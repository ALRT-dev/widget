import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_categories_list_item.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_categories_provider.dart';
import 'package:hazard_app/features/shared/providers/states/hazard_categories_provider_state.dart';

class HazardCategoriesList extends ConsumerStatefulWidget {
  const HazardCategoriesList({
    super.key,
    required this.categoriesKey,
    this.onCategoriesSelectionUpdated,
  });

  /// The key to identify the categories provider.
  final String categoriesKey;

  /// Callback when the categories selection is updated.
  final Function(List<HazardCategory>)? onCategoriesSelectionUpdated;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardCategoriesListState();
}

class _HazardCategoriesListState extends ConsumerState<HazardCategoriesList> {
  @override
  Widget build(BuildContext context) {
    final getCategoriesState = ref.watch(
      providerOfHazardCategories(widget.categoriesKey).select(
        (value) => value.getHazardCategoriesState,
      ),
    );
    return getCategoriesState.maybeWhen(
      loading: () => const SizedBox(),
      error: (message) => const SizedBox(),
      orElse: () => _dataBuilder(),
    );
  }

  Widget _dataBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final hazardCategories = ref.watch(
          providerOfHazardCategories(widget.categoriesKey).select(
            (value) => value.hazardCategories,
          ),
        );
        if (hazardCategories.isEmpty) return const SizedBox();

        return SizedBox(
          height: 40.spMin,
          child: ListView.separated(
            itemCount: hazardCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final hazardCategory = hazardCategories[index];
              return HazardCategoriesListItem(
                categoriesKey: widget.categoriesKey,
                hazardCategory: hazardCategory,
                onSelected: (_) => _handleCategoriesSelectionUpdated(),
              )
                  .pL(index == 0 ? 20.0 : 0.0)
                  .pR(index == (hazardCategories.length - 1) ? 20.0 : 0.0);
            },
            separatorBuilder: (context, index) => 10.wSizedBox,
          ),
        );
      },
    );
  }

  /// Handles the update of selected categories and invokes the callback if provided.
  void _handleCategoriesSelectionUpdated() {
    final selectedCategories = ref
        .read(providerOfHazardCategories(widget.categoriesKey))
        .selectedCategories;
    widget.onCategoriesSelectionUpdated?.call(selectedCategories);
  }
}
