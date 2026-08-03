import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/family/providers/family_provider.dart';
import 'package:hazard_app/features/subscription/providers/alrt_plus_provider.dart';
import 'package:hazard_app/features/subscription/views/screens/alrt_plus_manage_screen.dart';
import 'package:hazard_app/features/subscription/views/widgets/alrt_plus_style.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// The profile seat card: the entry point to the ALRT+ manage screen.
/// Renders nothing while the user isn't entitled, so free users see no
/// subscription furniture on their profile.
class AlrtPlusSeatCard extends ConsumerWidget {
  const AlrtPlusSeatCard({super.key, this.bottomPadding = 14.0});

  /// Space below the card, applied only when the card is visible.
  final double bottomPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(providerOfAlrtPlusStatus).valueOrNull;
    if (status == null || !status.isActive) return const SizedBox.shrink();

    final circle = ref.watch(providerOfFamily.select((s) => s.circle));
    final subtitle = circle != null
        ? '${circle.members.length} of ${circle.maxMembers} seats used'
        : status.isTrial
        ? 'Your free month is running'
        : 'Your family layer is on';

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding.spMin),
      child: GestureDetector(
        onTap: () => context.push(AlrtPlusManageScreen.route),
        child: Container(
          padding: EdgeInsets.all(18.spMin),
          decoration: AlrtPlusStyle.bandDecoration(
            borderRadius: BorderRadius.circular(20.spMin),
          ).copyWith(
            boxShadow: [
              BoxShadow(
                color: AlrtPlusStyle.purpleDeep.withValues(alpha: 0.35),
                blurRadius: 12.0,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 46.spMin,
                height: 46.spMin,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(14.spMin),
                ),
                child: Icon(
                  LucideIcons.sparkles,
                  color: Colors.white,
                  size: 24.spMin,
                ),
              ),
              SizedBox(width: 14.spMin),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your ALRT +',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.spMin,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 12.spMin,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                LucideIcons.chevronRight,
                color: Colors.white,
                size: 20.spMin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
