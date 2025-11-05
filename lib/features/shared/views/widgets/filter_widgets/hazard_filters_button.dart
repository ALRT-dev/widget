import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_severity_with_count_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
import 'package:hazard_app/features/shared/utils/dialogs.dart';
import 'package:hazard_app/others/app_colors.dart';

class HazardFiltersButton extends ConsumerStatefulWidget {
  const HazardFiltersButton({
    super.key,
    required this.filtersKey,
    this.buttonShadow = const [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 10.0,
        offset: Offset(0, 0.0),
      ),
    ],
    this.onCategoriesSelectionUpdated,
    this.onSeveritiesSelectionUpdated,
  });

  /// The key to identify the specific hazard filters instance.
  final String filtersKey;

  /// The box shadow to apply to the dropdown button.
  final List<BoxShadow> buttonShadow;

  /// Callback when the selected categories are updated.
  final void Function(List<HazardCategory>)? onCategoriesSelectionUpdated;

  /// Callback when the selected severities are updated.
  final void Function(List<HazardSeverityWithCount>)?
  onSeveritiesSelectionUpdated;

  @override
  ConsumerState<HazardFiltersButton> createState() =>
      _HazardFiltersButtonState();
}

class _HazardFiltersButtonState extends ConsumerState<HazardFiltersButton> {
  @override
  Widget build(BuildContext context) {
    return _filtersButtonBuilder().onPressed(_showFiltersBottomSheet);
  }

  Widget _filtersButtonBuilder() {
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
            boxShadow: widget.buttonShadow,
          ),
          child: Icon(
            Icons.filter_list,
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

  /// Shows the hazard filters bottom sheet.
  void _showFiltersBottomSheet() {
    showHazardFiltersBottomSheet(
      context: context,
      filtersKey: widget.filtersKey,
      onCategoriesSelectionUpdated: widget.onCategoriesSelectionUpdated,
      onSeveritiesSelectionUpdated: widget.onSeveritiesSelectionUpdated,
    );
  }
}
