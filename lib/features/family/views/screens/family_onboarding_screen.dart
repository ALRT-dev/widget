import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/family/providers/family_provider.dart';
import 'package:hazard_app/features/family/views/widgets/family_colors.dart';
import 'package:hazard_app/features/family/views/screens/family_invite_screen.dart';
import 'package:hazard_app/features/subscription/providers/alrt_plus_provider.dart';
import 'package:hazard_app/features/subscription/views/screens/alrt_plus_paywall_screen.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/others/app_colors.dart';

/// Shown when the user has no family circle yet: create one or join with a
/// code. Embedded as the Family tab body.
class FamilyOnboardingScreen extends ConsumerStatefulWidget {
  const FamilyOnboardingScreen({super.key});

  static const route = '/family-onboarding';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FamilyOnboardingScreenState();
}

class _FamilyOnboardingScreenState
    extends ConsumerState<FamilyOnboardingScreen> {
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listenToActionStates();

    final createState = ref.watch(
      providerOfFamily.select((s) => s.createCircleState),
    );
    final joinState = ref.watch(
      providerOfFamily.select((s) => s.joinCircleState),
    );

    // The prototype's empty state, in the family section's locked colours:
    // gradient header carrying the promise, one card of what a group gives
    // you, the privacy note, then the two paths. No price appears here —
    // the paywall comes only after tapping Create, and the invite path
    // never sees one.
    return Scaffold(
      backgroundColor: FamilyColors.v31Page,
      body: ListView(
        padding: EdgeInsets.only(bottom: 120.spMin),
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16.spMin, 56.spMin, 16.spMin, 20.spMin),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.5, -1),
                end: Alignment(0.5, 1),
                stops: [0.0, 0.55, 1.0],
                colors: [
                  FamilyColors.v31HeaderTop,
                  FamilyColors.v31HeaderMid,
                  FamilyColors.v31HeaderDeep,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Family',
                  style: TextStyle(
                    fontSize: 24.spMin,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5.spMin),
                Text(
                  'Know the people you care about are OK, '
                  'without ever tracking them.',
                  style: TextStyle(
                    fontSize: 13.spMin,
                    height: 1.5,
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16.spMin, 14.spMin, 16.spMin, 0),
            padding: EdgeInsets.symmetric(
              horizontal: 16.spMin,
              vertical: 15.spMin,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.spMin),
              boxShadow: [
                BoxShadow(
                  color: FamilyColors.v31CardShadow,
                  blurRadius: 12.0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What a group gives you',
                  style: TextStyle(
                    fontSize: 15.spMin,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 9.spMin),
                _pitchLineBuilder('One tap ', "I'm Safe", ' to everyone at once'),
                _pitchLineBuilder(
                  'Ask for a ',
                  'location snapshot',
                  ', they choose to send it',
                ),
                _pitchLineBuilder(
                  '',
                  'SOS',
                  ' to your people, with live location while it runs',
                ),
                _pitchLineBuilder(
                  'Alerts near your people, ',
                  'flagged automatically',
                  '',
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16.spMin, 11.spMin, 16.spMin, 0),
            padding: EdgeInsets.symmetric(
              horizontal: 14.spMin,
              vertical: 12.spMin,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF6ECFA),
              borderRadius: BorderRadius.circular(14.spMin),
              border: Border.all(color: const Color(0xFFECD9F4)),
            ),
            child: Text(
              'ALRT never live-tracks anyone. Snapshots are one moment, '
              'sent on purpose, and they expire after an hour.',
              style: TextStyle(
                fontSize: 12.spMin,
                height: 1.7,
                color: const Color(0xFF8E4AA6),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.spMin, 14.spMin, 16.spMin, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50.spMin,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFC939DD),
                          Color(0xFFA22CC6),
                          Color(0xFF7E1FA8),
                          Color(0xFF5C1585),
                        ],
                        stops: [0.0, 0.4, 0.74, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(15.spMin),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF9C27B0).withValues(
                            alpha: 0.32,
                          ),
                          blurRadius: 24.0,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.spMin),
                        ),
                      ),
                      onPressed: createState.isLoading
                          ? null
                          : _showCreateSheet,
                      child: createState.isLoading
                          ? SizedBox(
                              width: 20.spMin,
                              height: 20.spMin,
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              'Create a group',
                              style: TextStyle(
                                fontSize: 15.spMin,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 9.spMin),
                SizedBox(
                  height: 48.spMin,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1D1D21),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.spMin),
                        side: const BorderSide(
                          color: Color(0xFFE8E4EE),
                          width: 1.5,
                        ),
                      ),
                    ),
                    onPressed: joinState.isLoading ? null : _showJoinSheet,
                    child: joinState.isLoading
                        ? SizedBox(
                            width: 20.spMin,
                            height: 20.spMin,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'I have an invite code',
                            style: TextStyle(
                              fontSize: 14.spMin,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.spMin),
            child: Text(
              'No price to look. Joining is always free.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.spMin,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF6B6875),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// One benefit line: plain text with the load-bearing words in ink.
  Widget _pitchLineBuilder(
    final String lead,
    final String strong,
    final String tail,
  ) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: lead),
          TextSpan(
            text: strong,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF1D1D21),
            ),
          ),
          TextSpan(text: tail),
        ],
      ),
      style: TextStyle(
        fontSize: 13.spMin,
        height: 2.0,
        color: FamilyColors.v31Ink,
      ),
    );
  }

  /// A rounded input sheet used by both paths; keyboard-safe.
  Future<void> _showFieldSheet({
    required final String title,
    required final String subtitle,
    required final TextEditingController controller,
    required final String hint,
    required final String buttonLabel,
    required final VoidCallback onSubmit,
    final TextCapitalization capitalization = TextCapitalization.words,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.spMin)),
      ),
      builder: (sheetContext) => Padding(
        padding: EdgeInsets.fromLTRB(
          20.spMin,
          20.spMin,
          20.spMin,
          MediaQuery.of(sheetContext).viewInsets.bottom + 20.spMin,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  TextStyle(fontSize: 17.spMin, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 2.spMin),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12.spMin, color: AppColors.grey),
            ),
            SizedBox(height: 14.spMin),
            TextField(
              controller: controller,
              autofocus: true,
              textCapitalization: capitalization,
              decoration: InputDecoration(hintText: hint, counterText: ''),
            ),
            SizedBox(height: 14.spMin),
            SizedBox(
              height: 48.spMin,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: FamilyColors.indigo,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.spMin),
                  ),
                ),
                onPressed: () {
                  Navigator.of(sheetContext).pop();
                  onSubmit();
                },
                child: Text(
                  buttonLabel,
                  style: TextStyle(
                    fontSize: 15.spMin,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateSheet() {
    _showFieldSheet(
      title: 'Name your group',
      subtitle: 'e.g. Nixon Family, Netball Mums, Site Crew',
      controller: _nameController,
      hint: 'Group name',
      buttonLabel: 'Create a group',
      onSubmit: _onCreate,
    );
  }

  void _showJoinSheet() {
    _showFieldSheet(
      title: 'Join with a code',
      subtitle: 'Got an invite code from your family? Enter it here.',
      controller: _codeController,
      hint: 'e.g. ALRT-7F3K2',
      buttonLabel: 'Join group',
      capitalization: TextCapitalization.characters,
      onSubmit: _onJoin,
    );
  }

  Future<void> _onCreate() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      context.showErrorToast(message: 'Give your group a name first');
      return;
    }
    // ALRT+ moment: HOSTING a circle needs an ALRT+ subscription (1-month free
    // trial). Joining a circle is always free, so only this path is gated.
    final isPlus = await ref.read(providerOfAlrtPlus.future);
    if (!isPlus) {
      if (!mounted) return;
      final subscribed = await context.push<bool>(AlrtPlusPaywallScreen.route);
      if (subscribed != true) return;
    }
    if (!mounted) return;
    ref.read(providerOfFamily.notifier).createCircle(name: name);
  }

  void _onJoin() {
    final code = _codeController.text.trim();
    if (code.isEmpty) {
      context.showErrorToast(message: 'Enter an invite code first');
      return;
    }
    ref.read(providerOfFamily.notifier).join(code: code);
  }

  void _listenToActionStates() {
    ref.listen(providerOfFamily.select((s) => s.createCircleState), (
      prev,
      next,
    ) {
      if (prev != next && next.isError && next.error != null) {
        context.showErrorToast(message: next.error!.message);
      }
      // Honour the welcome screen's "Invite your family" intent once the
      // circle actually exists.
      if (prev != next &&
          next.isSuccess &&
          ref.read(providerOfPendingFamilyInvite)) {
        ref.read(providerOfPendingFamilyInvite.notifier).set(false);
        context.push(FamilyInviteScreen.route);
      }
    });
    ref.listen(providerOfFamily.select((s) => s.joinCircleState), (
      prev,
      next,
    ) {
      if (prev != next && next.isError && next.error != null) {
        context.showErrorToast(message: next.error!.message);
      }
    });
  }
}
