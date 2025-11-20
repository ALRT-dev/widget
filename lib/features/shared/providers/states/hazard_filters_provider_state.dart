import 'package:freezed_annotation/freezed_annotation.dart';

part 'hazard_filters_provider_state.freezed.dart';

@freezed
abstract class HazardFiltersProviderState with _$HazardFiltersProviderState {
  const HazardFiltersProviderState._();

  const factory HazardFiltersProviderState({
    /// Whether AWS Emergency level "Emergency" is selected.
    @Default(true) final bool isAwsEmergency,

    /// Whether AWS Emergency level "Watch and Act" is selected.
    @Default(true) final bool isAwsWatchAndAct,

    /// Whether AWS Emergency level "Advice" is selected.
    @Default(true) final bool isAwsAdvice,

    /// Whether Official Non-AWS sources are selected.
    @Default(true) final bool isOfficialNonAws,

    /// Whether User Reported sources are selected.
    @Default(true) final bool isUserReported,

    /// All available category IDs.
    @Default(<String>{}) final Set<String> allCategoryIds,

    /// Selected category IDs.
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

  /// Returns the total count of unselected filters.
  int get unselectedFiltersCount {
    int count = 0;
    if (!isAwsEmergency) count++;
    if (!isAwsWatchAndAct) count++;
    if (!isAwsAdvice) count++;
    if (!isOfficialNonAws) count++;
    if (!isUserReported) count++;
    count += allCategoryIds.length - selectedCategoryIds.length;
    return count;
  }
}
