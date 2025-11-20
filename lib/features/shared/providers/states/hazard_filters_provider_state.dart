import 'package:freezed_annotation/freezed_annotation.dart';

part 'hazard_filters_provider_state.freezed.dart';

@freezed
abstract class HazardFiltersProviderState with _$HazardFiltersProviderState {
  const HazardFiltersProviderState._();

  const factory HazardFiltersProviderState({
    /// AWS Emergency Level Filters
    @Default(false) final bool isAwsEmergency,
    @Default(false) final bool isAwsWatchAndAct,
    @Default(false) final bool isAwsAdvice,

    /// Other Source Filters
    @Default(false) final bool isOfficialNonAws,
    @Default(false) final bool isUserReported,

    /// Category selection state
    @Default(<String>{}) final Set<String> selectedCategoryIds,
  }) = _HazardFiltersProviderState;

  /// Indicates whether any filters are currently selected.
  bool get hasFiltersSelected =>
      isAwsEmergency ||
      isAwsWatchAndAct ||
      isAwsAdvice ||
      isOfficialNonAws ||
      isUserReported ||
      selectedCategoryIds.isNotEmpty;

  /// Returns the total count of selected filters.
  int get selectedFiltersCount {
    int count = 0;
    if (isAwsEmergency) count++;
    if (isAwsWatchAndAct) count++;
    if (isAwsAdvice) count++;
    if (isOfficialNonAws) count++;
    if (isUserReported) count++;
    count += selectedCategoryIds.length;
    return count;
  }
}
