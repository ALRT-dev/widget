import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/notification/views/widgets/notifications_appbar.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_results_list.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NotificationsAppBar(),
          10.hSizedBox.sliverBox,
          HazardSearchResultsList(),
          10.hSizedBox.sliverBox,
        ],
      ),
    ).keyboardDismisser(context);
  }
}
