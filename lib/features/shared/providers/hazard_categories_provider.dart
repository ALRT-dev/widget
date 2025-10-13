import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/notification/views/widgets/notifications_appbar.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_appbar.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/providers/states/hazard_categories_provider_state.dart';
import 'package:hazard_app/features/shared/services/hazard_service.dart';

final providerOfHazardCategoriesForSearch = providerOfHazardCategories(
  HazardSearchAppBar.categoriesKey,
);

final providerOfHazardCategoriesForNotifications = providerOfHazardCategories(
  NotificationsAppBar.categoriesKey,
);

final providerOfHazardCategories = StateNotifierProvider.autoDispose
    .family<HazardCategoriesProvider, HazardCategoriesProviderState, String>(
      (ref, id) => HazardCategoriesProvider(
        ref: ref,
        state: const HazardCategoriesProviderState(),
      ),
    );

class HazardCategoriesProvider
    extends StateNotifier<HazardCategoriesProviderState> {
  HazardCategoriesProvider({
    required final Ref ref,
    required final HazardCategoriesProviderState state,
  }) : _ref = ref,
       super(state);

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

  /// Updates [HazardCategoriesProviderState.hazardCategories] with the provided [hazardCategories].
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

  /// Updates [HazardCategoriesProviderState.selectedCategories] with the provided [selectedCategories].
  void updateSelectedCategories(final List<HazardCategory> selectedCategories) {
    state = state.copyWith(
      selectedCategories: selectedCategories,
    );
  }

  /// Adds a [HazardCategory] to the list of selected categories.
  void addToSelectedCategories(final HazardCategory category) {
    updateSelectedCategories([...state.selectedCategories, category]);
  }

  /// Removes a [HazardCategory] with id [categoryId] from the list of selected categories.
  void removeFromSelectedCategories(final String categoryId) {
    updateSelectedCategories(
      state.selectedCategories
          .where((element) => element.id != categoryId)
          .toList(),
    );
  }

  /// Toggles the selection state of a [HazardCategory].
  void toggleSelectedCategory(final HazardCategory category) {
    final isSelected = state.selectedCategories.any(
      (selectedCategory) => selectedCategory.id == category.id,
    );
    if (isSelected) {
      removeFromSelectedCategories(category.id);
    } else {
      addToSelectedCategories(category);
    }
  }

  /// Resets the [GetHazardCategoriesState] to its initial state.
  void updateGetHazardCategoriesStateToInitial() {
    state = state.copyWith(
      getHazardCategoriesState: const GetHazardCategoriesState.initial(),
    );
    updateHazardCategories([]);
  }
}
