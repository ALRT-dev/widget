import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/family/models/family_models.dart';
import 'package:hazard_app/features/family/providers/family_provider.dart';
import 'package:hazard_app/features/family/views/screens/family_invite_screen.dart';
import 'package:hazard_app/features/subscription/providers/alrt_plus_provider.dart';
import 'package:hazard_app/features/subscription/views/screens/alrt_plus_paywall_screen.dart';
import 'package:hazard_app/features/subscription/views/widgets/alrt_plus_style.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

/// The ALRT+ management screen (screen C on the design board), reached from
/// the profile seat card. Shows the plan, seat usage and members, and links
/// out to invites, plan changes and the store's own subscription management.
class AlrtPlusManageScreen extends ConsumerWidget {
  const AlrtPlusManageScreen({super.key});

  static const route = '/alrt-plus/manage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(providerOfAlrtPlusStatus).valueOrNull;
    final circle = ref.watch(providerOfFamily.select((s) => s.circle));

    return Scaffold(
      backgroundColor: AlrtPlusStyle.body,
      body: Column(
        children: [
          _bandBuilder(context, status),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(18.spMin, 16.spMin, 18.spMin, 18.spMin),
              children: [
                if (circle != null) ...[
                  Padding(
                    padding: EdgeInsets.only(left: 4.spMin, bottom: 8.spMin),
                    child: Text(
                      'SEATS · ${circle.members.length} OF '
                      '${circle.maxMembers} USED',
                      style: TextStyle(
                        fontSize: 10.5.spMin,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                        color: AlrtPlusStyle.label,
                      ),
                    ),
                  ),
                  _seatsCardBuilder(circle),
                  SizedBox(height: 10.spMin),
                  _membersCardBuilder(circle),
                  SizedBox(height: 10.spMin),
                ],
                _actionsCardBuilder(context, status, circle),
                SizedBox(height: 24.spMin),
                if (status?.expirationDate != null)
                  Text(
                    status!.willRenew
                        ? 'Cancelling stops renewal. ALRT + stays active '
                              'until ${_date(status.expirationDate!)}.'
                        : 'Renewal is off. ALRT + stays active until '
                              '${_date(status.expirationDate!)}.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.5.spMin,
                      height: 1.5,
                      color: AlrtPlusStyle.inkFaint,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _date(final DateTime date) => DateFormat('d MMM yyyy').format(date);

  Widget _bandBuilder(final BuildContext context, final AlrtPlusStatus? status) {
    final badge = status == null || !status.isActive
        ? 'INACTIVE'
        : status.isTrial
        ? 'FREE MONTH'
        : 'ACTIVE';
    final subParts = <String>[
      if (status?.isActive == true) status!.planLabel,
      if (status?.expirationDate != null)
        status!.willRenew
            ? 'renews ${_date(status.expirationDate!)}'
            : 'ends ${_date(status.expirationDate!)}',
    ];

    return Container(
      width: double.infinity,
      decoration: AlrtPlusStyle.bandDecoration(),
      child: Stack(
        children: [
          AlrtPlusStyle.bandGlows(),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(14.spMin, 4.spMin, 22.spMin, 20.spMin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.spMin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Your ALRT +',
                              style: TextStyle(
                                fontSize: 23.spMin,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            _badgeBuilder(badge),
                          ],
                        ),
                        if (subParts.isNotEmpty) ...[
                          SizedBox(height: 7.spMin),
                          Text(
                            subParts.join(' · '),
                            style: TextStyle(
                              fontSize: 13.spMin,
                              height: 1.55,
                              color: Colors.white.withValues(alpha: 0.78),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _badgeBuilder(final String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.spMin, vertical: 4.spMin),
      decoration: BoxDecoration(
        color: AlrtPlusStyle.goldBg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.spMin,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          color: AlrtPlusStyle.goldText,
        ),
      ),
    );
  }

  Widget _seatsCardBuilder(final FamilyCircle circle) {
    final used = circle.members.length;
    final free = (circle.maxMembers - used).clamp(0, circle.maxMembers);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.spMin, vertical: 13.spMin),
      decoration: AlrtPlusStyle.cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                circle.name,
                style: TextStyle(
                  fontSize: 13.5.spMin,
                  fontWeight: FontWeight.w700,
                  color: AlrtPlusStyle.ink,
                ),
              ),
              Text(
                '$used used · $free free',
                style: TextStyle(
                  fontSize: 11.spMin,
                  color: AlrtPlusStyle.inkSoft,
                ),
              ),
            ],
          ),
          SizedBox(height: 9.spMin),
          Row(
            children: [
              for (var i = 0; i < circle.maxMembers; i++) ...[
                if (i > 0) SizedBox(width: 4.spMin),
                Expanded(
                  child: Container(
                    height: 7.spMin,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: i < used ? null : const Color(0xFFEDE6F4),
                      gradient: i == 0
                          ? AlrtPlusStyle.ctaGradient
                          : i < used
                          ? AlrtPlusStyle.greenGradient
                          : null,
                    ),
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 7.spMin),
          Text(
            'Members keep the free tier if your plan lapses',
            style: TextStyle(
              fontSize: 10.5.spMin,
              color: AlrtPlusStyle.inkFaint,
            ),
          ),
        ],
      ),
    );
  }

  Widget _membersCardBuilder(final FamilyCircle circle) {
    // Host first, then everyone else in join order.
    final members = [...circle.members]
      ..sort((a, b) {
        if (a.role == FamilyRole.owner) return -1;
        if (b.role == FamilyRole.owner) return 1;
        return 0;
      });
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.spMin, vertical: 4.spMin),
      decoration: AlrtPlusStyle.cardDecoration(),
      child: Column(
        children: [
          for (final (index, member) in members.indexed)
            _memberRowBuilder(
              circle,
              member,
              showDivider: index < members.length - 1,
            ),
        ],
      ),
    );
  }

  Widget _memberRowBuilder(
    final FamilyCircle circle,
    final FamilyMember member, {
    required final bool showDivider,
  }) {
    final isMe = member.id == circle.myMemberId;
    final isHost = member.role == FamilyRole.owner;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.spMin),
      decoration: BoxDecoration(
        border: showDivider
            ? const Border(
                bottom: BorderSide(color: AlrtPlusStyle.cardLine),
              )
            : null,
      ),
      child: Row(
        children: [
          Container(
            width: 32.spMin,
            height: 32.spMin,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isHost
                  ? AlrtPlusStyle.ctaGradient
                  : AlrtPlusStyle.greenGradient,
            ),
            child: Text(
              member.initials,
              style: TextStyle(
                fontSize: 11.spMin,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 10.spMin),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isMe ? 'You' : member.name,
                  style: TextStyle(
                    fontSize: 12.5.spMin,
                    fontWeight: FontWeight.w700,
                    color: AlrtPlusStyle.ink,
                  ),
                ),
                Text(
                  isHost ? 'Host · ${circle.name}' : circle.name,
                  style: TextStyle(
                    fontSize: 10.5.spMin,
                    color: AlrtPlusStyle.inkSoft,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.spMin,
              vertical: 3.spMin,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF3EDF9),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              isHost ? 'PAYER' : 'SEAT',
              style: TextStyle(
                fontSize: 9.spMin,
                fontWeight: FontWeight.w700,
                color: AlrtPlusStyle.label,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionsCardBuilder(
    final BuildContext context,
    final AlrtPlusStatus? status,
    final FamilyCircle? circle,
  ) {
    final storeName = defaultTargetPlatform == TargetPlatform.iOS
        ? 'App Store'
        : 'Google Play';
    final actions = <(String, VoidCallback)>[
      if (circle != null)
        ('Invite to a seat', () => context.push(FamilyInviteScreen.route)),
      ('Change plan', () => context.push(AlrtPlusPaywallScreen.route)),
      if (status?.managementUrl != null)
        (
          'Manage in $storeName',
          () => launchUrl(
            status!.managementUrl!,
            mode: LaunchMode.externalApplication,
          ),
        ),
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.spMin, vertical: 2.spMin),
      decoration: AlrtPlusStyle.cardDecoration(),
      child: Column(
        children: [
          for (final (index, action) in actions.indexed)
            _actionRowBuilder(
              text: action.$1,
              onTap: action.$2,
              showDivider: index < actions.length - 1,
            ),
        ],
      ),
    );
  }

  Widget _actionRowBuilder({
    required final String text,
    required final VoidCallback onTap,
    final bool showDivider = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.spMin, horizontal: 2.spMin),
        decoration: BoxDecoration(
          border: showDivider
              ? const Border(
                  bottom: BorderSide(color: AlrtPlusStyle.cardLine),
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 12.5.spMin,
                fontWeight: FontWeight.w600,
                color: AlrtPlusStyle.ink,
              ),
            ),
            Icon(
              LucideIcons.chevronRight,
              size: 16.spMin,
              color: const Color(0xFFC9BFD6),
            ),
          ],
        ),
      ),
    );
  }
}
