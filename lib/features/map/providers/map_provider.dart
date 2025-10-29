import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/extensions/lat_lng_list_extension.dart';
import 'package:hazard_app/features/map/extensions/polyline_extension.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/models/route_plan_model.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/service_providers.dart';
import 'package:hazard_app/features/map/providers/states/map_provider_state.dart';
import 'package:hazard_app/features/map/services/location_service.dart';
import 'package:hazard_app/features/map/services/map_service.dart';
import 'package:hazard_app/features/map/views/widgets/custom_marker.dart';
import 'package:hazard_app/features/map/views/widgets/route_label_marker.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_categories_provider.dart';
import 'package:hazard_app/features/shared/providers/hazard_severity_filters_provider.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/hazard_service.dart';
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
  }) : _ref = ref,
       super(state) {
    _onInit();
  }

  final Ref _ref;
  MapService get _mapService => _ref.read(providerOfMapService);
  HazardService get _hazardService => _ref.read(providerOfHazardService);
  LocationService get _locationService => _ref.read(providerOfLocationService);
  HazardCategoriesProvider get _hazardCategoriesProvider =>
      _ref.read(providerOfHazardCategoriesForMap.notifier);
  HazardSeverityFiltersProvider get _hazardSeverityFiltersProvider =>
      _ref.read(providerOfHazardSeverityFiltersForMap.notifier);

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

  /// Fetches hazards for the map and updates the state accordingly.
  Future<void> getMapHazards() async {
    state = state.copyWith(
      getMapHazardsState: const GetMapHazardsState.loading(),
    );

    final visibleBoundsResult = await _mapService.getVisibleRegion();
    if (!mounted) return;

    final visibleBounds = visibleBoundsResult.whenSuccess(
      (success) => success,
    );
    if (visibleBounds == null) {
      state = state.copyWith(
        getMapHazardsState: GetMapHazardsState.error(
          AppError(
            message: 'Failed to get visible region bounds.',
          ),
        ),
      );
      return;
    }

    final selectedCategories = _ref
        .read(providerOfHazardCategoriesForMap)
        .selectedCategories;
    final selectedSeverities = _ref
        .read(providerOfHazardSeverityFiltersForMap)
        .selectedSeverities;

    final result = await _hazardService.getAllHazardsWithCategories(
      searchParams: HazardSearchParams(
        categoryIds: selectedCategories.map((e) => e.id).toList(),
        severities: selectedSeverities.map((e) => e.severity).toList(),
        northeastLat: visibleBounds.northeast.latitude,
        northeastLng: visibleBounds.northeast.longitude,
        southwestLat: visibleBounds.southwest.latitude,
        southwestLng: visibleBounds.southwest.longitude,
        pageSize: 100,
      ),
    );
    if (!mounted) return;

    result.when(
      (response) {
        state = state.copyWith(
          getMapHazardsState: GetMapHazardsState.success(response.hazards),
          hazards: response.hazards,
        );

        generateMarkers();

        // Also update hazard categories in the hazard categories provider
        _hazardCategoriesProvider.updateHazardCategories(
          response.categoryFilters,
        );

        // Also update hazard severity filters in the hazard severity filters provider
        _hazardSeverityFiltersProvider.updateHazardSeverities(
          response.severityFilters,
        );
      },
      (l) {
        state = state.copyWith(
          getMapHazardsState: GetMapHazardsState.error(l),
        );
      },
    );
  }

  /// Fetches route from the map service and updates the state accordingly.
  /// Optionally avoids specified hazards.
  Future<void> getRoute({
    required final AlrtLocation origin,
    required final AlrtLocation destination,
    final bool avoidHazards = true,
  }) async {
    state = state.copyWith(
      getRouteState: const GetRouteState.loading(),
    );

    // Get relevant hazards to avoid if enabled
    List<Hazard>? hazardsToAvoid;
    if (avoidHazards) {
      hazardsToAvoid = state.hazards;
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

  /// Fetches address from coordinates using the map service and updates the state accordingly.
  Future<void> getAddressFromCoordinates({
    required final LatLng coordinates,
  }) async {
    final isLoading = state.getAddressFromCoordinatesState.maybeWhen(
      orElse: () => false,
      loading: () => true,
    );
    if (isLoading) return;

    state = state.copyWith(
      getAddressFromCoordinatesState:
          const GetAddressFromCoordinatesState.loading(),
    );

    final result = await _mapService.getAddressFromCoordinates(
      coordinates: coordinates,
    );
    if (!mounted) return;

    result.when(
      (address) {
        final alrtLocation = AlrtLocation(
          latitude: coordinates.latitude,
          longitude: coordinates.longitude,
          address: address,
        );
        state = state.copyWith(
          getAddressFromCoordinatesState:
              GetAddressFromCoordinatesState.success(alrtLocation),
        );
      },
      (l) {
        state = state.copyWith(
          getAddressFromCoordinatesState: GetAddressFromCoordinatesState.error(
            l,
          ),
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

      _headingStreamSubscription = _locationService.getHeadingStream().listen((
        heading,
      ) {
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

  /// Generates markers for all hazards in the state.
  void generateMarkers() async {
    final hazards = state.hazards;
    final markerFutures = <Future<Marker>>[];

    for (final hazard in hazards) {
      if (hazard.latitude != null && hazard.longitude != null) {
        final markerFuture =
            CustomMarker(
              markerImagePath:
                  hazard.severity?.markerPath ?? HazardSeverity.info.markerPath,
              emoji: hazard.category?.emoji ?? '❗',
            ).toBitmapDescriptor().then(
              (bitmapDescriptor) {
                return Marker(
                  markerId: MarkerId(
                    hazard.id ?? '${hazard.latitude},${hazard.longitude}',
                  ),
                  position: LatLng(
                    hazard.latitude!,
                    hazard.longitude!,
                  ),
                  onTap: () => updateSelectedHazard(hazard),
                  icon: bitmapDescriptor,
                );
              },
            );
        markerFutures.add(markerFuture);
      }
    }

    final markers = await Future.wait(markerFutures);

    final selectedPlaceMarker = state.markers.firstWhereOrNull(
      (marker) => marker.markerId.value == 'selected_location',
    );
    final routeLabelMarkers = state.markers.where(
      (marker) => marker.markerId.value.startsWith('route_label_'),
    );
    updateMarkers({
      ...markers.toSet(),
      if (selectedPlaceMarker != null) selectedPlaceMarker,
      ...routeLabelMarkers,
    });
  }

  /// Updates the [MapProviderState.hazards] to the given [hazards].
  void updateHazards(final List<Hazard> hazards) {
    state = state.copyWith(
      hazards: hazards,
    );
  }

  /// Updates [MapProviderState.selectedHazard] to the given [hazard].
  void updateSelectedHazard(final Hazard? hazard) {
    state = state.copyWith(
      selectedHazard: hazard,
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
    var polylines = <Polyline>{};

    final allRoutes = (state.currentRoutePlan?.currentRoute?.allRoutes ?? []);

    for (final route in allRoutes) {
      final routePoints = route.polylinePoints!
          .map((e) => LatLng(e.latitude, e.longitude))
          .toList();
      if (routePoints.isEmpty) continue;

      final selectedTravelMode = state.currentRoutePlan?.selectedTravelMode;
      if (selectedTravelMode == null) continue;

      final polyLine = Polyline(
        polylineId: PolylineId('route_${allRoutes.indexOf(route)}'),
        color: state.currentRoutePlan?.currentRoute?.currentRoute == route
            ? AppColors.blue
            : AppColors.blue.withValues(alpha: 0.3),
        points: routePoints,
        width: 8,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.round,
        consumeTapEvents: true,
        onTap: () {
          // Update selected route in the current route plan
          updateCurrentRoutePlan(
            state.currentRoutePlan?.copyWith(
              travelModeRoutes: {
                ...state.currentRoutePlan!.travelModeRoutes,
                selectedTravelMode: state
                    .currentRoutePlan!
                    .travelModeRoutes[selectedTravelMode]!
                    .copyWith(selectedRoute: route),
              },
            ),
          );
        },
      );
      polylines = {
        ...polylines,
        polyLine,
      };
    }

    // Update polylines in the state
    updatePolylines(polylines);

    // Add route label markers
    addRouteLabelMarkers();

    // If not navigating, animate to fit the route bounds
    final isNavigating = state.currentRoutePlan?.isNavigating ?? false;
    if (!isNavigating) {
      final currentRoutePoints =
          state.currentRoutePlan?.currentRoute?.currentRoute.polylinePoints
              ?.map((e) => LatLng(e.latitude, e.longitude))
              .toList() ??
          [];

      if (currentRoutePoints.isNotEmpty) {
        animateToBounds(
          bounds: currentRoutePoints.toBounds(),
        );
      }
    }
  }

  /// Adds route label markers for fastest and safest routes.
  void addRouteLabelMarkers() async {
    final currentRoute = state.currentRoutePlan?.currentRoute;
    if (currentRoute == null) return;

    final routes = currentRoute.allRoutes;
    if (routes.length < 2) return; // No need to add labels if only one route

    final fastestRoute = currentRoute.fastestRoute;
    final safestRoute = currentRoute.safestRoute;

    // Remove existing route label markers
    final updatedMarkers = Set<Marker>.from(state.markers)
      ..removeWhere(
        (marker) => marker.markerId.value.startsWith('route_label_'),
      );

    // Add fastest route marker
    final fastestRoutePoints = fastestRoute.polylinePoints
        ?.map((e) => LatLng(e.latitude, e.longitude))
        .toList();
    if (fastestRoutePoints != null && fastestRoutePoints.isNotEmpty) {
      final fastestMidpoint = fastestRoutePoints.findMidpoint();
      if (fastestMidpoint != null) {
        final fastestMarkerIcon = await RouteLabelMarker(
          label: safestRoute == fastestRoute ? 'Fastest & Safest' : 'Fastest',
          backgroundColor: AppColors.blue,
        ).toBitmapDescriptor();

        updatedMarkers.add(
          Marker(
            markerId: const MarkerId('route_label_fastest'),
            position: fastestMidpoint,
            icon: fastestMarkerIcon,
            zIndexInt: 2,
            anchor: const Offset(
              0.0,
              0.5,
            ), // Anchor at left center so arrow points to route from the side
          ),
        );
      }
    }

    // Add safest route marker (only if different from fastest)
    if (safestRoute != fastestRoute) {
      final safestRoutePoints = safestRoute.polylinePoints
          ?.map((e) => LatLng(e.latitude, e.longitude))
          .toList();
      if (safestRoutePoints != null && safestRoutePoints.isNotEmpty) {
        final safestMidpoint = safestRoutePoints.findMidpoint();
        if (safestMidpoint != null) {
          final safestMarkerIcon = await const RouteLabelMarker(
            label: 'Safest',
            backgroundColor: AppColors.blue,
          ).toBitmapDescriptor();

          updatedMarkers.add(
            Marker(
              markerId: const MarkerId('route_label_safest'),
              position: safestMidpoint,
              icon: safestMarkerIcon,
              zIndexInt: 2,
              anchor: const Offset(
                0.0,
                0.5,
              ), // Anchor at left center so arrow points to route from the side
            ),
          );
        }
      }
    }

    updateMarkers(updatedMarkers);
  }

  /// Removes route label markers from the map.
  void removeRouteLabelMarkers() {
    final updatedMarkers = Set<Marker>.from(state.markers)
      ..removeWhere(
        (marker) => marker.markerId.value.startsWith('route_label_'),
      );
    updateMarkers(updatedMarkers);
  }

  /// Adds a marker for the selected location, replacing any existing selected location marker.
  void addSelectedLocationMarker(final LatLng position) {
    final marker = Marker(
      markerId: const MarkerId('selected_location'),
      position: position,
    );

    // Remove existing selected location marker if any
    final updatedMarkers = Set<Marker>.from(
      state.markers,
    ).where((m) => m.markerId.value != 'selected_location').toSet();

    // Add the new selected location marker
    updatedMarkers.add(marker);

    updateMarkers(updatedMarkers);
  }

  /// Removes the marker for the selected location if it exists.
  void removeSelectedLocationMarker() {
    final updatedMarkers = Set<Marker>.from(
      state.markers,
    ).where((m) => m.markerId.value != 'selected_location').toSet();
    updateMarkers(updatedMarkers);
  }

  /// Updates [MapProviderState.selectedLocation] to the given [location].
  void updateSelectedLocation(final AlrtLocation? location) {
    state = state.copyWith(
      selectedLocation: location,
    );
  }

  /// Updates [MapProviderState.currentRoutePlan] to the given [routePlan].
  void updateCurrentRoutePlan(final RoutePlan? routePlan) {
    state = state.copyWith(
      currentRoutePlan: routePlan,
    );
    if (routePlan == null) {
      updatePolylines({});
      removeRouteLabelMarkers();
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

  /// Updates [MapProviderState.currentRoutePlan]'s source to the given [source].
  void updateRouteSource(final AlrtLocation source) {
    updateCurrentRoutePlan(
      state.currentRoutePlan?.copyWith(
        origin: source,
      ),
    );
  }

  /// Updates [MapProviderState.currentRoutePlan]'s destination to the given [destination].
  void updateRouteDestination(final AlrtLocation destination) {
    updateCurrentRoutePlan(
      state.currentRoutePlan?.copyWith(
        destination: destination,
      ),
    );
  }
}
