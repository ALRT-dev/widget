import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/others/app_colors.dart';

class HazardCategoriesListItem extends ConsumerStatefulWidget {
  const HazardCategoriesListItem({
    super.key,
    required this.hazardCategory,
  });

  final HazardCategory hazardCategory;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardCategoriesListItemState();
}

class _HazardCategoriesListItemState
    extends ConsumerState<HazardCategoriesListItem> {
  @override
  Widget build(BuildContext context) {
    final isSelected = ref.watch(
      providerOfHazards.select(
        (value) => value.tempSearchParams.categoryIds.contains(
          widget.hazardCategory.id,
        ),
      ),
    );

    return ChoiceChip(
      label: Text(
        widget.hazardCategory.name,
        style: TextStyle(
          color: isSelected ? AppColors.white : AppColors.grey,
        ),
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
        .read(providerOfHazards.notifier)
        .selectCategory(widget.hazardCategory.id);
  }
}
