import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_severity_with_count_model.dart';

part 'hazard_filters_provider_state.freezed.dart';

@freezed
abstract class HazardFiltersProviderState with _$HazardFiltersProviderState {
  const factory HazardFiltersProviderState({
    /// The list of hazard categories fetched from the service.
    @Default(<HazardCategory>[]) final List<HazardCategory> hazardCategories,

    /// The list of categories selected by the user.
    @Default(<HazardCategory>[])
    final List<HazardCategory> selectedHazardCategories,

    /// The list of hazard severities (AWS compliant) fetched from the service.
    @Default(<HazardSeverityWithCount>[])
    final List<HazardSeverityWithCount> hazardSeveritiesAws,

    /// The list of AWS severities selected by the user.
    @Default(<HazardSeverityWithCount>[])
    final List<HazardSeverityWithCount> selectedHazardSeveritiesAws,

    /// The list of hazard severities (Non-AWS compliant) fetched from the service.
    @Default(<HazardSeverityWithCount>[])
    final List<HazardSeverityWithCount> hazardSeveritiesNonAws,

    /// The list of Non-AWS severities selected by the user.
    @Default(<HazardSeverityWithCount>[])
    final List<HazardSeverityWithCount> selectedHazardSeveritiesNonAws,

    /// The state of fetching hazard categories.
    @Default(GetAllHazardCategoriesState.initial())
    GetAllHazardCategoriesState getAllHazardCategoriesState,
  }) = _HazardFiltersProviderState;
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
