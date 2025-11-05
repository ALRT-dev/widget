import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/map/views/screens/map_screen.dart';
import 'package:hazard_app/features/notification/views/widgets/notifications_appbar.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_appbar.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_filters.dart';
import 'package:hazard_app/features/shared/models/hazard_severity_with_count_model.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/providers/states/hazard_filters_provider_state.dart';
import 'package:hazard_app/features/shared/services/hazard_service.dart';
import 'package:hazard_app/features/shared/views/widgets/categories_dropdown.dart';

final providerOfHazardFiltersForMap = providerOfHazardFilters(
  MapScreen.filtersKey,
);
final providerOfHazardFiltersForSearch = providerOfHazardFilters(
  HazardSearchAppBar.filtersKey,
);
final providerOfHazardFiltersForNotifications = providerOfHazardFilters(
  NotificationsAppBar.filtersKey,
);
final providerOfHazardFiltersForDropdown = providerOfHazardFilters(
  CategoriesDropdown.filtersKey,
);

final providerOfHazardFilters = StateNotifierProvider.autoDispose
    .family<HazardFiltersProvider, HazardFiltersProviderState, String>(
      (ref, id) => HazardFiltersProvider(
        ref: ref,
        state: const HazardFiltersProviderState(),
      ),
    );

class HazardFiltersProvider extends StateNotifier<HazardFiltersProviderState> {
  HazardFiltersProvider({
    required final Ref ref,
    required final HazardFiltersProviderState state,
  }) : _ref = ref,
       super(state);

  final Ref _ref;
  HazardService get _hazardService => _ref.read(providerOfHazardService);

  /// Fetches the list of hazard categories.
  Future<void> getAllParentHazardCategories() async {
    state = state.copyWith(
      getAllHazardCategoriesState: const GetAllHazardCategoriesState.loading(),
    );

    final result = await _hazardService.getAllParentHazardCategories();
    if (!mounted) return;

    result.when(
      (hazardCategories) {
        state = state.copyWith(
          getAllHazardCategoriesState: GetAllHazardCategoriesState.success(
            hazardCategories,
          ),
          parentHazardCategories: hazardCategories,
        );
      },
      (error) {
        state = state.copyWith(
          getAllHazardCategoriesState: GetAllHazardCategoriesState.error(error),
        );
      },
    );
  }

  /// Fetches the hazard filters from the server.
  Future<void> getHazardFilters({
    required final HazardSearchParams searchParams,
  }) async {
    state = state.copyWith(
      getHazardFiltersState: const GetHazardFiltersState.loading(),
    );

    final result = await _hazardService.getHazardFilters(
      searchParams: searchParams,
    );
    if (!mounted) return;

    result.when(
      (filters) {
        state = state.copyWith(
          getHazardFiltersState: GetHazardFiltersState.success(filters),
        );
        updateFilters(filters);
      },
      (error) {
        state = state.copyWith(
          getHazardFiltersState: GetHazardFiltersState.error(error),
        );
      },
    );
  }

  /// Updates [HazardFiltersProviderState.filters] with the provided [filters].
  void updateFilters(final HazardFilters filters) {
    state = state.copyWith(
      filters: filters,
    );
  }

  /// Updates [HazardFiltersProviderState.selectedFilters] with the provided [selectedFilters].
  void updateSelectedFilters(final HazardFilters selectedFilters) {
    state = state.copyWith(
      selectedFilters: selectedFilters,
    );
  }

  /// Updates [HazardFiltersProviderState.hazardCategories] with the provided [hazardCategories].
  void updateCategoryFilters(final List<HazardCategory> hazardCategories) {
    updateFilters(
      state.filters.copyWith(
        categoryFilters: hazardCategories,
      ),
    );
  }

  /// Updates a [HazardCategory] in the list of hazard categories.
  void updateCategoryFilter(HazardCategory updatedCategory) {
    final index = state.filters.categoryFilters.indexWhere(
      (category) => category.id == updatedCategory.id,
    );
    if (index != -1) {
      final updatedCategories = [...state.filters.categoryFilters];
      updatedCategories[index] = updatedCategory;
      updateCategoryFilters(updatedCategories);
      sortCategoryFiltersByHazardCount();
    }
  }

  /// Adds a [HazardCategory] to the list of hazard categories.
  ///
  /// Also sorts the categories by [HazardCategory.hazardsCount] in descending order.
  void addToCategoryFilters(final HazardCategory category) {
    updateCategoryFilters([...state.filters.categoryFilters, category]);
    sortCategoryFiltersByHazardCount();
  }

  /// Removes a [HazardCategory] with id [categoryId] from the list of hazard categories.
  void removeFromCategoryFilters(final String categoryId) {
    updateCategoryFilters(
      state.filters.categoryFilters
          .where((element) => element.id != categoryId)
          .toList(),
    );
  }

  /// Sorts the hazard categories by [HazardCategory.hazardsCount] in descending order.
  void sortCategoryFiltersByHazardCount() {
    final sortedCategories = [...state.filters.categoryFilters];
    sortedCategories.sort((a, b) => b.hazardsCount.compareTo(a.hazardsCount));
    updateCategoryFilters(sortedCategories);
  }

  /// Updates [HazardFiltersProviderState.selectedHazardCategories] with the provided [selectedCategories].
  void updateSelectedCategoryFilters(
    final List<HazardCategory> selectedCategories,
  ) {
    updateSelectedFilters(
      state.selectedFilters.copyWith(
        categoryFilters: selectedCategories,
      ),
    );
  }

