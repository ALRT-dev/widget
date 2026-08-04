import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/learn/views/screens/learn_topics_screen.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  /// Live results or the Learn hub — the prototype's ALRT Feed carries both
  /// behind one toggle, so Learn lives where the searching happens, not
  /// only on the Alerts bell.
  bool _showLearn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          HazardSearchAppBar(),
          10.hSizedBox.sliverBox,
          _modeToggleBuilder().sliverBox,
          10.hSizedBox.sliverBox,
          if (_showLearn)
            SliverToBoxAdapter(
              child: LearnTopicsView(
                padding: EdgeInsets.fromLTRB(
                  16.spMin,
                  4.spMin,
                  16.spMin,
                  120.spMin,
                ),
              ),
            )
          else ...[
            _showingResultsBuilder().sliverBox,
            20.hSizedBox.sliverBox,
            HazardSearchResultsList(),
            30.hSizedBox.sliverBox,
          ],
        ],
      ),
    ).keyboardDismisser(context);
  }

  /// The prototype's Live / Learn segmented toggle, same treatment as the
  /// Alerts screen so the two surfaces stay recognisably one control.
  Widget _modeToggleBuilder() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.spMin),
      child: Container(
        height: 44.spMin,
        padding: EdgeInsets.all(4.spMin),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEDEF),
          borderRadius: BorderRadius.circular(16.spMin),
        ),
        child: Row(
          children: [
            _modeButtonBuilder(label: 'Live', showLearn: false),
            _modeButtonBuilder(label: 'Learn', showLearn: true),
          ],
        ),
      ),
    );
  }

  Widget _modeButtonBuilder({
    required final String label,
    required final bool showLearn,
  }) {
    final isSelected = _showLearn == showLearn;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _showLearn = showLearn),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF23252B) : Colors.transparent,
            borderRadius: BorderRadius.circular(13.spMin),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13.spMin,
              fontWeight: FontWeight.w700,
              color: isSelected ? Colors.white : const Color(0xFF5F5C66),
            ),
          ),
        ),
      ),
    );
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
          children: [
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'Showing results for ',
                    style: TextStyle(
                      color: AppColors.mediumGrey,
                    ),
                  ),
                  TextSpan(
                    text: '"$selectedLocationName"',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: '\nSubscribe to get instant alerts and updates.',
                    style: TextStyle(
                      fontSize: 12.spMin,
                    ),
                  ),
                ],
              ),
            ),
            20.hSizedBox,
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
          height: 48.spMin,
          child: Button.filled(
            onPressed: _handleSubscribePressed,
            isLoading: isLoading,
            padding: EdgeInsets.symmetric(
              vertical: 12.spMin,
            ),
            borderRadius: 14.0,
            color: isSubscribed ? AppColors.grey : null,
            icon: isLoading
                ? null
                : Icon(
                    isSubscribed
                        ? Icons.notifications_off_rounded
                        : Icons.notifications_active_rounded,
                  ),
            iconAndTextSpacing: 8.0,
            value: isLoading
                ? null
                : isSubscribed
                ? 'Unsubscribe'
                : 'Subscribe',
            valueStyle: const TextStyle(),
          ),
        );
      },
    );
  }

  /// Toggles the subscription state when the subscribe button is pressed.
  void _handleSubscribePressed() {
    ref.read(providerOfMainSearch.notifier).toggleSubscription();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // User has scrolled near the bottom (200 pixels before the end)
      _loadMoreHazards();
    }
  }

  void _loadMoreHazards() {
    ref.read(providerOfMainSearch.notifier).getNextHazards();
  }
}
