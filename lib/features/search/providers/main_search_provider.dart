import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/notification/providers/notifications_feed_provider.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/search/providers/states/main_search_provider_state.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_categories_provider.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/hazard_service.dart';
import 'package:hazard_app/features/shared/services/user_service.dart';

final providerOfMainSearch =
    StateNotifierProvider.autoDispose<
      MainSearchProvider,
      MainSearchProviderState
    >(
      (ref) => MainSearchProvider(
        ref: ref,
        state: MainSearchProviderState(),
      ),
    );

class MainSearchProvider extends StateNotifier<MainSearchProviderState> {
  MainSearchProvider({
    required final Ref ref,
    required final MainSearchProviderState state,
  }) : _ref = ref,
       super(state);

  final Ref _ref;
  HazardService get _hazardService => _ref.read(providerOfHazardService);
  UserService get _userService => _ref.read(providerOfUserService);
  HazardCategoriesProvider get _hazardCategoriesProvider =>
      _ref.read(providerOfHazardCategoriesForSearch.notifier);
  NotificationsFeedProvider get _notificationsFeedProvider =>
      _ref.read(providerOfNotificationsFeed.notifier);

  /// Fetches hazards for the given location and updates the state accordingly.
  Future<void> getHazards() async {
    final location = state.searchedLocation;
    if (location == null) return;

    state = state.copyWith(
      getHazardsByLocationState: const GetHazardsByLocationState.loading(),
    );

    final result = await _hazardService.getGetHazardsWithCategories(
      searchParams: HazardSearchParams(
        latitude: location.latitude,
        longitude: location.longitude,
        northeastLat: location.bounds?.northeastLat,
        northeastLng: location.bounds?.northeastLng,
        southwestLat: location.bounds?.southwestLat,
        southwestLng: location.bounds?.southwestLng,
        categoryIds: state.selectedCategories.map((e) => e.id).toList(),
      ),
    );
    if (!mounted) return;

    result.when(
      (hazardsWithCategories) {
        state = state.copyWith(
          getHazardsByLocationState: GetHazardsByLocationState.success(
            hazardsWithCategories.hazards,
          ),
        );
        updateHazards(hazardsWithCategories.hazards);

        // add categories to the hazard categories provider
        _hazardCategoriesProvider.updateHazardCategories(
          hazardsWithCategories.categories,
        );

        // update subscriptionId if there's an active subscription for this location
        updateSubscriptionId(hazardsWithCategories.subscriptionId);
      },
      (error) {
        state = state.copyWith(
          getHazardsByLocationState: GetHazardsByLocationState.error(error),
        );
      },
    );
  }

  /// Subscribes to the current [MainSearchProviderState.searchedLocation].
  Future<void> subscribeToLocation() async {
    final location = state.searchedLocation;
    if (location == null) return;

    state = state.copyWith(
      subscribeToLocationState: const SubscribeToLocationState.loading(),
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
        updateSubscriptionId(subscription.id);
        state = state.copyWith(
          subscribeToLocationState: SubscribeToLocationState.success(
            subscription,
          ),
        );

        // after subscribing to a location, refresh the notifications feed
        _notificationsFeedProvider.getNotificationsFeed();
      },
      (error) {
        state = state.copyWith(
          subscribeToLocationState: SubscribeToLocationState.error(error),
        );
      },
    );
  }

  /// Unsubscribes from the subscription with the given [subscriptionId].
  Future<void> unsubscribeFromLocation({
    required final String subscriptionId,
  }) async {
    final location = state.searchedLocation;
    if (location == null) return;

    state = state.copyWith(
      unsubscribeFromLocationState:
          const UnsubscribeFromLocationState.loading(),
    );

    final result = await _userService.unsubscribeFromLocation(
      subscriptionId: subscriptionId,
    );
    if (!mounted) return;

    result.when(
      (_) {
        updateSubscriptionId(null);
        state = state.copyWith(
          unsubscribeFromLocationState: UnsubscribeFromLocationState.success(),
        );

        // after unsubscribing from a location, refresh the notifications feed
        _notificationsFeedProvider.getNotificationsFeed();
      },
      (error) {
        state = state.copyWith(
          unsubscribeFromLocationState: UnsubscribeFromLocationState.error(
            error,
          ),
        );
      },
    );
  }

  /// Toggles the subscription state.
  Future<void> toggleSubscription() async {
    final subscriptionId = state.subscriptionId;
    if (subscriptionId == null) {
      return subscribeToLocation();
    } else {
      return unsubscribeFromLocation(
        subscriptionId: subscriptionId,
      );
    }
  }

  /// Updates [MainSearchProviderState.searchedLocation] with the given [location].
  void updateSearchedLocation(final AlrtLocation? location) {
    state = state.copyWith(
      searchedLocation: location,
    );

    // every time the searched location is updated, reset the subscriptionId
    updateSubscriptionId(null);
  }

  /// Updates [MainSearchProviderState.selectedCategories] with the given [categories].
  void updateSelectedCategories(final List<HazardCategory> categories) {
    state = state.copyWith(
      selectedCategories: categories,
    );
  }

  /// Updates [MainSearchProviderState.hazards] with the given [hazards].
  void updateHazards(List<Hazard> hazards) {
    state = state.copyWith(
      hazards: hazards,
    );
  }

  /// Updates [MainSearchProviderState.getHazardsByLocationState] to its initial state.
  void updateGetHazardsByLocationStateToInitial() {
    state = state.copyWith(
      getHazardsByLocationState: const GetHazardsByLocationState.initial(),
    );
    updateHazards([]);
  }

  /// Updates [MainSearchProviderState.subscriptionId] with the given [subscriptionId].
  void updateSubscriptionId(final String? subscriptionId) {
    state = state.copyWith(
      subscriptionId: subscriptionId,
    );
  }
}
