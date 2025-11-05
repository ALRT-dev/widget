import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_categories_list_item.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
import 'package:hazard_app/features/shared/providers/states/hazard_filters_provider_state.dart';

class HazardCategoriesList extends ConsumerStatefulWidget {
  const HazardCategoriesList({
    super.key,
    required this.filtersKey,
    this.isSmall = false,
    this.separatorWidth = 10.0,
    this.onCategoriesSelectionUpdated,
  });

  /// The key to identify the filters provider.
  final String filtersKey;

  /// Whether to display a smaller version of the list.
  final bool isSmall;

  /// The width of the separator between list items.
  final double separatorWidth;

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
      providerOfHazardFilters(widget.filtersKey).select(
        (value) => value.getAllHazardCategoriesState,
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
          providerOfHazardFilters(widget.filtersKey).select(
            (value) => value.hazardCategories,
          ),
        );
        if (hazardCategories.isEmpty) return const SizedBox();

        return Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: widget.isSmall ? 30.spMin : 40.spMin,
            child: ListView.separated(
              itemCount: hazardCategories.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final hazardCategory = hazardCategories[index];
                return HazardCategoriesListItem(
                      filtersKey: widget.filtersKey,
                      isSmall: widget.isSmall,
                      hazardCategory: hazardCategory,
                      onSelected: (_) => _handleCategoriesSelectionUpdated(),
                    )
                    .pL(index == 0 ? 20.0 : 0.0)
                    .pR(index == (hazardCategories.length - 1) ? 20.0 : 0.0);
              },
              separatorBuilder: (context, index) =>
                  widget.separatorWidth.wSizedBox,
            ),
          ),
        );
      },
    );
  }

  /// Handles the update of selected categories and invokes the callback if provided.
  void _handleCategoriesSelectionUpdated() {
    final selectedCategories = ref
        .read(providerOfHazardFilters(widget.filtersKey))
        .selectedHazardCategories;
    widget.onCategoriesSelectionUpdated?.call(selectedCategories);
  }
}
