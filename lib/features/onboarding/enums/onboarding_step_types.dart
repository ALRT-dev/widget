enum OnboardingStep {
  welcome,
  location,
  radius,
  pushNotification,
  tosAcceptance,
  completed;

  /// Returns the route associated with the onboarding step.
  String get route {
    switch (this) {
      case OnboardingStep.welcome:
        return '/onboarding/welcome';
      case OnboardingStep.location:
        return '/onboarding/location';
      case OnboardingStep.radius:
        return '/onboarding/radius';
      case OnboardingStep.pushNotification:
        return '/onboarding/alert-sources';
      case OnboardingStep.tosAcceptance:
        return '/onboarding/emergency';
      case OnboardingStep.completed:
        return '/onboarding/complete';
    }
  }
}
