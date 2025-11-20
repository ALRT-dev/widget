import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/map/views/screens/map_screen.dart';
import 'package:hazard_app/features/notification/views/widgets/notifications_appbar.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_appbar.dart';
import 'package:hazard_app/features/shared/providers/main_categories_provider.dart';
import 'package:hazard_app/features/shared/providers/states/hazard_filters_provider_state.dart';
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
       super(state) {
    _onInit();
  }

  final Ref _ref;

  void _onInit() {
    // Initialize selected categories with all main categories if none are selected.
    final allMainCategories = _ref
        .read(providerOfMainCategories)
        .mainCategories;
    updateAllCategories(
      allMainCategories.map((e) => e.id).toSet(),
    );
    updateSelectedCategories(
      allMainCategories.map((e) => e.id).toSet(),
    );
    _ref.listen(
      providerOfMainCategories.select(
        (value) => value.mainCategories,
      ),
      (previous, next) {
        if (previous != next && state.selectedCategoryIds.isEmpty) {
          final allMainCategories = next;
          updateAllCategories(
            allMainCategories.map((e) => e.id).toSet(),
          );
          updateSelectedCategories(
            allMainCategories.map((e) => e.id).toSet(),
          );
        }
      },
    );
  }

  /// Updates the AWS Emergency filter state.
  void updateAwsEmergency(bool value) {
    state = state.copyWith(isAwsEmergency: value);
  }

  /// Updates the AWS Watch and Act filter state.
  void updateAwsWatchAndAct(bool value) {
    state = state.copyWith(isAwsWatchAndAct: value);
  }

  /// Updates the AWS Advice filter state.
  void updateAwsAdvice(bool value) {
    state = state.copyWith(isAwsAdvice: value);
  }

  /// Updates the Official Non-AWS filter state.
  void updateOfficialNonAws(bool value) {
    state = state.copyWith(isOfficialNonAws: value);
  }

  /// Updates the User Reported filter state.
  void updateUserReported(bool value) {
    state = state.copyWith(isUserReported: value);
  }

  /// Updates all available category IDs.
  void updateAllCategories(Set<String> categoryIds) {
    state = state.copyWith(allCategoryIds: categoryIds);
  }

  /// Updates the selected category IDs.
  void updateSelectedCategories(Set<String> categoryIds) {
    state = state.copyWith(selectedCategoryIds: categoryIds);
  }

  /// Adds a category ID to the selected categories.
  void addSelectedCategory(String categoryId) {
    final updatedSet = Set<String>.from(state.selectedCategoryIds);
    updatedSet.add(categoryId);
    updateSelectedCategories(updatedSet);
  }

  /// Removes a category ID from the selected categories.
  void removeSelectedCategory(String categoryId) {
    final updatedSet = Set<String>.from(state.selectedCategoryIds);
    updatedSet.remove(categoryId);
    updateSelectedCategories(updatedSet);
  }

  /// Toggles a category selection.
  void toggleCategory(String categoryId) {
    if (state.selectedCategoryIds.contains(categoryId)) {
      removeSelectedCategory(categoryId);
    } else {
      addSelectedCategory(categoryId);
    }
  }

  /// Clears all selected filters.
  void clearAllFilters() {
    state = const HazardFiltersProviderState();
  }
}
