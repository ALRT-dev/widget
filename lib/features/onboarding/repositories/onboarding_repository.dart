import 'package:hazard_app/api/rest_client.dart';
import 'package:hazard_app/features/onboarding/enums/push_notification_preference_types.dart';
import 'package:hazard_app/features/onboarding/models/onboarding_response_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

abstract class OnboardingRepository {
  Future<Either<OnboardingResponse, AppError>> startOnboarding();

  Future<Either<OnboardingResponse, AppError>> setOnboardingLocation({
    required final double latitude,
    required final double longitude,
    final String? locationName,
  });

  Future<Either<OnboardingResponse, AppError>> setOnboardingRadius({
    required final double radiusInKm,
  });

  Future<Either<OnboardingResponse, AppError>>
  setOnboardingNotificationPreferences({
    required final PushNotificationPreference pushNotificationPreference,
  });

  Future<Either<OnboardingResponse, AppError>> acceptOnboardingTermsOfService();
}

class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<Either<OnboardingResponse, AppError>> startOnboarding() {
    return runAsyncCall(
      name: 'startOnboarding',
      future: () async {
        final result = await _restClient.startOnboarding();
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<OnboardingResponse, AppError>> setOnboardingLocation({
    required double latitude,
    required double longitude,
    String? locationName,
  }) {
    return runAsyncCall(
      name: 'setOnboardingLocation',
      future: () async {
        final result = await _restClient.setOnboardingLocation(
          latitude: latitude,
          longitude: longitude,
          locationName: locationName,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<OnboardingResponse, AppError>> setOnboardingRadius({
    required double radiusInKm,
  }) {
    return runAsyncCall(
      name: 'setOnboardingRadius',
      future: () async {
        final result = await _restClient.setOnboardingRadius(
          radiusInKm: radiusInKm,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<OnboardingResponse, AppError>>
  setOnboardingNotificationPreferences({
    required PushNotificationPreference pushNotificationPreference,
  }) {
    return runAsyncCall(
      name: 'setOnboardingNotificationPreferences',
      future: () async {
        final result = await _restClient.setOnboardingNotificationPreferences(
          pushNotificationPreference: pushNotificationPreference.name,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<OnboardingResponse, AppError>>
  acceptOnboardingTermsOfService() {
    return runAsyncCall(
      name: 'acceptOnboardingTermsOfService',
      future: () async {
        final result = await _restClient.acceptOnboardingTermsOfService();
        return Success(result);
      },
      onError: Failure.new,
    );
  }
}
