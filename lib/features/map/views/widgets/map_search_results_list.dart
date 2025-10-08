import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/map/models/google_place_model.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/providers/states/map_provider_state.dart';
import 'package:hazard_app/features/map/views/widgets/map_search_results_item.dart';
import 'package:hazard_app/features/shared/views/widgets/spinner.dart';

class MapSearchResultsList extends ConsumerStatefulWidget {
  const MapSearchResultsList({
    super.key,
    this.onPlaceSelected,
  });

  final void Function(GooglePlace)? onPlaceSelected;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MapSearchResultsListState();
}

class _MapSearchResultsListState extends ConsumerState<MapSearchResultsList> {
  @override
  Widget build(BuildContext context) {
    final getPlacesState = ref.watch(
      providerOfMap.select(
        (value) => value.getPlacesState,
      ),
    );

    return getPlacesState.maybeWhen(
      loading: _loadingBuilder,
      error: (error) => _errorBuilder(),
      success: (_) => _dataBuilder(),
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget _loadingBuilder() {
    return Spinner();
  }

  Widget _errorBuilder() {
    return const Center(
      child: Text(
        'Error occurred while fetching places',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _emptyBuilder() {
    return const Center(
      child: Text(
        'No places found...',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _dataBuilder() {
    return Consumer(builder: (context, ref, child) {
      final places = ref.watch(
        providerOfMap.select(
          (value) => value.places,
        ),
      );
      if (places.isEmpty) {
        return _emptyBuilder();
      }

      return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return MapSearchResultsListItem(
            place: places[index],
            onSelected: widget.onPlaceSelected,
          );
        },
      );
    });
  }
}
