import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/extensions/lat_lng_list_extension.dart';
import 'package:hazard_app/features/map/models/google_place_model.dart';
import 'package:hazard_app/features/map/models/route_plan_model.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/service_providers.dart';
import 'package:hazard_app/features/map/providers/states/map_provider_state.dart';
import 'package:hazard_app/features/map/services/location_service.dart';
import 'package:hazard_app/features/map/services/map_service.dart';
import 'package:hazard_app/features/map/views/widgets/custom_marker.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/search/providers/states/hazards_provider_state.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/others/app_colors.dart';
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
  LocationService get _locationService => _ref.read(providerOfLocationService);
  StreamSubscription<double>? _headingStreamSubscription;

  void _onInit() {
    final currentUserLocation = _ref.read(providerOfLocation).location;
    updateCameraPosition(
      cameraPosition: CameraPosition(
        target: LatLng(
          currentUserLocation.latitude,
          currentUserLocation.longitude,
        ),
        zoom: 14.0,
      ),
    );

    _ref.onDispose(() {
      _headingStreamSubscription?.cancel();
    });
  }

  /// Initializes the map controller.
  Future<void> init({
    required final GoogleMapController googleMapController,
  }) async {
    _mapService.initializeMapController(
      googleMapController: googleMapController,
    );
  }

  /// Fetches places from the map service.
  Future<void> getPlaces({
    required final String searchString,
  }) async {
    state = state.copyWith(
      getPlacesState: const GetPlacesState.loading(),
    );

    final result = await _mapService.getPlaces(
      searchString: searchString,
      currentUserLocation: _ref.read(providerOfLocation).location,
    );
    if (!mounted) return;

    result.when(
      (places) {
        state = state.copyWith(
          getPlacesState: GetPlacesState.success(places),
          places: places,
        );
      },
      (l) {
        state = state.copyWith(
          getPlacesState: GetPlacesState.error(l),
        );
      },
    );
  }

  /// Fetches route from the map service and updates the state accordingly.
  /// Optionally avoids specified hazards.
  Future<void> getRoute({
    required final LatLng origin,
    required final LatLng destination,
    final bool avoidHazards = true,
  }) async {
    state = state.copyWith(
      getRouteState: const GetRouteState.loading(),
    );

    // Get relevant hazards to avoid if enabled
    List<Hazard>? hazardsToAvoid;
    if (avoidHazards) {
      final hazardsProvider = _ref.read(providerOfHazards);
      hazardsToAvoid = hazardsProvider.mapHazards;
    }

    final result = await _mapService.getRoutePlan(
      origin: origin,
      destination: destination,
      hazardsToAvoid: hazardsToAvoid,
    );
    if (!mounted) return;

    result.when(
      (r) {
        updateCurrentRoutePlan(r);
        state = state.copyWith(
          getRouteState: GetRouteState.success(r),
        );
      },
      (l) {
        state = state.copyWith(
          getRouteState: GetRouteState.error(l),
        );
      },
    );
  }

  /// Animates the camera to the given [position].
  Future<void> animateTo({
    required final LatLng position,
    final double? zoom,
  }) async {
    await _mapService.animateCamera(
      cameraUpdate: zoom != null
          ? CameraUpdate.newLatLngZoom(position, zoom)
          : CameraUpdate.newLatLng(position),
    );
  }

  /// Animates the camera to fit within the given [bounds] with optional [padding].
  Future<void> animateToBounds({
    required final LatLngBounds bounds,
    final double padding = 100.0,
  }) async {
    await _mapService.animateCamera(
      cameraUpdate: CameraUpdate.newLatLngBounds(
        bounds,
        padding,
      ),
    );
  }

  Future<void> animateToCameraUpdate({
    required final CameraUpdate cameraUpdate,
  }) async {
    await _mapService.animateCamera(
      cameraUpdate: cameraUpdate,
    );
  }

  /// Starts navigation by centering the camera on the user's current location.
  void startNavigation() {
    updateIsNavigating(true);

    final currentUserLocation = _ref.read(providerOfLocation).location;
    final zoom = 18.0;
    final tilt = 30.0;

    final cameraPosition = CameraPosition(
      target: LatLng(
        currentUserLocation.latitude,
        currentUserLocation.longitude,
      ),
      zoom: zoom,
      tilt: tilt,
    );

    updateCameraPosition(
      cameraPosition: cameraPosition,
    );
    animateToCameraUpdate(
      cameraUpdate: CameraUpdate.newCameraPosition(
        cameraPosition,
      ),
    );

    double? lastHeading;
    _headingStreamSubscription?.cancel();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;

      _headingStreamSubscription =
          _locationService.getHeadingStream().listen((heading) {
        if (!mounted) return;

        if (lastHeading == null || (heading - (lastHeading ?? 0)).abs() > 6) {
          lastHeading = heading;
          final cameraPosition = state.cameraPosition;
          animateToCameraUpdate(
            cameraUpdate: CameraUpdate.newCameraPosition(
              CameraPosition.fromMap({
                ...cameraPosition.toMap() as Map<String, dynamic>,
                'bearing': heading,
              })!,
            ),
          );
        }
      });
    });
  }

  /// Stops navigation and cancels heading updates.
  void stopNavigation() {
    updateIsNavigating(false);
    _headingStreamSubscription?.cancel();
    _headingStreamSubscription = null;
  }

  /// Toggles navigation state between started and stopped.
  void toggleNavigation() {
    final isNavigating = state.currentRoutePlan?.isNavigating ?? false;
    if (isNavigating) {
      stopNavigation();
    } else {
      startNavigation();
    }
  }

  /// Generates markers for all hazards in [HazardsProviderState.hazards].
  ///
  /// Uses [providerOfHazards] to get the list of hazards and creates a marker for each hazard with a valid location.
  void generateMarkers() async {
    final hazards = _ref.read(providerOfHazards).mapHazards;
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

    final selectedPlaceMarker = state.markers.firstWhereOrNull(
      (marker) => marker.markerId.value == 'selected_location',
    );
    updateMarkers({
      ...markers.toSet(),
      if (selectedPlaceMarker != null) selectedPlaceMarker,
    });
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

  /// Adds a marker to the current set of markers.
  void addToMarkers(final Marker marker) {
    updateMarkers(
      {...state.markers, marker},
    );
  }

  /// Updates [MapProviderState.polylines] to the given [polylines].
  void updatePolylines(final Set<Polyline> polylines) {
    state = state.copyWith(
      polylines: polylines,
    );
  }

  /// Adds a polyline for current route plan.
  void addPolylineForRoutePlan() {
    if (state.currentRoutePlan?.currentRoute?.routes.isEmpty ?? true) return;
    final routePoints = state
        .currentRoutePlan?.currentRoute?.routes.first.polylinePoints
        ?.map((e) => LatLng(e.latitude, e.longitude))
        .toList();
    if (routePoints == null || routePoints.isEmpty) return;

    final selectedTravelMode = state.currentRoutePlan?.selectedTravelMode;
    if (selectedTravelMode == null) return;

    final isNavigating = state.currentRoutePlan?.isNavigating ?? false;

    final polyLine = Polyline(
      polylineId: const PolylineId('route'),
      color: AppColors.blue,
      points: routePoints,
      width: 10,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      jointType: JointType.round,
      patterns: selectedTravelMode == TravelMode.walking
          ? [PatternItem.dash(3), PatternItem.gap(1)]
          : [],
    );

    updatePolylines({polyLine});
    if (!isNavigating) {
      animateToBounds(bounds: routePoints.toBounds());
    }
  }

  /// Adds a marker for the selected location, replacing any existing selected location marker.
  void addSelectedLocationMarker(final LatLng position) {
    final marker = Marker(
      markerId: const MarkerId('selected_location'),
      position: position,
    );

    // Remove existing selected location marker if any
    final updatedMarkers = Set<Marker>.from(state.markers)
        .where((m) => m.markerId.value != 'selected_location')
        .toSet();

    // Add the new selected location marker
    updatedMarkers.add(marker);

    updateMarkers(updatedMarkers);
  }

  /// Removes the marker for the selected location if it exists.
  void removeSelectedLocationMarker() {
    final updatedMarkers = Set<Marker>.from(state.markers)
        .where((m) => m.markerId.value != 'selected_location')
        .toSet();
    updateMarkers(updatedMarkers);
  }

  /// Updates [MapProviderState.places] to the given [places].
  void updatePlaces(final List<GooglePlace> places) {
    state = state.copyWith(
      places: places,
    );
  }

  /// Updates [MapProviderState.getPlacesState] to loading state.
  void updateGetPlacesStateToLoading() {
    state = state.copyWith(
      getPlacesState: const GetPlacesState.loading(),
    );
  }

  /// Updates [MapProviderState.selectedPlace] to the given [place].
  void updateSelectedPlace(final GooglePlace? place) {
    state = state.copyWith(
      selectedPlace: place,
    );
  }

  /// Updates [MapProviderState.searchString] to the given [searchString].
  void updateSearchString(final String searchString) {
    state = state.copyWith(
      searchString: searchString,
    );
  }

  /// Updates [MapProviderState.currentRoutePlan] to the given [routePlan].
  void updateCurrentRoutePlan(final RoutePlan? routePlan) {
    state = state.copyWith(
      currentRoutePlan: routePlan,
    );
    if (routePlan == null) {
      updatePolylines({});
    } else {
      addPolylineForRoutePlan();
    }
  }

  /// Updates [MapProviderState.currentRoutePlan]'s selected travel mode to the given [mode].
  void updateSelectedTravelMode(final TravelMode mode) {
    updateCurrentRoutePlan(
      state.currentRoutePlan?.copyWith(
        selectedTravelMode: mode,
      ),
    );
  }

  /// Updates [MapProviderState.currentRoutePlan]'s isNavigating to the given [isNavigating].
  void updateIsNavigating(final bool isNavigating) {
    updateCurrentRoutePlan(
      state.currentRoutePlan?.copyWith(
        isNavigating: isNavigating,
      ),
    );
  }
}
