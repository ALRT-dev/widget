import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/family/models/family_models.dart';
import 'package:hazard_app/features/family/providers/family_provider.dart';
import 'package:hazard_app/features/family/views/widgets/family_colors.dart';
import 'package:hazard_app/features/family/views/widgets/family_member_avatar.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/others/app_colors.dart';

/// Share a journey: live location while you travel, on your terms.
///
/// The traveller picks how long and exactly who, and the journey always
/// stops itself at the time they chose. Nothing here is gated on ALRT+.
class FamilyJourneyScreen extends ConsumerStatefulWidget {
  const FamilyJourneyScreen({super.key});

  static const route = '/family-journey';

  @override
  ConsumerState<FamilyJourneyScreen> createState() =>
      _FamilyJourneyScreenState();
}

class _FamilyJourneyScreenState extends ConsumerState<FamilyJourneyScreen> {
  /// The offered blocks. Anything longer is reached by extending, so the
  /// traveller is asked again rather than committing up front.
  static const _durations = [30, 60];

  int _durationMinutes = 60;
  final Set<String> _recipientIds = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(providerOfFamily.notifier).loadMyJourney(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final circle = ref.watch(providerOfFamily.select((s) => s.circle));
    final activeJourney = ref.watch(
      providerOfFamily.select((s) => s.activeJourney),
    );

    if (circle == null) return const SizedBox.shrink();

    final others = circle.members
        .where((m) => m.id != circle.myMemberId)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F5),
      body: Column(
        children: [
          _headerBuilder(circle.name),
          Expanded(
            child: activeJourney != null && activeJourney.isActive
                ? _runningBuilder(activeJourney)
                : _setupBuilder(others),
          ),
        ],
      ),
    );
  }

  Widget _headerBuilder(final String circleName) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF4B4BE0), Color(0xFF2E2EA8)],
        ),
      ),
      padding: EdgeInsets.fromLTRB(20.spMin, 8.spMin, 20.spMin, 22.spMin),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context).maybePop(),
              child: Container(
                width: 34.spMin,
                height: 34.spMin,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 15.spMin,
                  color: Colors.white,
                ),
              ),
            ),
            14.hSizedBox,
            Text(
              circleName.toUpperCase(),
              style: TextStyle(
                fontSize: 11.spMin,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0,
                color: Colors.white.withValues(alpha: 0.75),
              ),
            ),
            4.hSizedBox,
            Text(
              'Share my journey',
              style: TextStyle(
                fontSize: 26.spMin,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.1,
              ),
            ),
            5.hSizedBox,
            Text(
              'Live location while you travel, on your terms',
              style: TextStyle(
                fontSize: 13.spMin,
                color: Colors.white.withValues(alpha: 0.85),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Setup ────────────────────────────────────────────────────────────

  Widget _setupBuilder(final List<FamilyMember> others) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.spMin, 16.spMin, 16.spMin, 28.spMin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _cardBuilder(
            label: 'How long',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    for (final minutes in _durations) ...[
                      Expanded(child: _durationChipBuilder(minutes)),
                      if (minutes != _durations.last)
                        SizedBox(width: 10.spMin),
                    ],
                  ],
                ),
                12.hSizedBox,
                Text(
                  'Sharing always stops on its own at the time you pick, '
                  '1 hour at most per extension. ALRT asks before it ends '
                  'and only you can extend.',
                  style: TextStyle(
                    fontSize: 12.5.spMin,
                    height: 1.45,
                    color: AppColors.mediumGrey,
                  ),
                ),
              ],
            ),
          ),
          12.hSizedBox,
          _cardBuilder(
            label: 'Who sees it',
            padding: EdgeInsets.zero,
            child: others.isEmpty
                ? Padding(
                    padding: EdgeInsets.all(16.spMin),
                    child: Text(
                      'Invite someone to your circle first.',
                      style: TextStyle(
                        fontSize: 13.spMin,
                        color: AppColors.mediumGrey,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      for (final (index, member) in others.indexed) ...[
                        if (index > 0)
                          Divider(
                            height: 1,
                            indent: 68.spMin,
                            color: const Color(0xFFF0F0F2),
                          ),
                        _recipientRowBuilder(member),
                      ],
                    ],
                  ),
          ),
          14.hSizedBox,
          _noteBuilder(
            'A banner stays visible the whole time you’re sharing, and '
            'Stop is one tap. Not an ALRT+ upsell.',
          ),
          18.hSizedBox,
          _startButtonBuilder(),
        ],
      ),
    );
  }

  Widget _durationChipBuilder(final int minutes) {
    final isSelected = _durationMinutes == minutes;
    return GestureDetector(
      onTap: () => setState(() => _durationMinutes = minutes),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        height: 52.spMin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? FamilyColors.indigo : Colors.white,
          borderRadius: BorderRadius.circular(14.spMin),
          border: Border.all(
            color: isSelected
                ? FamilyColors.indigo
                : AppColors.lightGrey.withValues(alpha: 0.9),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          minutes < 60 ? '$minutes min' : '${minutes ~/ 60} hour',
          style: TextStyle(
            fontSize: 16.spMin,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : FamilyColors.indigo,
          ),
        ),
      ),
    );
  }

  Widget _recipientRowBuilder(final FamilyMember member) {
    final isOn = _recipientIds.contains(member.id);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.spMin, vertical: 8.spMin),
      child: Row(
        children: [
          FamilyMemberAvatar(member: member, isNearAlert: false),
          SizedBox(width: 12.spMin),
          Expanded(
            child: Text(
              member.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w700,
                color: isOn ? AppColors.black : AppColors.grey,
              ),
            ),
          ),
          Switch(
            value: isOn,
            activeTrackColor: FamilyColors.safeGreen,
            onChanged: (value) => setState(() {
              if (value) {
                _recipientIds.add(member.id);
              } else {
                _recipientIds.remove(member.id);
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _startButtonBuilder() {
    final isBusy = ref.watch(
      providerOfFamily.select((s) => s.journeyState.isLoading),
    );
    final canStart = _recipientIds.isNotEmpty && !isBusy;
    final endsAt = TimeOfDay.fromDateTime(
      DateTime.now().add(Duration(minutes: _durationMinutes)),
    );

    return SizedBox(
      height: 56.spMin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: FamilyColors.indigo,
          disabledBackgroundColor: FamilyColors.indigo.withValues(alpha: 0.4),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.spMin),
          ),
        ),
        onPressed: canStart ? _handleStart : null,
        child: Text(
          _recipientIds.isEmpty
              ? 'Pick who sees it'
              : 'Start sharing until ${endsAt.format(context)}',
          style: TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  // ── Running ──────────────────────────────────────────────────────────

  Widget _runningBuilder(final FamilyJourney journey) {
    final endsAt = TimeOfDay.fromDateTime(journey.endsAt);
    final minutesLeft = journey.remaining.inMinutes;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.spMin, 16.spMin, 16.spMin, 28.spMin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _cardBuilder(
            label: 'Sharing now',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  minutesLeft < 1
                      ? 'Stopping now'
                      : 'Stops in $minutesLeft min',
                  style: TextStyle(
                    fontSize: 22.spMin,
                    fontWeight: FontWeight.w800,
                    color: AppColors.black,
                  ),
                ),
                4.hSizedBox,
                Text(
                  'Ends at ${endsAt.format(context)} on its own. '
                  'Nothing renews unless you choose it.',
                  style: TextStyle(
                    fontSize: 12.5.spMin,
                    height: 1.45,
                    color: AppColors.mediumGrey,
                  ),
                ),
                if (journey.recipients.isNotEmpty) ...[
                  12.hSizedBox,
                  Text(
                    'Seen by ${journey.recipients.map((r) => r.name).join(', ')}',
                    style: TextStyle(
                      fontSize: 12.5.spMin,
                      color: AppColors.mediumGrey,
                    ),
                  ),
                ],
              ],
            ),
          ),
          14.hSizedBox,
          _noteBuilder(
            'When it stops, your last position is deleted. History keeps '
            'the time and how long, never where you were.',
          ),
          18.hSizedBox,
          if (journey.canExtend)
            SizedBox(
              height: 52.spMin,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: FamilyColors.indigo,
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: FamilyColors.indigo),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.spMin),
                  ),
                ),
                onPressed: _handleExtend,
                child: Text(
                  'Keep sharing 1 more hour',
                  style: TextStyle(
                    fontSize: 15.spMin,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          10.hSizedBox,
          SizedBox(
            height: 56.spMin,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: FamilyColors.sosRed,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.spMin),
                ),
              ),
              onPressed: _handleStop,
              child: Text(
                'Stop sharing now',
                style: TextStyle(
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Shared pieces ────────────────────────────────────────────────────

  Widget _cardBuilder({
    required final String label,
    required final Widget child,
    final EdgeInsetsGeometry? padding,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.spMin),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColorLight,
            blurRadius: 10.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: padding ?? EdgeInsets.all(16.spMin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: padding == EdgeInsets.zero
                ? EdgeInsets.fromLTRB(16.spMin, 16.spMin, 16.spMin, 10.spMin)
                : EdgeInsets.only(bottom: 12.spMin),
            child: Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 11.5.spMin,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0,
                color: const Color(0xFFB84500),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }

  Widget _noteBuilder(final String text) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E8),
        borderRadius: BorderRadius.circular(14.spMin),
        border: Border.all(color: const Color(0xFFF0DFB8)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 14.spMin,
        vertical: 12.spMin,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.5.spMin,
          height: 1.45,
          color: const Color(0xFF6B5424),
        ),
      ),
    );
  }

  Future<void> _handleStart() async {
    final ok = await ref
        .read(providerOfFamily.notifier)
        .startJourney(
          durationMinutes: _durationMinutes,
          recipientMemberIds: _recipientIds.toList(),
        );
    if (!mounted) return;
    if (ok) {
      context.showSuccessToast(message: 'Sharing your journey');
    } else {
      context.showErrorToast(message: 'Could not start sharing');
    }
  }

  Future<void> _handleExtend() async {
    final ok = await ref.read(providerOfFamily.notifier).extendJourney();
    if (!mounted) return;
    context.showSuccessToast(
      message: ok ? 'Sharing extended' : 'Could not extend',
    );
  }

  Future<void> _handleStop() async {
    final ok = await ref.read(providerOfFamily.notifier).stopJourney();
    if (!mounted) return;
    if (ok) {
      context.showSuccessToast(message: 'Sharing stopped');
      Navigator.of(context).maybePop();
    } else {
      context.showErrorToast(message: 'Could not stop sharing');
    }
  }
}
