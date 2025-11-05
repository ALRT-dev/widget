import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_categories_list.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
import 'package:hazard_app/features/shared/views/widgets/dropdown.dart';
import 'package:hazard_app/features/shared/views/widgets/filter_widgets/hazard_severity_filters_list.dart';
import 'package:hazard_app/others/app_colors.dart';

class HazardFiltersDropdown extends ConsumerStatefulWidget {
  const HazardFiltersDropdown({
    super.key,
    required this.filtersKey,
  });

  /// The key to identify the specific hazard filters instance.
  final String filtersKey;

  @override
  ConsumerState<HazardFiltersDropdown> createState() =>
      _HazardFiltersDropdownState();
}

class _HazardFiltersDropdownState extends ConsumerState<HazardFiltersDropdown> {
  @override
  Widget build(BuildContext context) {
    return AlrtDropdown(
      button: (context, isOpen) => _filtersButtonBuilder(isOpen),
      dropdownWidth: context.screenSize.width - 40.spMin,
      buttonAlignment: Alignment.topRight,
      dropdownAlignment: Alignment.topRight,
      dropdownHeight: 210.0,
      menuContent: _menuContentBuilder,
    );
  }

  Widget _filtersButtonBuilder(final bool isOpen) {
    return Stack(
      children: [
        Container(
          width: 48.spMin,
          height: 48.spMin,
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.lightGrey,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 10.0,
                offset: Offset(0, 0.0),
              ),
            ],
          ),
          child: Icon(
            isOpen ? Icons.close_rounded : Icons.filter_list,
            size: 22.spMin,
            color: AppColors.black,
          ),
        ),
        Positioned(
          right: 0,
          child: _countBuilder(),
        ),
      ],
    );
  }

  Widget _countBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final count = ref.watch(
          providerOfHazardFilters(widget.filtersKey).select(
            (value) =>
                value.selectedHazardCategories.length +
                value.selectedHazardSeveritiesAws.length +
                value.selectedHazardSeveritiesNonAws.length,
          ),
        );
        if (count == 0) {
          return const SizedBox.shrink();
        }

        return Container(
          width: 20.spMin,
          height: 20.spMin,
          decoration: BoxDecoration(
            color: AppColors.red,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            count.toString(),
            style: TextStyle(
              fontSize: 12.spMin,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }

  Widget _menuContentBuilder(BuildContext context, VoidCallback close) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _categoryFiltersBuilder(),
        15.hSizedBox,
        _severityFiltersBuilder(),
      ],
    ).pY(20.0);
  }

  Widget _categoryFiltersBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            fontSize: 14.spMin,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ).pL(20.0),
        8.hSizedBox,
        HazardCategoriesList(
          filtersKey: widget.filtersKey,
          isSmall: true,
          separatorWidth: 5.0,
          onCategoriesSelectionUpdated: (_) => _getMapHazards(),
        ),
      ],
    );
  }

  Widget _severityFiltersBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final hasAwsSeverities = ref.watch(
          providerOfHazardFilters(widget.filtersKey).select(
            (value) => value.hazardSeveritiesAws.isNotEmpty,
          ),
        );
        final hasNonAwsSeverities = ref.watch(
          providerOfHazardFilters(widget.filtersKey).select(
            (value) => value.hazardSeveritiesNonAws.isNotEmpty,
          ),
        );

        if (!hasAwsSeverities && !hasNonAwsSeverities) {
          return const SizedBox.shrink();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Severities',
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ).pL(20.0),
            8.hSizedBox,
            if (hasAwsSeverities)
              SingleChildScrollView(
                child: Row(
                  children: [
                    Text(
                      'AWS:',
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ).pL(20.0).pR(10.0),
                    HazardSeverityFiltersList(
                      filtersKey: widget.filtersKey,
                      isAws: true,
                      separatorWidth: 5.0,
                      onSeveritiesSelectionUpdated: (_) => _getMapHazards(),
                    ),
                  ],
                ),
              ).pB(6.0),
            if (hasNonAwsSeverities)
              SingleChildScrollView(
                child: Row(
                  children: [
                    Text(
                      'Non-AWS:',
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ).pL(20.0).pR(10.0),
                    HazardSeverityFiltersList(
                      filtersKey: widget.filtersKey,
                      isAws: false,
                      separatorWidth: 5.0,
                      onSeveritiesSelectionUpdated: (_) => _getMapHazards(),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  /// Gets the map hazards based on the selected filters.
  void _getMapHazards() {
    ref.read(providerOfMap.notifier).getMapHazards();
  }
}
