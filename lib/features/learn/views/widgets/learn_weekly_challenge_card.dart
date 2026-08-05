import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/profile/models/xp_summary_models.dart';
import 'package:hazard_app/features/profile/providers/xp_summary_provider.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// The weekly challenge, on the Learn tab.
///
/// It is a LEARNING challenge (complete guides this week), so this is where
/// people look for it. It used to exist only on the profile's trust card,
/// which is why the Learn tab looked like it had no challenges at all.
///
/// Renders nothing until the summary arrives, and nothing if the backend
/// has no quest for this week: an empty box is worse than no box.
class LearnWeeklyChallengeCard extends ConsumerWidget {
  const LearnWeeklyChallengeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(providerOfXpSummary);
    final quest = summary.asData?.value.weeklyQuest;
    if (quest == null) return const SizedBox.shrink();
    return _cardBuilder(quest);
  }

  Widget _cardBuilder(final WeeklyQuest quest) {
    final done = quest.completed;
    final progress = quest.target > 0
        ? (quest.progress / quest.target).clamp(0.0, 1.0)
        : 0.0;

    return Container(
      padding: EdgeInsets.all(14.spMin),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: done
              ? [const Color(0xFF13875A), const Color(0xFF0E6B47)]
              : [const Color(0xFFFF8C00), const Color(0xFFFF6B01)],
        ),
        borderRadius: BorderRadius.circular(16.spMin),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                done ? LucideIcons.trophy : LucideIcons.target,
                size: 18.spMin,
                color: Colors.white,
              ),
              SizedBox(width: 8.spMin),
              Text(
                done ? 'CHALLENGE COMPLETE' : 'THIS WEEK\'S CHALLENGE',
                style: TextStyle(
                  fontSize: 10.5.spMin,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.9,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 9.spMin,
                  vertical: 3.spMin,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '+${quest.xpReward} XP',
                  style: TextStyle(
                    fontSize: 11.spMin,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.spMin),
          Text(
            quest.title,
            style: TextStyle(
              fontSize: 15.spMin,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          if (quest.description != null && quest.description!.isNotEmpty) ...[
            SizedBox(height: 3.spMin),
            Text(
              quest.description!,
              style: TextStyle(
                fontSize: 12.spMin,
                height: 1.4,
                color: Colors.white.withValues(alpha: 0.88),
              ),
            ),
          ],
          if (!done) ...[
            SizedBox(height: 11.spMin),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6.spMin,
                backgroundColor: Colors.white.withValues(alpha: 0.25),
                valueColor: const AlwaysStoppedAnimation(Colors.white),
              ),
            ),
            SizedBox(height: 6.spMin),
            Text(
              '${quest.progress} of ${quest.target} done',
              style: TextStyle(
                fontSize: 11.spMin,
                fontWeight: FontWeight.w700,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
