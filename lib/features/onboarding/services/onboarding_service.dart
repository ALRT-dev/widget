import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/onboarding/enums/push_notification_preference_types.dart';
import 'package:hazard_app/features/onboarding/models/onboarding_response_model.dart';
import 'package:hazard_app/features/onboarding/providers/repository_providers.dart';
import 'package:hazard_app/features/onboarding/repositories/onboarding_repository.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

class OnboardingService {
  const OnboardingService(final Ref ref) : _ref = ref;

  final Ref _ref;

  OnboardingRepository get _onboardingRepository =>
      _ref.read(providerOfOnboardingRepository);

  /// Starts the user onboarding process.
  Future<Either<OnboardingResponse, AppError>> startOnboarding() {
    return _onboardingRepository.startOnboarding();
  }

  /// Sets the user's location during onboarding.
  Future<Either<OnboardingResponse, AppError>> setOnboardingLocation({
    required double latitude,
    required double longitude,
    String? locationName,
  }) {
    return _onboardingRepository.setOnboardingLocation(
      latitude: latitude,
      longitude: longitude,
      locationName: locationName,
    );
  }

  /// Sets the user's notification radius during onboarding.
  Future<Either<OnboardingResponse, AppError>> setOnboardingRadius({
    required double radiusInKm,
  }) {
    return _onboardingRepository.setOnboardingRadius(
      radiusInKm: radiusInKm,
    );
  }

  /// Sets the user's notification preferences during onboarding.
  Future<Either<OnboardingResponse, AppError>>
  setOnboardingNotificationPreferences({
    required PushNotificationPreference pushNotificationPreference,
  }) {
    return _onboardingRepository.setOnboardingNotificationPreferences(
      pushNotificationPreference: pushNotificationPreference,
    );
  }

  /// Accepts the terms of service during onboarding.
  Future<Either<OnboardingResponse, AppError>>
  acceptOnboardingTermsOfService() {
    return _onboardingRepository.acceptOnboardingTermsOfService();
  }
}
