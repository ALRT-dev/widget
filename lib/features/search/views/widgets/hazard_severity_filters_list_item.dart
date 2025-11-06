import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/models/hazard_severity_with_count_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
import 'package:hazard_app/others/app_colors.dart';

class HazardSeverityFiltersListItem extends ConsumerStatefulWidget {
  const HazardSeverityFiltersListItem({
    super.key,
    required this.filtersKey,
    required this.hazardSeverity,
    this.isAws = false,
    this.onSelected,
  });

  /// The key to identify the specific hazard filters instance.
  final String filtersKey;

  /// The hazard severity to be displayed.
  final HazardSeverityWithCount hazardSeverity;

  /// Indicates whether the severity is for AWS hazards.
  final bool isAws;

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
      providerOfHazardFilters(widget.filtersKey).select(
        (value) =>
            (widget.isAws
                    ? value.selectedFilters.severityFiltersAws
                    : value.selectedFilters.severityFiltersNonAws)
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
            widget.isAws
                ? widget.hazardSeverity.severity.emojiAws
                : widget.hazardSeverity.severity.emojiNonAws,
            style: TextStyle(
              height: 0.6,
            ),
          ),
          Text(
            widget.isAws
                ? widget.hazardSeverity.severity.titleAws
                : widget.hazardSeverity.severity.titleNonAws,
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
    if (widget.isAws) {
      ref
          .read(providerOfHazardFilters(widget.filtersKey).notifier)
          .toggleSelectedHazardSeverityAws(widget.hazardSeverity);
    } else {
      ref
          .read(providerOfHazardFilters(widget.filtersKey).notifier)
          .toggleSelectedHazardSeverityNonAws(widget.hazardSeverity);
    }

    widget.onSelected?.call(widget.hazardSeverity);
  }
}
