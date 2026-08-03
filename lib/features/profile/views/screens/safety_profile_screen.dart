import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/profile/models/safety_cohort.dart';
import 'package:hazard_app/features/profile/providers/safety_profile_provider.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// The safety profile: coarse cohort chips that tailor For You guidance.
///
/// Everything ticked here stays on the phone — nothing is sent to a server.
/// Cohorts speak to a situation, never an assumed limitation.
class SafetyProfileScreen extends ConsumerWidget {
  const SafetyProfileScreen({super.key});

  static const route = '/safety-profile';

  static const _ink = Color(0xFF232326);
  static const _inkSoft = Color(0xFF75757E);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(providerOfSafetyProfile);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(LucideIcons.arrowLeft, color: _ink),
        ),
        title: Text(
          'Safety profile',
          style: TextStyle(
            color: _ink,
            fontSize: 18.spMin,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(18.spMin, 6.spMin, 18.spMin, 28.spMin),
        children: [
          Container(
            padding: EdgeInsets.all(13.spMin),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.spMin),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(LucideIcons.lock, size: 16.spMin, color: _inkSoft),
                SizedBox(width: 10.spMin),
                Expanded(
                  child: Text(
                    'Stays on your phone. What you tick here tailors the '
                    'For You guidance on alerts, and it never leaves this '
                    'device. No diagnoses, no details — broad groups only.',
                    style: TextStyle(
                      fontSize: 12.spMin,
                      height: 1.55,
                      color: _inkSoft,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.spMin),
          Text(
            'THIS ALERT SEASON, MY HOUSEHOLD INCLUDES',
            style: TextStyle(
              fontSize: 10.5.spMin,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
              color: _inkSoft,
            ),
          ),
          SizedBox(height: 10.spMin),
          Wrap(
            spacing: 9.spMin,
            runSpacing: 9.spMin,
            children: [
              for (final cohort in SafetyCohort.values)
                _chipBuilder(
                  ref,
                  cohort,
                  isSelected: selected.contains(cohort),
                ),
            ],
          ),
          SizedBox(height: 18.spMin),
          Text(
            'Tick as many or as few as apply. Guidance for other groups stays '
            'one tap away on every alert, so nothing is hidden from you.',
            style: TextStyle(
              fontSize: 11.5.spMin,
              height: 1.55,
              color: _inkSoft,
            ),
          ),
          SizedBox(height: 12.spMin),
          Text(
            'Guidance covers 27 hazard types, from bushfires and floods to '
            'heatwaves, snakes and boil-water notices. A few alert types '
            '(police operations, crashes, road closures, events) show no '
            'card by design: no genuine group difference, no line.',
            style: TextStyle(
              fontSize: 11.5.spMin,
              height: 1.55,
              color: _inkSoft,
            ),
          ),
        ],
      ),
    );
  }

  Widget _chipBuilder(
    final WidgetRef ref,
    final SafetyCohort cohort, {
    required final bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => ref.read(providerOfSafetyProfile.notifier).toggle(cohort),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(horizontal: 13.spMin, vertical: 9.spMin),
        decoration: BoxDecoration(
          color: isSelected ? cohort.tintBg : Colors.white,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: isSelected ? cohort.tintInk : const Color(0xFFE3E1E8),
            width: isSelected ? 1.6 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              Icon(LucideIcons.check, size: 13.spMin, color: cohort.tintInk),
              SizedBox(width: 6.spMin),
            ],
            Text(
              cohort.label,
              style: TextStyle(
                fontSize: 12.5.spMin,
                fontWeight: FontWeight.w600,
                color: isSelected ? cohort.tintInk : _ink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
