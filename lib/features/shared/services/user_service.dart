import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/api/interceptors/auth_interceptor.dart';
import 'package:hazard_app/features/shared/models/app_user_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/location_subscription_model.dart';
import 'package:hazard_app/features/shared/providers/dio_instance_provider.dart';
import 'package:hazard_app/features/shared/providers/repository_providers.dart';
import 'package:hazard_app/features/shared/repositories/shared_prefs_repository.dart';
import 'package:hazard_app/features/shared/repositories/user_repository.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

class UserService {
  const UserService(final Ref ref) : _ref = ref;

  final Ref _ref;
  UserRepository get _userRepository => _ref.read(providerOfUserRepository);
  Dio get _dio => _ref.read(providerOfDioInstance(false));
  SharedPreferencesRepository get _sharedPrefRepository =>
      _ref.read(providerOfSharedPreferencesRepository);

  /// Fetches the current logged-in user.
  Future<Either<AppUser, AppError>> getCurrentUser() async {
    final accessToken = await AuthInterceptor(
      dio: _dio,
      sharedPreferencesRepository: _sharedPrefRepository,
    ).getAccessToken();

    if (accessToken == null) {
      return Failure(
        AppError(message: 'No access token found'),
      );
    }

    log('Access Token :: $accessToken');

    return _userRepository.getCurrentUser();
  }

  /// Subscribes the current user to location.
  Future<Either<LocationSubscription, AppError>> subscribeToLocation({
    required double northeastLat,
    required double northeastLng,
    required double southwestLat,
    required double southwestLng,
    String? name,
    String? address,
  }) {
    return _userRepository.subscribeToLocation(
      northeastLat: northeastLat,
      northeastLng: northeastLng,
      southwestLat: southwestLat,
      southwestLng: southwestLng,
      name: name,
      address: address,
    );
  }

  /// Unsubscribes the current user from location.
  Future<Either<void, AppError>> unsubscribeFromLocation({
    required String subscriptionId,
  }) {
    return _userRepository.unsubscribeFromLocation(
      subscriptionId: subscriptionId,
    );
  }
}