  /// Adds a [HazardCategory] to the list of selected categories.
  void addToSelectedHazardCategories(final HazardCategory category) {
    updateSelectedCategoryFilters([
      ...state.selectedFilters.categoryFilters,
      category,
    ]);
  }

  /// Removes a [HazardCategory] with id [categoryId] from the list of selected categories.
  void removeFromSelectedHazardCategories(final String categoryId) {
    updateSelectedCategoryFilters(
      state.selectedFilters.categoryFilters
          .where((element) => element.id != categoryId)
          .toList(),
    );
  }

  /// Toggles the selection state of a [HazardCategory].
  void toggleSelectedHazardCategory(final HazardCategory category) {
    final isSelected = state.selectedFilters.categoryFilters.any(
      (selectedCategory) => selectedCategory.id == category.id,
    );
    if (isSelected) {
      removeFromSelectedHazardCategories(category.id);
    } else {
      addToSelectedHazardCategories(category);
    }
  }

  /// Updates [HazardFiltersProviderState.hazardSeveritiesAws] with the provided [severities].
  void updateHazardSeveritiesAws(
    final List<HazardSeverityWithCount> severities,
  ) {
    updateFilters(
      state.filters.copyWith(
        severityFiltersAws: severities,
      ),
    );
  }

  /// Updates [HazardFiltersProviderState.selectedHazardSeveritiesAws] with the provided [selectedSeverities].
  void updateSelectedHazardSeveritiesAws(
    final List<HazardSeverityWithCount> selectedSeverities,
  ) {
    updateSelectedFilters(
      state.selectedFilters.copyWith(
        severityFiltersAws: selectedSeverities,
      ),
    );
  }

  /// Adds a [HazardSeverityWithCount] to the list of selected AWS severities.
  void addToSelectedHazardSeveritiesAws(
    final HazardSeverityWithCount severity,
  ) {
    updateSelectedHazardSeveritiesAws([
      ...state.selectedFilters.severityFiltersAws,
      severity,
    ]);
  }

  /// Removes a [HazardSeverityWithCount] from the list of selected AWS severities.
  void removeFromSelectedHazardSeveritiesAws(
    final HazardSeverityWithCount severity,
  ) {
    updateSelectedHazardSeveritiesAws(
      state.selectedFilters.severityFiltersAws
          .where((element) => element.severity != severity.severity)
          .toList(),
    );
  }

  /// Toggles the selection state of a [HazardSeverityWithCount] for AWS severities.
  void toggleSelectedHazardSeverityAws(final HazardSeverityWithCount severity) {
    final isSelected = state.selectedFilters.severityFiltersAws.any(
      (selectedSeverity) => selectedSeverity.severity == severity.severity,
    );
    if (isSelected) {
      removeFromSelectedHazardSeveritiesAws(severity);
    } else {
      addToSelectedHazardSeveritiesAws(severity);
    }
  }

  /// Updates [HazardFiltersProviderState.hazardSeveritiesNonAws] with the provided [severities].
  void updateHazardSeveritiesNonAws(
    final List<HazardSeverityWithCount> severities,
  ) {
    updateFilters(
      state.filters.copyWith(
        severityFiltersNonAws: severities,
      ),
    );
  }

  /// Updates [HazardFiltersProviderState.selectedHazardSeveritiesNonAws] with the provided [selectedSeverities].
  void updateSelectedHazardSeveritiesNonAws(
    final List<HazardSeverityWithCount> selectedSeverities,
  ) {
    updateSelectedFilters(
      state.selectedFilters.copyWith(
        severityFiltersNonAws: selectedSeverities,
      ),
    );
  }

  /// Adds a [HazardSeverityWithCount] to the list of selected Non-AWS severities.
  void addToSelectedHazardSeveritiesNonAws(
    final HazardSeverityWithCount severity,
  ) {
    updateSelectedHazardSeveritiesNonAws([
      ...state.selectedFilters.severityFiltersNonAws,
      severity,
    ]);
  }

  /// Removes a [HazardSeverityWithCount] from the list of selected Non-AWS severities.
  void removeFromSelectedHazardSeveritiesNonAws(
    final HazardSeverityWithCount severity,
  ) {
    updateSelectedHazardSeveritiesNonAws(
      state.selectedFilters.severityFiltersNonAws
          .where((element) => element.severity != severity.severity)
          .toList(),
    );
  }

  /// Toggles the selection state of a [HazardSeverityWithCount] for Non-AWS severities.
  void toggleSelectedHazardSeverityNonAws(
    final HazardSeverityWithCount severity,
  ) {
    final isSelected = state.selectedFilters.severityFiltersNonAws.any(
      (selectedSeverity) => selectedSeverity.severity == severity.severity,
    );
    if (isSelected) {
      removeFromSelectedHazardSeveritiesNonAws(severity);
    } else {
      addToSelectedHazardSeveritiesNonAws(severity);
    }
  }

  /// Resets the [GetAllHazardCategoriesState] to its initial state.
  void updateGetAllHazardCategoriesStateToInitial() {
    state = state.copyWith(
      getAllHazardCategoriesState: const GetAllHazardCategoriesState.initial(),
    );
    updateCategoryFilters([]);
  }
}
