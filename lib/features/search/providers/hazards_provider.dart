import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/search/providers/states/hazards_provider_state.dart';

final providerOfHazards =
    NotifierProvider.autoDispose<HazardsProvider, HazardsProviderState>(
  HazardsProvider.new,
);

class HazardsProvider extends Notifier<HazardsProviderState> {
  @override
  build() {
    return HazardsProviderState();
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
}
