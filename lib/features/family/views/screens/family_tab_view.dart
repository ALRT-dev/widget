import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/family/providers/family_provider.dart';
import 'package:hazard_app/features/family/services/family_location_service.dart';
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
    _listenToMembershipForLocationPings();

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

  /// Starts the battery-conscious location pinger while the user belongs to
  /// a circle (and their sharing level allows it), stops it otherwise.
  void _listenToMembershipForLocationPings() {
    ref.listen(
      providerOfFamily.select(
        (s) => (s.circle != null, s.circle?.me?.sharingLevel),
      ),
      (prev, next) {
        final (hasCircle, sharingLevel) = next;
        final locationService = ref.read(providerOfFamilyLocationService);
        if (hasCircle && sharingLevel?.name != 'off') {
          locationService.start();
        } else {
          locationService.stop();
        }
      },
    );
  }
}
