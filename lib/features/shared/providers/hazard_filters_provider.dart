import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/map/views/screens/map_screen.dart';
import 'package:hazard_app/features/notification/views/widgets/notifications_appbar.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_appbar.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
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
        );
        updateHazardCategories(hazardCategories);
      },
      (error) {
        state = state.copyWith(
          getAllHazardCategoriesState: GetAllHazardCategoriesState.error(error),
        );
      },
    );
  }

  /// Updates [HazardFiltersProviderState.hazardCategories] with the provided [hazardCategories].
  void updateHazardCategories(final List<HazardCategory> hazardCategories) {
    state = state.copyWith(
      hazardCategories: hazardCategories,
    );
  }

  /// Updates a [HazardCategory] in the list of hazard categories.
  void updateHazardCategory(HazardCategory updatedCategory) {
    final index = state.hazardCategories.indexWhere(
      (category) => category.id == updatedCategory.id,
    );
    if (index != -1) {
      final updatedCategories = [...state.hazardCategories];
      updatedCategories[index] = updatedCategory;
      updateHazardCategories(updatedCategories);
      sortHazardCategoriesByHazardCount();
    }
  }

  /// Adds a [HazardCategory] to the list of hazard categories.
  ///
  /// Also sorts the categories by [HazardCategory.hazardsCount] in descending order.
  void addToHazardCategories(final HazardCategory category) {
    updateHazardCategories([...state.hazardCategories, category]);
    sortHazardCategoriesByHazardCount();
  }

  /// Removes a [HazardCategory] with id [categoryId] from the list of hazard categories.
  void removeFromHazardCategories(final String categoryId) {
    updateHazardCategories(
      state.hazardCategories
          .where((element) => element.id != categoryId)
          .toList(),
    );
  }

  /// Sorts the hazard categories by [HazardCategory.hazardsCount] in descending order.
  void sortHazardCategoriesByHazardCount() {
    final sortedCategories = [...state.hazardCategories];
    sortedCategories.sort((a, b) => b.hazardsCount.compareTo(a.hazardsCount));
    updateHazardCategories(sortedCategories);
  }

  /// Updates [HazardFiltersProviderState.selectedHazardCategories] with the provided [selectedCategories].
  void updateSelectedHazardCategories(
    final List<HazardCategory> selectedCategories,
  ) {
    state = state.copyWith(
      selectedHazardCategories: selectedCategories,
    );
  }

  /// Adds a [HazardCategory] to the list of selected categories.
  void addToSelectedHazardCategories(final HazardCategory category) {
    updateSelectedHazardCategories([
      ...state.selectedHazardCategories,
      category,
    ]);
  }

  /// Removes a [HazardCategory] with id [categoryId] from the list of selected categories.
  void removeFromSelectedHazardCategories(final String categoryId) {
    updateSelectedHazardCategories(
      state.selectedHazardCategories
          .where((element) => element.id != categoryId)
          .toList(),
    );
  }

  /// Toggles the selection state of a [HazardCategory].
  void toggleSelectedHazardCategory(final HazardCategory category) {
    final isSelected = state.selectedHazardCategories.any(
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
    state = state.copyWith(
      hazardSeveritiesAws: severities,
    );
  }

  /// Updates [HazardFiltersProviderState.selectedHazardSeveritiesAws] with the provided [selectedSeverities].
  void updateSelectedHazardSeveritiesAws(
    final List<HazardSeverityWithCount> selectedSeverities,
  ) {
    state = state.copyWith(
      selectedHazardSeveritiesAws: selectedSeverities,
    );
  }

  /// Adds a [HazardSeverityWithCount] to the list of selected AWS severities.
  void addToSelectedHazardSeveritiesAws(
    final HazardSeverityWithCount severity,
  ) {
    updateSelectedHazardSeveritiesAws([
      ...state.selectedHazardSeveritiesAws,
      severity,
    ]);
  }

  /// Removes a [HazardSeverityWithCount] from the list of selected AWS severities.
  void removeFromSelectedHazardSeveritiesAws(
    final HazardSeverityWithCount severity,
  ) {
    updateSelectedHazardSeveritiesAws(
      state.selectedHazardSeveritiesAws
          .where((element) => element.severity != severity.severity)
          .toList(),
    );
  }

  /// Toggles the selection state of a [HazardSeverityWithCount] for AWS severities.
  void toggleSelectedHazardSeverityAws(final HazardSeverityWithCount severity) {
    final isSelected = state.selectedHazardSeveritiesAws.any(
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
    state = state.copyWith(
      hazardSeveritiesNonAws: severities,
    );
  }

  /// Updates [HazardFiltersProviderState.selectedHazardSeveritiesNonAws] with the provided [selectedSeverities].
  void updateSelectedHazardSeveritiesNonAws(
    final List<HazardSeverityWithCount> selectedSeverities,
  ) {
    state = state.copyWith(
      selectedHazardSeveritiesNonAws: selectedSeverities,
    );
  }

  /// Adds a [HazardSeverityWithCount] to the list of selected Non-AWS severities.
  void addToSelectedHazardSeveritiesNonAws(
    final HazardSeverityWithCount severity,
  ) {
    updateSelectedHazardSeveritiesNonAws([
      ...state.selectedHazardSeveritiesNonAws,
      severity,
    ]);
  }

  /// Removes a [HazardSeverityWithCount] from the list of selected Non-AWS severities.
  void removeFromSelectedHazardSeveritiesNonAws(
    final HazardSeverityWithCount severity,
  ) {
    updateSelectedHazardSeveritiesNonAws(
      state.selectedHazardSeveritiesNonAws
          .where((element) => element.severity != severity.severity)
          .toList(),
    );
  }

  /// Toggles the selection state of a [HazardSeverityWithCount] for Non-AWS severities.
  void toggleSelectedHazardSeverityNonAws(
    final HazardSeverityWithCount severity,
  ) {
    final isSelected = state.selectedHazardSeveritiesNonAws.any(
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
    updateHazardCategories([]);
  }

  /// Clears all selected filters (categories and severities).
  void clearAllFilters() {
    state = state.copyWith(
      selectedHazardCategories: [],
      selectedHazardSeveritiesAws: [],
      selectedHazardSeveritiesNonAws: [],
    );
  }

  /// Clears all selected hazard categories.
  void clearSelectedHazardCategories() {
    updateSelectedHazardCategories([]);
  }

  /// Clears all selected AWS severities.
  void clearSelectedHazardSeveritiesAws() {
    updateSelectedHazardSeveritiesAws([]);
  }

  /// Clears all selected Non-AWS severities.
  void clearSelectedHazardSeveritiesNonAws() {
    updateSelectedHazardSeveritiesNonAws([]);
  }
}
