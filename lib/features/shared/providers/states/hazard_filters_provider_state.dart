import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_filters.dart';

part 'hazard_filters_provider_state.freezed.dart';

@freezed
abstract class HazardFiltersProviderState with _$HazardFiltersProviderState {
  const HazardFiltersProviderState._();

  const factory HazardFiltersProviderState({
    /// The complete set of hazard filters fetched from the service.
    @Default(HazardFilters()) final HazardFilters filters,

    /// The currently selected hazard filters.
    @Default(HazardFilters()) final HazardFilters selectedFilters,

    /// The list of all parent hazard categories.
    @Default(<HazardCategory>[])
    final List<HazardCategory> parentHazardCategories,

    /// The state of fetching hazard filters.
    @Default(GetHazardFiltersState.initial())
    final GetHazardFiltersState getHazardFiltersState,

    /// The state of fetching hazard categories.
    @Default(GetAllHazardCategoriesState.initial())
    final GetAllHazardCategoriesState getAllHazardCategoriesState,
  }) = _HazardFiltersProviderState;

  /// Indicates whether any filters are currently available.
  bool get isFiltersAvailable =>
      filters.categoryFilters.isNotEmpty ||
      filters.severityFiltersAws.isNotEmpty ||
      filters.severityFiltersNonAws.isNotEmpty;

  /// Indicates whether any filters are currently selected.
  bool get isFiltersSelected =>
      selectedFilters.categoryFilters.isNotEmpty ||
      selectedFilters.severityFiltersAws.isNotEmpty ||
      selectedFilters.severityFiltersNonAws.isNotEmpty;

  /// Returns the total count of selected filters.
  int get selectedFiltersCount =>
      selectedFilters.categoryFilters.length +
      selectedFilters.severityFiltersAws.length +
      selectedFilters.severityFiltersNonAws.length;
}

@freezed
class GetAllHazardCategoriesState with _$GetAllHazardCategoriesState {
  const factory GetAllHazardCategoriesState.initial() =
      _GetAllHazardCategoriesStateInitial;
  const factory GetAllHazardCategoriesState.loading() =
      _GetAllHazardCategoriesStateLoading;
  const factory GetAllHazardCategoriesState.success(
    final List<HazardCategory> hazardCategories,
  ) = _GetAllHazardCategoriesStateSuccess;
  const factory GetAllHazardCategoriesState.error(
    final AppError error,
  ) = _GetAllHazardCategoriesStateError;
}

@freezed
class GetHazardFiltersState with _$GetHazardFiltersState {
  const factory GetHazardFiltersState.initial() = _GetHazardFiltersStateInitial;
  const factory GetHazardFiltersState.loading() = _GetHazardFiltersStateLoading;
  const factory GetHazardFiltersState.success(
    final HazardFilters hazardFilters,
  ) = _GetHazardFiltersStateSuccess;
  const factory GetHazardFiltersState.error(
    final AppError error,
  ) = _GetHazardFiltersStateError;
}
