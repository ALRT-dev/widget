import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/service_providers.dart';
import 'package:hazard_app/features/map/providers/states/map_provider_state.dart';
import 'package:hazard_app/features/map/services/map_service.dart';
import 'package:hazard_app/features/map/views/widgets/custom_marker.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/search/providers/states/hazards_provider_state.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

final providerOfMap =
    StateNotifierProvider.autoDispose<MapProvider, MapProviderState>(
  (ref) => MapProvider(
    ref: ref,
    state: MapProviderState(),
  ),
);

class MapProvider extends StateNotifier<MapProviderState> {
  MapProvider({
    required final Ref ref,
    required final MapProviderState state,
  })  : _ref = ref,
        super(state) {
    _onInit();
  }

  final Ref _ref;
  MapService get _mapService => _ref.read(providerOfMapService);

  void _onInit() {
    final currentUserLocation = _ref.read(providerOfLocation).location;
    if (currentUserLocation != null) {
      updateCameraPosition(
        cameraPosition: CameraPosition(
          target: LatLng(
            currentUserLocation.latitude,
            currentUserLocation.longitude,
          ),
          zoom: 14.0,
        ),
      );
    }
  }

  /// Initializes the map controller.
  Future<void> init({
    required final GoogleMapController googleMapController,
  }) async {
    _mapService.initializeMapController(
      googleMapController: googleMapController,
    );
  }

  /// Animates the camera to the given [position].
  Future<void> animateTo({
    required final LatLng position,
  }) async {
    await _mapService.animateCamera(
      cameraUpdate: CameraUpdate.newLatLng(position),
    );
  }

  /// Generates markers for all hazards in [HazardsProviderState.hazards].
  ///
  /// Uses [providerOfHazards] to get the list of hazards and creates a marker for each hazard with a valid location.
  void generateMarkers() async {
    final hazards = _ref.read(providerOfHazards).hazards;
    final markerFutures = <Future<Marker>>[];

    for (final hazard in hazards) {
      if (hazard.latitude != null && hazard.longitude != null) {
        final markerFuture = CustomMarker(
          markerImagePath:
              hazard.severity?.markerPath ?? HazardSeverity.info.markerPath,
          emoji: hazard.category?.emoji ?? '❗',
        ).toBitmapDescriptor().then((bitmapDescriptor) {
          return Marker(
            markerId: MarkerId(hazard.id),
            position: LatLng(
              hazard.latitude!,
              hazard.longitude!,
            ),
            infoWindow: InfoWindow(
              title: hazard.title,
              snippet: hazard.shortDescription,
            ),
            icon: bitmapDescriptor,
          );
        });
        markerFutures.add(markerFuture);
      }
    }

    final markers = await Future.wait(markerFutures);

    updateMarkers(markers.toSet());
  }

  /// Updates [MapProviderState.cameraPosition] to the given [cameraPosition].
  void updateCameraPosition({
    required final CameraPosition cameraPosition,
  }) {
    state = state.copyWith(
      cameraPosition: cameraPosition,
    );
  }

  /// Updates [MapProviderState.markers] to the given [markers].
  void updateMarkers(final Set<Marker> markers) {
    state = state.copyWith(
      markers: markers,
    );
  }
}
