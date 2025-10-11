import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/home/enums/home_tab_types.dart';
import 'package:hazard_app/features/home/widgets/home_tabbar.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/providers/map_search_text_editing_controller_provider.dart';
import 'package:hazard_app/features/map/providers/places_provider.dart';
import 'package:hazard_app/features/map/views/screens/map_screen.dart';
import 'package:hazard_app/features/notification/providers/notifications_feed_provider.dart';
import 'package:hazard_app/features/notification/views/screens/notifications_screen.dart';
import 'package:hazard_app/features/report/providers/create_report_provider.dart';
import 'package:hazard_app/features/report/providers/states/create_report_provider_state.dart';
import 'package:hazard_app/features/report/views/screens/create_report_screen.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/search/providers/main_search_provider.dart';
import 'package:hazard_app/features/search/views/screens/hazard_search_screen.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_categories_provider.dart';

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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // register this provider to the lifecycle of this screen
    ref.watch(providerOfMap.select((value) => null));
    ref.watch(providerOfHazards.select((value) => null));
    ref.watch(providerOfCreateReport.select((value) => null));
    ref.watch(providerOfMapSearchTextEditingController.select((value) => null));
    ref.watch(providerOfPlacesForMap.select((value) => null));
    ref.watch(providerOfPlacesForSearch.select((value) => null));
    ref.watch(providerOfMainSearch.select((value) => null));
    ref.watch(providerOfNotificationsFeed.select((value) => null));
    ref.watch(providerOfHazardCategoriesForSearch.select((value) => null));
    ref.watch(
      providerOfHazardCategoriesForNotifications.select((value) => null),
    );

    _listenToHazardsState();
    _listenToCreateReportState();

    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const MapScreen(),
          const HazardSearchScreen(),
          const CreateReportScreen(),
          const NotificationsScreen(),
          const SizedBox(),
        ],
      ),
      bottomNavigationBar: HomeTabbar(
        tabController: _tabController,
      ),
    );
  }

  /// Listens to changes in the hazards state and updates the map markers accordingly.
  void _listenToHazardsState() {
    ref.listen(
      providerOfHazards.select(
        (value) => value.mapHazards,
      ),
      (prev, next) {
        if (prev != next) {
          ref.read(providerOfMap.notifier).generateMarkers();
        }
      },
    );
  }

  /// Listens to changes in the create report state and shows appropriate toasts.
  void _listenToCreateReportState() {
    ref.listen(
      providerOfCreateReport.select(
        (value) => value.creatingHazardReports,
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
              success: (hazard) => context.showSuccessToast(
                message: 'Report submitted successfully!',
              ),
              error: _handleError,
              orElse: () {},
            );
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
}
