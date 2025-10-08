import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/models/google_place_model.dart';
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

    /// The search string used to fetch places.
    @Default('') final String searchString,

    /// The list of places fetched from the map service after [getPlacesState] is successful.
    @Default(<GooglePlace>[]) final List<GooglePlace> places,

    /// The currently selected place on the map, if any.
    final GooglePlace? selectedPlace,

    /// The state of fetching places.
    @Default(GetPlacesState.initial()) final GetPlacesState getPlacesState,

    /// The state of fetching route.
    @Default(GetRouteState.initial()) final GetRouteState getRouteState,
  }) = _MapProviderState;
}

@freezed
class GetPlacesState with _$GetPlacesState {
  const factory GetPlacesState.initial() = _GetPlacesStateInitial;
  const factory GetPlacesState.loading() = _GetPlacesStateLoading;
  const factory GetPlacesState.success(
    final List<GooglePlace> places,
  ) = _GetPlacesStateSuccess;
  const factory GetPlacesState.error(
    final AppError error,
  ) = _GetPlacesStateError;
}

@freezed
class GetRouteState with _$GetRouteState {
  const factory GetRouteState.initial() = _GetRouteStateInitial;
  const factory GetRouteState.loading() = _GetRouteStateLoading;
  const factory GetRouteState.success() = _GetRouteStateSuccess;
  const factory GetRouteState.error(
    final AppError error,
  ) = _GetRouteStateError;
}
