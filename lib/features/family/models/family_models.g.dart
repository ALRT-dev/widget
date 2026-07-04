// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FamilyCircle _$FamilyCircleFromJson(Map<String, dynamic> json) =>
    _FamilyCircle(
      id: json['id'] as String,
      name: json['name'] as String,
      plan: json['plan'] as String? ?? 'plus',
      maxMembers: (json['maxMembers'] as num?)?.toInt() ?? 10,
      myMemberId: json['myMemberId'] as String,
      members:
          (json['members'] as List<dynamic>?)
              ?.map((e) => FamilyMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FamilyMember>[],
      places:
          (json['places'] as List<dynamic>?)
              ?.map((e) => FamilySavedPlace.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FamilySavedPlace>[],
      activeSosEvents:
          (json['activeSosEvents'] as List<dynamic>?)
              ?.map((e) => FamilySosEvent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FamilySosEvent>[],
      latestCheckInRequest: json['latestCheckInRequest'] == null
          ? null
          : FamilyCheckInRequest.fromJson(
              json['latestCheckInRequest'] as Map<String, dynamic>,
            ),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FamilyCircleToJson(
  _FamilyCircle instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'plan': instance.plan,
  'maxMembers': instance.maxMembers,
  'myMemberId': instance.myMemberId,
  'members': instance.members.map((e) => e.toJson()).toList(),
  'places': instance.places.map((e) => e.toJson()).toList(),
  'activeSosEvents': instance.activeSosEvents.map((e) => e.toJson()).toList(),
  'latestCheckInRequest': ?instance.latestCheckInRequest?.toJson(),
  'createdAt': ?instance.createdAt?.toIso8601String(),
};

_FamilyMember _$FamilyMemberFromJson(Map<String, dynamic> json) =>
    _FamilyMember(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String? ?? 'Family member',
      profilePictureUrl: json['profilePictureUrl'] as String?,
      colorHex: json['colorHex'] as String?,
      role:
          $enumDecodeNullable(
            _$FamilyRoleEnumMap,
            json['role'],
            unknownValue: FamilyRole.adult,
          ) ??
          FamilyRole.adult,
      sharingLevel:
          $enumDecodeNullable(
            _$FamilySharingLevelEnumMap,
            json['sharingLevel'],
            unknownValue: FamilySharingLevel.precise,
          ) ??
          FamilySharingLevel.precise,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      locationLabel: json['locationLabel'] as String?,
      locationUpdatedAt: json['locationUpdatedAt'] == null
          ? null
          : DateTime.parse(json['locationUpdatedAt'] as String),
      locationExpiresAt: json['locationExpiresAt'] == null
          ? null
          : DateTime.parse(json['locationExpiresAt'] as String),
      locationSharedVia: $enumDecodeNullable(
        _$FamilySnapshotSourceEnumMap,
        json['locationSharedVia'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      batteryLevel: (json['batteryLevel'] as num?)?.toInt(),
      isMoving: json['isMoving'] as bool? ?? false,
      currentPlaceId: json['currentPlaceId'] as String?,
      lastCheckInAt: json['lastCheckInAt'] == null
          ? null
          : DateTime.parse(json['lastCheckInAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FamilyMemberToJson(_FamilyMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'profilePictureUrl': ?instance.profilePictureUrl,
      'colorHex': ?instance.colorHex,
      'role': _$FamilyRoleEnumMap[instance.role]!,
      'sharingLevel': _$FamilySharingLevelEnumMap[instance.sharingLevel]!,
      'latitude': ?instance.latitude,
      'longitude': ?instance.longitude,
      'locationLabel': ?instance.locationLabel,
      'locationUpdatedAt': ?instance.locationUpdatedAt?.toIso8601String(),
      'locationExpiresAt': ?instance.locationExpiresAt?.toIso8601String(),
      'locationSharedVia':
          ?_$FamilySnapshotSourceEnumMap[instance.locationSharedVia],
      'batteryLevel': ?instance.batteryLevel,
      'isMoving': instance.isMoving,
      'currentPlaceId': ?instance.currentPlaceId,
      'lastCheckInAt': ?instance.lastCheckInAt?.toIso8601String(),
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

const _$FamilyRoleEnumMap = {
  FamilyRole.owner: 'owner',
  FamilyRole.adult: 'adult',
  FamilyRole.child: 'child',
};

const _$FamilySharingLevelEnumMap = {
  FamilySharingLevel.precise: 'precise',
  FamilySharingLevel.approximate: 'approximate',
  FamilySharingLevel.alertsOnly: 'alertsOnly',
  FamilySharingLevel.off: 'off',
};

const _$FamilySnapshotSourceEnumMap = {
  FamilySnapshotSource.checkIn: 'checkIn',
  FamilySnapshotSource.request: 'request',
  FamilySnapshotSource.sos: 'sos',
  FamilySnapshotSource.manual: 'manual',
};

_FamilyInvite _$FamilyInviteFromJson(Map<String, dynamic> json) =>
    _FamilyInvite(
      id: json['id'] as String,
      code: json['code'] as String,
      useCount: (json['useCount'] as num?)?.toInt() ?? 0,
      maxUses: (json['maxUses'] as num?)?.toInt() ?? 10,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FamilyInviteToJson(_FamilyInvite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'useCount': instance.useCount,
      'maxUses': instance.maxUses,
      'expiresAt': ?instance.expiresAt?.toIso8601String(),
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

_FamilySavedPlace _$FamilySavedPlaceFromJson(Map<String, dynamic> json) =>
    _FamilySavedPlace(
      id: json['id'] as String,
      name: json['name'] as String,
      icon:
          $enumDecodeNullable(
            _$FamilyPlaceIconEnumMap,
            json['icon'],
            unknownValue: FamilyPlaceIcon.other,
          ) ??
          FamilyPlaceIcon.other,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radiusMeters: (json['radiusMeters'] as num?)?.toInt() ?? 300,
      address: json['address'] as String?,
      notificationPrefs:
          (json['notificationPrefs'] as List<dynamic>?)
              ?.map(
                (e) => FamilyPlaceNotificationPref.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const <FamilyPlaceNotificationPref>[],
    );

Map<String, dynamic> _$FamilySavedPlaceToJson(_FamilySavedPlace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': _$FamilyPlaceIconEnumMap[instance.icon]!,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radiusMeters': instance.radiusMeters,
      'address': ?instance.address,
      'notificationPrefs': instance.notificationPrefs
          .map((e) => e.toJson())
          .toList(),
    };

const _$FamilyPlaceIconEnumMap = {
  FamilyPlaceIcon.home: 'home',
  FamilyPlaceIcon.work: 'work',
  FamilyPlaceIcon.school: 'school',
  FamilyPlaceIcon.heart: 'heart',
  FamilyPlaceIcon.other: 'other',
};

_FamilyPlaceNotificationPref _$FamilyPlaceNotificationPrefFromJson(
  Map<String, dynamic> json,
) => _FamilyPlaceNotificationPref(
  placeId: json['placeId'] as String,
  subjectMemberId: json['subjectMemberId'] as String,
  notifyArrivals: json['notifyArrivals'] as bool? ?? true,
  notifyDepartures: json['notifyDepartures'] as bool? ?? true,
);

Map<String, dynamic> _$FamilyPlaceNotificationPrefToJson(
  _FamilyPlaceNotificationPref instance,
) => <String, dynamic>{
  'placeId': instance.placeId,
  'subjectMemberId': instance.subjectMemberId,
  'notifyArrivals': instance.notifyArrivals,
  'notifyDepartures': instance.notifyDepartures,
};

_FamilyMemberSnippet _$FamilyMemberSnippetFromJson(Map<String, dynamic> json) =>
    _FamilyMemberSnippet(
      id: json['id'] as String,
      nickname: json['nickname'] as String?,
      user: json['user'] == null
          ? null
          : FamilyMemberUserSnippet.fromJson(
              json['user'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FamilyMemberSnippetToJson(
  _FamilyMemberSnippet instance,
) => <String, dynamic>{
  'id': instance.id,
  'nickname': ?instance.nickname,
  'user': ?instance.user?.toJson(),
};

_FamilyMemberUserSnippet _$FamilyMemberUserSnippetFromJson(
  Map<String, dynamic> json,
) => _FamilyMemberUserSnippet(
  id: json['id'] as String,
  name: json['name'] as String?,
  profilePictureUrl: json['profilePictureUrl'] as String?,
);

Map<String, dynamic> _$FamilyMemberUserSnippetToJson(
  _FamilyMemberUserSnippet instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': ?instance.name,
  'profilePictureUrl': ?instance.profilePictureUrl,
};

_FamilyCheckIn _$FamilyCheckInFromJson(Map<String, dynamic> json) =>
    _FamilyCheckIn(
      id: json['id'] as String,
      circleId: json['circleId'] as String,
      memberId: json['memberId'] as String,
      status:
          $enumDecodeNullable(
            _$FamilyCheckInStatusEnumMap,
            json['status'],
            unknownValue: FamilyCheckInStatus.safe,
          ) ??
          FamilyCheckInStatus.safe,
      message: json['message'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      requestId: json['requestId'] as String?,
      hazardId: json['hazardId'] as String?,
      member: json['member'] == null
          ? null
          : FamilyMemberSnippet.fromJson(
              json['member'] as Map<String, dynamic>,
            ),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FamilyCheckInToJson(_FamilyCheckIn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'circleId': instance.circleId,
      'memberId': instance.memberId,
      'status': _$FamilyCheckInStatusEnumMap[instance.status]!,
      'message': ?instance.message,
      'latitude': ?instance.latitude,
      'longitude': ?instance.longitude,
      'requestId': ?instance.requestId,
      'hazardId': ?instance.hazardId,
      'member': ?instance.member?.toJson(),
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

const _$FamilyCheckInStatusEnumMap = {
  FamilyCheckInStatus.safe: 'safe',
  FamilyCheckInStatus.needsHelp: 'needsHelp',
};

_FamilyCheckInRequest _$FamilyCheckInRequestFromJson(
  Map<String, dynamic> json,
) => _FamilyCheckInRequest(
  id: json['id'] as String,
  circleId: json['circleId'] as String,
  requestedById: json['requestedById'] as String,
  hazardId: json['hazardId'] as String?,
  message: json['message'] as String?,
  requestedBy: json['requestedBy'] == null
      ? null
      : FamilyMemberSnippet.fromJson(
          json['requestedBy'] as Map<String, dynamic>,
        ),
  checkIns:
      (json['checkIns'] as List<dynamic>?)
          ?.map((e) => FamilyCheckIn.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FamilyCheckIn>[],
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$FamilyCheckInRequestToJson(
  _FamilyCheckInRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'circleId': instance.circleId,
  'requestedById': instance.requestedById,
  'hazardId': ?instance.hazardId,
  'message': ?instance.message,
  'requestedBy': ?instance.requestedBy?.toJson(),
  'checkIns': instance.checkIns.map((e) => e.toJson()).toList(),
  'createdAt': ?instance.createdAt?.toIso8601String(),
};

_FamilySosEvent _$FamilySosEventFromJson(
  Map<String, dynamic> json,
) => _FamilySosEvent(
  id: json['id'] as String,
  circleId: json['circleId'] as String,
  memberId: json['memberId'] as String,
  status:
      $enumDecodeNullable(
        _$FamilySosStatusEnumMap,
        json['status'],
        unknownValue: FamilySosStatus.active,
      ) ??
      FamilySosStatus.active,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  locationLabel: json['locationLabel'] as String?,
  member: json['member'] == null
      ? null
      : FamilyMemberSnippet.fromJson(json['member'] as Map<String, dynamic>),
  responses:
      (json['responses'] as List<dynamic>?)
          ?.map((e) => FamilySosResponse.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FamilySosResponse>[],
  resolvedAt: json['resolvedAt'] == null
      ? null
      : DateTime.parse(json['resolvedAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$FamilySosEventToJson(_FamilySosEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'circleId': instance.circleId,
      'memberId': instance.memberId,
      'status': _$FamilySosStatusEnumMap[instance.status]!,
      'latitude': ?instance.latitude,
      'longitude': ?instance.longitude,
      'locationLabel': ?instance.locationLabel,
      'member': ?instance.member?.toJson(),
      'responses': instance.responses.map((e) => e.toJson()).toList(),
      'resolvedAt': ?instance.resolvedAt?.toIso8601String(),
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

const _$FamilySosStatusEnumMap = {
  FamilySosStatus.active: 'active',
  FamilySosStatus.resolved: 'resolved',
  FamilySosStatus.cancelled: 'cancelled',
};

_FamilyLocationRequest _$FamilyLocationRequestFromJson(
  Map<String, dynamic> json,
) => _FamilyLocationRequest(
  id: json['id'] as String,
  circleId: json['circleId'] as String,
  requesterId: json['requesterId'] as String,
  targetMemberId: json['targetMemberId'] as String,
  status:
      $enumDecodeNullable(
        _$FamilyLocationRequestStatusEnumMap,
        json['status'],
        unknownValue: FamilyLocationRequestStatus.pending,
      ) ??
      FamilyLocationRequestStatus.pending,
  message: json['message'] as String?,
  requester: json['requester'] == null
      ? null
      : FamilyMemberSnippet.fromJson(json['requester'] as Map<String, dynamic>),
  respondedAt: json['respondedAt'] == null
      ? null
      : DateTime.parse(json['respondedAt'] as String),
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$FamilyLocationRequestToJson(
  _FamilyLocationRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'circleId': instance.circleId,
  'requesterId': instance.requesterId,
  'targetMemberId': instance.targetMemberId,
  'status': _$FamilyLocationRequestStatusEnumMap[instance.status]!,
  'message': ?instance.message,
  'requester': ?instance.requester?.toJson(),
  'respondedAt': ?instance.respondedAt?.toIso8601String(),
  'expiresAt': ?instance.expiresAt?.toIso8601String(),
  'createdAt': ?instance.createdAt?.toIso8601String(),
};

const _$FamilyLocationRequestStatusEnumMap = {
  FamilyLocationRequestStatus.pending: 'pending',
  FamilyLocationRequestStatus.shared: 'shared',
  FamilyLocationRequestStatus.declined: 'declined',
  FamilyLocationRequestStatus.expired: 'expired',
};

_FamilySosResponse _$FamilySosResponseFromJson(Map<String, dynamic> json) =>
    _FamilySosResponse(
      id: json['id'] as String,
      sosEventId: json['sosEventId'] as String,
      memberId: json['memberId'] as String,
      type:
          $enumDecodeNullable(
            _$FamilySosResponseTypeEnumMap,
            json['type'],
            unknownValue: FamilySosResponseType.seen,
          ) ??
          FamilySosResponseType.seen,
      member: json['member'] == null
          ? null
          : FamilyMemberSnippet.fromJson(
              json['member'] as Map<String, dynamic>,
            ),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FamilySosResponseToJson(_FamilySosResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sosEventId': instance.sosEventId,
      'memberId': instance.memberId,
      'type': _$FamilySosResponseTypeEnumMap[instance.type]!,
      'member': ?instance.member?.toJson(),
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

const _$FamilySosResponseTypeEnumMap = {
  FamilySosResponseType.seen: 'seen',
  FamilySosResponseType.onMyWay: 'onMyWay',
  FamilySosResponseType.called: 'called',
};
