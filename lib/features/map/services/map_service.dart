import 'dart:io';

import 'package:flutter/widgets.dart' hide Route;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/extensions/lat_lng_list_extension.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/models/google_place_model.dart';
import 'package:hazard_app/features/map/models/route_plan_model.dart';
import 'package:hazard_app/features/map/models/safest_fastest_routes_model.dart';
import 'package:hazard_app/features/map/providers/repository_providers.dart';
import 'package:hazard_app/features/map/repositories/map_repository.dart';
import 'package:hazard_app/features/map/utils/hazard_avoidance_helper.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/enums/sort_category_types.dart';
import 'package:hazard_app/features/shared/enums/sort_order_types.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/hazard_service.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

class MapService {
  MapService(final Ref ref) : _ref = ref;

  final Ref _ref;
  GoogleMapController? _googleMapController;
  HazardService get _hazardService => _ref.read(providerOfHazardService);

  MapRepository get _mapRepository {
    if (_googleMapController == null) {
      throw Exception('GoogleMapController is not initialized');
    }
    return _ref.read(providerOfMapRepository(_googleMapController!));
  }

  /// Initializes the map controller.
  void initializeMapController({
    required final GoogleMapController googleMapController,
  }) {
    _googleMapController = googleMapController;
  }

  /// Animates the camera to the given [cameraUpdate] with an optional [duration].
  Future<Either<void, AppError>> animateCamera({
    required final CameraUpdate cameraUpdate,
    final Duration? duration,
  }) async {
    final result = await _mapRepository.animateCamera(
      cameraUpdate: cameraUpdate,
      duration: duration,
    );
    return result;
  }

  /// Gets the visible region of the map.
  Future<Either<LatLngBounds, AppError>> getVisibleRegion() {
    return _mapRepository.getVisibleRegion();
  }

  /// Fetches places based on the given [searchString].
  Future<Either<List<GooglePlace>, AppError>> getPlaces({
    required final String searchString,
    required final AlrtLocation currentUserLocation,
    final bool showOnlyCities = false,
  }) async {
    final result = await _mapRepository.getPlaces(
      searchString: searchString,
      currentUserLocation: currentUserLocation,
      showOnlyCities: showOnlyCities,
    );
    return result;
  }

  /// Fetches detailed information about a place using its [placeId].
  Future<Either<void, AppError>> getPlaceDetails({
    required final String placeId,
  }) async {
    final result = await _mapRepository.getPlaceDetails(
      placeId: placeId,
    );
    return result;
  }

  Future<Either<String, AppError>> getAddressFromCoordinates({
    required final LatLng coordinates,
    final bool getSubUrbOnly = false,
  }) {
    return _mapRepository.getAddressFromCoordinates(
      coordinates: coordinates,
      getSubUrbOnly: getSubUrbOnly,
    );
  }

  /// Fetches a route plan between [origin] and [destination].
  ///
  /// Returns different travel mode routes including driving, transit, walking, and bicycling.
  Future<Either<RoutePlan, AppError>> getRoutePlan({
    required final AlrtLocation origin,
    required final AlrtLocation destination,
  }) async {
    final result = await Future.wait([
      getRoute(
        origin: origin.latLng,
        destination: destination.latLng,
        travelMode: TravelMode.driving,
      ),
      getRoute(
        origin: origin.latLng,
        destination: destination.latLng,
        travelMode: TravelMode.transit,
      ),
      getRoute(
        origin: origin.latLng,
        destination: destination.latLng,
        travelMode: TravelMode.walking,
      ),
      getRoute(
        origin: origin.latLng,
        destination: destination.latLng,
        travelMode: TravelMode.bicycling,
      ),
    ]);

    final allRoutesApiResponse = result
        .map((either) => either.whenSuccess((response) => response))
        .whereType<RoutesApiResponse>()
        .toList();
    final allRoutes = allRoutesApiResponse
        .expand((response) => response.routes)
        .toList();

    final bounds = allRoutes
        .expand(
          (route) => route.polylinePoints!
              .map((e) => LatLng(e.latitude, e.longitude))
              .toList(),
        )
        .toList()
        .toBounds();

    final hazardsToAvoidResult = await _hazardService.getAllHazards(
      allowEmptyCategoryIds: true,
      allowAllSourceFiltersFalse: true,
      searchParams: HazardSearchParams(
        northeastLat: bounds.northeast.latitude,
        northeastLng: bounds.northeast.longitude,
        southwestLat: bounds.southwest.latitude,
        southwestLng: bounds.southwest.longitude,
        ignoreHazardLatLngBounds: true,
        sortSettings: [
          {SortCategory.severityBand: SortOrder.desc},
          {SortCategory.createdAt: SortOrder.desc},
        ],
        pageSize: 20,
      ),
    );

    final hazardsToAvoid = hazardsToAvoidResult.whenSuccess(
      (hazards) => hazards,
    );

    final travelModeDriving = result[0].whenSuccess(
      (response) => convertRoutesApiResponseToSafestFastestRoutes(
        response: response,
        hazardsToAvoid: hazardsToAvoid,
      ),
    );
    final travelModeTransit = result[1].whenSuccess(
      (response) => convertRoutesApiResponseToSafestFastestRoutes(
        response: response,
        hazardsToAvoid: hazardsToAvoid,
      ),
    );
    final travelModeWalking = result[2].whenSuccess(
      (response) => convertRoutesApiResponseToSafestFastestRoutes(
        response: response,
        hazardsToAvoid: hazardsToAvoid,
      ),
    );
    final travelModeBicycling = result[3].whenSuccess(
      (response) => convertRoutesApiResponseToSafestFastestRoutes(
        response: response,
        hazardsToAvoid: hazardsToAvoid,
      ),
    );

    return Success(
      RoutePlan(
        origin: origin,
        destination: destination,
        hazardsToAvoid: hazardsToAvoid ?? <Hazard>[],
        travelModeRoutes: {
          if (travelModeDriving != null) TravelMode.driving: travelModeDriving,
          if (travelModeTransit != null) TravelMode.transit: travelModeTransit,
          if (travelModeWalking != null) TravelMode.walking: travelModeWalking,
          if (travelModeBicycling != null)
            TravelMode.bicycling: travelModeBicycling,
        },
      ),
    );
  }

