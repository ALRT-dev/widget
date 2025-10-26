import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/map/views/screens/map_screen.dart';
import 'package:hazard_app/features/notification/views/widgets/notifications_appbar.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_search_appbar.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/models/hazard_severity_with_count_model.dart';
import 'package:hazard_app/features/shared/providers/states/hazard_severity_filters_provider_state.dart';

final providerOfHazardSeverityFiltersForMap = providerOfHazardSeverityFilters(
  MapScreen.severityFiltersKey,
);

final providerOfHazardSeverityFiltersForSearch =
    providerOfHazardSeverityFilters(HazardSearchAppBar.categoriesKey);

final providerOfHazardSeverityFiltersForNotifications =
    providerOfHazardSeverityFilters(NotificationsAppBar.severityFiltersKey);

final providerOfHazardSeverityFilters = StateNotifierProvider.autoDispose
    .family<
      HazardSeverityFiltersProvider,
      HazardSeverityFiltersProviderState,
      String
    >(
      (ref, id) => HazardSeverityFiltersProvider(
        ref: ref,
        state: const HazardSeverityFiltersProviderState(),
      ),
    );

class HazardSeverityFiltersProvider
    extends StateNotifier<HazardSeverityFiltersProviderState> {
  HazardSeverityFiltersProvider({
    required final Ref ref,
    required final HazardSeverityFiltersProviderState state,
  }) : _ref = ref,
       super(state);

  // ignore: unused_field
  final Ref _ref;

  /// Updates [HazardSeverityFiltersProviderState.hazardSeverities] with the provided [hazardSeverities].
  void updateHazardSeverities(
    final List<HazardSeverityWithCount> hazardSeverities,
  ) {
    state = state.copyWith(
      hazardSeverities: hazardSeverities,
    );
  }

  /// Updates a [HazardSeverityWithCount] in the list of hazard severities.
  void updateHazardSeverity(HazardSeverityWithCount updatedSeverity) {
    final index = state.hazardSeverities.indexWhere(
      (severity) => severity.severity == updatedSeverity.severity,
    );
    if (index != -1) {
      final updatedCategories = [...state.hazardSeverities];
      updatedCategories[index] = updatedSeverity;
      updateHazardSeverities(updatedCategories);
      sortHazardSeveritiesByHazardCount();
    }
  }

  /// Adds a [HazardSeverityWithCount] to the list of hazard severities.
  ///
  /// Also sorts the severities by [HazardSeverityWithCount.hazardsCount] in descending order.
  void addToHazardSeverities(final HazardSeverityWithCount severity) {
    updateHazardSeverities([...state.hazardSeverities, severity]);
    sortHazardSeveritiesByHazardCount();
  }

  /// Removes a [HazardSeverityWithCount] with severity [severity] from the list of hazard severities.
  void removeFromHazardSeverities(final HazardSeverity severity) {
    updateHazardSeverities(
      state.hazardSeverities
          .where((element) => element.severity != severity)
          .toList(),
    );
  }

  /// Sorts the hazard categories by [HazardSeverityWithCount.hazardsCount] in descending order.
  void sortHazardSeveritiesByHazardCount() {
    final sortedCategories = [...state.hazardSeverities];
    sortedCategories.sort(
      (a, b) => b.hazardsCount.compareTo(a.hazardsCount),
    );
    updateHazardSeverities(sortedCategories);
  }

  /// Updates [HazardSeverityFiltersProviderState.selectedSeverities] with the provided [selectedSeverities].
  void updateSelectedSeverities(
    final List<HazardSeverityWithCount> selectedSeverities,
  ) {
    state = state.copyWith(
      selectedSeverities: selectedSeverities,
    );
  }

  /// Adds a [HazardSeverityWithCount] to the list of selected severities.
  void addToSelectedSeverities(final HazardSeverityWithCount severity) {
    updateSelectedSeverities([...state.selectedSeverities, severity]);
  }

  /// Removes a [HazardSeverityWithCount] with severity [severity] from the list of selected severities.
  void removeFromSelectedSeverities(final HazardSeverityWithCount severity) {
    updateSelectedSeverities(
      state.selectedSeverities
          .where((element) => element.severity != severity.severity)
          .toList(),
    );
  }

  /// Toggles the selection state of a [HazardSeverity].
  void toggleSelectedSeverity(final HazardSeverityWithCount severity) {
    final isSelected = state.selectedSeverities.any(
      (selectedSeverity) => selectedSeverity.severity == severity.severity,
    );
    if (isSelected) {
      removeFromSelectedSeverities(severity);
    } else {
      addToSelectedSeverities(severity);
    }
  }

  /// Updates [HazardSeverityFiltersProviderState.isFiltersVisible] with the provided [isVisible].
  void updateFiltersVisibility(final bool isVisible) {
    state = state.copyWith(
      isFiltersVisible: isVisible,
    );
  }

  /// Toggles the visibility of the filters.
  void toggleFiltersVisibility() {
    updateFiltersVisibility(!state.isFiltersVisible);
  }
}
