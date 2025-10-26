import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/models/hazard_severity_with_count_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_severity_filters_provider.dart';
import 'package:hazard_app/others/app_colors.dart';

class HazardSeverityFiltersListItem extends ConsumerStatefulWidget {
  const HazardSeverityFiltersListItem({
    super.key,
    required this.severityFiltersKey,
    required this.hazardSeverity,
    this.onSelected,
  });

  /// The key to identify the severity filters provider.
  final String severityFiltersKey;

  /// The hazard severity to be displayed.
  final HazardSeverityWithCount hazardSeverity;

  /// Callback when a severity is selected.
  final Function(HazardSeverityWithCount)? onSelected;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardSeverityFiltersListItemState();
}

class _HazardSeverityFiltersListItemState
    extends ConsumerState<HazardSeverityFiltersListItem> {
  @override
  Widget build(BuildContext context) {
    final isSelected = ref.watch(
      providerOfHazardSeverityFilters(widget.severityFiltersKey).select(
        (value) => value.selectedSeverities
            .map((e) => e.severity)
            .contains(widget.hazardSeverity.severity),
      ),
    );

    return ChoiceChip(
      padding: EdgeInsets.symmetric(
        horizontal: 5.spMin,
      ),
      label: Row(
        spacing: 5.spMin,
        children: [
          Text(
            widget.hazardSeverity.severity.emoji,
            style: TextStyle(
              fontSize: 14.spMin,
              height: 0.6,
            ),
          ),
          Text(
            widget.hazardSeverity.severity.title,
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.grey,
              fontSize: 12.spMin,
              height: 0.6,
            ),
          ),
          Text(
            '(${widget.hazardSeverity.hazardsCount})',
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.grey,
              fontSize: 12.spMin,
              height: 0.6,
            ),
          ),
        ],
      ),
      color: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.white;
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20.0),
        side: BorderSide(
          color: isSelected ? AppColors.black : AppColors.lightGrey,
        ),
      ),
      selected: isSelected,
      onSelected: (val) => _handleCategorySelection(),
    );
  }

  /// Updates the state with the given category.
  void _handleCategorySelection() {
    ref
        .read(
          providerOfHazardSeverityFilters(widget.severityFiltersKey).notifier,
        )
        .toggleSelectedSeverity(widget.hazardSeverity);

    widget.onSelected?.call(widget.hazardSeverity);
  }
}
