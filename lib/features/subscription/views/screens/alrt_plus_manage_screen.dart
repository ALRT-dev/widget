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
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// "Your ALRT +": plan status, the seat ledger, who fills the seats, and the
/// management actions. Reached from the profile once subscribed.
class AlrtPlusManageScreen extends ConsumerStatefulWidget {
  const AlrtPlusManageScreen({super.key});

  static const route = '/alrt-plus/manage';

  static const totalSeats = 8;

  @override
  ConsumerState<AlrtPlusManageScreen> createState() =>
      _AlrtPlusManageScreenState();
}

class _AlrtPlusManageScreenState extends ConsumerState<AlrtPlusManageScreen> {
  EntitlementInfo? _entitlement;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final entitlement =
        await ref.read(providerOfRevenueCat).plusEntitlement();
    if (!mounted) return;
    setState(() {
      _entitlement = entitlement;
      _loaded = true;
    });
  }

  Future<void> _openStoreManagement() async {
    final url = await ref.read(providerOfRevenueCat).managementUrl();
    if (url == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Manage your subscription in your app store account settings.',
            ),
          ),
        );
      }
      return;
    }
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final circle = ref.watch(providerOfFamily.select((s) => s.circle));

    return Scaffold(
      backgroundColor: AlrtPlusStyle.body,
      body: Column(
        children: [
          _bandBuilder(context),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(18.spMin, 16.spMin, 18.spMin, 24.spMin),
              children: [
                _sectionLabelBuilder(circle),
                SizedBox(height: 8.spMin),
                _seatCardBuilder(circle),
                SizedBox(height: 10.spMin),
                if (circle != null) _membersCardBuilder(circle),
                SizedBox(height: 10.spMin),
                _actionsCardBuilder(circle),
                SizedBox(height: 18.spMin),
                Text(
                  'Cancelling stops renewal. ALRT + stays active until the end '
                  'of the period you have paid for.',
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

  Widget _bandBuilder(final BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AlrtPlusStyle.bandGradient),
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top + 4.spMin,
        left: 10.spMin,
        right: 22.spMin,
        bottom: 20.spMin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              LucideIcons.arrowLeft,
              color: Colors.white,
              size: 22.spMin,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.spMin),
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
                        letterSpacing: -0.3,
                        color: Colors.white,
                      ),
                    ),
                    _activeBadgeBuilder(),
                  ],
                ),
                SizedBox(height: 7.spMin),
                Text(
                  _planLineBuilder(),
                  style: TextStyle(
                    fontSize: 13.spMin,
                    height: 1.5,
                    color: Colors.white.withValues(alpha: 0.78),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _activeBadgeBuilder() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.spMin, vertical: 4.spMin),
      decoration: BoxDecoration(
        color: AlrtPlusStyle.goldBg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        'ACTIVE',
        style: TextStyle(
          fontSize: 10.spMin,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          color: AlrtPlusStyle.goldText,
        ),
      ),
    );
  }

  String _planLineBuilder() {
    final entitlement = _entitlement;
    if (!_loaded) return ' ';
    if (entitlement == null) return 'ALRT + is active on this account';
    final parts = <String>[];
    final product = entitlement.productIdentifier.toLowerCase();
    if (product.contains('year')) {
      parts.add('Yearly');
    } else if (product.contains('month')) {
      parts.add('Monthly');
    }
    final expiration = entitlement.expirationDate;
    if (expiration != null) {
      final date = DateTime.tryParse(expiration);
      if (date != null) {
        final formatted = DateFormat('d MMM yyyy').format(date.toLocal());
        parts.add(
          entitlement.willRenew ? 'renews $formatted' : 'ends $formatted',
        );
      }
    }
    return parts.isEmpty ? 'ALRT + is active on this account' : parts.join(' · ');
  }

  Widget _sectionLabelBuilder(final FamilyCircle? circle) {
    final used = circle?.members.length ?? 1;
    return Padding(
      padding: EdgeInsets.only(left: 4.spMin),
      child: Text(
        'SEATS · $used OF ${AlrtPlusManageScreen.totalSeats} USED',
        style: TextStyle(
          fontSize: 10.5.spMin,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: AlrtPlusStyle.label,
        ),
      ),
    );
  }

  Widget _seatCardBuilder(final FamilyCircle? circle) {
    final used = circle?.members.length ?? 1;
    return _cardBuilder(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                circle?.name ?? 'Your circle',
                style: TextStyle(
                  fontSize: 13.5.spMin,
                  fontWeight: FontWeight.w700,
                  color: AlrtPlusStyle.ink,
                ),
              ),
              Text(
                '$used used · ${AlrtPlusManageScreen.totalSeats - used} free',
                style: TextStyle(
                  fontSize: 11.spMin,
                  color: AlrtPlusStyle.inkSoft,
                ),
              ),
            ],
          ),
          SizedBox(height: 9.spMin),
          Row(
            children: List.generate(AlrtPlusManageScreen.totalSeats, (index) {
              final Gradient? gradient;
              if (index == 0) {
                gradient = AlrtPlusStyle.ctaGradient;
              } else if (index < used) {
                gradient = AlrtPlusStyle.greenGradient;
              } else {
                gradient = null;
              }
              return Expanded(
                child: Container(
                  height: 7.spMin,
                  margin: EdgeInsets.only(
                    right: index == AlrtPlusManageScreen.totalSeats - 1
                        ? 0
                        : 4.spMin,
                  ),
                  decoration: BoxDecoration(
                    gradient: gradient,
                    color: gradient == null ? AlrtPlusStyle.seatEmpty : null,
                    borderRadius: BorderRadius.circular(4.spMin),
                  ),
                ),
              );
            }),
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
    return _cardBuilder(
      padding: EdgeInsets.symmetric(horizontal: 15.spMin, vertical: 4.spMin),
      child: Column(
        children: [
          for (final member in circle.members)
            _memberRowBuilder(circle, member),
        ],
      ),
    );
  }

  Widget _memberRowBuilder(final FamilyCircle circle, final FamilyMember member) {
    final isMe = member.id == circle.myMemberId;
    final isPayer = member.role == FamilyRole.owner;
    final initials = member.initials;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.spMin),
      child: Row(
        children: [
          Container(
            width: 32.spMin,
            height: 32.spMin,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isMe
                  ? AlrtPlusStyle.ctaGradient
                  : AlrtPlusStyle.greenGradient,
            ),
            child: Center(
              child: Text(
                initials,
                style: TextStyle(
                  fontSize: 11.spMin,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
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
                  isPayer ? 'Host · ${circle.name}' : circle.name,
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
              isPayer ? 'PAYER' : 'SEAT',
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

  Widget _actionsCardBuilder(final FamilyCircle? circle) {
    return _cardBuilder(
      padding: EdgeInsets.symmetric(horizontal: 15.spMin, vertical: 2.spMin),
      child: Column(
        children: [
          if (circle != null)
            _actionRowBuilder(
              'Invite to a seat',
              () => context.push(FamilyInviteScreen.route),
            ),
          _actionRowBuilder(
            'Change plan',
            () => context.push(AlrtPlusPaywallScreen.route),
          ),
          _actionRowBuilder(
            'Manage in your app store',
            _openStoreManagement,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _actionRowBuilder(
    final String label,
    final VoidCallback onTap, {
    final bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.spMin, horizontal: 2.spMin),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(
                  bottom: BorderSide(color: AlrtPlusStyle.cardLine),
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
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

  Widget _cardBuilder({required final Widget child, EdgeInsets? padding}) {
    return Container(
      width: double.infinity,
      padding: padding ??
          EdgeInsets.symmetric(horizontal: 15.spMin, vertical: 13.spMin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.spMin),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3A1560).withValues(alpha: 0.07),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
