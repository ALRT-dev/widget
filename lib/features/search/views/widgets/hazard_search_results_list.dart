import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_results_list_item.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/utils/dummy_data.dart';

class HazardSearchResultsList extends ConsumerStatefulWidget {
  const HazardSearchResultsList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardSearchResultsListState();
}

class _HazardSearchResultsListState
    extends ConsumerState<HazardSearchResultsList> {
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: kDummyHazards.length,
      itemBuilder: (context, index) {
        final hazard = kDummyHazards[index];
        return HazardSearchResultsListItem(
          hazard: hazard,
        );
      },
      separatorBuilder: (context, index) => 10.hSizedBox,
    );
  }
}
