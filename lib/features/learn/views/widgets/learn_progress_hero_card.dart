import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Dark hero card on top of the Learn tab: "3 of 20 guides done",
/// a progress bar and an orange "+30 XP" pill.
class LearnProgressHeroCard extends StatelessWidget {
  const LearnProgressHeroCard({
    super.key,
    required this.completedCount,
    required this.totalCount,
    required this.totalXpEarned,
  });

  final int completedCount;
  final int totalCount;
  final int totalXpEarned;

  double get _progress =>
      totalCount == 0 ? 0 : (completedCount / totalCount).clamp(0, 1);

  String get _subtitle {
    if (totalCount == 0) {
      return 'Guides are on their way — check back soon.';
    }
    if (completedCount == 0) {
      return 'Start a guide below — each one earns XP.';
    }
    if (completedCount >= totalCount) {
      return 'All guides done — great work staying prepared.';
    }
    final remaining = totalCount - completedCount;
    return '$remaining more to go — each guide earns XP.';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.spMin),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(16.spMin),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  totalCount == 0
                      ? 'Be ready before it happens'
                      : '$completedCount of $totalCount guides done',
                  style: TextStyle(
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
              8.wSizedBox,
              _xpPillBuilder(),
            ],
          ),
          6.hSizedBox,
          Text(
            _subtitle,
            style: TextStyle(
              fontSize: 12.spMin,
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            ),
          ),
          14.hSizedBox,
          _progressBarBuilder(),
        ],
      ),
    );
  }

  Widget _xpPillBuilder() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.spMin,
        vertical: 6.spMin,
      ),
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(100.spMin),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            LucideIcons.bookOpen,
            color: AppColors.white,
            size: 14.spMin,
          ),
          5.wSizedBox,
          Text(
            '+$totalXpEarned XP',
            style: TextStyle(
              fontSize: 12.spMin,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _progressBarBuilder() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          height: 7.spMin,
          decoration: BoxDecoration(
            color: AppColors.grey.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(100.spMin),
          ),
          child: Row(
            children: [
              Container(
                width: _progress * constraints.maxWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.spMin),
                  gradient: const LinearGradient(
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
  }
}
