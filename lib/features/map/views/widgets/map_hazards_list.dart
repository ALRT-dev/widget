import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/providers/states/map_provider_state.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/views/widgets/common_hazards_list_item.dart';

class MapHazardsList extends ConsumerStatefulWidget {
  const MapHazardsList({super.key});

  @override
  ConsumerState<MapHazardsList> createState() => _MapHazardsListState();
}

class _MapHazardsListState extends ConsumerState<MapHazardsList> {
  @override
  Widget build(BuildContext context) {
    final getMapHazardsState = ref.watch(
      providerOfMap.select(
        (value) => value.getMapHazardsState,
      ),
    );

    return getMapHazardsState.maybeWhen(
      loading: _dataBuilder,
      error: _errorBuilder,
      success: (_) => _dataBuilder(),
      orElse: _emptyBuilder,
    );
  }

  Widget _errorBuilder(final AppError error) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Something went wrong!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.spMin,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'There was an error loading alerts. Please try again later.',
          textAlign: TextAlign.center,
        ),
      ],
    ).pad(40.0);
  }

  Widget _emptyBuilder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Nothing to show!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.spMin,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'There are no alerts to display for the selected filters.',
          textAlign: TextAlign.center,
        ),
      ],
    ).pad(40.0);
  }

  Widget _dataBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final mapHazards = ref.watch(
          providerOfMap.select(
            (value) => value.hazards,
          ),
        );
        if (mapHazards.isEmpty) {
          return _emptyBuilder();
        }

        return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.separated(
            itemCount: mapHazards.length,
            itemBuilder: (context, index) {
              final hazard = mapHazards[index];
              return CommonHazardsListItem(
                key: ValueKey(hazard.id),
                hazard: hazard,
              ).pB(index == mapHazards.length - 1 ? 120.0 : 0.0);
            },
            separatorBuilder: (context, index) => 15.hSizedBox,
          ),
        );
      },
    );
  }
}
