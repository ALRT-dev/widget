import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';

part 'main_search_provider_state.freezed.dart';

@freezed
abstract class MainSearchProviderState with _$MainSearchProviderState {
  const factory MainSearchProviderState({
    /// The location selected from the search results.
    final AlrtLocation? searchedLocation,

    /// The hazards fetched from the search results after a successful fetch.
    @Default(<Hazard>[]) final List<Hazard> hazards,

    /// The state of fetching hazards by location.
    @Default(GetHazardsByLocationState.initial())
    final GetHazardsByLocationState getHazardsByLocationState,
  }) = _MainSearchProviderState;
}

@freezed
class GetHazardsByLocationState with _$GetHazardsByLocationState {
  const factory GetHazardsByLocationState.initial() =
      _GetHazardsByLocationStateInitial;
  const factory GetHazardsByLocationState.loading() =
      _GetHazardsByLocationStateLoading;
  const factory GetHazardsByLocationState.success(
    final List<Hazard> hazards,
  ) = _GetHazardsByLocationStateSuccess;
  const factory GetHazardsByLocationState.error(
    final AppError error,
  ) = _GetHazardsByLocationStateError;
}
