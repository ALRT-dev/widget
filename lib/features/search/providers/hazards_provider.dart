import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/search/providers/states/hazards_provider_state.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/hazard_service.dart';

final providerOfHazards =
    StateNotifierProvider.autoDispose<HazardsProvider, HazardsProviderState>(
  (ref) => HazardsProvider(
    ref: ref,
    state: HazardsProviderState(),
  ),
);

class HazardsProvider extends StateNotifier<HazardsProviderState> {
  HazardsProvider({
    required final Ref ref,
    required final HazardsProviderState state,
  })  : _ref = ref,
        super(state) {
    getHazardCategories();
    getHazards();
  }

  final Ref _ref;
  HazardService get _hazardService => _ref.read(providerOfHazardService);

  /// Fetches the list of hazard categories.
  Future<void> getHazardCategories() async {
    state = state.copyWith(
      getHazardCategoriesState: const GetHazardCategoriesState.loading(),
    );

    final result = await _hazardService.getHazardCategories();
    if (!mounted) return;

    result.when(
      (hazardCategories) {
        state = state.copyWith(
          getHazardCategoriesState: GetHazardCategoriesState.success(
            hazardCategories,
          ),
        );
        updateHazardCategories(hazardCategories);
      },
      (error) {
        state = state.copyWith(
          getHazardCategoriesState: GetHazardCategoriesState.error(error),
        );
      },
    );
  }

  /// Gets the list of hazards based on the current [HazardsProviderState.searchParams].
  Future<void> getHazards() async {
    state = state.copyWith(
      getHazardsState: const GetHazardsState.loading(),
    );

    // Commit the temporary search parameters before making the API call
    commitTempSearchParams();

    final result = await _hazardService.getHazards(
      searchParams: state.searchParams,
    );
    if (!mounted) return;

    result.when(
      (hazards) {
        state = state.copyWith(
          getHazardsState: GetHazardsState.success(hazards),
        );
        updateHazards(hazards);
      },
      (error) {
        state = state.copyWith(
          getHazardsState: GetHazardsState.error(error),
        );
      },
    );
  }

  /// Updates [HazardsProviderState.tempSearchParams] with the given [searchParams].
  void updateTempSearchParams(final HazardSearchParams searchParams) {
    state = state.copyWith(
      tempSearchParams: searchParams,
    );
  }

  /// Commits the temporary search parameters to be the actual search parameters.
  void commitTempSearchParams() {
    state = state.copyWith(
      searchParams: state.tempSearchParams,
    );
  }

  /// Updates [HazardsProviderState.searchParams] with the given [searchParams].
  void updateSearchParams(final HazardSearchParams searchParams) {
    state = state.copyWith(
      searchParams: searchParams,
    );
  }

  /// Updates [HazardsProviderState.tempSearchParams] with the given [searchString].
  void updateTempSearchString(final String? searchString) {
    updateTempSearchParams(
      state.tempSearchParams.copyWith(
        searchString: searchString,
      ),
    );
  }

  /// Updates [HazardsProviderState.tempSearchParams] with the given [categoryIds].
  void updateTempCategoryIds(final List<String> categoryIds) {
    updateTempSearchParams(
      state.tempSearchParams.copyWith(
        categoryIds: categoryIds,
      ),
    );
  }

  /// Adds or removes the given [categoryId] from [HazardsProviderState.tempSearchParams.categoryIds].
  void selectCategory(final String categoryId) {
    final categoryIds = List<String>.from(
      state.tempSearchParams.categoryIds,
    );

    if (categoryIds.contains(categoryId)) {
      categoryIds.remove(categoryId);
    } else {
      categoryIds.add(categoryId);
    }

    updateTempCategoryIds(categoryIds);
  }

  /// Updates [HazardsProviderState.getHazardsState] to loading.
  void updateGetHazardsStateToLoading() {
    state = state.copyWith(
      getHazardsState: const GetHazardsState.loading(),
    );
  }

  /// Updates [HazardsProviderState.hazards] with the given [hazards].
  void updateHazards(final List<Hazard> hazards) {
    state = state.copyWith(
      hazards: hazards,
    );
  }

  /// Updates [HazardsProviderState.hazardCategories] with the given [hazardCategories].
  void updateHazardCategories(final List<HazardCategory> hazardCategories) {
    state = state.copyWith(
      hazardCategories: hazardCategories,
    );
  }
}
