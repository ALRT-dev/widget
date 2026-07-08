import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_models.freezed.dart';
part 'family_models.g.dart';

enum FamilyRole {
  owner,
  adult,
  child,
}

enum FamilySharingLevel {
  precise,
  approximate,
  alertsOnly,
  off,
}

enum FamilyPlaceIcon {
  home,
  work,
  school,
  heart,
  other,
}

enum FamilyCheckInStatus {
  safe,
  needsHelp,
}

enum FamilySosStatus {
  active,
  resolved,
  cancelled,
}

enum FamilySosResponseType {
  seen,
  onMyWay,
  called,
}

/// How a location snapshot came to be shared — always a deliberate action.
enum FamilySnapshotSource {
  checkIn,
  request,
  sos,
  manual,
}

enum FamilyLocationRequestStatus {
  pending,
  shared,
  declined,
  expired,
}

/// Response of `GET /api/family/circle` — the family hub payload.
@freezed
abstract class FamilyCircle with _$FamilyCircle {
  const FamilyCircle._();

  const factory FamilyCircle({
    required final String id,
    required final String name,
    @Default('plus') final String plan,
    @Default(10) final int maxMembers,
    required final String myMemberId,
    @Default(<FamilyMember>[]) final List<FamilyMember> members,
    @Default(<FamilySavedPlace>[]) final List<FamilySavedPlace> places,
    @Default(<FamilySosEvent>[]) final List<FamilySosEvent> activeSosEvents,
    final FamilyCheckInRequest? latestCheckInRequest,
    final DateTime? createdAt,
  }) = _FamilyCircle;

  FamilyMember? get me =>
      members.where((m) => m.id == myMemberId).firstOrNull;

  List<FamilyMember> get others =>
      members.where((m) => m.id != myMemberId).toList();

  factory FamilyCircle.fromJson(Map<String, dynamic> json) =>
      _$FamilyCircleFromJson(json);
}

@freezed
abstract class FamilyMember with _$FamilyMember {
  const FamilyMember._();

  const factory FamilyMember({
    required final String id,
    required final String userId,
    @Default('Family member') final String name,
    final String? profilePictureUrl,
    final String? colorHex,
    @JsonKey(unknownEnumValue: FamilyRole.adult)
    @Default(FamilyRole.adult)
    final FamilyRole role,
    @JsonKey(unknownEnumValue: FamilySharingLevel.precise)
    @Default(FamilySharingLevel.precise)
    final FamilySharingLevel sharingLevel,
    final double? latitude,
    final double? longitude,
    final String? locationLabel,
    final DateTime? locationUpdatedAt,
    final DateTime? locationExpiresAt,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    final FamilySnapshotSource? locationSharedVia,
    final int? batteryLevel,
    @Default(false) final bool isMoving,
    final String? currentPlaceId,
    final DateTime? lastCheckInAt,
    final DateTime? createdAt,
  }) = _FamilyMember;

  /// Two-letter initials for the avatar pin.
  String get initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    if (parts.length == 1) {
      return parts.first.substring(0, parts.first.length >= 2 ? 2 : 1).toUpperCase();
    }
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  bool get hasLiveLocation => latitude != null && longitude != null;

  /// Checked in within the last 24 hours counts as "safe".
  bool get isCheckedInRecently =>
      lastCheckInAt != null &&
      DateTime.now().difference(lastCheckInAt!).inHours < 24;

  factory FamilyMember.fromJson(Map<String, dynamic> json) =>
      _$FamilyMemberFromJson(json);
}

@freezed
abstract class FamilyInvite with _$FamilyInvite {
  const factory FamilyInvite({
    required final String id,
    required final String code,
    @Default(0) final int useCount,
    @Default(10) final int maxUses,
    final DateTime? expiresAt,
    final DateTime? createdAt,
  }) = _FamilyInvite;

  factory FamilyInvite.fromJson(Map<String, dynamic> json) =>
      _$FamilyInviteFromJson(json);
}

@freezed
abstract class FamilySavedPlace with _$FamilySavedPlace {
  const factory FamilySavedPlace({
    required final String id,
    required final String name,
    @JsonKey(unknownEnumValue: FamilyPlaceIcon.other)
    @Default(FamilyPlaceIcon.other)
    final FamilyPlaceIcon icon,
    required final double latitude,
    required final double longitude,
    @Default(300) final int radiusMeters,
    final String? address,
    @Default(<FamilyPlaceNotificationPref>[])
    final List<FamilyPlaceNotificationPref> notificationPrefs,
  }) = _FamilySavedPlace;

  factory FamilySavedPlace.fromJson(Map<String, dynamic> json) =>
      _$FamilySavedPlaceFromJson(json);
}

