import 'package:hazard_app/api/rest_client.dart';
import 'package:hazard_app/features/shared/models/app_user_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/location_subscription_model.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

abstract class UserRepository {
  Future<Either<AppUser, AppError>> getCurrentUser();

  Future<Either<LocationSubscription, AppError>> subscribeToLocation({
    required double northeastLat,
    required double northeastLng,
    required double southwestLat,
    required double southwestLng,
    String? name,
    String? address,
  });

  Future<Either<void, AppError>> unsubscribeFromLocation({
    required String subscriptionId,
  });
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<Either<AppUser, AppError>> getCurrentUser() {
    return runAsyncCall(
      name: 'getCurrentUser',
      future: () async {
        final result = await _restClient.getCurrentUser();
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<LocationSubscription, AppError>> subscribeToLocation({
    required double northeastLat,
    required double northeastLng,
    required double southwestLat,
    required double southwestLng,
    String? name,
    String? address,
  }) {
    return runAsyncCall(
      name: 'subscribeToLocation',
      future: () async {
        final result = await _restClient.subscribeToLocation(
          northeastLat: northeastLat,
          northeastLng: northeastLng,
          southwestLat: southwestLat,
          southwestLng: southwestLng,
          name: name,
          address: address,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<void, AppError>> unsubscribeFromLocation({
    required String subscriptionId,
  }) {
    return runAsyncCall(
      name: 'unsubscribeFromLocation',
      future: () async {
        await _restClient.unsubscribeFromLocation(
          subscriptionId: subscriptionId,
        );
        return Success(null);
      },
      onError: Failure.new,
    );
  }
}
