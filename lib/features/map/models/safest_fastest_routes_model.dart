import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/map/models/route_step_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';

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

    /// The hazards relevant to each route in [allRoutes].
    ///
    /// Routes without any nearby hazards map to an empty list.
    @Default(<Route, List<Hazard>>{})
    final Map<Route, List<Hazard>> routeHazards,

    /// The turn-by-turn navigation steps for each route in [allRoutes].
    ///
    /// Routes without parsable steps map to an empty list.
    @Default(<Route, List<RouteStep>>{})
    final Map<Route, List<RouteStep>> routeSteps,
  }) = _SafestFastestRoutes;

  /// Gets the current route, prioritizing the selected route if available.
  Route get currentRoute => selectedRoute ?? safestRoute;

  /// Returns the hazards relevant to [route], or an empty list if none.
  List<Hazard> hazardsForRoute(final Route route) =>
      routeHazards[route] ?? const <Hazard>[];

  /// Returns the turn-by-turn steps for [route], or an empty list if none.
  List<RouteStep> stepsForRoute(final Route route) =>
      routeSteps[route] ?? const <RouteStep>[];
}
