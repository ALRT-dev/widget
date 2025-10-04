import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/search/providers/states/hazards_provider_state.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_categories_list_item.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';

class HazardCategoriesList extends ConsumerStatefulWidget {
  const HazardCategoriesList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardCategoriesListState();
}

class _HazardCategoriesListState extends ConsumerState<HazardCategoriesList> {
  @override
  Widget build(BuildContext context) {
    final getCategoriesState = ref.watch(
      providerOfHazards.select(
        (value) => value.getHazardCategoriesState,
      ),
    );
    return switch (getCategoriesState) {
      GetHazardCategoriesStateSuccess() => _dataBuilder(),
      (_) => const SizedBox(),
    };
  }

  Widget _dataBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final hazardCategories = ref.watch(
          providerOfHazards.select(
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
                hazardCategory: hazardCategory,
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
}
