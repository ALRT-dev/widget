import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/search/providers/states/main_search_provider_state.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/hazard_service.dart';

final providerOfMainSearch = StateNotifierProvider.autoDispose<
    MainSearchProvider, MainSearchProviderState>(
  (ref) => MainSearchProvider(
    ref: ref,
    state: MainSearchProviderState(),
  ),
);

class MainSearchProvider extends StateNotifier<MainSearchProviderState> {
  MainSearchProvider({
    required final Ref ref,
    required final MainSearchProviderState state,
  })  : _ref = ref,
        super(state);

  final Ref _ref;
  HazardService get _hazardService => _ref.read(providerOfHazardService);

  /// Fetches hazards for the given location and updates the state accordingly.
  Future<void> getHazards() async {
    final location = state.searchedLocation;
    if (location == null) return;

    state = state.copyWith(
      getHazardsByLocationState: const GetHazardsByLocationState.loading(),
    );

    final result = await _hazardService.getHazards(
      searchParams: HazardSearchParams(
        latitude: location.latitude,
        longitude: location.longitude,
      ),
    );
    if (!mounted) return;

    result.when(
      (hazards) {
        state = state.copyWith(
          getHazardsByLocationState: GetHazardsByLocationState.success(hazards),
        );
        updateHazards(hazards);
      },
      (error) {
        state = state.copyWith(
          getHazardsByLocationState: GetHazardsByLocationState.error(error),
        );
      },
    );
  }

  /// Updates [MainSearchProviderState.searchedLocation] with the given [location].
  void updateSearchedLocation(AlrtLocation? location) {
    state = state.copyWith(
      searchedLocation: location,
    );
  }

  /// Updates [MainSearchProviderState.hazards] with the given [hazards].
  void updateHazards(List<Hazard> hazards) {
    state = state.copyWith(
      hazards: hazards,
    );
  }

  /// Updates [MainSearchProviderState.getHazardsByLocationState] to its initial state.
  void updateGetHazardsByLocationStateToInitial() {
    state = state.copyWith(
      getHazardsByLocationState: const GetHazardsByLocationState.initial(),
    );
    updateHazards([]);
  }
}
