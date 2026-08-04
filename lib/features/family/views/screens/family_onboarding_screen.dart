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
import 'package:lucide_icons_flutter/lucide_icons.dart';

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

    return Scaffold(
      backgroundColor: FamilyColors.v31Page,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.spMin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.spMin),
              _pitchCardBuilder(),
              SizedBox(height: 24.spMin),
              // Locked V3 empty state: a value pitch and two buttons.
              // No price on this screen; the paywall appears only after
              // tapping Create a group. The invite path never sees one.
              SizedBox(
                height: 52.spMin,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FamilyColors.indigo,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.spMin),
                    ),
                  ),
                  onPressed: createState.isLoading ? null : _showCreateSheet,
                  child: createState.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Create a group',
                          style: TextStyle(
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 12.spMin),
              SizedBox(
                height: 52.spMin,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: FamilyColors.indigo,
                    side: const BorderSide(color: FamilyColors.indigo),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.spMin),
                    ),
                  ),
                  onPressed: joinState.isLoading ? null : _showJoinSheet,
                  child: joinState.isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          'I have an invite code',
                          style: TextStyle(
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 20.spMin),
              Text(
                'Each member controls their own sharing level. '
                'No one is tracked without saying yes.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.spMin, color: AppColors.grey),
              ),
              SizedBox(height: 120.spMin),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pitchCardBuilder() {
    return Container(
      padding: EdgeInsets.all(22.spMin),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [FamilyColors.indigo, Color(0xFF7C7CE0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.spMin),
      ),
      child: Column(
        children: [
          Container(
            width: 60.spMin,
            height: 60.spMin,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(18.spMin),
            ),
            child: Icon(LucideIcons.users, color: Colors.white, size: 30.spMin),
          ),
          SizedBox(height: 14.spMin),
          Text(
            'Family Safety',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.spMin,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6.spMin),
          Text(
            'Check in with one tap, see who is near an alert, '
            'and get a quiet note when family arrive home safe.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 13.spMin,
            ),
          ),
        ],
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
