import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/models/route_plan_model.dart';
import 'package:hazard_app/features/map/utils/constants.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';

part 'map_provider_state.freezed.dart';

@freezed
abstract class MapProviderState with _$MapProviderState {
  const factory MapProviderState({
    /// The current camera position of the map.
    @Default(kDefaultCameraPosition) final CameraPosition cameraPosition,

    /// The set of markers displayed on the map.
    @Default(<Marker>{}) final Set<Marker> markers,

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
  }) = _MapProviderState;
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
