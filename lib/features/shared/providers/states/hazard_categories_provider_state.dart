import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';

part 'hazard_categories_provider_state.freezed.dart';

@freezed
abstract class HazardCategoriesProviderState
    with _$HazardCategoriesProviderState {
  const factory HazardCategoriesProviderState({
    /// The list of hazard categories fetched from the service.
    @Default(<HazardCategory>[]) final List<HazardCategory> hazardCategories,

    /// The list of categories selected by the user.
    @Default(<HazardCategory>[]) final List<HazardCategory> selectedCategories,

    /// The state of fetching hazard categories.
    @Default(GetAllHazardCategoriesState.initial())
    GetAllHazardCategoriesState getAllHazardCategoriesState,
  }) = _HazardCategoriesProviderState;
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
