import 'dart:async';
import 'dart:math' hide log;
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/extensions/lat_lng_list_extension.dart';
import 'package:hazard_app/features/map/extensions/polyline_extension.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/models/route_plan_model.dart';
import 'package:hazard_app/features/map/providers/hazard_markers_bitmaps_provider.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/service_providers.dart';
import 'package:hazard_app/features/map/providers/states/hazard_markers_bitmaps_provider_state.dart';
import 'package:hazard_app/features/map/providers/states/map_provider_state.dart';
import 'package:hazard_app/features/map/services/location_service.dart';
import 'package:hazard_app/features/map/services/map_service.dart';
import 'package:hazard_app/features/map/views/widgets/route_label_marker.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/enums/sort_category_types.dart';
import 'package:hazard_app/features/shared/enums/sort_order_types.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
import 'package:hazard_app/features/shared/providers/hazard_item_provider.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/hazard_service.dart';
import 'package:hazard_app/features/shared/utils/location_helper.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

final providerOfMap =
    StateNotifierProvider.autoDispose<MapProvider, MapProviderState>(
      (ref) => MapProvider(
        ref: ref,
        state: MapProviderState(
          getMapHazardsCancelToken: CancelToken(),
        ),
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
  HazardMarkersBitmapsProviderState get _hazardMarkerBitmapsProviderState =>
      _ref.read(providerOfHazardMarkerBitmaps);

  StreamSubscription<double>? _headingStreamSubscription;
  StreamSubscription? _positionStreamSubscription;

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
      _positionStreamSubscription?.cancel();
      // Reset map ready state when provider is disposed
      if (mounted) {
        state = state.copyWith(
          isMapReady: false,
          pendingAnimationBounds: null,
        );
      }
    });
  }

  /// Initializes the map controller.
  Future<void> init({
    required final GoogleMapController googleMapController,
  }) async {
    _mapService.initializeMapController(
      googleMapController: googleMapController,
    );

    // Mark map as ready
    updateIsMapReady(true);

    // Execute any pending animation
    final pendingBounds = state.pendingAnimationBounds;
    if (pendingBounds != null) {
      animateToBounds(bounds: pendingBounds);
    }
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

    final selectedCategoryIds = _ref
        .read(providerOfHazardFiltersForMap)
        .selectedCategoryIds
        .toList();
    final awsEmergency = _ref.read(providerOfHazardFiltersForMap).awsEmergency;
    final awsWatchAndAct = _ref
        .read(providerOfHazardFiltersForMap)
        .awsWatchAndAct;
    final awsAdvice = _ref.read(providerOfHazardFiltersForMap).awsAdvice;
    final officialNonAws = _ref
        .read(providerOfHazardFiltersForMap)
        .officialNonAws;
    final userReported = _ref.read(providerOfHazardFiltersForMap).userReported;

    // cancel the old requests before making new requests
    if (state.getMapHazardsCancelToken.requestOptions != null) {
      state.getMapHazardsCancelToken.cancel();
      state = state.copyWith(getMapHazardsCancelToken: CancelToken());
    }

    final result = await _hazardService.getAllHazards(
      cancelToken: state.getMapHazardsCancelToken,
      searchParams: HazardSearchParams(
        categoryIds: selectedCategoryIds,
        awsEmergency: awsEmergency,
        awsWatchAndAct: awsWatchAndAct,
        awsAdvice: awsAdvice,
        officialNonAws: officialNonAws,
        userReported: userReported,
        northeastLat: visibleBounds.northeast.latitude,
        northeastLng: visibleBounds.northeast.longitude,
        southwestLat: visibleBounds.southwest.latitude,
        southwestLng: visibleBounds.southwest.longitude,
        ignoreHazardLatLngBounds: true,
        sortSettings: [
          {SortCategory.severityBand: SortOrder.desc},
          {SortCategory.createdAt: SortOrder.desc},
        ],
        pageSize: 20,
      ),
    );
    if (!mounted) return;

    result.when(
      (hazards) {
        state = state.copyWith(
          getMapHazardsState: GetMapHazardsState.success(hazards),
          hazards: hazards,
        );

        final selectedHazard = hazards.firstWhereOrNull(
          (hazard) => hazard.id == state.selectedHazard?.id,
        );
        if (selectedHazard != null) {
          updateSelectedHazard(selectedHazard);
        }

        // Update all the hazards in the hazard item providers
        for (final hazard in hazards) {
          if (hazard.id == null) continue;
          final hazardItemProvider = providerOfHazardItem(hazard.id!);
          _ref.read(hazardItemProvider.notifier).updateHazard(hazard);
        }

        if (hazards.isEmpty) {
          removeAllHazardMarkers();
        } else {
          generateMarkers();
        }
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
  Future<void> getRoutePlan({
    required final AlrtLocation origin,
    required final AlrtLocation destination,
  }) async {
    state = state.copyWith(
      getRouteState: const GetRouteState.loading(),
    );

    final result = await _mapService.getRoutePlan(
      origin: origin,
      destination: destination,
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

  /// Fetches hazards to avoid for the current route plan and updates the state accordingly.
  Future<void> getRoutePlanHazardsToAvoid() async {
    if (state.currentRoutePlan == null) return;

    final allRoutes = state.currentRoutePlan?.currentRoute?.allRoutes ?? [];
    if (allRoutes.isEmpty) return;

    final bounds = allRoutes
        .expand(
          (route) => route.polylinePoints!
              .map((e) => LatLng(e.latitude, e.longitude))
              .toList(),
        )
        .toList()
        .toBounds();

    final result = await _hazardService.getAllHazards(
      numberOfParallelRequests: 5,
      searchParams: HazardSearchParams(
        northeastLat: bounds.northeast.latitude,
        northeastLng: bounds.northeast.longitude,
        southwestLat: bounds.southwest.latitude,
        southwestLng: bounds.southwest.longitude,
        pageSize: 100,
      ),
    );

    result.whenSuccess(updateHazardsToAvoid);
  }

  /// Fetches address from coordinates using the map service and updates the state accordingly.
  Future<void> getAddressFromCoordinates({
    required final LatLng coordinates,
    final bool getSubUrbOnly = false,
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
      getSubUrbOnly: getSubUrbOnly,
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
  /// If the map is not ready, stores the bounds to animate to later.
  Future<void> animateToBounds({
    required final LatLngBounds bounds,
    final double padding = 100.0,
  }) async {
    if (!state.isMapReady) {
      // If map is not ready, store the bounds for later execution
      state = state.copyWith(
        pendingAnimationBounds: bounds,
      );
    } else {
      // If map is ready, attempt to animate immediately
      final result = await _mapService.animateCamera(
        cameraUpdate: CameraUpdate.newLatLngBounds(bounds, padding),
      );
      if (!mounted) return;

      result.when(
        (success) {
          // Animation succeeded, reset pending bounds
          state = state.copyWith(
            pendingAnimationBounds: null,
          );
        },
        (failure) {
          // If animation fails, queue it
          state = state.copyWith(
            pendingAnimationBounds: bounds,
          );
        },
      );
    }
  }

  /// Animates the camera using the given [cameraUpdate].
  Future<void> animateToCameraUpdate({
    required final CameraUpdate cameraUpdate,
  }) async {
    await _mapService.animateCamera(
      cameraUpdate: cameraUpdate,
    );
  }

  /// Starts navigation by centering the camera on the user's current location.
  void startNavigation() async {
    final currentRoutePlan = state.currentRoutePlan;
    if (currentRoutePlan == null) return;

    final currentUserLocation = _ref.read(providerOfLocation).location;
    final origin = currentRoutePlan.origin;
    final destination = currentRoutePlan.destination;

    // If origin is different from current user location, get a new route then start navigation
    if (origin != currentUserLocation) {
      await getRoutePlan(
        origin: currentUserLocation,
        destination: destination,
      );
      if (!mounted) return;
    }

    updateIsNavigating(true);

    final zoom = 18.0;
    final tilt = 20.0;

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

    // Start real-time location tracking during navigation
    _startLocationTracking();

    // Start heading updates
    _startHeadingUpdates();
  }

  /// Starts real-time location tracking using position stream
  void _startLocationTracking() {
    _positionStreamSubscription?.cancel();

    // Use high accuracy location settings for navigation
    final locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 5, // Update every 5 meters
    );

    _positionStreamSubscription = _locationService
        .getPositionStream(locationSettings: locationSettings)
        .listen(
          (position) {
            if (!mounted) return;

            final newLocation = AlrtLocation(
              latitude: position.latitude,
              longitude: position.longitude,
              address: 'Your Location',
            );

            _handleLocationUpdate(newLocation);
          },
          onError: (error) {
            log('Location tracking error: $error');
          },
        );
  }

  /// Handles location updates during navigation
  void _handleLocationUpdate(AlrtLocation newLocation) {
    final currentRoutePlan = state.currentRoutePlan;
    if (currentRoutePlan == null || !currentRoutePlan.isNavigating) return;

    // Update current navigation location and calculate bearing/speed
    _updateNavigationLocation(newLocation);

    // Check if destination is reached
    if (_checkDestinationReached(newLocation)) {
      _handleNavigationComplete();
      return;
    }

    // Check if user is off route and trigger rerouting if needed
    _checkAndHandleRerouting(newLocation);

    // Update route polylines to show progress
    addPolylineForRoutePlan();

    // Update user location marker
    // _updateUserLocationMarker(newLocation);

    // Update camera position smoothly
    _updateNavigationCamera(newLocation);
  }

  /// Updates navigation location and calculates speed/bearing
  void _updateNavigationLocation(AlrtLocation newLocation) {
    final previousLocation = state.currentNavigationLocation;

    double bearing = state.currentBearing;
    double speed = state.currentSpeed;

    if (previousLocation != null) {
      speed = _calculateSpeed(previousLocation, newLocation);
      bearing = _calculateBearing(
        LatLng(previousLocation.latitude, previousLocation.longitude),
        LatLng(newLocation.latitude, newLocation.longitude),
      );
    }

    state = state.copyWith(
      currentNavigationLocation: newLocation,
      currentSpeed: speed,
      currentBearing: bearing,
    );
  }

  /// Calculates speed between two locations in m/s
  double _calculateSpeed(AlrtLocation from, AlrtLocation to) {
    final distance = calculateDistanceInMeters(
      from.latitude,
      from.longitude,
      to.latitude,
      to.longitude,
    );

    // Assume 1 second between updates for speed calculation
    // Apply smoothing to avoid erratic speed readings
    final newSpeed = distance / 1.0; // m/s
    final currentSpeed = state.currentSpeed;

    // Apply simple low-pass filter for smoother speed readings
    const double alpha = 0.3; // Smoothing factor
    return alpha * newSpeed + (1 - alpha) * currentSpeed;
  }

  /// Calculates bearing between two points in degrees (0-360)
  double _calculateBearing(LatLng from, LatLng to) {
    final lat1 = from.latitude * (3.14159265359 / 180);
    final lat2 = to.latitude * (3.14159265359 / 180);
    final deltaLng = (to.longitude - from.longitude) * (3.14159265359 / 180);

    final y = sin(deltaLng) * cos(lat2);
    final x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(deltaLng);

    final bearing = atan2(y, x);
    return (bearing * 180 / 3.14159265359 + 360) % 360;
  }

  /// Toggles whether the camera should follow the user
  void toggleFollowUser() {
    state = state.copyWith(
      followUser: !state.followUser,
    );
  }

  /// Updates or creates a user location marker during navigation
  // ignore: unused_element
  void _updateUserLocationMarker(AlrtLocation location) {
    final userLocationMarker = Marker(
      markerId: const MarkerId('user_location'),
      position: LatLng(location.latitude, location.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(title: 'Your Location'),
      zIndexInt: 10, // Show above route markers
    );

    // Remove existing user location marker and add new one
    final updatedMarkers = Set<Marker>.from(state.markers)
      ..removeWhere((marker) => marker.markerId.value == 'user_location')
      ..add(userLocationMarker);

    updateMarkers(updatedMarkers);
  }

  /// Checks if the destination has been reached
  bool _checkDestinationReached(AlrtLocation currentLocation) {
    final destination = state.currentRoutePlan?.destination;
    if (destination == null) return false;

    const double arrivalThreshold = 20.0; // 20 meters
    final distanceToDestination = calculateDistanceInMeters(
      currentLocation.latitude,
      currentLocation.longitude,
      destination.latitude,
      destination.longitude,
    );

    return distanceToDestination <= arrivalThreshold;
  }

  /// Handles navigation completion
  void _handleNavigationComplete() {
    log('Navigation completed - arrived at destination');

    // Stop navigation after a short delay to show arrival
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        stopNavigation();
        updateCurrentRoutePlan(null); // Clear the route
      }
    });
  }

  /// Checks if user is off route and handles rerouting
  void _checkAndHandleRerouting(AlrtLocation currentLocation) {
    final currentRoutePlan = state.currentRoutePlan;
    if (currentRoutePlan?.currentRoute?.currentRoute.polylinePoints == null) {
      return;
    }

    final routePoints = currentRoutePlan!
        .currentRoute!
        .currentRoute
        .polylinePoints!
        .map((p) => LatLng(p.latitude, p.longitude))
        .toList();

    // Check distance to route
    final userLatLng = LatLng(
      currentLocation.latitude,
      currentLocation.longitude,
    );
    double minDistanceToRoute = double.infinity;

    for (int i = 0; i < routePoints.length - 1; i++) {
      final distance = _calculateDistanceToLineSegment(
        userLatLng,
        routePoints[i],
        routePoints[i + 1],
      );
      if (distance < minDistanceToRoute) {
        minDistanceToRoute = distance;
      }
    }

    // Dynamic rerouting threshold based on travel mode
    final selectedTravelMode = currentRoutePlan.selectedTravelMode;
    double rerouteThreshold = switch (selectedTravelMode) {
      TravelMode.driving => 100.0, // 100m for driving
      TravelMode.walking => 50.0, // 50m for walking
      TravelMode.bicycling => 75.0, // 75m for cycling
      TravelMode.twoWheeler => 75.0, // 75m for two wheeler
      TravelMode.transit => 150.0, // 150m for transit
    };

    // Add some hysteresis to prevent constant rerouting
    if (state.isOffRoute) {
      rerouteThreshold *= 0.7; // Easier to get back on route
    } else {
      rerouteThreshold *= 1.3; // Harder to go off route
    }

    // Update off-route status
    final isOffRoute = minDistanceToRoute > rerouteThreshold;
    if (isOffRoute != state.isOffRoute) {
      state = state.copyWith(isOffRoute: isOffRoute);
    }

    if (minDistanceToRoute > rerouteThreshold) {
      _triggerRerouting(currentLocation);
    }
  }

  /// Triggers automatic rerouting from current location to destination
  void _triggerRerouting(AlrtLocation currentLocation) async {
    final currentRoutePlan = state.currentRoutePlan;
    if (currentRoutePlan?.destination == null) return;

    // Prevent too frequent rerouting
    if (state.getRouteState.maybeWhen(
      orElse: () => false,
      loading: () => true,
    )) {
      return;
    }

    log('User is off route, recalculating...');

    // Get new route from current location to destination
    await getRoutePlan(
      origin: currentLocation,
      destination: currentRoutePlan!.destination,
    );
  }

  /// Updates camera position during navigation
  void _updateNavigationCamera(AlrtLocation location) {
    // Only update camera if user following is enabled
    if (!state.followUser) return;

    final currentBearing = state.currentBearing;
    final currentSpeed = state.currentSpeed;

    // Adjust zoom and tilt based on speed for better navigation experience
    double zoom = 18.0;
    double tilt = 30.0;

    if (currentSpeed > 20) {
      // High speed (>72 km/h)
      zoom = 16.0;
      tilt = 45.0;
    } else if (currentSpeed > 10) {
      // Medium speed (>36 km/h)
      zoom = 17.0;
      tilt = 50.0;
    }

    animateToCameraUpdate(
      cameraUpdate: CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(location.latitude, location.longitude),
          zoom: zoom,
          bearing: currentBearing,
          tilt: tilt,
        ),
      ),
    );
  }

  /// Starts heading updates for navigation
  void _startHeadingUpdates() {
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

  /// Calculates distance from a point to a line segment in meters
  double _calculateDistanceToLineSegment(
    LatLng point,
    LatLng lineStart,
    LatLng lineEnd,
  ) {
    final A = point.latitude - lineStart.latitude;
    final B = point.longitude - lineStart.longitude;
    final C = lineEnd.latitude - lineStart.latitude;
    final D = lineEnd.longitude - lineStart.longitude;

    final dot = A * C + B * D;
    final lenSq = C * C + D * D;

    if (lenSq == 0) {
      return calculateDistanceInMeters(
        point.latitude,
        point.longitude,
        lineStart.latitude,
        lineStart.longitude,
      );
    }

    final param = dot / lenSq;
    final LatLng closestPoint;

    if (param < 0) {
      closestPoint = lineStart;
    } else if (param > 1) {
      closestPoint = lineEnd;
    } else {
      closestPoint = LatLng(
        lineStart.latitude + param * C,
        lineStart.longitude + param * D,
      );
    }

    return calculateDistanceInMeters(
      point.latitude,
      point.longitude,
      closestPoint.latitude,
      closestPoint.longitude,
    );
  }

  /// Stops navigation and cancels heading updates.
  void stopNavigation() {
    updateIsNavigating(false);
    _headingStreamSubscription?.cancel();
    _headingStreamSubscription = null;
    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;

    // Remove user location marker
    _removeUserLocationMarker();
  }

  /// Removes the user location marker
  void _removeUserLocationMarker() {
    final updatedMarkers = Set<Marker>.from(state.markers)
      ..removeWhere((marker) => marker.markerId.value == 'user_location');
    updateMarkers(updatedMarkers);
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
    final currentZoom = state.cameraPosition.zoom;
    final individualMarkers = <Marker>[];

    // At low zoom levels (< 6.5), show small red dots instead of detailed icons
    final useRedDotBitmap = currentZoom < 6.5;
    final redDotBitmap = _hazardMarkerBitmapsProviderState.redDotBitmap;

    for (final hazard in hazards) {
      if (hazard.latitude == null || hazard.longitude == null) continue;

      BitmapDescriptor? bitmapDescriptor;
      if (useRedDotBitmap && redDotBitmap != null) {
        bitmapDescriptor = redDotBitmap;
      } else {
        final markerBitmaps = _hazardMarkerBitmapsProviderState.markerBitmaps;
        bitmapDescriptor = hazard.getMarkerBitmapDescriptor(markerBitmaps);
      }

      individualMarkers.add(
        Marker(
          markerId: MarkerId(
            'hazard_${hazard.id ?? '${hazard.latitude},${hazard.longitude}'}',
          ),
          position: LatLng(hazard.latitude!, hazard.longitude!),
          onTap: () => _onIndividualMarkerTap(
            hazard: hazard,
            isRedDot: useRedDotBitmap,
          ),
          consumeTapEvents: true,
          icon: bitmapDescriptor ?? BitmapDescriptor.defaultMarker,
        ),
      );
    }

    // Preserve non-hazard markers
    final selectedPlaceMarker = state.markers.firstWhereOrNull(
      (marker) => marker.markerId.value == 'selected_location',
    );
    final routeLabelMarkers = state.markers.where(
      (marker) => marker.markerId.value.startsWith('route_label_'),
    );
    final currentUserLocationMarker = state.markers.firstWhereOrNull(
      (marker) => marker.markerId.value == 'user_location',
    );

    final allMarkers = <Marker>{
      ...individualMarkers,
      if (selectedPlaceMarker != null) selectedPlaceMarker,
      ...routeLabelMarkers,
      if (currentUserLocationMarker != null) currentUserLocationMarker,
    };

    updateMarkers(allMarkers);
  }

  void _onIndividualMarkerTap({
    required final Hazard hazard,
    final bool isRedDot = false,
  }) {
    if (isRedDot) {
      // At low zoom levels, just zoom in closer to show detailed marker
      animateTo(
        position: LatLng(hazard.latitude!, hazard.longitude!),
        zoom: 8.0,
      );
      return;
    }

    updateSelectedHazard(hazard);

    // Calculate position with offset to create top padding effect
    final markerPosition = LatLng(hazard.latitude!, hazard.longitude!);

    // Calculate consistent visual offset based on zoom level
    // This ensures the marker appears in the same relative position on screen
    // regardless of zoom level (e.g., 30% from the top of the screen)
    final currentZoom = state.cameraPosition.zoom;

    // Calculate latitude degrees per pixel at current zoom level
    // At zoom level z, each tile is 256 pixels and represents 360/(2^z) degrees
    final degreesPerPixel = 360.0 / (256.0 * pow(2, currentZoom));

    // Offset by approximately 150 pixels (adjust this value to fine-tune positioning)
    // This will consistently place the marker about 150 pixels from the top
    final pixelOffset = 120.0;
    final latOffset = degreesPerPixel * pixelOffset;

    final targetPosition = LatLng(
      markerPosition.latitude + latOffset,
      markerPosition.longitude,
    );

    animateTo(position: targetPosition, zoom: currentZoom + 0.01);
  }

  /// Updates [MapProviderState.isMapReady] to the given [isMapReady].
  void updateIsMapReady(final bool isMapReady) {
    state = state.copyWith(
      isMapReady: isMapReady,
    );
  }

  /// Updates the [MapProviderState.hazards] to the given [hazards].
  void updateHazards(final List<Hazard> hazards) {
    state = state.copyWith(
      hazards: hazards,
    );
  }

  /// Removes a hazard by its [hazardId] from the state.
  void removeFromHazards(final String hazardId) {
    final updatedHazards = state.hazards
        .where((hazard) => hazard.id != hazardId)
        .toList();
    updateHazards(updatedHazards);

    // If the removed hazard was the selected one, clear selection
    if (state.selectedHazard?.id == hazardId) {
      updateSelectedHazard(null);
    }

    // Regenerate markers after removal
    generateMarkers();
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

  /// Removes all hazard markers from the current set of markers.
  void removeAllHazardMarkers() {
    final updatedMarkers = state.markers
        .where(
          (marker) => !marker.markerId.value.startsWith('hazard_'),
        )
        .toSet();
    updateMarkers(updatedMarkers);
  }

  /// Updates [MapProviderState.polylines] to the given [polylines].
  void updatePolylines(final Set<Polyline> polylines) {
    state = state.copyWith(
      polylines: polylines,
    );
  }

  /// Adds a polyline for current route plan.
  ///
  /// If [animateToBounds] is true, animates the camera to fit the route bounds.
  void addPolylineForRoutePlan({
    final bool animateToBounds = true,
  }) {
    var polylines = <Polyline>{};

    final allRoutes = (state.currentRoutePlan?.currentRoute?.allRoutes ?? []);
    final isNavigating = state.currentRoutePlan?.isNavigating ?? false;

    for (final route in allRoutes) {
      final routePoints = route.polylinePoints!
          .map((e) => LatLng(e.latitude, e.longitude))
          .toList();
      if (routePoints.isEmpty) continue;

      final selectedTravelMode = state.currentRoutePlan?.selectedTravelMode;
      if (selectedTravelMode == null) continue;

      final isCurrentRoute =
          state.currentRoutePlan?.currentRoute?.currentRoute == route;

      if (isNavigating && isCurrentRoute) {
        // During navigation, split the route into passed and upcoming segments
        final routeSegments = _createNavigationRouteSegments(routePoints);
        polylines.addAll(routeSegments);
      } else {
        // Normal route display (not navigating or not the current route)
        final polyLine = Polyline(
          polylineId: PolylineId('route_${allRoutes.indexOf(route)}'),
          color: isCurrentRoute
              ? AppColors.darkBlue
              : AppColors.darkBlue.withValues(alpha: 0.3),
          points: routePoints,
          width: isCurrentRoute ? 10 : 8,
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
              animateToRouteBounds: false,
            );
          },
        );
        polylines.add(polyLine);
      }
    }

    // Update polylines in the state
    updatePolylines(polylines);

    // Add route label markers (only when not navigating)
    if (!isNavigating) {
      addRouteLabelMarkers();
    } else {
      removeRouteLabelMarkers();
    }

    // If not navigating, animate to fit the route bounds
    if (!isNavigating && animateToBounds) {
      final currentRoutePoints =
          state.currentRoutePlan?.currentRoute?.currentRoute.polylinePoints
              ?.map((e) => LatLng(e.latitude, e.longitude))
              .toList() ??
          [];

      if (currentRoutePoints.isNotEmpty) {
        this.animateToBounds(
          bounds: currentRoutePoints.toBounds(),
        );
      }
    }
  }

  /// Creates route segments for navigation with different colors for passed and upcoming parts
  Set<Polyline> _createNavigationRouteSegments(List<LatLng> routePoints) {
    final polylines = <Polyline>{};

    // Get current user location from navigation state
    final currentLocation = state.currentNavigationLocation;
    if (currentLocation == null) {
      // If no current location, show entire route in active color
      polylines.add(
        Polyline(
          polylineId: const PolylineId('active_route'),
          color: AppColors.darkBlue,
          points: routePoints,
          width: 8,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          jointType: JointType.round,
        ),
      );
      return polylines;
    }

    final userLatLng = LatLng(
      currentLocation.latitude,
      currentLocation.longitude,
    );

    // Find the closest point on the route to the user's current location
    int closestSegmentIndex = 0;
    double minDistance = double.infinity;

    for (int i = 0; i < routePoints.length - 1; i++) {
      final distance = _calculateDistanceToLineSegment(
        userLatLng,
        routePoints[i],
        routePoints[i + 1],
      );
      if (distance < minDistance) {
        minDistance = distance;
        closestSegmentIndex = i;
      }
    }

    // Choose colors based on whether user is on route
    final isOffRoute = state.isOffRoute;
    final activeColor = isOffRoute ? AppColors.red : AppColors.darkBlue;
    final passedColor = AppColors.grey.withValues(alpha: 0.6);

    // Create passed route segment (gray/dimmed)
    if (closestSegmentIndex > 0) {
      final passedPoints = routePoints.sublist(0, closestSegmentIndex + 1);
      polylines.add(
        Polyline(
          polylineId: const PolylineId('passed_route'),
          color: passedColor,
          points: passedPoints,
          width: 6,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          jointType: JointType.round,
        ),
      );
    }

    // Create upcoming route segment (active color - darkBlue if on route, red if off route)
    if (closestSegmentIndex < routePoints.length - 1) {
      final upcomingPoints = routePoints.sublist(closestSegmentIndex);
      polylines.add(
        Polyline(
          polylineId: const PolylineId('upcoming_route'),
          color: activeColor,
          points: upcomingPoints,
          width: 8,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          jointType: JointType.round,
          patterns: isOffRoute
              ? [PatternItem.dash(20), PatternItem.gap(10)]
              : [],
        ),
      );
    }

    return polylines;
  }

  /// Adds route label markers for fastest and safest routes.
  void addRouteLabelMarkers() async {
    final currentRoute = state.currentRoutePlan?.currentRoute;
    if (currentRoute == null) return;

    final routes = currentRoute.allRoutes;
    if (routes.length < 2) return; // No need to add labels if only one route

    final fastestRoute = currentRoute.fastestRoute;
    final safestRoute = currentRoute.safestRoute;

    log('State markers before adding route labels: ${state.markers.length}');

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
          backgroundColor: AppColors.darkBlue,
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
            backgroundColor: AppColors.darkBlue,
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
  ///
  /// If [routePlan] is null, removes existing polylines and route label markers.
  /// If [animateToRouteBounds] is true, animates the camera to fit the route bounds.
  void updateCurrentRoutePlan(
    final RoutePlan? routePlan, {
    final bool animateToRouteBounds = true,
    final bool updatePolylines = true,
  }) {
    state = state.copyWith(
      currentRoutePlan: routePlan,
    );

    if (updatePolylines) {
      if (routePlan == null) {
        this.updatePolylines({});
        removeRouteLabelMarkers();
      } else {
        addPolylineForRoutePlan(
          animateToBounds: animateToRouteBounds,
        );
      }
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

  /// Updates [MapProviderState.currentRoutePlan]'s hazards to avoid to the given [hazardsToAvoid].
  void updateHazardsToAvoid(final List<Hazard> hazardsToAvoid) {
    updateCurrentRoutePlan(
      state.currentRoutePlan?.copyWith(
        hazardsToAvoid: hazardsToAvoid,
      ),

      // No need to update polylines here as the route itself hasn't changed
      updatePolylines: false,
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
