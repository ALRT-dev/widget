import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_cluster_manager_2/google_maps_cluster_manager_2.dart'
    as cluster_manager;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/models/route_plan_model.dart';
import 'package:hazard_app/features/map/utils/constants.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';

part 'map_provider_state.freezed.dart';

@freezed
abstract class MapProviderState with _$MapProviderState {
  const factory MapProviderState({
    /// The cancel token for fetching map hazards.
    required final CancelToken getMapHazardsCancelToken,

    /// The cancel token for fetching hazards to avoid.
    required final CancelToken getHazardsToAvoidCancelToken,

    /// The list of hazards displayed on the map.
    @Default(<Hazard>[]) final List<Hazard> hazards,

    /// The currently selected hazard on the map, if any.
    final Hazard? selectedHazard,

    /// The current camera position of the map.
    @Default(kDefaultCameraPosition) final CameraPosition cameraPosition,

    /// The set of markers displayed on the map.
    @Default(<Marker>{}) final Set<Marker> markers,

    /// The cluster manager for hazard markers.
    final cluster_manager.ClusterManager? clusterManager,

    /// The set of polylines displayed on the map.
    @Default(<Polyline>{}) final Set<Polyline> polylines,

    /// The currently selected location on the map, if any.
    final AlrtLocation? selectedLocation,

    /// The current route plan, including travel mode and route responses.
    final RoutePlan? currentRoutePlan,

    /// The state of fetching route.
    @Default(GetRouteState.initial()) final GetRouteState getRouteState,

    /// The state of fetching address from coordinates.
    @Default(GetAddressFromCoordinatesState.initial())
    final GetAddressFromCoordinatesState getAddressFromCoordinatesState,

    /// The state of fetching hazards for the map.
    @Default(GetMapHazardsState.initial())
    final GetMapHazardsState getMapHazardsState,

    // Navigation-related fields
    /// Current user location during navigation
    final AlrtLocation? currentNavigationLocation,

    /// Current speed (m/s)
    @Default(0.0) final double currentSpeed,

    /// Current bearing/direction in degrees (0-360)
    @Default(0.0) final double currentBearing,

    /// Whether the user is off-route
    @Default(false) final bool isOffRoute,

    /// Camera should follow user during navigation
    @Default(true) final bool followUser,

    /// Navigation state
    @Default(NavigationState.idle) final NavigationState navigationState,

    /// Whether the map controller is ready for operations
    @Default(false) final bool isMapReady,

    /// Pending camera update to apply when the map is ready
    final CameraUpdate? pendingCameraUpdateToApply,

    /// Whether to show route hazards
    @Default(false) final bool showRouteHazards,

    /// In-memory hazard cache keyed by hazard ID.
    @Default(<String, Hazard>{}) final Map<String, Hazard> hazardCache,
  }) = _MapProviderState;
}

enum NavigationState {
  idle,
  starting,
  active,
  paused,
  completed,
  error,
}

@freezed
class GetRouteState with _$GetRouteState {
  const factory GetRouteState.initial() = _GetRouteStateInitial;
  const factory GetRouteState.loading() = _GetRouteStateLoading;
  const factory GetRouteState.success(
    final RoutePlan routeSettings,
  ) = _GetRouteStateSuccess;
  const factory GetRouteState.error(
    final AppError error,
  ) = _GetRouteStateError;
}

@freezed
abstract class GetAddressFromCoordinatesState
    with _$GetAddressFromCoordinatesState {
  const factory GetAddressFromCoordinatesState.initial() =
      _GetAddressFromCoordinatesStateInitial;
  const factory GetAddressFromCoordinatesState.loading() =
      _GetAddressFromCoordinatesStateLoading;
  const factory GetAddressFromCoordinatesState.success(
    final AlrtLocation location,
  ) = _GetAddressFromCoordinatesStateSuccess;
  const factory GetAddressFromCoordinatesState.error(
    final AppError error,
  ) = _GetAddressFromCoordinatesStateError;
}

@freezed
abstract class GetMapHazardsState with _$GetMapHazardsState {
  const factory GetMapHazardsState.initial() = _GetMapHazardsStateInitial;
  const factory GetMapHazardsState.loading() = _GetMapHazardsStateLoading;
  const factory GetMapHazardsState.success(
    final List<Hazard> hazards,
  ) = _GetMapHazardsStateSuccess;
  const factory GetMapHazardsState.error(
    final AppError error,
  ) = _GetMapHazardsStateError;
}
