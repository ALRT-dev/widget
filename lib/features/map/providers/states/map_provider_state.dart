import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/utils/constants.dart';

part 'map_provider_state.freezed.dart';

@freezed
abstract class MapProviderState with _$MapProviderState {
  const factory MapProviderState({
    /// The current camera position of the map.
    @Default(kDefaultCameraPosition) final CameraPosition cameraPosition,

    /// The set of markers displayed on the map.
    @Default(<Marker>{}) final Set<Marker> markers,
  }) = _MapProviderState;
}
