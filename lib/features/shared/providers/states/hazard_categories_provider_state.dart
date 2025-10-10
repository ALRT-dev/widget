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
    @Default(GetHazardCategoriesState.initial())
    GetHazardCategoriesState getHazardCategoriesState,
  }) = _HazardCategoriesProviderState;
}

@freezed
class GetHazardCategoriesState with _$GetHazardCategoriesState {
  const factory GetHazardCategoriesState.initial() =
      GetHazardCategoriesStateInitial;
  const factory GetHazardCategoriesState.loading() =
      GetHazardCategoriesStateLoading;
  const factory GetHazardCategoriesState.success(
    final List<HazardCategory> hazardCategories,
  ) = GetHazardCategoriesStateSuccess;
  const factory GetHazardCategoriesState.error(
    final AppError error,
  ) = GetHazardCategoriesStateError;
}
