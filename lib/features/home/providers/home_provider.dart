import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/home/providers/states/home_provider_state.dart';
import 'package:hazard_app/features/map/providers/service_providers.dart';
import 'package:hazard_app/features/map/services/location_service.dart';
import 'package:hazard_app/features/notification/providers/service_providers.dart';
import 'package:hazard_app/features/notification/services/notification_service.dart';
import 'package:hazard_app/features/shared/models/app_user_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/socket_service.dart';
import 'package:hazard_app/features/shared/services/user_service.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

final providerOfHome =
    StateNotifierProvider.autoDispose<HomeProvider, HomeProviderState>(
      (ref) => HomeProvider(
        ref: ref,
        state: HomeProviderState(),
      ),
    );

class HomeProvider extends StateNotifier<HomeProviderState> {
  HomeProvider({
    required final Ref ref,
    required final HomeProviderState state,
  }) : _ref = ref,
       super(state) {
    _connectSocket();
    _sendPushNotificationToken();
    _updateUserLocation();
  }

  final Ref _ref;
  NotificationService get _notificationService =>
      _ref.read(providerOfNotificationService);
  SocketService get _socketService => _ref.read(providerOfSocketService);
  UserService get _userService => _ref.read(providerOfUserService);
  LocationService get _locationService => _ref.read(providerOfLocationService);
  AppUser? get _loggedInUser => _ref.read(providerOfLoggedInUser);

  /// Connects to the socket.
  Future<void> _connectSocket() async {
    _socketService.connect();
    _ref.onDispose(
      () => _socketService.dispose(),
    );
  }

  /// Sends the push notification token to the server.
  Future<void> _sendPushNotificationToken() async {
    state = state.copyWith(
      sendPushNotificationTokenState: SendPushNotificationTokenState.loading(),
    );

    final result = await _notificationService.getFCMToken().then(
      (data) => data.when<Future<Either<String, AppError>>>(
        (fcmToken) async {
          final result = await _notificationService.sendPushNotificationToken(
            token: fcmToken,
          );
          return result.when(
            (success) => Success(fcmToken),
            (failure) => Failure(failure),
          );
        },
        (failure) async => Failure(failure),
      ),
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          sendPushNotificationTokenState:
              SendPushNotificationTokenState.success(success),
        );
      },
      (failure) {
        state = state.copyWith(
          sendPushNotificationTokenState: SendPushNotificationTokenState.error(
            failure,
          ),
        );
      },
    );
  }

  /// Gets the device location and compares it with the user's location,
  /// if the locations are different then update the user's location with the device location.
  Future<void> _updateUserLocation() async {
    state = state.copyWith(
      updateUserLocationState: UpdateUserLocationState.loading(),
    );

    // get the current location of the device
    final deviceLocationResult = await _locationService.getCurrentLocation();
    if (!mounted) return;

    final deviceLocation = deviceLocationResult.whenSuccess(
      (location) => location,
    );

    // if device location is not found then there's nothing to do
    if (deviceLocation == null) return;

    // if device location is already equals to the user's location then there's nothing to do
    if (deviceLocation.latitude.toStringAsFixed(3) ==
            _loggedInUser?.latitude?.toStringAsFixed(3) &&
        deviceLocation.longitude.toStringAsFixed(3) ==
            _loggedInUser?.longitude?.toStringAsFixed(3)) {
      log(
        "Skipping location update because the device's location and the user's location are same!",
      );
      return;
    }

    // if device location is different than the user's location then update the user's location
    final updateUserResult = await _userService.updateCurrentUser(
      user: AppUser(
        latitude: deviceLocation.latitude,
        longitude: deviceLocation.longitude,
        locationName: deviceLocation.displayName,
      ),
    );
    if (!mounted) return;

    updateUserResult.when(
      (success) {
        state = state.copyWith(
          updateUserLocationState: UpdateUserLocationState.success(success),
        );
        _ref.read(providerOfLoggedInUser.notifier).state = success;
      },
      (failure) {
        state = state.copyWith(
          updateUserLocationState: UpdateUserLocationState.error(failure),
        );
      },
    );
  }
}
