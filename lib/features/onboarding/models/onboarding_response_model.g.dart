// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnboardingResponse _$OnboardingResponseFromJson(Map<String, dynamic> json) =>
    _OnboardingResponse(
      nextOnboardingStep: $enumDecode(
        _$OnboardingStepEnumMap,
        json['nextOnboardingStep'],
      ),
    );

Map<String, dynamic> _$OnboardingResponseToJson(
  _OnboardingResponse instance,
) => <String, dynamic>{
  'nextOnboardingStep': _$OnboardingStepEnumMap[instance.nextOnboardingStep]!,
};

const _$OnboardingStepEnumMap = {
  OnboardingStep.welcome: 'welcome',
  OnboardingStep.location: 'location',
  OnboardingStep.radius: 'radius',
  OnboardingStep.pushNotification: 'pushNotification',
  OnboardingStep.tosAcceptance: 'tosAcceptance',
  OnboardingStep.completed: 'completed',
};
