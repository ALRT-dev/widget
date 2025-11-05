import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
import 'package:hazard_app/others/app_colors.dart';

class HazardCategoriesListItem extends ConsumerStatefulWidget {
  const HazardCategoriesListItem({
    super.key,
    required this.filtersKey,
    this.isSmall = false,
    required this.hazardCategory,
    this.onSelected,
  });

  /// The key to identify the filters provider.
  final String filtersKey;

  /// Indicates whether to use a smaller size for the item.
  final bool isSmall;

  /// The hazard category to be displayed.
  final HazardCategory hazardCategory;

  /// Callback when a category is selected.
  final Function(HazardCategory)? onSelected;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardCategoriesListItemState();
}

class _HazardCategoriesListItemState
    extends ConsumerState<HazardCategoriesListItem> {
  @override
  Widget build(BuildContext context) {
    final isSelected = ref.watch(
      providerOfHazardFilters(widget.filtersKey).select(
        (value) => value.selectedFilters.categoryFilters
            .map((e) => e.id)
            .contains(widget.hazardCategory.id),
      ),
    );

    return ChoiceChip(
      padding: widget.isSmall
          ? EdgeInsets.symmetric(horizontal: 5.spMin)
          : null,
      label: Row(
        spacing: 5.spMin,
        children: [
          Text(
            widget.hazardCategory.name ?? 'Error',
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.grey,
              fontSize: widget.isSmall ? 12.spMin : null,
              height: widget.isSmall ? 0.6 : null,
            ),
          ),
          Text(
            '(${widget.hazardCategory.hazardsCount})',
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.grey,
              fontSize: widget.isSmall ? 12.spMin : null,
              height: widget.isSmall ? 0.6 : null,
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
        .read(providerOfHazardFilters(widget.filtersKey).notifier)
        .toggleSelectedHazardCategory(widget.hazardCategory);

    widget.onSelected?.call(widget.hazardCategory);
  }
}
