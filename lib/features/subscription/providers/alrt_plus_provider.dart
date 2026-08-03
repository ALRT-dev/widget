import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  // Test-build escape hatch: sideloaded QA builds can't complete store
  // purchases, so CI sets ALRT_PLUS_TEST_UNLOCK=true in .env to open the
  // ALRT+ gates. Never set in store builds.
  if (dotenv.env['ALRT_PLUS_TEST_UNLOCK'] == 'true') return true;
  final rc = ref.watch(providerOfRevenueCat);
  await rc.ensureConfigured(userId);
  return rc.isPlus();
});

/// True when the active ALRT+ entitlement has a detected billing issue
/// (payment failed, store is retrying). Drives the calm amber banner on the
/// family screen.
final providerOfAlrtPlusBillingIssue = FutureProvider.autoDispose<bool>((
  ref,
) async {
  final userId = ref.watch(providerOfLoggedInUser)?.id;
  if (userId == null) return false;
  final rc = ref.watch(providerOfRevenueCat);
  await rc.ensureConfigured(userId);
  final entitlement = await rc.plusEntitlement();
  return entitlement?.billingIssueDetectedAt != null;
});

/// One-shot intent: set by the welcome screen's "Invite your family" CTA,
/// consumed by the family onboarding after the circle is created.
/// (Notifier-based: StateProvider was removed in Riverpod 3.)
class PendingFamilyInviteNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  // ignore: use_setters_to_change_properties
  void set(final bool value) => state = value;
}

final providerOfPendingFamilyInvite =
    NotifierProvider<PendingFamilyInviteNotifier, bool>(
  PendingFamilyInviteNotifier.new,
);
