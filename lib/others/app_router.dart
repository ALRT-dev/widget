import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/shared/providers/navigator_key_provider.dart';
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
      ],
    );
  }
}
