import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/notification/providers/service_providers.dart';
import 'package:hazard_app/features/notification/providers/states/notifications_feed_provider_state.dart';
import 'package:hazard_app/features/notification/services/notification_service.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/enums/socket_event_types.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_categories_provider.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/socket_service.dart';

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
    _onInit();
  }

  final Ref _ref;
  NotificationService get _notificationService =>
      _ref.read(providerOfNotificationService);
  SocketService get _socketService => _ref.read(providerOfSocketService);
  HazardCategoriesProvider get _hazardCategoriesProvider =>
      _ref.read(providerOfHazardCategoriesForNotifications.notifier);

  StreamSubscription<bool>? _onSocketConnectionChangedListener;

  void _onInit() async {
    await getNotificationsFeed();
    if (!mounted) return;

    if (_socketService.isSocketConnected) {
      _listenToSocketForNewHazards();
    } else {
      _onSocketConnectionChangedListener?.cancel();
      _onSocketConnectionChangedListener = _socketService
          .onSocketConnectionChanged
          .listen(
            (isConnected) {
              if (isConnected) {
                _listenToSocketForNewHazards();
              } else {
                _socketService.socket.off(SocketEvent.newHazard.name);
              }
            },
          );
    }

    _ref.onDispose(() {
      _onSocketConnectionChangedListener?.cancel();
      _onSocketConnectionChangedListener = null;
      _socketService.socket.off(SocketEvent.newHazard.name);
    });
  }

  /// Listens to the socket for new hazards and adds them to the notifications feed.
  void _listenToSocketForNewHazards() {
    _socketService.socket.on(
      SocketEvent.newHazard.name,
      (data) {
        if (data is Map<String, dynamic>) {
          final newHazard = Hazard.fromJson(data);

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
        }
      },
    );
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
          hazardsWithCategories.categories,
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

  /// Updates [NotificationsFeedProviderState.hazards] with the provided [hazards].
  void updateHazards(final List<Hazard> hazards) {
    state = state.copyWith(
      hazards: hazards,
    );
  }

  /// Adds a new hazard to the existing list of hazards in the state.
  void addToHazards(final Hazard newHazard) {
    updateHazards([newHazard, ...state.hazards]);
  }

  /// Updates [NotificationsFeedProviderState.getNotificationsFeed] to loading state.
  void updateGetNotificationsFeedStateToLoading() {
    state = state.copyWith(
      getNotificationsFeed: const GetNotificationsFeed.loading(),
    );
  }
}
