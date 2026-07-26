import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/subscription/services/revenuecat_service.dart';

final providerOfRevenueCat = Provider<RevenueCatService>(
  (ref) => RevenueCatService(),
);

/// True when the signed-in user has an active ALRT+ entitlement. Ensures
/// RevenueCat is configured for the current user before reading status.
/// `ref.refresh(providerOfAlrtPlus)` re-checks after a purchase.
final providerOfAlrtPlus = FutureProvider.autoDispose<bool>((ref) async {
  final userId = ref.watch(providerOfLoggedInUser)?.id;
  if (userId == null) return false;
  final rc = ref.watch(providerOfRevenueCat);
  await rc.ensureConfigured(userId);
  return rc.isPlus();
});
