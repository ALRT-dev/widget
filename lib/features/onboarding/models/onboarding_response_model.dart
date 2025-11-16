import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/onboarding/enums/onboarding_step_types.dart';

part 'onboarding_response_model.freezed.dart';
part 'onboarding_response_model.g.dart';

@freezed
abstract class OnboardingResponse with _$OnboardingResponse {
  const factory OnboardingResponse({
    required final OnboardingStep nextOnboardingStep,
  }) = _OnboardingResponse;

  factory OnboardingResponse.fromJson(Map<String, dynamic> json) =>
      _$OnboardingResponseFromJson(json);
}
