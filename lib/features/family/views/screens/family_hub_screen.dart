import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/family/models/family_models.dart';
import 'package:hazard_app/features/family/providers/family_provider.dart';
import 'package:hazard_app/features/family/providers/states/family_provider_state.dart';
import 'package:hazard_app/features/family/views/screens/family_circle_profile_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_invite_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_places_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_sharing_level_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_sos_receiver_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_sos_screen.dart';
import 'package:hazard_app/features/family/views/widgets/family_colors.dart';
import 'package:hazard_app/features/family/views/widgets/family_member_list_item.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/utils/dialogs.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:timeago/timeago.dart' as timeago;

/// The family hub: status banner, one-tap "I'm Safe", check-in requests and
/// the member list. Embedded as the Family tab body.
class FamilyHubScreen extends ConsumerStatefulWidget {
  const FamilyHubScreen({super.key});

  static const route = '/family-hub';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FamilyHubScreenState();
}

class _FamilyHubScreenState extends ConsumerState<FamilyHubScreen> {
  @override
  Widget build(BuildContext context) {
    _listenToActionErrors();

    final circle = ref.watch(providerOfFamily.select((s) => s.circle));
    if (circle == null) return const SizedBox.shrink();

    final memberIdsNearAlert = ref.watch(
      providerOfFamily.select((s) => s.memberIdsNearAlert),
    );
    final activeSosEvents = ref.watch(
      providerOfFamily.select((s) => s.activeSosEvents),
    );
    final checkInState = ref.watch(
      providerOfFamily.select((s) => s.checkInState),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F6),
      body: RefreshIndicator(
        onRefresh: () => ref.read(providerOfFamily.notifier).load(silent: true),
        color: FamilyColors.indigo,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            _headerBuilder(circle, memberIdsNearAlert),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20.spMin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final sos in activeSosEvents) ...[
                      _sosBannerBuilder(sos),
                      SizedBox(height: 12.spMin),
                    ],
                    _imSafeButtonBuilder(checkInState),
                    SizedBox(height: 10.spMin),
                    _requestCheckInButtonBuilder(),
                    SizedBox(height: 16.spMin),
                    _privacyBannerBuilder(),
                    SizedBox(height: 20.spMin),
                    _membersSectionBuilder(circle, memberIdsNearAlert),
                    SizedBox(height: 120.spMin),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerBuilder(
    final FamilyCircle circle,
    final Set<String> memberIdsNearAlert,
  ) {
    final others = circle.others;
    final checkedIn = others.where((m) => m.isCheckedInRecently).length;
    final allAccounted =
        others.isNotEmpty &&
        checkedIn == others.length &&
        memberIdsNearAlert.isEmpty;
    final nearCount = memberIdsNearAlert.length;

    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [FamilyColors.indigo, FamilyColors.indigoDark],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.fromLTRB(20.spMin, 0, 20.spMin, 24.spMin),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.spMin),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      circle.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.spMin,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  _overflowMenuBuilder(circle),
                ],
              ),
              SizedBox(height: 14.spMin),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.spMin),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16.spMin),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40.spMin,
                      height: 40.spMin,
                      decoration: BoxDecoration(
                        color: allAccounted
                            ? FamilyColors.safeGreen
                            : FamilyColors.amber,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        allAccounted ? Icons.check : LucideIcons.clock,
                        color: Colors.white,
                        size: 22.spMin,
                      ),
                    ),
                    SizedBox(width: 12.spMin),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            allAccounted
                                ? 'Everyone is accounted for'
                                : 'Waiting on check-ins',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.spMin,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '$checkedIn of ${others.length} checked in'
                            '${nearCount > 0 ? ' · $nearCount near an active alert' : ''}',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 12.spMin,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _overflowMenuBuilder(final FamilyCircle circle) {
    final isOwner = circle.me?.role == FamilyRole.owner;
    return PopupMenuButton<String>(
      icon: Icon(LucideIcons.ellipsisVertical, color: Colors.white, size: 22.spMin),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.spMin),
      ),
      onSelected: (value) {
        switch (value) {
          case 'places':
            context.push(FamilyPlacesScreen.route);
          case 'invite':
            context.push(FamilyInviteScreen.route);
          case 'sharing':
            context.push(FamilySharingLevelScreen.route);
          case 'profile':
            context.push(FamilyCircleProfileScreen.route);
          case 'leave':
            _confirmLeaveOrDelete(isOwner: isOwner);
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'places', child: Text('Places')),
        const PopupMenuItem(value: 'invite', child: Text('Invite members')),
        const PopupMenuItem(value: 'sharing', child: Text('My sharing level')),
        const PopupMenuItem(value: 'profile', child: Text('My circle profile')),
        PopupMenuItem(
          value: 'leave',
          child: Text(
            isOwner ? 'Delete circle' : 'Leave circle',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget _sosBannerBuilder(final FamilySosEvent sos) {
    final name = sos.member?.displayName ?? 'A family member';
    return GestureDetector(
      onTap: () => context.push(
        FamilySosReceiverScreen.route,
        extra: FamilySosReceiverScreenArgs(sosEvent: sos),
      ),
      child: Container(
        padding: EdgeInsets.all(14.spMin),
        decoration: BoxDecoration(
          color: FamilyColors.sosRed,
          borderRadius: BorderRadius.circular(16.spMin),
        ),
        child: Row(
          children: [
            Icon(LucideIcons.siren, color: Colors.white, size: 24.spMin),
            SizedBox(width: 10.spMin),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name triggered SOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.spMin,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (sos.createdAt != null)
                    Text(
                      'Started ${timeago.format(sos.createdAt!)} · tap to respond',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 12.spMin,
                      ),
                    ),
                ],
              ),
            ),
            Icon(LucideIcons.chevronRight, color: Colors.white, size: 20.spMin),
          ],
        ),
      ),
    );
  }

  Widget _imSafeButtonBuilder(final FamilyActionState checkInState) {
    return SizedBox(
      height: 54.spMin,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: FamilyColors.safeGreen,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.spMin),
          ),
          elevation: 0,
        ),
        onPressed: checkInState.isLoading
            ? null
            : () => ref.read(providerOfFamily.notifier).checkIn(),
        icon: checkInState.isLoading
            ? SizedBox(
                width: 18.spMin,
                height: 18.spMin,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Icon(Icons.check, size: 22.spMin),
        label: Text(
          "I'm Safe",
          style: TextStyle(fontSize: 17.spMin, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _requestCheckInButtonBuilder() {
    return SizedBox(
      height: 48.spMin,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          foregroundColor: FamilyColors.indigo,
          backgroundColor: Colors.white,
          side: BorderSide(color: FamilyColors.indigo.withValues(alpha: 0.3)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.spMin),
          ),
        ),
        onPressed: () async {
          await ref.read(providerOfFamily.notifier).requestCheckIn();
          if (!mounted) return;
          context.showSuccessToast(
            message: 'Check-in requested from everyone',
          );
        },
        icon: Icon(LucideIcons.bellRing, size: 18.spMin),
        label: Text(
          'Request a check-in from everyone',
          style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _privacyBannerBuilder() {
    return Container(
      padding: EdgeInsets.all(14.spMin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.spMin),
        border: Border(
          left: BorderSide(color: FamilyColors.safeGreen, width: 3.spMin),
        ),
        boxShadow: [
          BoxShadow(color: AppColors.shadowColorLight, blurRadius: 2.0),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            LucideIcons.shieldCheck,
            color: FamilyColors.safeGreen,
            size: 18.spMin,
          ),
          SizedBox(width: 10.spMin),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'ALRT never live-tracks. ',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const TextSpan(
                    text:
                        'What you see is each member\'s last shared snapshot. '
                        'Ask for a fresh one anytime; they choose whether to '
                        'send it.',
                  ),
                ],
              ),
              style: TextStyle(
                fontSize: 12.spMin,
                height: 1.4,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _membersSectionBuilder(
    final FamilyCircle circle,
    final Set<String> memberIdsNearAlert,
  ) {
    final isOwner = circle.me?.role == FamilyRole.owner;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MEMBERS',
          style: TextStyle(
            fontSize: 13.spMin,
            fontWeight: FontWeight.w700,
            color: FamilyColors.indigo,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 10.spMin),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.spMin),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColorLight,
                blurRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            children: [
              for (final (index, member) in circle.members.indexed) ...[
                if (index > 0)
                  Divider(height: 1, indent: 70.spMin, color: const Color(0xFFF0F0F2)),
                FamilyMemberListItem(
                  member: member,
                  isMe: member.id == circle.myMemberId,
                  isNearAlert: memberIdsNearAlert.contains(member.id),
                  onLongPress: isOwner && member.id != circle.myMemberId
                      ? () => _confirmRemoveMember(member)
                      : null,
                  onRequestLocation: member.id != circle.myMemberId
                      ? () => _requestLocationSnapshot(member)
                      : null,
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: 20.spMin),
        _sosEntryButtonBuilder(),
      ],
    );
  }

  Widget _sosEntryButtonBuilder() {
    return SizedBox(
      height: 48.spMin,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          foregroundColor: FamilyColors.sosRed,
          side: const BorderSide(color: FamilyColors.sosRed),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.spMin),
          ),
        ),
        onPressed: () => context.push(FamilySosScreen.route),
        icon: Icon(LucideIcons.siren, size: 18.spMin),
        label: Text(
          'Family SOS',
          style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Future<void> _requestLocationSnapshot(final FamilyMember member) async {
    final sent = await ref
        .read(providerOfFamily.notifier)
        .requestMemberLocation(memberId: member.id);
    if (!mounted) return;
    if (sent) {
      context.showSuccessToast(
        message:
            '${member.name} has been asked to share a one-time snapshot.',
      );
    }
  }

  void _confirmRemoveMember(final FamilyMember member) {
    showConfirmationSheet(
      context: context,
      title: 'Remove ${member.name} from the circle?',
      confirmButtonText: 'Remove',
      onPressedConfirm: (_, __) => ref
          .read(providerOfFamily.notifier)
          .removeMember(memberId: member.id),
    );
  }

  void _confirmLeaveOrDelete({required final bool isOwner}) {
    showConfirmationSheet(
      context: context,
      title: isOwner
          ? 'Delete this circle for everyone?'
          : 'Leave this family circle?',
      confirmButtonText: isOwner ? 'Delete' : 'Leave',
      onPressedConfirm: (_, __) {
        final notifier = ref.read(providerOfFamily.notifier);
        isOwner ? notifier.deleteCircle() : notifier.leave();
      },
    );
  }

  void _listenToActionErrors() {
    void listenTo(
      FamilyActionState Function(FamilyProviderState) selector,
    ) {
      ref.listen(providerOfFamily.select(selector), (prev, next) {
        if (prev != next && next.isError && next.error != null) {
          context.showErrorToast(message: next.error!.message);
        }
      });
    }

    listenTo((s) => s.checkInState);
    listenTo((s) => s.requestCheckInState);
    listenTo((s) => s.leaveDeleteState);
    listenTo((s) => s.memberUpdateState);
  }
}
