import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/onboarding/enums/onboarding_step_types.dart';
import 'package:hazard_app/features/profile/models/safety_cohort.dart';
import 'package:hazard_app/features/profile/providers/safety_profile_provider.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// The safety profile: coarse cohort chips that tailor For You guidance.
///
/// Everything ticked here stays on the phone — nothing is sent to a server.
/// Cohorts speak to a situation, never an assumed limitation.
class SafetyProfileScreen extends ConsumerWidget {
  const SafetyProfileScreen({super.key, this.isOnboarding = false});

  /// During onboarding the screen leads with what it is for and offers a
  /// way past it, because a profile nobody understands is worse than none.
  final bool isOnboarding;

  static const route = '/safety-profile';
  static const onboardingRoute = '/onboarding/safety-profile';

  static const _ink = Color(0xFF232326);
  static const _inkSoft = Color(0xFF75757E);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(providerOfSafetyProfile);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F6),
      appBar: isOnboarding
          ? null
          : AppBar(
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
      bottomNavigationBar: isOnboarding ? _onboardingFooter(context) : null,
      body: ListView(
        padding: EdgeInsets.fromLTRB(18.spMin, 6.spMin, 18.spMin, 28.spMin),
        children: [
          if (isOnboarding) _onboardingHeroBuilder(),
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

  /// The onboarding lead-in: what this is, and that it is optional.
  Widget _onboardingHeroBuilder() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 14.spMin),
      padding: EdgeInsets.all(18.spMin),
      decoration: BoxDecoration(
        color: const Color(0xFF17171A),
        borderRadius: BorderRadius.circular(18.spMin),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your safety profile',
            style: TextStyle(
              fontSize: 24.spMin,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.15,
            ),
          ),
          SizedBox(height: 8.spMin),
          Text(
            'Pick anything that applies to you or the people you care for. '
            'Alerts will show the guidance that matters to you first. '
            'Optional, and you can change it anytime.',
            style: TextStyle(
              fontSize: 13.spMin,
              height: 1.5,
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _onboardingFooter(final BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(18.spMin, 8.spMin, 18.spMin, 10.spMin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 54.spMin,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B01),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.spMin),
                  ),
                ),
                onPressed: () => _finishOnboardingStep(context),
                child: Text(
                  'Save my profile',
                  style: TextStyle(
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 6.spMin),
            TextButton(
              onPressed: () => _finishOnboardingStep(context),
              child: Text(
                'Skip — show all guidance equally',
                style: TextStyle(
                  fontSize: 13.spMin,
                  color: _inkSoft,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// The profile is already saved on every tap, so both buttons simply
  /// move on. Skipping is a real choice, not a penalty.
  void _finishOnboardingStep(final BuildContext context) {
    context.go(OnboardingStep.safetyProfile.nextStep.route);
  }
}
