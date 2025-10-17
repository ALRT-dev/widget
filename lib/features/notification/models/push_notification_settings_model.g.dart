// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PushNotificationSettings _$PushNotificationSettingsFromJson(
  Map<String, dynamic> json,
) => _PushNotificationSettings(
  severity: json['severity'] == null
      ? const PushNotificationSettingsBySeverity()
      : PushNotificationSettingsBySeverity.fromJson(
          json['severity'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PushNotificationSettingsToJson(
  _PushNotificationSettings instance,
) => <String, dynamic>{'severity': instance.severity.toJson()};

_PushNotificationSettingsBySeverity
_$PushNotificationSettingsBySeverityFromJson(Map<String, dynamic> json) =>
    _PushNotificationSettingsBySeverity(
      info: json['info'] as bool? ?? true,
      advice: json['advice'] as bool? ?? true,
      watchAndAct: json['watchAndAct'] as bool? ?? true,
      emergency: json['emergency'] as bool? ?? true,
    );

Map<String, dynamic> _$PushNotificationSettingsBySeverityToJson(
  _PushNotificationSettingsBySeverity instance,
) => <String, dynamic>{
  'info': instance.info,
  'advice': instance.advice,
  'watchAndAct': instance.watchAndAct,
  'emergency': instance.emergency,
};
