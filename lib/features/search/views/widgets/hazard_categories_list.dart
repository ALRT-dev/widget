import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_categories_list_item.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/utils/dummy_data.dart';

class HazardCategoriesList extends ConsumerStatefulWidget {
  const HazardCategoriesList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardCategoriesListState();
}

class _HazardCategoriesListState extends ConsumerState<HazardCategoriesList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.spMin,
      child: ListView.separated(
        itemCount: kDummyHazardCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final hazardCategory = kDummyHazardCategories[index];
          return HazardCategoriesListItem(
            hazardCategory: hazardCategory,
          )
              .pL(index == 0 ? 20.0 : 0.0)
              .pR(index == (kDummyHazardCategories.length - 1) ? 20.0 : 0.0);
        },
        separatorBuilder: (context, index) => 10.wSizedBox,
      ),
    );
  }
}
