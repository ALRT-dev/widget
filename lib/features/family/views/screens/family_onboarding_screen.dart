import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/family/providers/family_provider.dart';
import 'package:hazard_app/features/family/views/widgets/family_colors.dart';
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
      backgroundColor: const Color(0xFFF4F4F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.spMin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.spMin),
              _pitchCardBuilder(),
              SizedBox(height: 24.spMin),
              _sectionCardBuilder(
                title: 'Create a circle',
                subtitle: 'Start a new family circle and invite the others.',
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.words,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        hintText: 'Circle name, e.g. Nixon Family',
                        counterText: '',
                      ),
                    ),
                    SizedBox(height: 12.spMin),
                    SizedBox(
                      height: 48.spMin,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: FamilyColors.indigo,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.spMin),
                          ),
                        ),
                        onPressed: createState.isLoading ? null : _onCreate,
                        child: createState.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Create circle',
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
              SizedBox(height: 16.spMin),
              _sectionCardBuilder(
                title: 'Join with a code',
                subtitle: 'Got an invite code from your family? Enter it here.',
                child: Column(
                  children: [
                    TextField(
                      controller: _codeController,
                      textCapitalization: TextCapitalization.characters,
                      decoration: const InputDecoration(
                        hintText: 'e.g. ALRT-7F3K2',
                      ),
                    ),
                    SizedBox(height: 12.spMin),
                    SizedBox(
                      height: 48.spMin,
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: FamilyColors.indigo,
                          side: const BorderSide(color: FamilyColors.indigo),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.spMin),
                          ),
                        ),
                        onPressed: joinState.isLoading ? null : _onJoin,
                        child: joinState.isLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                'Join circle',
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

  Widget _sectionCardBuilder({
    required final String title,
    required final String subtitle,
    required final Widget child,
  }) {
    return Container(
      padding: EdgeInsets.all(18.spMin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.spMin),
        boxShadow: [
          BoxShadow(color: AppColors.shadowColorLight, blurRadius: 2.0),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 17.spMin, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 2.spMin),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12.spMin, color: AppColors.grey),
          ),
          SizedBox(height: 12.spMin),
          child,
        ],
      ),
    );
  }

  void _onCreate() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      context.showErrorToast(message: 'Give your circle a name first');
      return;
    }
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