@freezed
abstract class FamilyPlaceNotificationPref with _$FamilyPlaceNotificationPref {
  const factory FamilyPlaceNotificationPref({
    required final String placeId,
    required final String subjectMemberId,
    @Default(true) final bool notifyArrivals,
    @Default(true) final bool notifyDepartures,
  }) = _FamilyPlaceNotificationPref;

  factory FamilyPlaceNotificationPref.fromJson(Map<String, dynamic> json) =>
      _$FamilyPlaceNotificationPrefFromJson(json);
}

/// Nested member snippet included in check-ins / SOS payloads.
@freezed
abstract class FamilyMemberSnippet with _$FamilyMemberSnippet {
  const FamilyMemberSnippet._();

  const factory FamilyMemberSnippet({
    required final String id,
    final String? nickname,
    final FamilyMemberUserSnippet? user,
  }) = _FamilyMemberSnippet;

  String get displayName => nickname ?? user?.name ?? 'Family member';

  factory FamilyMemberSnippet.fromJson(Map<String, dynamic> json) =>
      _$FamilyMemberSnippetFromJson(json);
}

@freezed
abstract class FamilyMemberUserSnippet with _$FamilyMemberUserSnippet {
  const factory FamilyMemberUserSnippet({
    required final String id,
    final String? name,
    final String? profilePictureUrl,
  }) = _FamilyMemberUserSnippet;

  factory FamilyMemberUserSnippet.fromJson(Map<String, dynamic> json) =>
      _$FamilyMemberUserSnippetFromJson(json);
}

@freezed
abstract class FamilyCheckIn with _$FamilyCheckIn {
  const factory FamilyCheckIn({
    required final String id,
    required final String circleId,
    required final String memberId,
    @JsonKey(unknownEnumValue: FamilyCheckInStatus.safe)
    @Default(FamilyCheckInStatus.safe)
    final FamilyCheckInStatus status,
    final String? message,
    final double? latitude,
    final double? longitude,
    final String? requestId,
    final String? hazardId,
    final FamilyMemberSnippet? member,
    final DateTime? createdAt,
  }) = _FamilyCheckIn;

  factory FamilyCheckIn.fromJson(Map<String, dynamic> json) =>
      _$FamilyCheckInFromJson(json);
}

@freezed
abstract class FamilyCheckInRequest with _$FamilyCheckInRequest {
  const factory FamilyCheckInRequest({
    required final String id,
    required final String circleId,
    required final String requestedById,
    final String? hazardId,
    final String? message,
    final FamilyMemberSnippet? requestedBy,
    @Default(<FamilyCheckIn>[]) final List<FamilyCheckIn> checkIns,
    final DateTime? createdAt,
  }) = _FamilyCheckInRequest;

  factory FamilyCheckInRequest.fromJson(Map<String, dynamic> json) =>
      _$FamilyCheckInRequestFromJson(json);
}

@freezed
abstract class FamilySosEvent with _$FamilySosEvent {
  const factory FamilySosEvent({
    required final String id,
    required final String circleId,
    required final String memberId,
    @JsonKey(unknownEnumValue: FamilySosStatus.active)
    @Default(FamilySosStatus.active)
    final FamilySosStatus status,
    final double? latitude,
    final double? longitude,
    final String? locationLabel,
    final FamilyMemberSnippet? member,
    @Default(<FamilySosResponse>[]) final List<FamilySosResponse> responses,
    final DateTime? resolvedAt,
    final DateTime? createdAt,
  }) = _FamilySosEvent;

  factory FamilySosEvent.fromJson(Map<String, dynamic> json) =>
      _$FamilySosEventFromJson(json);
}

/// "Sarah asked where you are" — a one-time, consent-gated location request.
@freezed
abstract class FamilyLocationRequest with _$FamilyLocationRequest {
  const factory FamilyLocationRequest({
    required final String id,
    required final String circleId,
    required final String requesterId,
    required final String targetMemberId,
    @JsonKey(unknownEnumValue: FamilyLocationRequestStatus.pending)
    @Default(FamilyLocationRequestStatus.pending)
    final FamilyLocationRequestStatus status,
    final String? message,
    final FamilyMemberSnippet? requester,
    final DateTime? respondedAt,
    final DateTime? expiresAt,
    final DateTime? createdAt,
  }) = _FamilyLocationRequest;

  factory FamilyLocationRequest.fromJson(Map<String, dynamic> json) =>
      _$FamilyLocationRequestFromJson(json);
}

@freezed
abstract class FamilySosResponse with _$FamilySosResponse {
  const factory FamilySosResponse({
    required final String id,
    required final String sosEventId,
    required final String memberId,
    @JsonKey(unknownEnumValue: FamilySosResponseType.seen)
    @Default(FamilySosResponseType.seen)
    final FamilySosResponseType type,
    final FamilyMemberSnippet? member,
    final DateTime? createdAt,
  }) = _FamilySosResponse;

  factory FamilySosResponse.fromJson(Map<String, dynamic> json) =>
      _$FamilySosResponseFromJson(json);
}
