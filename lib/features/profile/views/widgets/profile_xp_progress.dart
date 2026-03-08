import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/enums/user_badge_enum.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/others/app_colors.dart';

class ProfileXpProgress extends ConsumerStatefulWidget {
  const ProfileXpProgress({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileXpProgressState();
}

class _ProfileXpProgressState extends ConsumerState<ProfileXpProgress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.spMin,
      children: [
        _buildXpPoints(),
        _buildProgressBar(),
        _buildBadgeTextSection(),
      ],
    );
  }

  Widget _buildXpPoints() {
    return Consumer(
      builder: (context, ref, child) {
        final xpPoints = ref.watch(
          providerOfLoggedInUser.select(
            (value) => value?.xpPoints ?? 0,
          ),
        );
        final userBadge = ref.watch(
          providerOfLoggedInUser.select(
            (value) => value?.userBadge ?? UserBadge.watcher,
          ),
        );
        final nextBadge = userBadge.nextBadge;
        final requiredXpPoints = nextBadge.requiredXpPoints;
        final isLastBadge = userBadge == UserBadge.values.last;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$xpPoints XP',
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isLastBadge)
                  Text(
                    '🎉',
                    style: TextStyle(
                      fontSize: 16.spMin,
                    ),
                  ).pB(2.0),
                Text(
                  isLastBadge
                      ? 'Completed!'
                      : '${requiredXpPoints - xpPoints} XP to ${nextBadge.title}',
                  style: TextStyle(
                    fontSize: 12.spMin,
                    fontWeight: FontWeight.w700,
                    color: isLastBadge
                        ? AppColors.white
                        : AppColors.grey.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildProgressBar() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Consumer(
          builder: (context, ref, child) {
            final maxXpPoints = UserBadge.values.last.requiredXpPoints;
            final xpPoints = ref.watch(
              providerOfLoggedInUser.select(
                (value) => (value?.xpPoints ?? 0).clamp(0, maxXpPoints),
              ),
            );
            final progressWidth = xpPoints / maxXpPoints * constraints.maxWidth;

            return Container(
              width: double.infinity,
              height: 7.spMin,
              decoration: BoxDecoration(
                color: AppColors.grey.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(100.spMin),
              ),
              child: Row(
                children: [
                  Container(
                    width: progressWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.spMin),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.orange300,
                          AppColors.red200,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBadgeTextSection() {
    return Consumer(
      builder: (context, ref, child) {
        final allBadges = UserBadge.values;
        final userBadge = ref.watch(
          providerOfLoggedInUser.select(
            (value) => value?.userBadge ?? UserBadge.watcher,
          ),
        );

        return Row(
          spacing: 8.spMin,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: allBadges.map(
            (badge) {
              final hasPassedBadge = userBadge.index >= badge.index;
              final isFirstBadge = badge == allBadges.first;

              return Text(
                '${badge.title}${isFirstBadge ? '' : ' · ${badge.requiredXpPoints}'}',
                style: TextStyle(
                  fontSize: 11.spMin,
                  fontWeight: FontWeight.w600,
                  color: hasPassedBadge
                      ? AppColors.orange300
                      : AppColors.grey.withValues(alpha: 0.7),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
