import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';

part 'route_plan_model.freezed.dart';

@freezed
abstract class RoutePlan with _$RoutePlan {
  const RoutePlan._();

  const factory RoutePlan({
    /// The origin location for the route.
    required final AlrtLocation origin,

    /// The destination location for the route.
    required final AlrtLocation destination,

    /// Currently selected travel mode.
    @Default(TravelMode.driving) final TravelMode selectedTravelMode,

    /// Map of travel modes to their corresponding route responses.
    @Default(<TravelMode, RoutesApiResponse>{})
    final Map<TravelMode, RoutesApiResponse> travelModeRoutes,

    /// Whether navigation is currently active.
    @Default(false) final bool isNavigating,
  }) = _RoutePlan;

  /// Gets the current route based on the selected travel mode.
  RoutesApiResponse? get currentRoute => travelModeRoutes[selectedTravelMode];
}
