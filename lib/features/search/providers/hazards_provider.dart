import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/search/providers/states/hazards_provider_state.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/utils/dummy_data.dart';

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
  }) : super(state) {
    _onInit();
  }

  void _onInit() async {
    await Future.delayed(const Duration(milliseconds: 500));
    // sort by createdAt descending
    kDummyHazards.sort((a, b) {
      final aDate = a.createdAt ?? DateTime.now();
      final bDate = b.createdAt ?? DateTime.now();
      return bDate.compareTo(aDate);
    });
    updateHazards(kDummyHazards);
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

  /// Updates [[HazardsProviderState.tempSearchParams] with the given [searchString].
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

  /// Updates [HazardsProviderState.hazards] with the given [hazards].
  void updateHazards(final List<Hazard> hazards) {
    state = state.copyWith(
      hazards: hazards,
    );
  }
}
