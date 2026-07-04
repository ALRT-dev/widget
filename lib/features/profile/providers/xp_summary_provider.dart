import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/profile/models/xp_summary_models.dart';
import 'package:hazard_app/features/shared/providers/rest_client_provider.dart';

/// Scoring v2 summary for the profile (XP, streak, trust tier, quest).
/// Auto-refreshes whenever it is re-watched after disposal; call
/// `ref.refresh(providerOfXpSummary)` to force-reload after XP changes.
final providerOfXpSummary = FutureProvider.autoDispose<XpSummary>((ref) async {
  final restClient = ref.watch(providerOfRestClient);
  return restClient.getXpSummary();
});
