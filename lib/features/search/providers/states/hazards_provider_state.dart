import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';

part 'hazards_provider_state.freezed.dart';

@freezed
abstract class HazardsProviderState with _$HazardsProviderState {
  const factory HazardsProviderState({
    /// The temporary search parameters that are being modified by the user.
    @Default(HazardSearchParams()) final HazardSearchParams tempSearchParams,

    /// The actual search parameters used to fetch hazards.
    @Default(HazardSearchParams()) final HazardSearchParams searchParams,

    /// The list of hazards fetched based on [searchParams] after [getHazardsState] is successful.
    @Default(<Hazard>[]) final List<Hazard> hazards,

    /// The list of hazard categories fetched after [getHazardCategoriesState] is successful.
    @Default(<HazardCategory>[]) final List<HazardCategory> hazardCategories,

    /// The state of the get hazards operation.
    @Default(GetHazardsState.initial()) final GetHazardsState getHazardsState,

    /// The state of the get hazard categories operation.
    @Default(GetHazardCategoriesState.initial())
    final GetHazardCategoriesState getHazardCategoriesState,
  }) = _HazardsProviderState;
}

@freezed
class GetHazardsState with _$GetHazardsState {
  const factory GetHazardsState.initial() = GetHazardsStateInitial;
  const factory GetHazardsState.loading() = GetHazardsStateLoading;
  const factory GetHazardsState.success(
    final List<Hazard> hazards,
  ) = GetHazardsStateSuccess;
  const factory GetHazardsState.error(
    final AppError error,
  ) = GetHazardsStateError;
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