  /// Fetches different routes and the hazards near the routes between [origin] and [destination].
  ///
  /// Returns the safest and the fastest routes.
  Future<Either<RoutesApiResponse, AppError>> getRoute({
    required final LatLng origin,
    required final LatLng destination,
    final TravelMode travelMode = TravelMode.driving,
  }) {
    return _mapRepository.getRoute(
      origin: origin,
      destination: destination,
      travelMode: travelMode,
    );
  }

  /// Extracts the safest and fastest routes from the [RoutesApiResponse].
  SafestFastestRoutes? convertRoutesApiResponseToSafestFastestRoutes({
    required final RoutesApiResponse response,
    final List<Hazard>? hazardsToAvoid,
  }) {
    final routes = response.routes;
    if (routes.isEmpty) {
      return null;
    }

    // Determine the safest route if hazards are provided
    Route? safestRoute;
    if (hazardsToAvoid != null && hazardsToAvoid.isNotEmpty) {
      safestRoute = _chooseSafestRoute(routes, hazardsToAvoid);
    }

    // The fastest route based on duration
    Route? fastestRoute;
    for (final route in routes) {
      if (route.duration != null) {
        if (fastestRoute == null ||
            (route.duration! < fastestRoute.duration!)) {
          fastestRoute = route;
        }
      }
    }
    fastestRoute ??= routes.first;

    return SafestFastestRoutes(
      safestRoute: safestRoute ?? fastestRoute,
      fastestRoute: fastestRoute,
      allRoutes: routes,
    );
  }

  /// Chooses the safest route from available options.
  Route? _chooseSafestRoute(
    List<Route> routes,
    List<Hazard> hazards,
  ) {
    if (routes.isEmpty) return null;

    Route? safestRoute;
    double lowestRiskScore = double.infinity;

    for (final route in routes) {
      final riskScore = _calculateRouteRiskScore(route, hazards);
      if (riskScore < lowestRiskScore) {
        lowestRiskScore = riskScore;
        safestRoute = route;
      }
    }

    return safestRoute;
  }

  /// Calculates risk score for a route based on hazard proximity using actual route polyline.
  double _calculateRouteRiskScore(
    Route route,
    List<Hazard> hazards,
  ) {
    try {
      // Check if polylinePoints are available directly on the route
      if (route.polylinePoints != null && route.polylinePoints!.isNotEmpty) {
        // Convert polyline points to LatLng list
        final routePoints = route.polylinePoints!
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();

        // Use the improved hazard analysis with actual route polyline
        final routeAnalysis = HazardAvoidanceHelper.analyzeRouteHazards(
          hazards: hazards,
          routePoints: routePoints,
        );

        // Calculate risk score based on hazard severity and count
        double totalRisk = 0.0;
        totalRisk +=
            routeAnalysis.emergencyHazards * 10.0; // Emergency: 10x weight
        totalRisk +=
            routeAnalysis.highRiskHazards * 5.0; // High risk: 5x weight
        totalRisk +=
            routeAnalysis.mediumRiskHazards * 2.0; // Medium risk: 2x weight
        totalRisk += routeAnalysis.lowRiskHazards * 1.0; // Low risk: 1x weight

        return totalRisk;
      } else {
        // Fallback: assign moderate risk if we can't analyze the route properly
        return hazards.length * 0.5; // Basic risk assessment
      }
    } catch (e) {
      // If we can't decode the route properly, assign moderate risk
      return hazards.length * 1.0;
    }
  }

  /// Gets the screen coordinate for a given [latLng] position on the map.
  ///
  /// On Android, the coordinates are adjusted for device pixel density to return
  /// logical pixels that match Flutter's coordinate system.
  Future<ScreenCoordinate?> getScreenCoordinate(LatLng latLng) async {
    try {
      if (_googleMapController == null) return null;
      final screenCoordinate = await _googleMapController!.getScreenCoordinate(
        latLng,
      );

      // On Android, getScreenCoordinate returns physical pixels
      // We need to convert to logical pixels by dividing by device pixel ratio
      if (Platform.isAndroid) {
        final devicePixelRatio = WidgetsBinding
            .instance
            .platformDispatcher
            .views
            .first
            .devicePixelRatio;
        return ScreenCoordinate(
          x: (screenCoordinate.x / devicePixelRatio).round(),
          y: (screenCoordinate.y / devicePixelRatio).round(),
        );
      }

      return screenCoordinate;
    } catch (e) {
      return null;
    }
  }

  /// Gets the map controller if it's initialized.
  GoogleMapController? get mapController => _googleMapController;
}
