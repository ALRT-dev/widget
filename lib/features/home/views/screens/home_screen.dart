import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/home/enums/home_tab_types.dart';
import 'package:hazard_app/features/home/widgets/home_tabbar.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/views/screens/map_screen.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/search/views/screens/hazard_search_screen.dart';

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

    _listenToHazardsState();

    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const MapScreen(),
          const HazardSearchScreen(),
          const SizedBox(),
          const SizedBox(),
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
        (value) => value.hazards,
      ),
      (prev, next) {
        if (prev != next) {
          ref.read(providerOfMap.notifier).generateMarkers();
        }
      },
    );
  }
}
