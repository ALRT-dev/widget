import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/home/enums/home_tab_types.dart';
import 'package:hazard_app/features/home/providers/home_provider.dart';
import 'package:hazard_app/features/home/providers/home_tab_provider.dart';
import 'package:hazard_app/features/home/widgets/home_tabbar.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/providers/map_search_text_editing_controller_provider.dart';
import 'package:hazard_app/features/map/providers/places_provider.dart';
import 'package:hazard_app/features/map/views/screens/map_screen.dart';
import 'package:hazard_app/features/notification/enums/push_notification_types.dart';
import 'package:hazard_app/features/notification/extensions/remote_message_extension.dart';
import 'package:hazard_app/features/notification/providers/manage_notifications_provider.dart';
import 'package:hazard_app/features/notification/providers/notifications_feed_provider.dart';
import 'package:hazard_app/features/notification/providers/push_notification_message_provider.dart';
import 'package:hazard_app/features/notification/views/screens/notifications_screen.dart';
import 'package:hazard_app/features/profile/providers/my_hazards_provider.dart';
import 'package:hazard_app/features/profile/providers/my_location_subscriptions_provider.dart';
import 'package:hazard_app/features/profile/providers/profile_provider.dart';
import 'package:hazard_app/features/profile/views/screens/profile_screen.dart';
import 'package:hazard_app/features/report/providers/create_update_report_provider.dart';
import 'package:hazard_app/features/report/providers/states/create_update_report_provider_state.dart';
import 'package:hazard_app/features/report/views/screens/create_update_report_screen.dart';
import 'package:hazard_app/features/search/providers/main_search_provider.dart';
import 'package:hazard_app/features/search/views/screens/hazard_search_screen.dart';
import 'package:hazard_app/features/shared/enums/hazard_review_status_types.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_categories_provider.dart';
import 'package:hazard_app/features/shared/providers/hazard_severity_filters_provider.dart';
import 'package:hazard_app/features/shared/providers/hazard_socket_manager_provider.dart';
import 'package:hazard_app/features/shared/providers/user_socket_manager_provider.dart';
import 'package:hazard_app/features/shared/views/screens/view_hazard_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  /// Displays the home screen of the app.
  const HomeScreen({super.key});

  static const route = '/home';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(
    length: HomeTab.values.length,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _onInit());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // register this provider to the lifecycle of this screen
    ref.watch(providerOfHome.select((value) => null));
    ref.watch(providerOfMap.select((value) => null));
    ref.watch(providerOfCreateReport.select((value) => null));
    ref.watch(providerOfProfile.select((value) => null));
    ref.watch(providerOfMyHazards.select((value) => null));
    ref.watch(providerOfMyLocationSubscriptions.select((value) => null));
    ref.watch(providerOfMapSearchTextEditingController.select((value) => null));
    ref.watch(providerOfPlacesForMap.select((value) => null));
    ref.watch(providerOfPlacesForSearch.select((value) => null));
    ref.watch(providerOfMainSearch.select((value) => null));
    ref.watch(providerOfNotificationsFeed.select((value) => null));
    ref.watch(providerOfHazardCategoriesForDropdown.select((value) => null));
    ref.watch(providerOfHazardCategoriesForSearch.select((value) => null));
    ref.watch(
      providerOfHazardCategoriesForNotifications.select((value) => null),
    );
    ref.watch(providerOfHazardSeverityFiltersForSearch.select((value) => null));
    ref.watch(
      providerOfHazardSeverityFiltersForNotifications.select((value) => null),
    );
    ref.watch(providerOfPushNotificationMessage.select((value) => null));
    ref.watch(providerOfHazardSocketManager.select((value) => null));
    ref.watch(providerOfUserSocketManager.select((value) => null));
    ref.watch(providerOfManageNotifications.select((value) => null));

    _listenToHomeTabStateChanges();
    _listenToCreateReportState();
    _listenToTheMessageRecievedFromThePushNotification();

    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const MapScreen(),
          const HazardSearchScreen(),
          const CreateUpdateReportScreen(),
          const NotificationsScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: HomeTabbar(
        tabController: _tabController,
      ),
    );
  }

  /// Listens to changes in the selected tab and updates the tab controller.
  void _listenToHomeTabStateChanges() {
    ref.listen<HomeTab>(
      providerOfHomeTab,
      (previous, next) {
        if (previous != next) {
          _tabController.animateTo(next.index);
        }
      },
    );
  }

  /// Listens to changes in the create report state and shows appropriate toasts.
  void _listenToCreateReportState() {
    ref.listen(
      providerOfCreateReport.select(
        (value) => value.creatingUpdatingHazardReports,
      ),
      (prev, next) {
        if (prev != next) {
          final newItems = next.where(
            (item) => !(prev ?? []).any(
              (prevItem) => prevItem.state == item.state,
            ),
          );

          for (final report in newItems) {
            report.state.maybeWhen(
              success: (hazard) {
                if (hazard.reviewStatus == HazardReviewStatus.accepted) {
                  context.showSuccessToast(
                    message:
                        'Your alrt report has been reviewed and posted successfully.',
                  );
                } else if (hazard.reviewStatus == HazardReviewStatus.rejected) {
                  context.showErrorToast(
                    message:
                        hazard.reviewFeedback ?? 'Your alrt report is invalid.',
                  );
                }
              },
              error: _handleError,
              orElse: () {},
            );
          }
        }
      },
    );
  }

  void _onInit() {
    // fetch hazard categories for dropdowns
    ref
        .read(providerOfHazardCategoriesForDropdown.notifier)
        .getAllParentHazardCategories();
  }

  /// Listens to the message received from the push notification.
  void _listenToTheMessageRecievedFromThePushNotification() {
    ref.listen(
      providerOfPushNotificationMessage.select(
        (value) => value.receivedPushNotifMessage,
      ),
      (prev, remoteMessage) {
        if (remoteMessage != null) {
          log('Remote Message: ${remoteMessage.data}');

          switch (remoteMessage.type) {
            case PushNotificationType.viewHazard:
              return _gotoViewHazardScreen(
                Hazard.fromJson(remoteMessage.payload),
              );
            default:
          }
        }
      },
    );
  }

  /// Handles errors by showing a toast message.
  void _handleError(AppError error) {
    context.showErrorToast(
      message: error.message,
    );
  }

  /// Navigates to the view hazard screen with the hazard from the [data].
  void _gotoViewHazardScreen(final Hazard hazard) {
    context.push(
      ViewHazardScreen.route,
      extra: ViewHazardScreenArgs(hazard: hazard),
    );
  }
}
