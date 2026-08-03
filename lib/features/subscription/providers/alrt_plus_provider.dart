import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/subscription/services/revenuecat_service.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

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

/// A read-only snapshot of the user's ALRT+ subscription, shaped for the
/// welcome / manage / billing screens. All fields come from RevenueCat's
/// `CustomerInfo`; the app never grants entitlements itself.
class AlrtPlusStatus {
  const AlrtPlusStatus({
    this.isActive = false,
    this.isTrial = false,
    this.willRenew = false,
    this.expirationDate,
    this.hasBillingIssue = false,
    this.productIdentifier,
    this.managementUrl,
  });

  /// Whether the `plus` entitlement is currently active (a billing grace
  /// period still counts as active).
  final bool isActive;

  /// Whether the user is inside the free introductory month.
  final bool isTrial;

  /// Whether the subscription renews at [expirationDate] (false once the
  /// user has cancelled).
  final bool willRenew;

  /// When the current period ends. This is the renewal date while
  /// [willRenew], the first payment date while [isTrial], and the lapse date
  /// once cancelled or in a billing grace period.
  final DateTime? expirationDate;

  /// The store failed to renew and RevenueCat is retrying (grace period).
  final bool hasBillingIssue;

  /// The store product backing the entitlement, e.g. `alrt_plus_yearly`.
  final String? productIdentifier;

  /// Deep link into the store's own subscription management UI.
  final Uri? managementUrl;

  /// A short plan label derived from the product id.
  String get planLabel {
    final id = productIdentifier ?? '';
    if (id.contains('year') || id.contains('annual')) return 'Yearly';
    if (id.contains('month')) return 'Monthly';
    return 'ALRT +';
  }
}

/// The ALRT+ subscription snapshot for the signed-in user. Refresh after a
/// purchase or restore with `ref.invalidate(providerOfAlrtPlusStatus)`.
final providerOfAlrtPlusStatus = FutureProvider.autoDispose<AlrtPlusStatus>((
  ref,
) async {
  final userId = ref.watch(providerOfLoggedInUser)?.id;
  if (userId == null) return const AlrtPlusStatus();
  final rc = ref.watch(providerOfRevenueCat);
  await rc.ensureConfigured(userId);
  final info = await rc.customerInfo();
  final entitlement =
      info?.entitlements.all[RevenueCatService.entitlementId];
  if (info == null || entitlement == null) return const AlrtPlusStatus();
  return AlrtPlusStatus(
    isActive: entitlement.isActive,
    isTrial: entitlement.periodType == PeriodType.trial,
    willRenew: entitlement.willRenew,
    expirationDate: entitlement.expirationDate != null
        ? DateTime.tryParse(entitlement.expirationDate!)?.toLocal()
        : null,
    hasBillingIssue: entitlement.billingIssueDetectedAt != null,
    productIdentifier: entitlement.productIdentifier,
    managementUrl:
        info.managementURL != null ? Uri.tryParse(info.managementURL!) : null,
  );
});
