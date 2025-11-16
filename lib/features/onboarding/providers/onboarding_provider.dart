import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/onboarding/enums/push_notification_preference_types.dart';
import 'package:hazard_app/features/onboarding/providers/service_providers.dart';
import 'package:hazard_app/features/onboarding/providers/states/onboarding_provider_state.dart';
import 'package:hazard_app/features/onboarding/services/onboarding_service.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

final providerOfOnboarding =
    StateNotifierProvider.autoDispose<
      OnboardingProvider,
      OnboardingProviderState
    >(
      (ref) => OnboardingProvider(
        ref: ref,
        initialState: OnboardingProviderState(),
      ),
    );

class OnboardingProvider extends StateNotifier<OnboardingProviderState> {
  OnboardingProvider({
    required final Ref ref,
    required final OnboardingProviderState initialState,
  }) : _ref = ref,
       super(initialState);

  final Ref _ref;
  LocationProvider get _locationProvider =>
      _ref.read(providerOfLocation.notifier);
  OnboardingService get _onboardingService =>
      _ref.read(providerOfOnboardingService);

  /// Gets the user's current location.
  Future<void> getUserLocation() {
    return _locationProvider.getLocation();
  }

  /// Sets the user's location during onboarding.
  Future<Either<void, AppError>> setOnboardingLocation() async {
    state = state.copyWith(
      continueOnboarding: const ContinueOnboarding.loading(),
    );

    final latitude = _locationProvider.state.location.latitude;
    final longitude = _locationProvider.state.location.longitude;
    final address = _locationProvider.state.location.address;

    final result = await _onboardingService.setOnboardingLocation(
      latitude: latitude,
      longitude: longitude,
      locationName: address,
    );

    if (mounted) {
      result.when(
        (onboardingResponse) {
          state = state.copyWith(
            continueOnboarding: ContinueOnboarding.success(),
          );
        },
        (error) {
          state = state.copyWith(
            continueOnboarding: ContinueOnboarding.error(error),
          );
        },
      );
    }

    return result;
  }

  /// Sets the user's notification radius during onboarding.
  Future<Either<void, AppError>> setOnboardingRadius() async {
    if (state.selectedRadius == null) {
      return Failure(AppError(message: 'No radius selected'));
    }

    state = state.copyWith(
      continueOnboarding: const ContinueOnboarding.loading(),
    );

    final result = await _onboardingService.setOnboardingRadius(
      radiusInKm: state.selectedRadius!.toDouble(),
    );

    if (mounted) {
      result.when(
        (onboardingResponse) {
          state = state.copyWith(
            continueOnboarding: ContinueOnboarding.success(),
          );
        },
        (error) {
          state = state.copyWith(
            continueOnboarding: ContinueOnboarding.error(error),
          );
        },
      );
    }

    return result;
  }

  /// Sets the user's notification preferences during onboarding.
  Future<Either<void, AppError>> setOnboardingNotificationPreferences() async {
    if (state.selectedNotificationPreference == null) {
      return Failure(
        AppError(message: 'No notification preference selected'),
      );
    }

    state = state.copyWith(
      continueOnboarding: const ContinueOnboarding.loading(),
    );

    final result = await _onboardingService
        .setOnboardingNotificationPreferences(
          pushNotificationPreference: state.selectedNotificationPreference!,
        );
    if (mounted) {
      result.when(
        (onboardingResponse) {
          state = state.copyWith(
            continueOnboarding: ContinueOnboarding.success(),
          );
        },
        (error) {
          state = state.copyWith(
            continueOnboarding: ContinueOnboarding.error(error),
          );
        },
      );
    }

    return result;
  }

  /// Accepts the terms of service during onboarding.
  Future<Either<void, AppError>> acceptOnboardingTermsOfService() async {
    state = state.copyWith(
      continueOnboarding: const ContinueOnboarding.loading(),
    );

    final result = await _onboardingService.acceptOnboardingTermsOfService();

    if (mounted) {
      result.when(
        (onboardingResponse) {
          state = state.copyWith(
            continueOnboarding: ContinueOnboarding.success(),
          );
        },
        (error) {
          state = state.copyWith(
            continueOnboarding: ContinueOnboarding.error(error),
          );
        },
      );
    }

    return result;
  }

  /// Updates [OnboardingProviderState.selectedRadius] with the given [radius].
  void updateSelectedRadius(final int radius) {
    state = state.copyWith(selectedRadius: radius);
  }

  /// Updates [OnboardingProviderState.selectedNotificationPreference] with the given [preference].
  void updateSelectedNotificationPreference(
    final PushNotificationPreference preference,
  ) {
    state = state.copyWith(selectedNotificationPreference: preference);
  }
}
