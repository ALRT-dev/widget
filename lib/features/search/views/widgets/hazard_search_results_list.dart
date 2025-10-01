import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_results_list_item.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';

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
    final hazards = ref.watch(
      providerOfHazards.select(
        (value) => value.hazards,
      ),
    );
    return SliverList.separated(
      itemCount: hazards.length,
      itemBuilder: (context, index) {
        final hazard = hazards[index];
        return HazardSearchResultsListItem(
          hazard: hazard,
        );
      },
      separatorBuilder: (context, index) => 10.hSizedBox,
    );
  }
}
