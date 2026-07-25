import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/profile/models/xp_breakdown_models.dart';
import 'package:hazard_app/features/shared/providers/rest_client_provider.dart';

/// Per-report XP breakdown and ranking from GET /api/xp/breakdown.
final providerOfXpBreakdown = FutureProvider.autoDispose<XpBreakdown>((
  ref,
) async {
  final restClient = ref.watch(providerOfRestClient);
  return restClient.getXpBreakdown();
});
