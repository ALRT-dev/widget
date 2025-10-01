import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/service_providers.dart';
import 'package:hazard_app/features/map/providers/states/map_provider_state.dart';
import 'package:hazard_app/features/map/services/map_service.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/search/providers/states/hazards_provider_state.dart';

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
    final markers = <Marker>{};

    final pins = await Future.wait([
      rootBundle.load('assets/pins/pin_warning.png'),
      rootBundle.load('assets/pins/pin_danger.png'),
      rootBundle.load('assets/pins/pin_pickpocket.png'),
      rootBundle.load('assets/pins/pin_thief.png'),
    ]);

    final warningPin = BitmapDescriptor.bytes(
      pins[0].buffer.asUint8List(),
      width: 32.w,
    );
    final dangerPin = BitmapDescriptor.bytes(
      pins[1].buffer.asUint8List(),
      width: 32.w,
    );
    final pickpocketPin = BitmapDescriptor.bytes(
      pins[2].buffer.asUint8List(),
      width: 32.w,
    );
    final thiefPin = BitmapDescriptor.bytes(
      pins[3].buffer.asUint8List(),
      width: 32.w,
    );

    final pinIcons = [
      warningPin,
      dangerPin,
      pickpocketPin,
      thiefPin,
    ];

    final rand = Random();

    for (final hazard in hazards) {
      if (hazard.location?.latitude != null &&
          hazard.location?.longitude != null) {
        final marker = Marker(
          markerId: MarkerId(hazard.id),
          position: LatLng(
            hazard.location!.latitude,
            hazard.location!.longitude,
          ),
          infoWindow: InfoWindow(
            title: hazard.title,
            snippet: hazard.description,
          ),
          icon: pinIcons[rand.nextInt(pinIcons.length)],
        );
        markers.add(marker);
      }
    }

    updateMarkers(markers);
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
