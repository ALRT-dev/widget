// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_update_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PushNotificationUpdateInput _$PushNotificationUpdateInputFromJson(
  Map<String, dynamic> json,
) => _PushNotificationUpdateInput(
  settingType: json['settingType'] as String,
  settingKey: json['settingKey'] as String,
  isEnabled: json['isEnabled'] as bool,
);

Map<String, dynamic> _$PushNotificationUpdateInputToJson(
  _PushNotificationUpdateInput instance,
) => <String, dynamic>{
  'settingType': instance.settingType,
  'settingKey': instance.settingKey,
  'isEnabled': instance.isEnabled,
};
