import 'package:freezed_annotation/freezed_annotation.dart';

part 'hazard_filters_provider_state.freezed.dart';

@freezed
abstract class HazardFiltersProviderState with _$HazardFiltersProviderState {
  const HazardFiltersProviderState._();

  const factory HazardFiltersProviderState({
    /// Whether AWS Emergency level "Emergency" is selected.
    @Default(true) final bool awsEmergency,

    /// Whether AWS Emergency level "Watch and Act" is selected.
    @Default(true) final bool awsWatchAndAct,

    /// Whether AWS Emergency level "Advice" is selected.
    @Default(true) final bool awsAdvice,

    /// Whether Official Non-AWS sources are selected.
    @Default(true) final bool officialNonAws,

    /// Whether User Reported sources are selected.
    @Default(true) final bool userReported,

    /// All available category IDs.
    @Default(<String>{}) final Set<String> allCategoryIds,

    /// Selected category IDs.
    @Default(<String>{}) final Set<String> selectedCategoryIds,

    /// Selected location subscription IDs.
    @Default(<String>{}) final Set<String> selectedLocationIds,
  }) = _HazardFiltersProviderState;

  /// Indicates whether any filters are currently selected.
  bool get hasFiltersSelected =>
      awsEmergency ||
      awsWatchAndAct ||
      awsAdvice ||
      officialNonAws ||
      userReported ||
      selectedCategoryIds.isNotEmpty;

  /// Returns the total count of unselected filters.
  int get unselectedFiltersCount {
    int count = 0;
    if (!awsEmergency) count++;
    if (!awsWatchAndAct) count++;
    if (!awsAdvice) count++;
    if (!officialNonAws) count++;
    if (!userReported) count++;
    count += allCategoryIds.length - selectedCategoryIds.length;
    return count;
  }
}
