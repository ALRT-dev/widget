import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_plan_model.freezed.dart';

@freezed
abstract class RoutePlan with _$RoutePlan {
  const RoutePlan._();

  const factory RoutePlan({
    /// Currently selected travel mode.
    @Default(TravelMode.driving) final TravelMode selectedTravelMode,

    /// Map of travel modes to their corresponding route responses.
    @Default(<TravelMode, RoutesApiResponse>{})
    final Map<TravelMode, RoutesApiResponse> travelModeRoutes,
  }) = _RoutePlan;

  /// Gets the current route based on the selected travel mode.
  RoutesApiResponse? get currentRoute => travelModeRoutes[selectedTravelMode];
}
