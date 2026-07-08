import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/family/providers/family_provider.dart';
import 'package:hazard_app/features/family/views/screens/family_hub_screen.dart';
import 'package:hazard_app/features/family/views/screens/family_onboarding_screen.dart';
import 'package:hazard_app/features/family/views/widgets/family_colors.dart';
import 'package:hazard_app/others/app_colors.dart';

/// The Family tab body: loads the circle, starts/stops the live-location
/// pinger based on membership, and shows onboarding or the hub.
class FamilyTabView extends ConsumerStatefulWidget {
  const FamilyTabView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FamilyTabViewState();
}

class _FamilyTabViewState extends ConsumerState<FamilyTabView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(providerOfFamily.notifier).load(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasLoadedOnce = ref.watch(
      providerOfFamily.select((s) => s.hasLoadedOnce),
    );
    final loadState = ref.watch(providerOfFamily.select((s) => s.loadState));
    final hasCircle = ref.watch(
      providerOfFamily.select((s) => s.circle != null),
    );

    if (!hasLoadedOnce) {
      if (loadState.isError) {
        return _errorBuilder();
      }
      return const Center(
        child: CircularProgressIndicator(color: FamilyColors.indigo),
      );
    }

    return hasCircle ? const FamilyHubScreen() : const FamilyOnboardingScreen();
  }

  Widget _errorBuilder() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Could not load your family circle',
            style: TextStyle(fontSize: 15.spMin, color: AppColors.grey),
          ),
          SizedBox(height: 10.spMin),
          OutlinedButton(
            onPressed: () => ref.read(providerOfFamily.notifier).load(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

}
