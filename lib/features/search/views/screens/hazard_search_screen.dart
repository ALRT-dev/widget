import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_results_list.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_appbar.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';

class HazardSearchScreen extends ConsumerStatefulWidget {
  const HazardSearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardSearchScreenState();
}

class _HazardSearchScreenState extends ConsumerState<HazardSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HazardSearchAppBar(),
          20.hSizedBox.sliverBox,
          HazardSearchResultsList(),
        ],
      ),
    ).keyboardDismisser(context);
  }
}
