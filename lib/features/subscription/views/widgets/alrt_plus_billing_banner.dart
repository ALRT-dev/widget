import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/subscription/providers/alrt_plus_provider.dart';
import 'package:hazard_app/features/subscription/views/widgets/alrt_plus_style.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

/// The billing issue banner (screen D on the design board). Renders nothing
/// unless RevenueCat reports a failed renewal with the entitlement still in
/// its grace period; then shows a calm amber card stating the grace period
/// plainly, with one action. Only the payer's own entitlement carries the
/// billing flag, so members never see it.
class AlrtPlusBillingBanner extends ConsumerWidget {
  const AlrtPlusBillingBanner({super.key, this.bottomPadding = 12.0});

  /// Space below the banner, applied only when the banner is visible so the
  /// host layout doesn't get a stray gap the rest of the time.
  final double bottomPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(providerOfAlrtPlusStatus).valueOrNull;
    if (status == null || !status.hasBillingIssue || !status.isActive) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding.spMin),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.spMin, vertical: 13.spMin),
        decoration: BoxDecoration(
          gradient: AlrtPlusStyle.amberGradient,
          borderRadius: BorderRadius.circular(16.spMin),
          boxShadow: [
            BoxShadow(
              color: AlrtPlusStyle.goldText.withValues(alpha: 0.12),
              blurRadius: 14.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 30.spMin,
              height: 30.spMin,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.spMin),
              ),
              child: Icon(
                LucideIcons.creditCard,
                size: 16.spMin,
                color: AlrtPlusStyle.goldText,
              ),
            ),
            SizedBox(width: 11.spMin),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We couldn't renew ALRT +",
                    style: TextStyle(
                      fontSize: 12.5.spMin,
                      fontWeight: FontWeight.w700,
                      color: AlrtPlusStyle.warnTitle,
                    ),
                  ),
                  SizedBox(height: 2.spMin),
                  Text(
                    'Your family layer stays on '
                    '${_untilPhrase(status.expirationDate)} while we retry. '
                    'Update your payment method to keep everyone covered.',
                    style: TextStyle(
                      fontSize: 11.5.spMin,
                      height: 1.5,
                      color: AlrtPlusStyle.warnBody,
                    ),
                  ),
                  if (status.managementUrl != null) ...[
                    SizedBox(height: 10.spMin),
                    GestureDetector(
                      onTap: () => launchUrl(
                        status.managementUrl!,
                        mode: LaunchMode.externalApplication,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.spMin,
                          vertical: 8.spMin,
                        ),
                        decoration: BoxDecoration(
                          gradient: AlrtPlusStyle.ctaGradient,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          'Update payment',
                          style: TextStyle(
                            fontSize: 11.5.spMin,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// "until Friday" while the grace period ends within a week, otherwise
  /// "until 12 Aug"; a plain "for now" when the store gave no end date.
  String _untilPhrase(final DateTime? graceEnd) {
    if (graceEnd == null) return 'for now';
    final days = graceEnd.difference(DateTime.now()).inDays;
    if (days >= 0 && days < 7) {
      return 'until ${DateFormat('EEEE').format(graceEnd)}';
    }
    return 'until ${DateFormat('d MMM').format(graceEnd)}';
  }
}
