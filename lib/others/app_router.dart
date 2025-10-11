import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/auth/views/screens/auth_screen.dart';
import 'package:hazard_app/features/home/views/screens/home_screen.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/providers/states/map_provider_state.dart';
import 'package:hazard_app/features/map/views/screens/navigation_screen.dart';
import 'package:hazard_app/features/map/views/screens/select_location_on_map_screen.dart';
import 'package:hazard_app/features/map/views/screens/select_location_screen.dart';
import 'package:hazard_app/features/shared/providers/navigator_key_provider.dart';
import 'package:hazard_app/features/shared/views/screens/splash_screen.dart';
import 'package:hazard_app/features/shared/views/screens/view_hazard_screen.dart';
import 'package:hazard_app/others/app_wrapper.dart';

class AppRouter {
  /// Builds and returns a [GoRouter] instance configured with routes and navigation settings.
  static GoRouter buildRouter(final WidgetRef ref) {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: AppWrapper.route,
      navigatorKey: ref.read(providerOfGlobalNavigatorKey),
      routes: [
        GoRoute(
          path: AppWrapper.route,
          builder: (context, state) {
            return const AppWrapper();
          },
        ),
        GoRoute(
          path: SplashScreen.route,
          builder: (context, state) {
            return const SplashScreen();
          },
        ),
        GoRoute(
          path: AuthScreen.route,
          builder: (context, state) {
            return const AuthScreen();
          },
        ),
        GoRoute(
          path: HomeScreen.route,
          builder: (context, state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: SelectLocationScreen.route,
          builder: (context, state) {
            return SelectLocationScreen(
              args: state.extra as SelectLocationScreenArgs?,
            );
          },
        ),
        GoRoute(
          path: SelectLocationOnMapScreen.route,
          builder: (context, state) {
            return ProviderScope(
              // Create a new ProviderScope to ensure a fresh state for the map screen.
              overrides: [
                providerOfMap.overrideWith(
                  (ref) => MapProvider(
                    ref: ref,
                    state: MapProviderState(),
                  ),
                ),
              ],
              child: SelectLocationOnMapScreen(
                args: state.extra as SelectLocationOnMapScreenArgs?,
              ),
            );
          },
        ),
        GoRoute(
          path: NavigationScreen.route,
          builder: (context, state) {
            return const NavigationScreen();
          },
        ),
        GoRoute(
          path: ViewHazardScreen.route,
          builder: (context, state) {
            return ViewHazardScreen(
              args: state.extra as ViewHazardScreenArgs,
            );
          },
        ),
      ],
    );
  }
}
