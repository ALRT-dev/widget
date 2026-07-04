import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/auth/views/screens/auth_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_invite_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_place_edit_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_places_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_sharing_level_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_sos_receiver_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_sos_screen.dart';
import 'package:hazard_app/features/home/views/screens/home_screen.dart';
import 'package:hazard_app/features/learn/views/screens/guide_detail_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_circle_profile_screen.dart';
import 'package:hazard_app/features/profile/views/screens/how_points_work_screen.dart';
import 'package:hazard_app/features/learn/views/screens/learn_topics_screen.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/providers/states/map_provider_state.dart';
import 'package:hazard_app/features/map/views/screens/navigation_screen.dart';
import 'package:hazard_app/features/map/views/screens/select_location_on_map_screen.dart';
import 'package:hazard_app/features/map/views/screens/select_location_screen.dart';
import 'package:hazard_app/features/notification/views/screens/manage_notifications_screen.dart';
import 'package:hazard_app/features/onboarding/views/onboarding_alert_sources_screen.dart';
import 'package:hazard_app/features/onboarding/views/onboarding_complete_screen.dart';
import 'package:hazard_app/features/onboarding/views/onboarding_emergency_screen.dart';
import 'package:hazard_app/features/onboarding/views/onboarding_location_screen.dart';
import 'package:hazard_app/features/onboarding/views/onboarding_radius_screen.dart';
import 'package:hazard_app/features/onboarding/views/onboarding_disclaimer_screen.dart';
import 'package:hazard_app/features/onboarding/views/onboarding_legal_screen.dart';
import 'package:hazard_app/features/onboarding/views/onboarding_welcome_screen.dart';
import 'package:hazard_app/features/profile/views/screens/my_hazards_screen.dart';
import 'package:hazard_app/features/profile/views/screens/delete_account_screen.dart';
import 'package:hazard_app/features/profile/views/screens/deleted_account_info_screen.dart';
import 'package:hazard_app/features/profile/views/screens/support_request_screen.dart';
import 'package:hazard_app/features/report/views/screens/create_update_report_screen.dart';
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
            return AppWrapper(
              args: (state.extra as AppWrapperArgs?) ?? const AppWrapperArgs(),
            );
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
          path: OnboardingWelcomeScreen.route,
          builder: (context, state) {
            return const OnboardingWelcomeScreen();
          },
        ),
        GoRoute(
          path: OnboardingDisclaimerScreen.route,
          builder: (context, state) {
            return const OnboardingDisclaimerScreen();
          },
        ),
        GoRoute(
          path: OnboardingLegalScreen.route,
          builder: (context, state) {
            return const OnboardingLegalScreen();
          },
        ),
        GoRoute(
          path: OnboardingLocationScreen.route,
          builder: (context, state) {
            return const OnboardingLocationScreen();
          },
        ),
        GoRoute(
          path: OnboardingRadiusScreen.route,
          builder: (context, state) {
            return const OnboardingRadiusScreen();
          },
        ),
        GoRoute(
          path: OnboardingAlertSourcesScreen.route,
          builder: (context, state) {
            return const OnboardingAlertSourcesScreen();
          },
        ),
        GoRoute(
          path: OnboardingEmergencyScreen.route,
          builder: (context, state) {
            return const OnboardingEmergencyScreen();
          },
        ),
        GoRoute(
          path: OnboardingCompleteScreen.route,
          builder: (context, state) {
            return const OnboardingCompleteScreen();
          },
        ),
        GoRoute(
          path: HomeScreen.route,
          builder: (context, state) {
            return HomeScreen(
              args: (state.extra as HomeScreenArgs?) ?? HomeScreenArgs(),
            );
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
                    state: MapProviderState(
                      getMapHazardsCancelToken: CancelToken(),
                      getHazardsToAvoidCancelToken: CancelToken(),
                    ),
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
        // ------------------------- FAMILY MODE -------------------------
        GoRoute(
          path: FamilyInviteScreen.route,
          builder: (context, state) => const FamilyInviteScreen(),
        ),
        GoRoute(
          path: FamilyPlacesScreen.route,
          builder: (context, state) => const FamilyPlacesScreen(),
        ),
        GoRoute(
          path: FamilyPlaceEditScreen.route,
          builder: (context, state) => FamilyPlaceEditScreen(
            args: state.extra as FamilyPlaceEditScreenArgs?,
          ),
        ),
        GoRoute(
          path: FamilySharingLevelScreen.route,
          builder: (context, state) => const FamilySharingLevelScreen(),
        ),
        GoRoute(
          path: FamilySosScreen.route,
          builder: (context, state) => const FamilySosScreen(),
        ),
        GoRoute(
          path: FamilySosReceiverScreen.route,
          builder: (context, state) => FamilySosReceiverScreen(
            args: state.extra as FamilySosReceiverScreenArgs,
          ),
        ),
        // ------------------------- LEARN HUB -------------------------
        GoRoute(
          path: LearnTopicsScreen.route,
          builder: (context, state) => const LearnTopicsScreen(),
        ),
        GoRoute(
          path: GuideDetailScreen.route,
          builder: (context, state) => GuideDetailScreen(
            args: state.extra as GuideDetailScreenArgs,
          ),
        ),
        GoRoute(
          path: FamilyCircleProfileScreen.route,
          builder: (context, state) => const FamilyCircleProfileScreen(),
        ),
        GoRoute(
          path: HowPointsWorkScreen.route,
          builder: (context, state) => const HowPointsWorkScreen(),
        ),
        GoRoute(
          path: ViewHazardScreen.route,
          builder: (context, state) {
            return ViewHazardScreen(
              args: state.extra as ViewHazardScreenArgs,
            );
          },
        ),
        GoRoute(
          path: MyHazardsScreen.route,
          builder: (context, state) {
            return MyHazardsScreen(
              args:
                  (state.extra as MyHazardsScreenArgs?) ??
                  const MyHazardsScreenArgs(),
            );
          },
        ),
        GoRoute(
          path: CreateUpdateReportScreen.createRoute,
          builder: (context, state) {
            return CreateUpdateReportScreen(
              args: state.extra as CreateUpdateReportScreenArgs?,
            );
          },
        ),
        GoRoute(
          path: CreateUpdateReportScreen.updateRoute,
          builder: (context, state) {
            return CreateUpdateReportScreen(
              args: state.extra as CreateUpdateReportScreenArgs?,
            );
          },
        ),
        GoRoute(
          path: ManageNotificationsScreen.route,
          builder: (context, state) {
            return ManageNotificationsScreen(
              args:
                  (state.extra as ManageNotificationsScreenArgs?) ??
                  const ManageNotificationsScreenArgs(),
            );
          },
        ),
        GoRoute(
          path: SupportRequestScreen.route,
          builder: (context, state) {
            return const SupportRequestScreen();
          },
        ),
        GoRoute(
          path: DeleteAccountScreen.route,
          builder: (context, state) {
            return const DeleteAccountScreen();
          },
        ),
        GoRoute(
          path: DeletedAccountInfoScreen.route,
          builder: (context, state) {
            return const DeletedAccountInfoScreen();
          },
        ),
      ],
    );
  }
}
