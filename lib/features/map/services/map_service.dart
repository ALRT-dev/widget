import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/models/google_place_model.dart';
import 'package:hazard_app/features/map/models/route_plan_model.dart';
import 'package:hazard_app/features/map/models/safest_fastest_routes_model.dart';
import 'package:hazard_app/features/map/providers/repository_providers.dart';
import 'package:hazard_app/features/map/repositories/map_repository.dart';
import 'package:hazard_app/features/map/utils/hazard_avoidance_helper.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

class MapService {
  MapService(final Ref ref) : _ref = ref;

  final Ref _ref;
  GoogleMapController? _googleMapController;

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
  }) {
    return _mapRepository.getAddressFromCoordinates(
      coordinates: coordinates,
    );
  }

  Future<Either<RoutePlan, AppError>> getRoutePlan({
    required final AlrtLocation origin,
    required final AlrtLocation destination,
    final List<Hazard>? hazardsToAvoid,
  }) async {
    final result = await Future.wait([
      getRoute(
        origin: origin.latLng,
        destination: destination.latLng,
        hazardsToAvoid: hazardsToAvoid,
        travelMode: TravelMode.driving,
      ),
      getRoute(
        origin: origin.latLng,
        destination: destination.latLng,
        hazardsToAvoid: hazardsToAvoid,
        travelMode: TravelMode.transit,
      ),
      getRoute(
        origin: origin.latLng,
        destination: destination.latLng,
        hazardsToAvoid: hazardsToAvoid,
        travelMode: TravelMode.walking,
      ),
      getRoute(
        origin: origin.latLng,
        destination: destination.latLng,
        hazardsToAvoid: hazardsToAvoid,
        travelMode: TravelMode.bicycling,
      ),
    ]);

    final travelModeDriving = result[0].whenSuccess(
      (response) => response,
    );
    final travelModeTransit = result[1].whenSuccess(
      (response) => response,
    );
    final travelModeWalking = result[2].whenSuccess(
      (response) => response,
    );
    final travelModeBicycling = result[3].whenSuccess(
      (response) => response,
    );

    return Success(
      RoutePlan(
        origin: origin,
        destination: destination,
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

  /// Fetches a route between [origin] and [destination], optionally avoiding [hazardsToAvoid].
  ///
  /// Returns the safest and the fastest routes.
  Future<Either<SafestFastestRoutes, AppError>> getRoute({
    required final LatLng origin,
    required final LatLng destination,
    final TravelMode travelMode = TravelMode.driving,
    final List<Hazard>? hazardsToAvoid,
  }) async {
    final result = await _mapRepository.getRoute(
      origin: origin,
      destination: destination,
      travelMode: travelMode,
    );

    return result.when(
      (response) {
        final routes = response.routes;
        if (routes.isEmpty) {
          return Failure(
            AppError(
              message: 'No routes found between the specified locations.',
            ),
          );
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

        return Success(
          SafestFastestRoutes(
            safestRoute: safestRoute ?? fastestRoute,
            fastestRoute: fastestRoute,
            allRoutes: routes,
          ),
        );
      },
      Failure.new,
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
}
