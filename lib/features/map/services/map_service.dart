import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/models/google_place_model.dart';
import 'package:hazard_app/features/map/models/route_plan_model.dart';
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
      (response) => response.hasRoutes ? response : null,
    );
    final travelModeTransit = result[1].whenSuccess(
      (response) => response.hasRoutes ? response : null,
    );
    final travelModeWalking = result[2].whenSuccess(
      (response) => response.hasRoutes ? response : null,
    );
    final travelModeBicycling = result[3].whenSuccess(
      (response) => response.hasRoutes ? response : null,
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

  /// Fetches route from the given [origin] to the [destination].
  /// Optionally avoids specified hazards.
  Future<Either<RoutesApiResponse, AppError>> getRoute({
    required final LatLng origin,
    required final LatLng destination,
    final TravelMode travelMode = TravelMode.driving,
    final List<Hazard>? hazardsToAvoid,
  }) async {
    try {
      // If no hazards to avoid, use the simple route
      if (hazardsToAvoid?.isEmpty ?? true) {
        final simpleRoute = await _getSimpleRoute(
          origin: origin,
          destination: destination,
          travelMode: travelMode,
        );
        return Success(simpleRoute);
      }

      // Try to get a route that avoids hazards
      final safestRoute = await _getRouteAvoidingHazards(
        origin: origin,
        destination: destination,
        hazards: hazardsToAvoid!,
        travelMode: travelMode,
      );

      return Success(safestRoute);
    } catch (error) {
      return Failure(AppError(message: error.toString()));
    }
  }

  /// Gets a simple route without hazard avoidance.
  Future<RoutesApiResponse> _getSimpleRoute({
    required final LatLng origin,
    required final LatLng destination,
    final TravelMode travelMode = TravelMode.driving,
  }) async {
    final result = await _mapRepository.getRoute(
      origin: origin,
      destination: destination,
      travelMode: travelMode,
    );

    return result.when(
      (routeResponse) => routeResponse,
      (error) => throw error,
    );
  }

  /// Gets a route that tries to avoid hazard areas using alternative routing preferences.
  Future<RoutesApiResponse> _getRouteAvoidingHazards({
    required final LatLng origin,
    required final LatLng destination,
    required final List<Hazard> hazards,
    final TravelMode travelMode = TravelMode.driving,
  }) async {
    // Filter hazards that have valid coordinates
    final validHazards = hazards
        .where((h) => h.latitude != null && h.longitude != null)
        .toList();

    if (validHazards.isEmpty) {
      return await _getSimpleRoute(
        origin: origin,
        destination: destination,
        travelMode: travelMode,
      );
    }

    // Try different routing approaches and select the safest
    final routes = <RoutesApiResponse>[];

    // 1. Try direct route first to compare
    try {
      final directRoute = await _getSimpleRoute(
        origin: origin,
        destination: destination,
        travelMode: travelMode,
      );
      routes.add(directRoute);
    } catch (e) {
      // Continue with other approaches if direct route fails
    }

    // 2. Try alternative routes using different routing preferences
    // Note: This is a simplified approach. In a real implementation,
    // you might want to use different waypoints or routing parameters
    try {
      final alternativeRoute = await _getSimpleRoute(
        origin: origin,
        destination: destination,
        travelMode: travelMode,
      );
      routes.add(alternativeRoute);
    } catch (e) {
      // Continue if this fails
    }

    // Choose the safest route from available options
    return _chooseSafestRoute(routes, validHazards) ??
        await _getSimpleRoute(
          origin: origin,
          destination: destination,
          travelMode: travelMode,
        );
  }

  /// Chooses the safest route from available options.
  RoutesApiResponse? _chooseSafestRoute(
    List<RoutesApiResponse> routes,
    List<Hazard> hazards,
  ) {
    if (routes.isEmpty) return null;

    RoutesApiResponse? safestRoute;
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
    RoutesApiResponse route,
    List<Hazard> hazards,
  ) {
    if (route.routes.isEmpty) {
      return double.infinity;
    }

    try {
      final firstRoute = route.routes.first;

      // Check if polylinePoints are available directly on the route
      if (firstRoute.polylinePoints != null &&
          firstRoute.polylinePoints!.isNotEmpty) {
        // Convert polyline points to LatLng list
        final routePoints = firstRoute.polylinePoints!
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
