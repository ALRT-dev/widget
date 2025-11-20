import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/notification/providers/service_providers.dart';
import 'package:hazard_app/features/notification/providers/states/notifications_feed_provider_state.dart';
import 'package:hazard_app/features/notification/services/notification_service.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/enums/hazard_review_status_types.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
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
            }
          } else {
            addToHazards(newHazard);
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
            }
          }
        });

    final deleteHazardSubscription = _ref
        .read(providerOfHazardSocketManager)
        .deleteHazardStream
        .listen((hazardId) {
          removeFromHazards(hazardId);
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

    final selectedCategoryIds = _ref
        .read(providerOfHazardFiltersForNotifications)
        .selectedCategoryIds
        .toList();
    final isAwsEmergency = _ref
        .read(providerOfHazardFiltersForMap)
        .isAwsEmergency;
    final isAwsWatchAndAct = _ref
        .read(providerOfHazardFiltersForMap)
        .isAwsWatchAndAct;
    final isAwsAdvice = _ref.read(providerOfHazardFiltersForMap).isAwsAdvice;
    final isOfficialNonAws = _ref
        .read(providerOfHazardFiltersForMap)
        .isOfficialNonAws;
    final isUserReported = _ref
        .read(providerOfHazardFiltersForMap)
        .isUserReported;

    final result = await _notificationService.getNotificationsFeedWithFilters(
      searchParams: HazardSearchParams(
        searchString: state.searchString,
        categoryIds: selectedCategoryIds,
        awsEmergency: isAwsEmergency,
        awsWatchAndAct: isAwsWatchAndAct,
        awsAdvice: isAwsAdvice,
        officialNonAws: isOfficialNonAws,
        userReported: isUserReported,
      ),
    );
    if (!mounted) return;

    result.when(
      (response) {
        state = state.copyWith(
          getNotificationsFeed: GetNotificationsFeed.success(
            response.$1,
          ),
        );
        updateHazards(response.$1);
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

  /// Updates [NotificationsFeedProviderState.getNotificationsFeed] to loading state.
  void updateGetNotificationsFeedStateToLoading() {
    state = state.copyWith(
      getNotificationsFeed: const GetNotificationsFeed.loading(),
    );
  }
}
