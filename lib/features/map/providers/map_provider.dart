import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/service_providers.dart';
import 'package:hazard_app/features/map/providers/states/map_provider_state.dart';
import 'package:hazard_app/features/map/services/map_service.dart';

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

  /// Updates [MapProviderState.cameraPosition] to the given [cameraPosition].
  void updateCameraPosition({
    required final CameraPosition cameraPosition,
  }) {
    state = state.copyWith(
      cameraPosition: cameraPosition,
    );
  }
}
