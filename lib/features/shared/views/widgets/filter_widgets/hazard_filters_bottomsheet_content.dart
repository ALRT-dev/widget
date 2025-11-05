import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_categories_list.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_severity_with_count_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
import 'package:hazard_app/features/shared/views/widgets/base_bottomsheet.dart';
import 'package:hazard_app/features/shared/views/widgets/filter_widgets/hazard_severity_filters_list.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
import 'package:hazard_app/others/app_colors.dart';

class HazardFiltersBottomsheetContent extends ConsumerStatefulWidget {
  const HazardFiltersBottomsheetContent({
    super.key,
    required this.filtersKey,
    this.onCategoriesSelectionUpdated,
    this.onSeveritiesSelectionUpdated,
  });

  /// The key to identify the specific hazard filters instance.
  final String filtersKey;

  /// Callback when the selected categories are updated.
  final void Function(List<HazardCategory>)? onCategoriesSelectionUpdated;

  /// Callback when the selected severities are updated.
  final void Function(List<HazardSeverityWithCount>)?
  onSeveritiesSelectionUpdated;

  @override
  ConsumerState<HazardFiltersBottomsheetContent> createState() =>
      _HazardFiltersBottomsheetContentState();
}

class _HazardFiltersBottomsheetContentState
    extends ConsumerState<HazardFiltersBottomsheetContent> {
  @override
  Widget build(BuildContext context) {
    return BaseBottomsheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerBuilder().pX(20.0),
          Divider().pY(5.0),
          _categoryFiltersBuilder(),
          20.hSizedBox,
          _severityFiltersBuilder(),
        ],
      ).pY(13.0),
    );
  }

  Widget _headerBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _titleBuilder(),
        RoundButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.close_rounded,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _titleBuilder() {
    return Text(
      'Filters',
      style: TextStyle(
        fontSize: 20.spMin,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    );
  }

  Widget _categoryFiltersBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final hasCategories = ref.watch(
          providerOfHazardFilters(widget.filtersKey).select(
            (value) => value.filters.categoryFilters.isNotEmpty,
          ),
        );
        if (!hasCategories) {
          return const SizedBox.shrink();
        }

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
              onCategoriesSelectionUpdated: widget.onCategoriesSelectionUpdated,
            ),
          ],
        );
      },
    );
  }

  Widget _severityFiltersBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final hasAwsSeverities = ref.watch(
          providerOfHazardFilters(widget.filtersKey).select(
            (value) => value.filters.severityFiltersAws.isNotEmpty,
          ),
        );
        final hasNonAwsSeverities = ref.watch(
          providerOfHazardFilters(widget.filtersKey).select(
            (value) => value.filters.severityFiltersNonAws.isNotEmpty,
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
            5.hSizedBox,
            if (hasAwsSeverities)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                      onSeveritiesSelectionUpdated:
                          widget.onSeveritiesSelectionUpdated,
                    ),
                  ],
                ),
              ).pB(6.0),
            if (hasNonAwsSeverities)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                      onSeveritiesSelectionUpdated:
                          widget.onSeveritiesSelectionUpdated,
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
