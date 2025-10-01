import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';

part 'hazards_provider_state.freezed.dart';

@freezed
abstract class HazardsProviderState with _$HazardsProviderState {
  const factory HazardsProviderState({
    /// The temporary search parameters that are being modified by the user.
    @Default(HazardSearchParams()) final HazardSearchParams tempSearchParams,

    /// The actual search parameters used to fetch hazards.
    @Default(HazardSearchParams()) final HazardSearchParams searchParams,
  }) = _HazardsProviderState;
}
