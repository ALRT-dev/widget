import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/profile/enums/my_hazards_tab_types.dart';
import 'package:hazard_app/features/profile/views/widgets/accepted_hazards_widgets/my_accepted_hazards_list.dart';
import 'package:hazard_app/features/profile/views/widgets/rejected_hazards_widgets/my_rejected_hazards_list.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/others/app_colors.dart';

class MyHazardsScreenArgs {
  const MyHazardsScreenArgs({
    this.initialTab = MyHazardsTab.accepted,
  });

  /// The initial tab to display when the screen is opened.
  final MyHazardsTab initialTab;
}

class MyHazardsScreen extends ConsumerStatefulWidget {
  const MyHazardsScreen({
    super.key,
    required this.args,
  });

  /// The arguments for the screen.
  final MyHazardsScreenArgs args;

  static const route = '/my-hazards';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyHazardsScreenState();
}

class _MyHazardsScreenState extends ConsumerState<MyHazardsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.args.initialTab.index,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Alrts'),
        bottom: TabBar(
          controller: _tabController,
          dividerColor: AppColors.transparent,
          tabs: const [
            Tab(
              icon: Icon(Icons.check_circle_outline_rounded),
              text: 'Accepted',
            ),
            Tab(
              icon: Icon(Icons.warning_amber_rounded),
              text: 'Rejected',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAcceptedTab(),
          _buildRejectedTab(),
        ],
      ),
    );
  }

  Widget _buildAcceptedTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Accepted Alrts',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          8.hSizedBox,
          Text(
            'These are your hazard alrts that have been reviewed and accepted.',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          16.hSizedBox,
          const Expanded(
            child: MyAcceptedHazardsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRejectedTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Rejected Alrts',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          8.hSizedBox,
          Text(
            'These alrts need updates before they can be approved.',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          16.hSizedBox,
          const Expanded(
            child: MyRejectedHazardsList(),
          ),
        ],
      ),
    );
  }
}
