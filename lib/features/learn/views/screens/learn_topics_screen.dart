import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/learn/models/guide_models.dart';
import 'package:hazard_app/features/learn/providers/learn_provider.dart';
import 'package:hazard_app/features/learn/views/screens/guide_detail_screen.dart';
import 'package:hazard_app/features/learn/views/widgets/learn_progress_hero_card.dart';
import 'package:hazard_app/features/learn/views/widgets/learn_topic_card.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// The Learn hub content: progress hero card + expandable topic cards.
///
/// This is NOT a routed screen — embed it directly (e.g. as the "Learn"
/// toggle tab of the alerts feed screen). For direct navigation use
/// [LearnTopicsScreen] (route `/learn`) which wraps this in a Scaffold.
class LearnTopicsView extends ConsumerWidget {
  const LearnTopicsView({
    super.key,
    this.padding,
  });

  /// Outer scroll padding; defaults to 16 all around.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenToRefreshErrors(context, ref);

    final learnState = ref.watch(providerOfLearn);

    if (!learnState.hasData) {
      if (learnState.isLoading) return _loadingBuilder();
      if (learnState.error != null) {
        return _errorBuilder(
          context: context,
          ref: ref,
          message: learnState.error?.message,
        );
      }
    }

    return RefreshIndicator(
      color: AppColors.orange,
      onRefresh: () => ref.read(providerOfLearn.notifier).refresh(),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: padding ?? EdgeInsets.all(16.spMin),
        children: [
          LearnProgressHeroCard(
            completedCount: learnState.completedCount,
            totalCount: learnState.totalCount,
            totalXpEarned: learnState.totalXpEarned,
          ),
          20.hSizedBox,
          Text(
            'BE READY FOR',
            style: TextStyle(
              fontSize: 12.spMin,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: AppColors.grey,
            ),
          ),
          10.hSizedBox,
          if (learnState.topics.isEmpty)
            _emptyBuilder()
          else
            ...learnState.topics.map(
              (topic) => Padding(
                padding: EdgeInsets.only(bottom: 12.spMin),
                child: LearnTopicCard(
                  topic: topic,
                  onGuideTap: (guide) => _openGuide(context, topic, guide),
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Shows a toast when a pull-to-refresh fails while stale data is shown.
  void _listenToRefreshErrors(final BuildContext context, final WidgetRef ref) {
    ref.listen(
      providerOfLearn.select((value) => value.error),
      (previous, next) {
        if (next != null && next != previous) {
          final hasData = ref.read(providerOfLearn).hasData;
          if (hasData) {
            context.showErrorToast(
              message: 'Could not refresh guides. Please try again.',
            );
          }
        }
      },
    );
  }

  Widget _loadingBuilder() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.orange,
      ),
    );
  }

  Widget _errorBuilder({
    required final BuildContext context,
    required final WidgetRef ref,
    final String? message,
  }) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.spMin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.wifiOff,
              size: 40.spMin,
              color: AppColors.grey,
            ),
            12.hSizedBox,
            Text(
              'Could not load guides',
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w600,
              ),
            ),
            6.hSizedBox,
            Text(
              (message ?? '').trim().isNotEmpty
                  ? message!.trim()
                  : 'Something went wrong. Please try again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.spMin,
                color: AppColors.grey,
              ),
            ),
            16.hSizedBox,
            OutlinedButton.icon(
              onPressed: () => ref.read(providerOfLearn.notifier).load(),
              icon: Icon(
                LucideIcons.refreshCw,
                size: 16.spMin,
              ),
              label: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyBuilder() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.spMin),
      child: Column(
        children: [
          Icon(
            LucideIcons.bookOpen,
            size: 40.spMin,
            color: AppColors.lightGrey,
          ),
          12.hSizedBox,
          Text(
            'No guides yet',
            style: TextStyle(
              fontSize: 15.spMin,
              fontWeight: FontWeight.w600,
            ),
          ),
          4.hSizedBox,
          Text(
            'Preparedness guides will appear here soon.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.spMin,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }

  void _openGuide(
    final BuildContext context,
    final GuideTopic topic,
    final GuideListItem guide,
  ) {
    context.push(
      GuideDetailScreen.route,
      extra: GuideDetailScreenArgs(
        slugOrId: guide.slug,
        topicName: topic.name,
      ),
    );
  }
}

/// Thin routed wrapper around [LearnTopicsView] for direct navigation.
class LearnTopicsScreen extends StatelessWidget {
  const LearnTopicsScreen({super.key});

  static const route = '/learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Learn',
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        foregroundColor: AppColors.black,
      ),
      body: const LearnTopicsView(),
    );
  }
}
