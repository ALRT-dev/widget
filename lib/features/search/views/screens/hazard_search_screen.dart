import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/search/providers/main_search_provider.dart';
import 'package:hazard_app/features/search/providers/states/main_search_provider_state.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_results_list.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_appbar.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/views/widgets/button.dart';
import 'package:hazard_app/others/app_colors.dart';

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
            _subscribeButtonBuilder(),
          ],
        ).pX(20.0);
      },
    );
  }

  Widget _subscribeButtonBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final isLoading = ref.watch(
          providerOfMainSearch.select(
            (value) =>
                value.subscribeToLocationState.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                ) ||
                value.unsubscribeFromLocationState.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                ),
          ),
        );
        final isSubscribed = ref.watch(
          providerOfMainSearch.select(
            (value) => value.subscriptionId != null,
          ),
        );
        return SizedBox(
          height: 30.spMin,
          child: Button.filled(
            width: 120.spMin,
            onPressed: _handleSubscribePressed,
            isLoading: isLoading,
            padding: EdgeInsets.zero,
            color: isSubscribed ? AppColors.grey : null,
            icon: isLoading
                ? null
                : Icon(
                    isSubscribed
                        ? Icons.notifications_off_rounded
                        : Icons.notifications_active_rounded,
                    size: 16,
                  ),
            borderRadius: 8.0,
            value: isLoading
                ? null
                : isSubscribed
                ? 'Unsubscribe'
                : 'Subscribe',
            valueStyle: const TextStyle(
              fontSize: 12,
            ),
          ),
        );
      },
    );
  }

  /// Toggles the subscription state when the subscribe button is pressed.
  void _handleSubscribePressed() {
    ref.read(providerOfMainSearch.notifier).toggleSubscription();
  }
}
