import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/hazard_severity_with_count_model.dart';

part 'hazard_severity_filters_provider_state.freezed.dart';

@freezed
abstract class HazardSeverityFiltersProviderState
    with _$HazardSeverityFiltersProviderState {
  const factory HazardSeverityFiltersProviderState({
    /// The list of hazard severities fetched from the service.
    @Default(<HazardSeverityWithCount>[])
    final List<HazardSeverityWithCount> hazardSeverities,

    /// The list of severities selected by the user.
    @Default(<HazardSeverityWithCount>[])
    final List<HazardSeverityWithCount> selectedSeverities,

    /// Whether the severity filters are displayed in the UI.
    @Default(false) final bool isFiltersVisible,
  }) = _HazardSeverityFiltersProviderState;
}
