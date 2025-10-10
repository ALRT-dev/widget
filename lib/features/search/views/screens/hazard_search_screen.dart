import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/search/providers/main_search_provider.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_results_list.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_appbar.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/views/widgets/button.dart';

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
          10.hSizedBox.sliverBox,
          _showingResultsBuilder().sliverBox,
          20.hSizedBox.sliverBox,
          HazardSearchResultsList(),
          10.hSizedBox.sliverBox,
        ],
      ),
    ).keyboardDismisser(context);
  }

  Widget _showingResultsBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final selectedLocationName = ref.watch(
          providerOfMainSearch.select(
            (value) => value.searchedLocation?.displayName,
          ),
        );
        if (selectedLocationName == null) {
          return const SizedBox();
        }

        final isHazardsEmpty = ref.watch(
          providerOfMainSearch.select(
            (value) => value.hazards.isEmpty,
          ),
        );
        if (isHazardsEmpty) return const SizedBox();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.spMin,
          children: [
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'Showing results for ',
                  ),
                  TextSpan(
                    text: '"$selectedLocationName"',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: '. Subscribe to get instant alerts and updates. ',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.spMin,
              child: Button.filled(
                width: 110.spMin,
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.notifications_active,
                  size: 16,
                ),
                value: 'Subscribe',
                valueStyle: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ).pX(20.0);
      },
    );
  }
}
