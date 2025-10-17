import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/notification/providers/notifications_feed_provider.dart';
import 'package:hazard_app/features/profile/providers/states/my_location_subscriptions_provider_state.dart';
import 'package:hazard_app/features/shared/models/location_subscription_model.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/user_service.dart';
import 'package:uuid/uuid.dart';

final providerOfMyLocationSubscriptions =
    StateNotifierProvider.autoDispose<
      MyLocationSubscriptionsProvider,
      MyLocationSubscriptionsProviderState
    >(
      (ref) => MyLocationSubscriptionsProvider(
        ref: ref,
        state: MyLocationSubscriptionsProviderState(),
      ),
    );

class MyLocationSubscriptionsProvider
    extends StateNotifier<MyLocationSubscriptionsProviderState> {
  MyLocationSubscriptionsProvider({
    required final Ref ref,
    required final MyLocationSubscriptionsProviderState state,
  }) : _ref = ref,
       super(state) {
    getLocationSubscriptions();
  }

  final Ref _ref;
  UserService get _userService => _ref.read(providerOfUserService);
  NotificationsFeedProvider get _notificationsFeedProvider =>
      _ref.read(providerOfNotificationsFeed.notifier);

  /// Fetches the location subscriptions for the current user.
  Future<void> getLocationSubscriptions() async {
    state = state.copyWith(
      getLocationSubscriptionsState:
          const GetLocationSubscriptionsState.loading(),
    );

    final result = await _userService.getLocationSubscriptions();
    if (!mounted) return;

    result.when(
      (subscriptions) {
        state = state.copyWith(
          locationSubscriptions: subscriptions,
          getLocationSubscriptionsState: GetLocationSubscriptionsState.success(
            subscriptions,
          ),
        );
      },
      (error) {
        state = state.copyWith(
          getLocationSubscriptionsState: GetLocationSubscriptionsState.error(
            error,
          ),
        );
      },
    );
  }

  /// Subscribes to the given [location].
  Future<void> subscribeToLocation({
    required final AlrtLocation location,
  }) async {
    final locationSubscription = LocationSubscription(
      northeastLat: location.bounds!.northeastLat,
      northeastLng: location.bounds!.northeastLng,
      southwestLat: location.bounds!.southwestLat,
      southwestLng: location.bounds!.southwestLng,
      name: location.name,
      address: location.address,
    );

    final subscribeToLocationStateWrapper = SubscribeToLocationStateWrapper(
      id: Uuid().v1(),
      locationSubscription: locationSubscription,
      subscribeToLocationState: const SubscribeToLocationState.loading(),
    );
    state = state.copyWith(
      subscribeToLocationStateWrappers: [
        ...state.subscribeToLocationStateWrappers,
        subscribeToLocationStateWrapper,
      ],
    );

    final result = await _userService.subscribeToLocation(
      northeastLat: location.bounds!.northeastLat,
      northeastLng: location.bounds!.northeastLng,
      southwestLat: location.bounds!.southwestLat,
      southwestLng: location.bounds!.southwestLng,
      name: location.name,
      address: location.address,
    );
    if (!mounted) return;

    result.when(
      (subscription) {
        state = state.copyWith(
          subscribeToLocationStateWrappers: state
              .subscribeToLocationStateWrappers
              .map((wrapper) {
                if (wrapper.id == subscribeToLocationStateWrapper.id) {
                  return wrapper.copyWith(
                    locationSubscription: subscription,
                    subscribeToLocationState:
                        SubscribeToLocationState.success(),
                  );
                }
                return wrapper;
              })
              .toList(),
        );

        addLocationSubscription(locationSubscription);

        // after subscribing to a location, refresh the notifications feed
        _notificationsFeedProvider.getNotificationsFeed();
      },
      (error) {
        state = state.copyWith(
          subscribeToLocationStateWrappers: state
              .subscribeToLocationStateWrappers
              .map((wrapper) {
                if (wrapper.id == subscribeToLocationStateWrapper.id) {
                  return wrapper.copyWith(
                    subscribeToLocationState: SubscribeToLocationState.error(
                      error,
                    ),
                  );
                }
                return wrapper;
              })
              .toList(),
        );
      },
    );
  }

  /// Unsubscribes from the subscription with the given [subscriptionId].
  Future<void> unsubscribeFromLocation({
    required final String subscriptionId,
  }) async {
    final unsubscribeFromLocationStateWrapper =
        UnsubscribeFromLocationStateWrapper(
          id: Uuid().v1(),
          subscriptionId: subscriptionId,
          unsubscribeFromLocationState:
              const UnsubscribeFromLocationState.loading(),
        );
    state = state.copyWith(
      unsubscribeFromLocationStateWrappers: [
        ...state.unsubscribeFromLocationStateWrappers,
        unsubscribeFromLocationStateWrapper,
      ],
    );

    final result = await _userService.unsubscribeFromLocation(
      subscriptionId: subscriptionId,
    );
    if (!mounted) return;

    result.when(
      (_) {
        state = state.copyWith(
          unsubscribeFromLocationStateWrappers: state
              .unsubscribeFromLocationStateWrappers
              .map((wrapper) {
                if (wrapper.id == unsubscribeFromLocationStateWrapper.id) {
                  return wrapper.copyWith(
                    unsubscribeFromLocationState:
                        const UnsubscribeFromLocationState.success(),
                  );
                }
                return wrapper;
              })
              .toList(),
        );

        removeLocationSubscription(subscriptionId);

        // after unsubscribing from a location, refresh the notifications feed
        _notificationsFeedProvider.getNotificationsFeed();
      },
      (error) {
        state = state.copyWith(
          unsubscribeFromLocationStateWrappers: state
              .unsubscribeFromLocationStateWrappers
              .map((wrapper) {
                if (wrapper.id == unsubscribeFromLocationStateWrapper.id) {
                  return wrapper.copyWith(
                    unsubscribeFromLocationState:
                        UnsubscribeFromLocationState.error(error),
                  );
                }
                return wrapper;
              })
              .toList(),
        );
      },
    );
  }

  /// Updates [MyLocationSubscriptionsProviderState.locationSubscriptions]  with the given [locationSubscriptions].
  void updateLocationSubscriptions({
    required final List<LocationSubscription> locationSubscriptions,
  }) {
    state = state.copyWith(
      locationSubscriptions: locationSubscriptions,
    );
  }

  /// Adds the given [locationSubscription] to [MyLocationSubscriptionsProviderState.locationSubscriptions].
  void addLocationSubscription(
    final LocationSubscription locationSubscription,
  ) {
    final updatedLocationSubscriptions = [
      locationSubscription,
      ...state.locationSubscriptions,
    ];

    // sort isOwnLocation subscriptions first
    updatedLocationSubscriptions.sort(
      (a, b) {
        if (a.isOwnLocation && !b.isOwnLocation) {
          return -1;
        } else if (!a.isOwnLocation && b.isOwnLocation) {
          return 1;
        } else {
          return 0;
        }
      },
    );

    updateLocationSubscriptions(
      locationSubscriptions: updatedLocationSubscriptions,
    );
  }

  /// Removes the location subscription with the given [subscriptionId] from [MyLocationSubscriptionsProviderState.locationSubscriptions].
  void removeLocationSubscription(final String subscriptionId) {
    updateLocationSubscriptions(
      locationSubscriptions: state.locationSubscriptions
          .where((subscription) => subscription.id != subscriptionId)
          .toList(),
    );
  }
}
