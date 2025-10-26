import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/notification/providers/service_providers.dart';
import 'package:hazard_app/features/notification/providers/states/notifications_feed_provider_state.dart';
import 'package:hazard_app/features/notification/services/notification_service.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/enums/hazard_review_status_types.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/models/hazard_severity_with_count_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_categories_provider.dart';
import 'package:hazard_app/features/shared/providers/hazard_severity_filters_provider.dart';
import 'package:hazard_app/features/shared/providers/hazard_socket_manager_provider.dart';

final providerOfNotificationsFeed =
    StateNotifierProvider.autoDispose<
      NotificationsFeedProvider,
      NotificationsFeedProviderState
    >(
      (ref) => NotificationsFeedProvider(
        ref: ref,
        state: NotificationsFeedProviderState(),
      ),
    );

class NotificationsFeedProvider
    extends StateNotifier<NotificationsFeedProviderState> {
  NotificationsFeedProvider({
    required final Ref ref,
    required final NotificationsFeedProviderState state,
  }) : _ref = ref,
       super(state) {
    getNotificationsFeed();
    _listenToSocketForHazards();
  }

  final Ref _ref;

  NotificationService get _notificationService =>
      _ref.read(providerOfNotificationService);
  HazardCategoriesProvider get _hazardCategoriesProvider =>
      _ref.read(providerOfHazardCategoriesForNotifications.notifier);
  HazardSeverityFiltersProvider get _hazardSeverityFiltersProvider =>
      _ref.read(providerOfHazardSeverityFiltersForNotifications.notifier);

  /// Listens to the socket for hazard updates, new hazards, and deletions.
  void _listenToSocketForHazards() {
    final newHazardSubscription = _ref
        .read(providerOfHazardSocketManager)
        .newHazardStream
        .listen((newHazard) {
          // if search string is not empty, check if the new hazard matches the search string
          // if it does, add it to the list of hazards
          // otherwise, ignore it
          if (state.searchString.isNotEmpty) {
            final title = newHazard.title ?? '';
            final description = newHazard.description ?? '';
            if (title.toLowerCase().contains(
                  state.searchString.toLowerCase(),
                ) ||
                description.toLowerCase().contains(
                  state.searchString.toLowerCase(),
                )) {
              addToHazards(newHazard);
              if (newHazard.category != null) {
                processCategoryFromSocket(newHazard.category!);
              }
            }
          } else {
            addToHazards(newHazard);
            if (newHazard.category != null) {
              processCategoryFromSocket(newHazard.category!);
            }
          }
        });

    final updateHazardSubscription = _ref
        .read(providerOfHazardSocketManager)
        .updateHazardStream
        .listen((updatedHazard) {
          if (updatedHazard.id != null) {
            if (updatedHazard.reviewStatus != HazardReviewStatus.accepted) {
              // If the updated hazard is not accepted, remove it from the list
              removeFromHazards(updatedHazard.id!);
              if (updatedHazard.category != null) {
                removeCategoryFromSocket(updatedHazard.category!.id);
              }
            }
          }
        });

    final deleteHazardSubscription = _ref
        .read(providerOfHazardSocketManager)
        .deleteHazardStream
        .listen((hazardId) {
          final hazard = state.hazards.firstWhereOrNull(
            (hazard) => hazard.id == hazardId,
          );
          removeFromHazards(hazardId);
          if (hazard != null && hazard.category != null) {
            removeCategoryFromSocket(hazard.category!.id);
          }
        });

    // Clean up subscription when provider is disposed
    _ref.onDispose(() {
      newHazardSubscription.cancel();
      updateHazardSubscription.cancel();
      deleteHazardSubscription.cancel();
    });
  }

  /// Fetches the hazards that the user has subscribed to for notifications
  Future<void> getNotificationsFeed() async {
    state = state.copyWith(
      getNotificationsFeed: const GetNotificationsFeed.loading(),
    );

    final result = await _notificationService.getNotificationsFeed(
      searchParams: HazardSearchParams(
        searchString: state.searchString,
        categoryIds: state.selectedCategories.map((e) => e.id).toList(),
        severities: state.selectedSeverities.map((e) => e.severity).toList(),
      ),
    );
    if (!mounted) return;

    result.when(
      (hazardsWithCategories) {
        updateHazards(hazardsWithCategories.hazards);
        state = state.copyWith(
          getNotificationsFeed: GetNotificationsFeed.success(
            hazardsWithCategories.hazards,
          ),
        );

        // add categories to the hazard categories provider
        _hazardCategoriesProvider.updateHazardCategories(
          hazardsWithCategories.categoryFilters,
        );

        // add severities to the hazard severity filters provider
        _hazardSeverityFiltersProvider.updateHazardSeverities(
          hazardsWithCategories.severityFilters,
        );
      },
      (error) {
        state = state.copyWith(
          getNotificationsFeed: GetNotificationsFeed.error(error),
        );
      },
    );
  }

  /// Updates [NotificationsFeedProviderState.searchString] with the provided [searchString].
  void updateSearchString(final String searchString) {
    state = state.copyWith(
      searchString: searchString,
    );
  }

  /// Updates [NotificationsFeedProviderState.selectedCategories] with the provided [selectedCategories].
  void updateSelectedCategories(final List<HazardCategory> selectedCategories) {
    state = state.copyWith(
      selectedCategories: selectedCategories,
    );
  }

  /// Updates [NotificationsFeedProviderState.selectedSeverities] with the provided [selectedSeverities].
  void updateSelectedSeverities(
    final List<HazardSeverityWithCount> selectedSeverities,
  ) {
    state = state.copyWith(
      selectedSeverities: selectedSeverities,
    );
  }

  /// Updates [NotificationsFeedProviderState.hazards] with the provided [hazards].
  void updateHazards(final List<Hazard> hazards) {
    state = state.copyWith(
      hazards: hazards,
    );
  }

  /// Updates a hazard in the existing list of hazards in the state.
  void updateHazard(final Hazard updatedHazard) {
    final updatedHazards = state.hazards.map((hazard) {
      if (hazard.id == updatedHazard.id) {
        return updatedHazard;
      }
      return hazard;
    }).toList();
    updateHazards(updatedHazards);
  }

  /// Adds a new hazard to the existing list of hazards in the state.
  void addToHazards(final Hazard newHazard) {
    final index = state.hazards.indexWhere(
      (hazard) => hazard.id == newHazard.id,
    );
    if (index != -1) return; // hazard already exists, do not add it again
    updateHazards([newHazard, ...state.hazards]);
  }

  /// Removes a hazard from the existing list of hazards in the state.
  void removeFromHazards(final String hazardId) {
    updateHazards(
      state.hazards.where((hazard) => hazard.id != hazardId).toList(),
    );
  }

  /// Removes hazards that have expired from the existing list of hazards in the state.
  void removeExpiredHazards() {
    final updatedHazards = state.hazards
        .where((hazard) => !hazard.isExpired)
        .toList();
    updateHazards(updatedHazards);
  }

  /// Processes a [HazardCategory] received from the socket by adding or updating it in the hazard categories provider.
  void processCategoryFromSocket(final HazardCategory category) {
    final existingCategories = _ref
        .read(providerOfHazardCategoriesForNotifications)
        .hazardCategories;

    final index = existingCategories.indexWhere((c) => c.id == category.id);
    if (index == -1) {
      // category does not exist, add it
      _hazardCategoriesProvider.addToHazardCategories(
        category.copyWith(
          hazardsCount: 1,
        ),
      );
    } else {
      // category exists, update the hazards count
      final existingCategory = existingCategories[index];
      final updatedCategory = existingCategory.copyWith(
        hazardsCount: existingCategory.hazardsCount + 1,
      );
      _hazardCategoriesProvider.updateHazardCategory(updatedCategory);
    }
  }

  /// Removes a [HazardCategory] from the hazard categories provider or updates its hazards count based on the provided [categoryId].
  void removeCategoryFromSocket(final String categoryId) {
    final existingCategories = _ref
        .read(providerOfHazardCategoriesForNotifications)
        .hazardCategories;

    final index = existingCategories.indexWhere((c) => c.id == categoryId);
    if (index != -1) {
      final existingCategory = existingCategories[index];
      final updatedCount = existingCategory.hazardsCount - 1;
      if (updatedCount <= 0) {
        _hazardCategoriesProvider.removeFromHazardCategories(categoryId);
      } else {
        final updatedCategory = existingCategory.copyWith(
          hazardsCount: updatedCount,
        );
        _hazardCategoriesProvider.updateHazardCategory(updatedCategory);
      }
    }
  }

  /// Updates [NotificationsFeedProviderState.getNotificationsFeed] to loading state.
  void updateGetNotificationsFeedStateToLoading() {
    state = state.copyWith(
      getNotificationsFeed: const GetNotificationsFeed.loading(),
    );
  }
}
