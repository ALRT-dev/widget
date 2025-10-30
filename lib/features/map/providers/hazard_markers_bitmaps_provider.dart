import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/map/providers/states/hazard_markers_bitmaps_provider_state.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/hazard_service.dart';

final providerOfHazardMarkerBitmaps =
    StateNotifierProvider<
      HazardMarkerBitmapsProvider,
      HazardMarkersBitmapsProviderState
    >(
      (ref) => HazardMarkerBitmapsProvider(
        ref: ref,
        state: const HazardMarkersBitmapsProviderState(),
      ),
    );

class HazardMarkerBitmapsProvider
    extends StateNotifier<HazardMarkersBitmapsProviderState> {
  HazardMarkerBitmapsProvider({
    required final Ref ref,
    required final HazardMarkersBitmapsProviderState state,
  }) : _ref = ref,
       super(state);

  final Ref _ref;
  HazardService get _hazardService => _ref.read(providerOfHazardService);

  /// Generates marker bitmaps for all hazard categories and severities.
  Future<void> generateMarkerBitmaps() async {
    state = state.copyWith(
      generateMarkerBitmaps: const GenerateMarkerBitmaps.loading(),
    );

    final result = await _hazardService.generateHazardMarkerBitmaps();
    if (!mounted) return;

    result.when(
      (markerBitmaps) {
        state = state.copyWith(
          markerBitmaps: markerBitmaps,
          generateMarkerBitmaps: GenerateMarkerBitmaps.success(markerBitmaps),
        );
      },
      (error) {
        state = state.copyWith(
          generateMarkerBitmaps: GenerateMarkerBitmaps.failure(error),
        );
      },
    );
  }
}
