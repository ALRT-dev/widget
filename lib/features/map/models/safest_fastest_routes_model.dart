import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'safest_fastest_routes_model.freezed.dart';

@freezed
abstract class SafestFastestRoutes with _$SafestFastestRoutes {
  const SafestFastestRoutes._();

  const factory SafestFastestRoutes({
    /// The safest route determined by the application.
    required final Route safestRoute,

    /// The fastest route determined by the application.
    required final Route fastestRoute,

    /// The list of all available routes.
    required final List<Route> allRoutes,

    /// The currently selected route amoung the routes.
    final Route? selectedRoute,
  }) = _SafestFastestRoutes;

  /// Gets the current route, prioritizing the selected route if available.
  Route get currentRoute => selectedRoute ?? safestRoute;
}
