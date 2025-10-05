import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/search/providers/states/hazards_provider_state.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_results_list_item.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/views/widgets/spinner.dart';

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
    final getHazardsState = ref.watch(
      providerOfHazards.select(
        (value) => value.getListHazardsState,
      ),
    );

    return switch (getHazardsState) {
      GetHazardsStateLoading() => _loadingBuilder(),
      GetHazardsStateError() => _errorBuilder(),
      GetHazardsStateSuccess() => _dataBuilder(),
      _ => const SizedBox(),
    };
  }

  Widget _loadingBuilder() {
    return SliverFillRemaining(
      child: Spinner(),
    );
  }

  Widget _emptyBuilder() {
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nothing to show!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final isSearchActive = ref.watch(
                providerOfHazards.select(
                  (value) =>
                      value.tempSearchParams.searchString?.isNotEmpty ?? false,
                ),
              );

              return Text(
                isSearchActive
                    ? 'No results found for your search. Please try changing it.'
                    : 'There are no data available at the moment. Please check back later.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              );
            },
          ),
        ],
      ).pad(20.0),
    );
  }

  Widget _errorBuilder() {
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Something went wrong!',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'We are unable to load the data at the moment. Please try again later.',
            textAlign: TextAlign.center,
          ),
        ],
      ).pad(20.0),
    );
  }

  Widget _dataBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final hazards = ref.watch(
          providerOfHazards.select(
            (value) => value.listHazards,
          ),
        );
        if (hazards.isEmpty) {
          return _emptyBuilder();
        }

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
      },
    );
  }
}
