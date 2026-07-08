// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'family_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FamilyCircle {

 String get id; String get name; String get plan; int get maxMembers; String get myMemberId; List<FamilyMember> get members; List<FamilySavedPlace> get places; List<FamilySosEvent> get activeSosEvents; FamilyCheckInRequest? get latestCheckInRequest; DateTime? get createdAt;
/// Create a copy of FamilyCircle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyCircleCopyWith<FamilyCircle> get copyWith => _$FamilyCircleCopyWithImpl<FamilyCircle>(this as FamilyCircle, _$identity);

  /// Serializes this FamilyCircle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilyCircle&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.maxMembers, maxMembers) || other.maxMembers == maxMembers)&&(identical(other.myMemberId, myMemberId) || other.myMemberId == myMemberId)&&const DeepCollectionEquality().equals(other.members, members)&&const DeepCollectionEquality().equals(other.places, places)&&const DeepCollectionEquality().equals(other.activeSosEvents, activeSosEvents)&&(identical(other.latestCheckInRequest, latestCheckInRequest) || other.latestCheckInRequest == latestCheckInRequest)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,plan,maxMembers,myMemberId,const DeepCollectionEquality().hash(members),const DeepCollectionEquality().hash(places),const DeepCollectionEquality().hash(activeSosEvents),latestCheckInRequest,createdAt);

@override
String toString() {
  return 'FamilyCircle(id: $id, name: $name, plan: $plan, maxMembers: $maxMembers, myMemberId: $myMemberId, members: $members, places: $places, activeSosEvents: $activeSosEvents, latestCheckInRequest: $latestCheckInRequest, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FamilyCircleCopyWith<$Res>  {
  factory $FamilyCircleCopyWith(FamilyCircle value, $Res Function(FamilyCircle) _then) = _$FamilyCircleCopyWithImpl;
@useResult
$Res call({
 String id, String name, String plan, int maxMembers, String myMemberId, List<FamilyMember> members, List<FamilySavedPlace> places, List<FamilySosEvent> activeSosEvents, FamilyCheckInRequest? latestCheckInRequest, DateTime? createdAt
});


$FamilyCheckInRequestCopyWith<$Res>? get latestCheckInRequest;

}
/// @nodoc
class _$FamilyCircleCopyWithImpl<$Res>
    implements $FamilyCircleCopyWith<$Res> {
  _$FamilyCircleCopyWithImpl(this._self, this._then);

  final FamilyCircle _self;
  final $Res Function(FamilyCircle) _then;

/// Create a copy of FamilyCircle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? plan = null,Object? maxMembers = null,Object? myMemberId = null,Object? members = null,Object? places = null,Object? activeSosEvents = null,Object? latestCheckInRequest = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,maxMembers: null == maxMembers ? _self.maxMembers : maxMembers // ignore: cast_nullable_to_non_nullable
as int,myMemberId: null == myMemberId ? _self.myMemberId : myMemberId // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<FamilyMember>,places: null == places ? _self.places : places // ignore: cast_nullable_to_non_nullable
as List<FamilySavedPlace>,activeSosEvents: null == activeSosEvents ? _self.activeSosEvents : activeSosEvents // ignore: cast_nullable_to_non_nullable
as List<FamilySosEvent>,latestCheckInRequest: freezed == latestCheckInRequest ? _self.latestCheckInRequest : latestCheckInRequest // ignore: cast_nullable_to_non_nullable
as FamilyCheckInRequest?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of FamilyCircle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyCheckInRequestCopyWith<$Res>? get latestCheckInRequest {
    if (_self.latestCheckInRequest == null) {
    return null;
  }

  return $FamilyCheckInRequestCopyWith<$Res>(_self.latestCheckInRequest!, (value) {
    return _then(_self.copyWith(latestCheckInRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [FamilyCircle].
extension FamilyCirclePatterns on FamilyCircle {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilyCircle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilyCircle() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilyCircle value)  $default,){
final _that = this;
switch (_that) {
case _FamilyCircle():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilyCircle value)?  $default,){
final _that = this;
switch (_that) {
case _FamilyCircle() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String plan,  int maxMembers,  String myMemberId,  List<FamilyMember> members,  List<FamilySavedPlace> places,  List<FamilySosEvent> activeSosEvents,  FamilyCheckInRequest? latestCheckInRequest,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilyCircle() when $default != null:
return $default(_that.id,_that.name,_that.plan,_that.maxMembers,_that.myMemberId,_that.members,_that.places,_that.activeSosEvents,_that.latestCheckInRequest,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String plan,  int maxMembers,  String myMemberId,  List<FamilyMember> members,  List<FamilySavedPlace> places,  List<FamilySosEvent> activeSosEvents,  FamilyCheckInRequest? latestCheckInRequest,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FamilyCircle():
return $default(_that.id,_that.name,_that.plan,_that.maxMembers,_that.myMemberId,_that.members,_that.places,_that.activeSosEvents,_that.latestCheckInRequest,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String plan,  int maxMembers,  String myMemberId,  List<FamilyMember> members,  List<FamilySavedPlace> places,  List<FamilySosEvent> activeSosEvents,  FamilyCheckInRequest? latestCheckInRequest,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FamilyCircle() when $default != null:
return $default(_that.id,_that.name,_that.plan,_that.maxMembers,_that.myMemberId,_that.members,_that.places,_that.activeSosEvents,_that.latestCheckInRequest,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilyCircle extends FamilyCircle {
  const _FamilyCircle({required this.id, required this.name, this.plan = 'plus', this.maxMembers = 10, required this.myMemberId, final  List<FamilyMember> members = const <FamilyMember>[], final  List<FamilySavedPlace> places = const <FamilySavedPlace>[], final  List<FamilySosEvent> activeSosEvents = const <FamilySosEvent>[], this.latestCheckInRequest, this.createdAt}): _members = members,_places = places,_activeSosEvents = activeSosEvents,super._();
  factory _FamilyCircle.fromJson(Map<String, dynamic> json) => _$FamilyCircleFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String plan;
@override@JsonKey() final  int maxMembers;
@override final  String myMemberId;
 final  List<FamilyMember> _members;
@override@JsonKey() List<FamilyMember> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

 final  List<FamilySavedPlace> _places;
@override@JsonKey() List<FamilySavedPlace> get places {
  if (_places is EqualUnmodifiableListView) return _places;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_places);
}

 final  List<FamilySosEvent> _activeSosEvents;
@override@JsonKey() List<FamilySosEvent> get activeSosEvents {
  if (_activeSosEvents is EqualUnmodifiableListView) return _activeSosEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeSosEvents);
}

@override final  FamilyCheckInRequest? latestCheckInRequest;
@override final  DateTime? createdAt;

/// Create a copy of FamilyCircle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilyCircleCopyWith<_FamilyCircle> get copyWith => __$FamilyCircleCopyWithImpl<_FamilyCircle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilyCircleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilyCircle&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.maxMembers, maxMembers) || other.maxMembers == maxMembers)&&(identical(other.myMemberId, myMemberId) || other.myMemberId == myMemberId)&&const DeepCollectionEquality().equals(other._members, _members)&&const DeepCollectionEquality().equals(other._places, _places)&&const DeepCollectionEquality().equals(other._activeSosEvents, _activeSosEvents)&&(identical(other.latestCheckInRequest, latestCheckInRequest) || other.latestCheckInRequest == latestCheckInRequest)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,plan,maxMembers,myMemberId,const DeepCollectionEquality().hash(_members),const DeepCollectionEquality().hash(_places),const DeepCollectionEquality().hash(_activeSosEvents),latestCheckInRequest,createdAt);

@override
String toString() {
  return 'FamilyCircle(id: $id, name: $name, plan: $plan, maxMembers: $maxMembers, myMemberId: $myMemberId, members: $members, places: $places, activeSosEvents: $activeSosEvents, latestCheckInRequest: $latestCheckInRequest, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FamilyCircleCopyWith<$Res> implements $FamilyCircleCopyWith<$Res> {
  factory _$FamilyCircleCopyWith(_FamilyCircle value, $Res Function(_FamilyCircle) _then) = __$FamilyCircleCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String plan, int maxMembers, String myMemberId, List<FamilyMember> members, List<FamilySavedPlace> places, List<FamilySosEvent> activeSosEvents, FamilyCheckInRequest? latestCheckInRequest, DateTime? createdAt
});


@override $FamilyCheckInRequestCopyWith<$Res>? get latestCheckInRequest;

}
/// @nodoc
class __$FamilyCircleCopyWithImpl<$Res>
    implements _$FamilyCircleCopyWith<$Res> {
  __$FamilyCircleCopyWithImpl(this._self, this._then);

  final _FamilyCircle _self;
  final $Res Function(_FamilyCircle) _then;

/// Create a copy of FamilyCircle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? plan = null,Object? maxMembers = null,Object? myMemberId = null,Object? members = null,Object? places = null,Object? activeSosEvents = null,Object? latestCheckInRequest = freezed,Object? createdAt = freezed,}) {
  return _then(_FamilyCircle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,maxMembers: null == maxMembers ? _self.maxMembers : maxMembers // ignore: cast_nullable_to_non_nullable
as int,myMemberId: null == myMemberId ? _self.myMemberId : myMemberId // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<FamilyMember>,places: null == places ? _self._places : places // ignore: cast_nullable_to_non_nullable
as List<FamilySavedPlace>,activeSosEvents: null == activeSosEvents ? _self._activeSosEvents : activeSosEvents // ignore: cast_nullable_to_non_nullable
as List<FamilySosEvent>,latestCheckInRequest: freezed == latestCheckInRequest ? _self.latestCheckInRequest : latestCheckInRequest // ignore: cast_nullable_to_non_nullable
as FamilyCheckInRequest?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of FamilyCircle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyCheckInRequestCopyWith<$Res>? get latestCheckInRequest {
    if (_self.latestCheckInRequest == null) {
    return null;
  }

  return $FamilyCheckInRequestCopyWith<$Res>(_self.latestCheckInRequest!, (value) {
    return _then(_self.copyWith(latestCheckInRequest: value));
  });
}
}


/// @nodoc
mixin _$FamilyMember {

 String get id; String get userId; String get name; String? get profilePictureUrl; String? get colorHex;@JsonKey(unknownEnumValue: FamilyRole.adult) FamilyRole get role;@JsonKey(unknownEnumValue: FamilySharingLevel.precise) FamilySharingLevel get sharingLevel; double? get latitude; double? get longitude; String? get locationLabel; DateTime? get locationUpdatedAt; DateTime? get locationExpiresAt;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) FamilySnapshotSource? get locationSharedVia; int? get batteryLevel; bool get isMoving; String? get currentPlaceId; DateTime? get lastCheckInAt; DateTime? get createdAt;
/// Create a copy of FamilyMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyMemberCopyWith<FamilyMember> get copyWith => _$FamilyMemberCopyWithImpl<FamilyMember>(this as FamilyMember, _$identity);

  /// Serializes this FamilyMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilyMember&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.profilePictureUrl, profilePictureUrl) || other.profilePictureUrl == profilePictureUrl)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.role, role) || other.role == role)&&(identical(other.sharingLevel, sharingLevel) || other.sharingLevel == sharingLevel)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationLabel, locationLabel) || other.locationLabel == locationLabel)&&(identical(other.locationUpdatedAt, locationUpdatedAt) || other.locationUpdatedAt == locationUpdatedAt)&&(identical(other.locationExpiresAt, locationExpiresAt) || other.locationExpiresAt == locationExpiresAt)&&(identical(other.locationSharedVia, locationSharedVia) || other.locationSharedVia == locationSharedVia)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.isMoving, isMoving) || other.isMoving == isMoving)&&(identical(other.currentPlaceId, currentPlaceId) || other.currentPlaceId == currentPlaceId)&&(identical(other.lastCheckInAt, lastCheckInAt) || other.lastCheckInAt == lastCheckInAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,profilePictureUrl,colorHex,role,sharingLevel,latitude,longitude,locationLabel,locationUpdatedAt,locationExpiresAt,locationSharedVia,batteryLevel,isMoving,currentPlaceId,lastCheckInAt,createdAt);

@override
String toString() {
  return 'FamilyMember(id: $id, userId: $userId, name: $name, profilePictureUrl: $profilePictureUrl, colorHex: $colorHex, role: $role, sharingLevel: $sharingLevel, latitude: $latitude, longitude: $longitude, locationLabel: $locationLabel, locationUpdatedAt: $locationUpdatedAt, locationExpiresAt: $locationExpiresAt, locationSharedVia: $locationSharedVia, batteryLevel: $batteryLevel, isMoving: $isMoving, currentPlaceId: $currentPlaceId, lastCheckInAt: $lastCheckInAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FamilyMemberCopyWith<$Res>  {
  factory $FamilyMemberCopyWith(FamilyMember value, $Res Function(FamilyMember) _then) = _$FamilyMemberCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String name, String? profilePictureUrl, String? colorHex,@JsonKey(unknownEnumValue: FamilyRole.adult) FamilyRole role,@JsonKey(unknownEnumValue: FamilySharingLevel.precise) FamilySharingLevel sharingLevel, double? latitude, double? longitude, String? locationLabel, DateTime? locationUpdatedAt, DateTime? locationExpiresAt,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) FamilySnapshotSource? locationSharedVia, int? batteryLevel, bool isMoving, String? currentPlaceId, DateTime? lastCheckInAt, DateTime? createdAt
});




}
/// @nodoc
class _$FamilyMemberCopyWithImpl<$Res>
    implements $FamilyMemberCopyWith<$Res> {
  _$FamilyMemberCopyWithImpl(this._self, this._then);

  final FamilyMember _self;
  final $Res Function(FamilyMember) _then;

/// Create a copy of FamilyMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? profilePictureUrl = freezed,Object? colorHex = freezed,Object? role = null,Object? sharingLevel = null,Object? latitude = freezed,Object? longitude = freezed,Object? locationLabel = freezed,Object? locationUpdatedAt = freezed,Object? locationExpiresAt = freezed,Object? locationSharedVia = freezed,Object? batteryLevel = freezed,Object? isMoving = null,Object? currentPlaceId = freezed,Object? lastCheckInAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profilePictureUrl: freezed == profilePictureUrl ? _self.profilePictureUrl : profilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as FamilyRole,sharingLevel: null == sharingLevel ? _self.sharingLevel : sharingLevel // ignore: cast_nullable_to_non_nullable
as FamilySharingLevel,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,locationLabel: freezed == locationLabel ? _self.locationLabel : locationLabel // ignore: cast_nullable_to_non_nullable
as String?,locationUpdatedAt: freezed == locationUpdatedAt ? _self.locationUpdatedAt : locationUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,locationExpiresAt: freezed == locationExpiresAt ? _self.locationExpiresAt : locationExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,locationSharedVia: freezed == locationSharedVia ? _self.locationSharedVia : locationSharedVia // ignore: cast_nullable_to_non_nullable
as FamilySnapshotSource?,batteryLevel: freezed == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int?,isMoving: null == isMoving ? _self.isMoving : isMoving // ignore: cast_nullable_to_non_nullable
as bool,currentPlaceId: freezed == currentPlaceId ? _self.currentPlaceId : currentPlaceId // ignore: cast_nullable_to_non_nullable
as String?,lastCheckInAt: freezed == lastCheckInAt ? _self.lastCheckInAt : lastCheckInAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FamilyMember].
extension FamilyMemberPatterns on FamilyMember {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilyMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilyMember() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilyMember value)  $default,){
final _that = this;
switch (_that) {
case _FamilyMember():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilyMember value)?  $default,){
final _that = this;
switch (_that) {
case _FamilyMember() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String name,  String? profilePictureUrl,  String? colorHex, @JsonKey(unknownEnumValue: FamilyRole.adult)  FamilyRole role, @JsonKey(unknownEnumValue: FamilySharingLevel.precise)  FamilySharingLevel sharingLevel,  double? latitude,  double? longitude,  String? locationLabel,  DateTime? locationUpdatedAt,  DateTime? locationExpiresAt, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  FamilySnapshotSource? locationSharedVia,  int? batteryLevel,  bool isMoving,  String? currentPlaceId,  DateTime? lastCheckInAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilyMember() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.profilePictureUrl,_that.colorHex,_that.role,_that.sharingLevel,_that.latitude,_that.longitude,_that.locationLabel,_that.locationUpdatedAt,_that.locationExpiresAt,_that.locationSharedVia,_that.batteryLevel,_that.isMoving,_that.currentPlaceId,_that.lastCheckInAt,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String name,  String? profilePictureUrl,  String? colorHex, @JsonKey(unknownEnumValue: FamilyRole.adult)  FamilyRole role, @JsonKey(unknownEnumValue: FamilySharingLevel.precise)  FamilySharingLevel sharingLevel,  double? latitude,  double? longitude,  String? locationLabel,  DateTime? locationUpdatedAt,  DateTime? locationExpiresAt, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  FamilySnapshotSource? locationSharedVia,  int? batteryLevel,  bool isMoving,  String? currentPlaceId,  DateTime? lastCheckInAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FamilyMember():
return $default(_that.id,_that.userId,_that.name,_that.profilePictureUrl,_that.colorHex,_that.role,_that.sharingLevel,_that.latitude,_that.longitude,_that.locationLabel,_that.locationUpdatedAt,_that.locationExpiresAt,_that.locationSharedVia,_that.batteryLevel,_that.isMoving,_that.currentPlaceId,_that.lastCheckInAt,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String name,  String? profilePictureUrl,  String? colorHex, @JsonKey(unknownEnumValue: FamilyRole.adult)  FamilyRole role, @JsonKey(unknownEnumValue: FamilySharingLevel.precise)  FamilySharingLevel sharingLevel,  double? latitude,  double? longitude,  String? locationLabel,  DateTime? locationUpdatedAt,  DateTime? locationExpiresAt, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  FamilySnapshotSource? locationSharedVia,  int? batteryLevel,  bool isMoving,  String? currentPlaceId,  DateTime? lastCheckInAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FamilyMember() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.profilePictureUrl,_that.colorHex,_that.role,_that.sharingLevel,_that.latitude,_that.longitude,_that.locationLabel,_that.locationUpdatedAt,_that.locationExpiresAt,_that.locationSharedVia,_that.batteryLevel,_that.isMoving,_that.currentPlaceId,_that.lastCheckInAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilyMember extends FamilyMember {
  const _FamilyMember({required this.id, required this.userId, this.name = 'Family member', this.profilePictureUrl, this.colorHex, @JsonKey(unknownEnumValue: FamilyRole.adult) this.role = FamilyRole.adult, @JsonKey(unknownEnumValue: FamilySharingLevel.precise) this.sharingLevel = FamilySharingLevel.precise, this.latitude, this.longitude, this.locationLabel, this.locationUpdatedAt, this.locationExpiresAt, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.locationSharedVia, this.batteryLevel, this.isMoving = false, this.currentPlaceId, this.lastCheckInAt, this.createdAt}): super._();
  factory _FamilyMember.fromJson(Map<String, dynamic> json) => _$FamilyMemberFromJson(json);

@override final  String id;
@override final  String userId;
@override@JsonKey() final  String name;
@override final  String? profilePictureUrl;
@override final  String? colorHex;
@override@JsonKey(unknownEnumValue: FamilyRole.adult) final  FamilyRole role;
@override@JsonKey(unknownEnumValue: FamilySharingLevel.precise) final  FamilySharingLevel sharingLevel;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? locationLabel;
@override final  DateTime? locationUpdatedAt;
@override final  DateTime? locationExpiresAt;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  FamilySnapshotSource? locationSharedVia;
@override final  int? batteryLevel;
@override@JsonKey() final  bool isMoving;
@override final  String? currentPlaceId;
@override final  DateTime? lastCheckInAt;
@override final  DateTime? createdAt;

/// Create a copy of FamilyMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilyMemberCopyWith<_FamilyMember> get copyWith => __$FamilyMemberCopyWithImpl<_FamilyMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilyMemberToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilyMember&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.profilePictureUrl, profilePictureUrl) || other.profilePictureUrl == profilePictureUrl)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.role, role) || other.role == role)&&(identical(other.sharingLevel, sharingLevel) || other.sharingLevel == sharingLevel)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationLabel, locationLabel) || other.locationLabel == locationLabel)&&(identical(other.locationUpdatedAt, locationUpdatedAt) || other.locationUpdatedAt == locationUpdatedAt)&&(identical(other.locationExpiresAt, locationExpiresAt) || other.locationExpiresAt == locationExpiresAt)&&(identical(other.locationSharedVia, locationSharedVia) || other.locationSharedVia == locationSharedVia)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.isMoving, isMoving) || other.isMoving == isMoving)&&(identical(other.currentPlaceId, currentPlaceId) || other.currentPlaceId == currentPlaceId)&&(identical(other.lastCheckInAt, lastCheckInAt) || other.lastCheckInAt == lastCheckInAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,profilePictureUrl,colorHex,role,sharingLevel,latitude,longitude,locationLabel,locationUpdatedAt,locationExpiresAt,locationSharedVia,batteryLevel,isMoving,currentPlaceId,lastCheckInAt,createdAt);

@override
String toString() {
  return 'FamilyMember(id: $id, userId: $userId, name: $name, profilePictureUrl: $profilePictureUrl, colorHex: $colorHex, role: $role, sharingLevel: $sharingLevel, latitude: $latitude, longitude: $longitude, locationLabel: $locationLabel, locationUpdatedAt: $locationUpdatedAt, locationExpiresAt: $locationExpiresAt, locationSharedVia: $locationSharedVia, batteryLevel: $batteryLevel, isMoving: $isMoving, currentPlaceId: $currentPlaceId, lastCheckInAt: $lastCheckInAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FamilyMemberCopyWith<$Res> implements $FamilyMemberCopyWith<$Res> {
  factory _$FamilyMemberCopyWith(_FamilyMember value, $Res Function(_FamilyMember) _then) = __$FamilyMemberCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String name, String? profilePictureUrl, String? colorHex,@JsonKey(unknownEnumValue: FamilyRole.adult) FamilyRole role,@JsonKey(unknownEnumValue: FamilySharingLevel.precise) FamilySharingLevel sharingLevel, double? latitude, double? longitude, String? locationLabel, DateTime? locationUpdatedAt, DateTime? locationExpiresAt,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) FamilySnapshotSource? locationSharedVia, int? batteryLevel, bool isMoving, String? currentPlaceId, DateTime? lastCheckInAt, DateTime? createdAt
});




}
/// @nodoc
class __$FamilyMemberCopyWithImpl<$Res>
    implements _$FamilyMemberCopyWith<$Res> {
  __$FamilyMemberCopyWithImpl(this._self, this._then);

  final _FamilyMember _self;
  final $Res Function(_FamilyMember) _then;

/// Create a copy of FamilyMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? profilePictureUrl = freezed,Object? colorHex = freezed,Object? role = null,Object? sharingLevel = null,Object? latitude = freezed,Object? longitude = freezed,Object? locationLabel = freezed,Object? locationUpdatedAt = freezed,Object? locationExpiresAt = freezed,Object? locationSharedVia = freezed,Object? batteryLevel = freezed,Object? isMoving = null,Object? currentPlaceId = freezed,Object? lastCheckInAt = freezed,Object? createdAt = freezed,}) {
  return _then(_FamilyMember(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profilePictureUrl: freezed == profilePictureUrl ? _self.profilePictureUrl : profilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as FamilyRole,sharingLevel: null == sharingLevel ? _self.sharingLevel : sharingLevel // ignore: cast_nullable_to_non_nullable
as FamilySharingLevel,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,locationLabel: freezed == locationLabel ? _self.locationLabel : locationLabel // ignore: cast_nullable_to_non_nullable
as String?,locationUpdatedAt: freezed == locationUpdatedAt ? _self.locationUpdatedAt : locationUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,locationExpiresAt: freezed == locationExpiresAt ? _self.locationExpiresAt : locationExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,locationSharedVia: freezed == locationSharedVia ? _self.locationSharedVia : locationSharedVia // ignore: cast_nullable_to_non_nullable
as FamilySnapshotSource?,batteryLevel: freezed == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int?,isMoving: null == isMoving ? _self.isMoving : isMoving // ignore: cast_nullable_to_non_nullable
as bool,currentPlaceId: freezed == currentPlaceId ? _self.currentPlaceId : currentPlaceId // ignore: cast_nullable_to_non_nullable
as String?,lastCheckInAt: freezed == lastCheckInAt ? _self.lastCheckInAt : lastCheckInAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$FamilyInvite {

 String get id; String get code; int get useCount; int get maxUses; DateTime? get expiresAt; DateTime? get createdAt;
/// Create a copy of FamilyInvite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyInviteCopyWith<FamilyInvite> get copyWith => _$FamilyInviteCopyWithImpl<FamilyInvite>(this as FamilyInvite, _$identity);

  /// Serializes this FamilyInvite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilyInvite&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.useCount, useCount) || other.useCount == useCount)&&(identical(other.maxUses, maxUses) || other.maxUses == maxUses)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,useCount,maxUses,expiresAt,createdAt);

@override
String toString() {
  return 'FamilyInvite(id: $id, code: $code, useCount: $useCount, maxUses: $maxUses, expiresAt: $expiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FamilyInviteCopyWith<$Res>  {
  factory $FamilyInviteCopyWith(FamilyInvite value, $Res Function(FamilyInvite) _then) = _$FamilyInviteCopyWithImpl;
@useResult
$Res call({
 String id, String code, int useCount, int maxUses, DateTime? expiresAt, DateTime? createdAt
});




}
/// @nodoc
class _$FamilyInviteCopyWithImpl<$Res>
    implements $FamilyInviteCopyWith<$Res> {
  _$FamilyInviteCopyWithImpl(this._self, this._then);

  final FamilyInvite _self;
  final $Res Function(FamilyInvite) _then;

/// Create a copy of FamilyInvite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? useCount = null,Object? maxUses = null,Object? expiresAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,useCount: null == useCount ? _self.useCount : useCount // ignore: cast_nullable_to_non_nullable
as int,maxUses: null == maxUses ? _self.maxUses : maxUses // ignore: cast_nullable_to_non_nullable
as int,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FamilyInvite].
extension FamilyInvitePatterns on FamilyInvite {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilyInvite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilyInvite() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilyInvite value)  $default,){
final _that = this;
switch (_that) {
case _FamilyInvite():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilyInvite value)?  $default,){
final _that = this;
switch (_that) {
case _FamilyInvite() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  int useCount,  int maxUses,  DateTime? expiresAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilyInvite() when $default != null:
return $default(_that.id,_that.code,_that.useCount,_that.maxUses,_that.expiresAt,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  int useCount,  int maxUses,  DateTime? expiresAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FamilyInvite():
return $default(_that.id,_that.code,_that.useCount,_that.maxUses,_that.expiresAt,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  int useCount,  int maxUses,  DateTime? expiresAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FamilyInvite() when $default != null:
return $default(_that.id,_that.code,_that.useCount,_that.maxUses,_that.expiresAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilyInvite implements FamilyInvite {
  const _FamilyInvite({required this.id, required this.code, this.useCount = 0, this.maxUses = 10, this.expiresAt, this.createdAt});
  factory _FamilyInvite.fromJson(Map<String, dynamic> json) => _$FamilyInviteFromJson(json);

@override final  String id;
@override final  String code;
@override@JsonKey() final  int useCount;
@override@JsonKey() final  int maxUses;
@override final  DateTime? expiresAt;
@override final  DateTime? createdAt;

/// Create a copy of FamilyInvite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilyInviteCopyWith<_FamilyInvite> get copyWith => __$FamilyInviteCopyWithImpl<_FamilyInvite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilyInviteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilyInvite&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.useCount, useCount) || other.useCount == useCount)&&(identical(other.maxUses, maxUses) || other.maxUses == maxUses)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,useCount,maxUses,expiresAt,createdAt);

@override
String toString() {
  return 'FamilyInvite(id: $id, code: $code, useCount: $useCount, maxUses: $maxUses, expiresAt: $expiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FamilyInviteCopyWith<$Res> implements $FamilyInviteCopyWith<$Res> {
  factory _$FamilyInviteCopyWith(_FamilyInvite value, $Res Function(_FamilyInvite) _then) = __$FamilyInviteCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, int useCount, int maxUses, DateTime? expiresAt, DateTime? createdAt
});




}
/// @nodoc
class __$FamilyInviteCopyWithImpl<$Res>
    implements _$FamilyInviteCopyWith<$Res> {
  __$FamilyInviteCopyWithImpl(this._self, this._then);

  final _FamilyInvite _self;
  final $Res Function(_FamilyInvite) _then;

/// Create a copy of FamilyInvite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? useCount = null,Object? maxUses = null,Object? expiresAt = freezed,Object? createdAt = freezed,}) {
  return _then(_FamilyInvite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,useCount: null == useCount ? _self.useCount : useCount // ignore: cast_nullable_to_non_nullable
as int,maxUses: null == maxUses ? _self.maxUses : maxUses // ignore: cast_nullable_to_non_nullable
as int,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$FamilySavedPlace {

 String get id; String get name;@JsonKey(unknownEnumValue: FamilyPlaceIcon.other) FamilyPlaceIcon get icon; double get latitude; double get longitude; int get radiusMeters; String? get address; List<FamilyPlaceNotificationPref> get notificationPrefs;
/// Create a copy of FamilySavedPlace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilySavedPlaceCopyWith<FamilySavedPlace> get copyWith => _$FamilySavedPlaceCopyWithImpl<FamilySavedPlace>(this as FamilySavedPlace, _$identity);

  /// Serializes this FamilySavedPlace to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilySavedPlace&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusMeters, radiusMeters) || other.radiusMeters == radiusMeters)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.notificationPrefs, notificationPrefs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon,latitude,longitude,radiusMeters,address,const DeepCollectionEquality().hash(notificationPrefs));

@override
String toString() {
  return 'FamilySavedPlace(id: $id, name: $name, icon: $icon, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters, address: $address, notificationPrefs: $notificationPrefs)';
}


}

/// @nodoc
abstract mixin class $FamilySavedPlaceCopyWith<$Res>  {
  factory $FamilySavedPlaceCopyWith(FamilySavedPlace value, $Res Function(FamilySavedPlace) _then) = _$FamilySavedPlaceCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(unknownEnumValue: FamilyPlaceIcon.other) FamilyPlaceIcon icon, double latitude, double longitude, int radiusMeters, String? address, List<FamilyPlaceNotificationPref> notificationPrefs
});




}
/// @nodoc
class _$FamilySavedPlaceCopyWithImpl<$Res>
    implements $FamilySavedPlaceCopyWith<$Res> {
  _$FamilySavedPlaceCopyWithImpl(this._self, this._then);

  final FamilySavedPlace _self;
  final $Res Function(FamilySavedPlace) _then;

/// Create a copy of FamilySavedPlace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = null,Object? latitude = null,Object? longitude = null,Object? radiusMeters = null,Object? address = freezed,Object? notificationPrefs = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as FamilyPlaceIcon,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as int,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,notificationPrefs: null == notificationPrefs ? _self.notificationPrefs : notificationPrefs // ignore: cast_nullable_to_non_nullable
as List<FamilyPlaceNotificationPref>,
  ));
}

}


/// Adds pattern-matching-related methods to [FamilySavedPlace].
extension FamilySavedPlacePatterns on FamilySavedPlace {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilySavedPlace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilySavedPlace() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilySavedPlace value)  $default,){
final _that = this;
switch (_that) {
case _FamilySavedPlace():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilySavedPlace value)?  $default,){
final _that = this;
switch (_that) {
case _FamilySavedPlace() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(unknownEnumValue: FamilyPlaceIcon.other)  FamilyPlaceIcon icon,  double latitude,  double longitude,  int radiusMeters,  String? address,  List<FamilyPlaceNotificationPref> notificationPrefs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilySavedPlace() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.latitude,_that.longitude,_that.radiusMeters,_that.address,_that.notificationPrefs);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(unknownEnumValue: FamilyPlaceIcon.other)  FamilyPlaceIcon icon,  double latitude,  double longitude,  int radiusMeters,  String? address,  List<FamilyPlaceNotificationPref> notificationPrefs)  $default,) {final _that = this;
switch (_that) {
case _FamilySavedPlace():
return $default(_that.id,_that.name,_that.icon,_that.latitude,_that.longitude,_that.radiusMeters,_that.address,_that.notificationPrefs);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(unknownEnumValue: FamilyPlaceIcon.other)  FamilyPlaceIcon icon,  double latitude,  double longitude,  int radiusMeters,  String? address,  List<FamilyPlaceNotificationPref> notificationPrefs)?  $default,) {final _that = this;
switch (_that) {
case _FamilySavedPlace() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.latitude,_that.longitude,_that.radiusMeters,_that.address,_that.notificationPrefs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilySavedPlace implements FamilySavedPlace {
  const _FamilySavedPlace({required this.id, required this.name, @JsonKey(unknownEnumValue: FamilyPlaceIcon.other) this.icon = FamilyPlaceIcon.other, required this.latitude, required this.longitude, this.radiusMeters = 300, this.address, final  List<FamilyPlaceNotificationPref> notificationPrefs = const <FamilyPlaceNotificationPref>[]}): _notificationPrefs = notificationPrefs;
  factory _FamilySavedPlace.fromJson(Map<String, dynamic> json) => _$FamilySavedPlaceFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(unknownEnumValue: FamilyPlaceIcon.other) final  FamilyPlaceIcon icon;
@override final  double latitude;
@override final  double longitude;
@override@JsonKey() final  int radiusMeters;
@override final  String? address;
 final  List<FamilyPlaceNotificationPref> _notificationPrefs;
@override@JsonKey() List<FamilyPlaceNotificationPref> get notificationPrefs {
  if (_notificationPrefs is EqualUnmodifiableListView) return _notificationPrefs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notificationPrefs);
}


/// Create a copy of FamilySavedPlace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilySavedPlaceCopyWith<_FamilySavedPlace> get copyWith => __$FamilySavedPlaceCopyWithImpl<_FamilySavedPlace>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilySavedPlaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilySavedPlace&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusMeters, radiusMeters) || other.radiusMeters == radiusMeters)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._notificationPrefs, _notificationPrefs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon,latitude,longitude,radiusMeters,address,const DeepCollectionEquality().hash(_notificationPrefs));

@override
String toString() {
  return 'FamilySavedPlace(id: $id, name: $name, icon: $icon, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters, address: $address, notificationPrefs: $notificationPrefs)';
}


}

/// @nodoc
abstract mixin class _$FamilySavedPlaceCopyWith<$Res> implements $FamilySavedPlaceCopyWith<$Res> {
  factory _$FamilySavedPlaceCopyWith(_FamilySavedPlace value, $Res Function(_FamilySavedPlace) _then) = __$FamilySavedPlaceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(unknownEnumValue: FamilyPlaceIcon.other) FamilyPlaceIcon icon, double latitude, double longitude, int radiusMeters, String? address, List<FamilyPlaceNotificationPref> notificationPrefs
});




}
/// @nodoc
class __$FamilySavedPlaceCopyWithImpl<$Res>
    implements _$FamilySavedPlaceCopyWith<$Res> {
  __$FamilySavedPlaceCopyWithImpl(this._self, this._then);

  final _FamilySavedPlace _self;
  final $Res Function(_FamilySavedPlace) _then;

/// Create a copy of FamilySavedPlace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = null,Object? latitude = null,Object? longitude = null,Object? radiusMeters = null,Object? address = freezed,Object? notificationPrefs = null,}) {
  return _then(_FamilySavedPlace(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as FamilyPlaceIcon,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as int,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,notificationPrefs: null == notificationPrefs ? _self._notificationPrefs : notificationPrefs // ignore: cast_nullable_to_non_nullable
as List<FamilyPlaceNotificationPref>,
  ));
}


}


/// @nodoc
mixin _$FamilyPlaceNotificationPref {

 String get placeId; String get subjectMemberId; bool get notifyArrivals; bool get notifyDepartures;
/// Create a copy of FamilyPlaceNotificationPref
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyPlaceNotificationPrefCopyWith<FamilyPlaceNotificationPref> get copyWith => _$FamilyPlaceNotificationPrefCopyWithImpl<FamilyPlaceNotificationPref>(this as FamilyPlaceNotificationPref, _$identity);

  /// Serializes this FamilyPlaceNotificationPref to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilyPlaceNotificationPref&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.subjectMemberId, subjectMemberId) || other.subjectMemberId == subjectMemberId)&&(identical(other.notifyArrivals, notifyArrivals) || other.notifyArrivals == notifyArrivals)&&(identical(other.notifyDepartures, notifyDepartures) || other.notifyDepartures == notifyDepartures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placeId,subjectMemberId,notifyArrivals,notifyDepartures);

@override
String toString() {
  return 'FamilyPlaceNotificationPref(placeId: $placeId, subjectMemberId: $subjectMemberId, notifyArrivals: $notifyArrivals, notifyDepartures: $notifyDepartures)';
}


}

/// @nodoc
abstract mixin class $FamilyPlaceNotificationPrefCopyWith<$Res>  {
  factory $FamilyPlaceNotificationPrefCopyWith(FamilyPlaceNotificationPref value, $Res Function(FamilyPlaceNotificationPref) _then) = _$FamilyPlaceNotificationPrefCopyWithImpl;
@useResult
$Res call({
 String placeId, String subjectMemberId, bool notifyArrivals, bool notifyDepartures
});




}
/// @nodoc
class _$FamilyPlaceNotificationPrefCopyWithImpl<$Res>
    implements $FamilyPlaceNotificationPrefCopyWith<$Res> {
  _$FamilyPlaceNotificationPrefCopyWithImpl(this._self, this._then);

  final FamilyPlaceNotificationPref _self;
  final $Res Function(FamilyPlaceNotificationPref) _then;

/// Create a copy of FamilyPlaceNotificationPref
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placeId = null,Object? subjectMemberId = null,Object? notifyArrivals = null,Object? notifyDepartures = null,}) {
  return _then(_self.copyWith(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,subjectMemberId: null == subjectMemberId ? _self.subjectMemberId : subjectMemberId // ignore: cast_nullable_to_non_nullable
as String,notifyArrivals: null == notifyArrivals ? _self.notifyArrivals : notifyArrivals // ignore: cast_nullable_to_non_nullable
as bool,notifyDepartures: null == notifyDepartures ? _self.notifyDepartures : notifyDepartures // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FamilyPlaceNotificationPref].
extension FamilyPlaceNotificationPrefPatterns on FamilyPlaceNotificationPref {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilyPlaceNotificationPref value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilyPlaceNotificationPref() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilyPlaceNotificationPref value)  $default,){
final _that = this;
switch (_that) {
case _FamilyPlaceNotificationPref():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilyPlaceNotificationPref value)?  $default,){
final _that = this;
switch (_that) {
case _FamilyPlaceNotificationPref() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String placeId,  String subjectMemberId,  bool notifyArrivals,  bool notifyDepartures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilyPlaceNotificationPref() when $default != null:
return $default(_that.placeId,_that.subjectMemberId,_that.notifyArrivals,_that.notifyDepartures);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String placeId,  String subjectMemberId,  bool notifyArrivals,  bool notifyDepartures)  $default,) {final _that = this;
switch (_that) {
case _FamilyPlaceNotificationPref():
return $default(_that.placeId,_that.subjectMemberId,_that.notifyArrivals,_that.notifyDepartures);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String placeId,  String subjectMemberId,  bool notifyArrivals,  bool notifyDepartures)?  $default,) {final _that = this;
switch (_that) {
case _FamilyPlaceNotificationPref() when $default != null:
return $default(_that.placeId,_that.subjectMemberId,_that.notifyArrivals,_that.notifyDepartures);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilyPlaceNotificationPref implements FamilyPlaceNotificationPref {
  const _FamilyPlaceNotificationPref({required this.placeId, required this.subjectMemberId, this.notifyArrivals = true, this.notifyDepartures = true});
  factory _FamilyPlaceNotificationPref.fromJson(Map<String, dynamic> json) => _$FamilyPlaceNotificationPrefFromJson(json);

@override final  String placeId;
@override final  String subjectMemberId;
@override@JsonKey() final  bool notifyArrivals;
@override@JsonKey() final  bool notifyDepartures;

/// Create a copy of FamilyPlaceNotificationPref
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilyPlaceNotificationPrefCopyWith<_FamilyPlaceNotificationPref> get copyWith => __$FamilyPlaceNotificationPrefCopyWithImpl<_FamilyPlaceNotificationPref>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilyPlaceNotificationPrefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilyPlaceNotificationPref&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.subjectMemberId, subjectMemberId) || other.subjectMemberId == subjectMemberId)&&(identical(other.notifyArrivals, notifyArrivals) || other.notifyArrivals == notifyArrivals)&&(identical(other.notifyDepartures, notifyDepartures) || other.notifyDepartures == notifyDepartures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placeId,subjectMemberId,notifyArrivals,notifyDepartures);

@override
String toString() {
  return 'FamilyPlaceNotificationPref(placeId: $placeId, subjectMemberId: $subjectMemberId, notifyArrivals: $notifyArrivals, notifyDepartures: $notifyDepartures)';
}


}

/// @nodoc
abstract mixin class _$FamilyPlaceNotificationPrefCopyWith<$Res> implements $FamilyPlaceNotificationPrefCopyWith<$Res> {
  factory _$FamilyPlaceNotificationPrefCopyWith(_FamilyPlaceNotificationPref value, $Res Function(_FamilyPlaceNotificationPref) _then) = __$FamilyPlaceNotificationPrefCopyWithImpl;
@override @useResult
$Res call({
 String placeId, String subjectMemberId, bool notifyArrivals, bool notifyDepartures
});




}
/// @nodoc
class __$FamilyPlaceNotificationPrefCopyWithImpl<$Res>
    implements _$FamilyPlaceNotificationPrefCopyWith<$Res> {
  __$FamilyPlaceNotificationPrefCopyWithImpl(this._self, this._then);

  final _FamilyPlaceNotificationPref _self;
  final $Res Function(_FamilyPlaceNotificationPref) _then;

/// Create a copy of FamilyPlaceNotificationPref
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placeId = null,Object? subjectMemberId = null,Object? notifyArrivals = null,Object? notifyDepartures = null,}) {
  return _then(_FamilyPlaceNotificationPref(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,subjectMemberId: null == subjectMemberId ? _self.subjectMemberId : subjectMemberId // ignore: cast_nullable_to_non_nullable
as String,notifyArrivals: null == notifyArrivals ? _self.notifyArrivals : notifyArrivals // ignore: cast_nullable_to_non_nullable
as bool,notifyDepartures: null == notifyDepartures ? _self.notifyDepartures : notifyDepartures // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$FamilyMemberSnippet {

 String get id; String? get nickname; FamilyMemberUserSnippet? get user;
/// Create a copy of FamilyMemberSnippet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyMemberSnippetCopyWith<FamilyMemberSnippet> get copyWith => _$FamilyMemberSnippetCopyWithImpl<FamilyMemberSnippet>(this as FamilyMemberSnippet, _$identity);

  /// Serializes this FamilyMemberSnippet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilyMemberSnippet&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,user);

@override
String toString() {
  return 'FamilyMemberSnippet(id: $id, nickname: $nickname, user: $user)';
}


}

/// @nodoc
abstract mixin class $FamilyMemberSnippetCopyWith<$Res>  {
  factory $FamilyMemberSnippetCopyWith(FamilyMemberSnippet value, $Res Function(FamilyMemberSnippet) _then) = _$FamilyMemberSnippetCopyWithImpl;
@useResult
$Res call({
 String id, String? nickname, FamilyMemberUserSnippet? user
});


$FamilyMemberUserSnippetCopyWith<$Res>? get user;

}
/// @nodoc
class _$FamilyMemberSnippetCopyWithImpl<$Res>
    implements $FamilyMemberSnippetCopyWith<$Res> {
  _$FamilyMemberSnippetCopyWithImpl(this._self, this._then);

  final FamilyMemberSnippet _self;
  final $Res Function(FamilyMemberSnippet) _then;

/// Create a copy of FamilyMemberSnippet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nickname = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as FamilyMemberUserSnippet?,
  ));
}
/// Create a copy of FamilyMemberSnippet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyMemberUserSnippetCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $FamilyMemberUserSnippetCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [FamilyMemberSnippet].
extension FamilyMemberSnippetPatterns on FamilyMemberSnippet {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilyMemberSnippet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilyMemberSnippet() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilyMemberSnippet value)  $default,){
final _that = this;
switch (_that) {
case _FamilyMemberSnippet():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilyMemberSnippet value)?  $default,){
final _that = this;
switch (_that) {
case _FamilyMemberSnippet() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? nickname,  FamilyMemberUserSnippet? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilyMemberSnippet() when $default != null:
return $default(_that.id,_that.nickname,_that.user);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? nickname,  FamilyMemberUserSnippet? user)  $default,) {final _that = this;
switch (_that) {
case _FamilyMemberSnippet():
return $default(_that.id,_that.nickname,_that.user);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? nickname,  FamilyMemberUserSnippet? user)?  $default,) {final _that = this;
switch (_that) {
case _FamilyMemberSnippet() when $default != null:
return $default(_that.id,_that.nickname,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilyMemberSnippet extends FamilyMemberSnippet {
  const _FamilyMemberSnippet({required this.id, this.nickname, this.user}): super._();
  factory _FamilyMemberSnippet.fromJson(Map<String, dynamic> json) => _$FamilyMemberSnippetFromJson(json);

@override final  String id;
@override final  String? nickname;
@override final  FamilyMemberUserSnippet? user;

/// Create a copy of FamilyMemberSnippet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilyMemberSnippetCopyWith<_FamilyMemberSnippet> get copyWith => __$FamilyMemberSnippetCopyWithImpl<_FamilyMemberSnippet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilyMemberSnippetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilyMemberSnippet&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,user);

@override
String toString() {
  return 'FamilyMemberSnippet(id: $id, nickname: $nickname, user: $user)';
}


}

/// @nodoc
abstract mixin class _$FamilyMemberSnippetCopyWith<$Res> implements $FamilyMemberSnippetCopyWith<$Res> {
  factory _$FamilyMemberSnippetCopyWith(_FamilyMemberSnippet value, $Res Function(_FamilyMemberSnippet) _then) = __$FamilyMemberSnippetCopyWithImpl;
@override @useResult
$Res call({
 String id, String? nickname, FamilyMemberUserSnippet? user
});


@override $FamilyMemberUserSnippetCopyWith<$Res>? get user;

}
/// @nodoc
class __$FamilyMemberSnippetCopyWithImpl<$Res>
    implements _$FamilyMemberSnippetCopyWith<$Res> {
  __$FamilyMemberSnippetCopyWithImpl(this._self, this._then);

  final _FamilyMemberSnippet _self;
  final $Res Function(_FamilyMemberSnippet) _then;

/// Create a copy of FamilyMemberSnippet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nickname = freezed,Object? user = freezed,}) {
  return _then(_FamilyMemberSnippet(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as FamilyMemberUserSnippet?,
  ));
}

/// Create a copy of FamilyMemberSnippet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyMemberUserSnippetCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $FamilyMemberUserSnippetCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$FamilyMemberUserSnippet {

 String get id; String? get name; String? get profilePictureUrl;
/// Create a copy of FamilyMemberUserSnippet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyMemberUserSnippetCopyWith<FamilyMemberUserSnippet> get copyWith => _$FamilyMemberUserSnippetCopyWithImpl<FamilyMemberUserSnippet>(this as FamilyMemberUserSnippet, _$identity);

  /// Serializes this FamilyMemberUserSnippet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilyMemberUserSnippet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.profilePictureUrl, profilePictureUrl) || other.profilePictureUrl == profilePictureUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,profilePictureUrl);

@override
String toString() {
  return 'FamilyMemberUserSnippet(id: $id, name: $name, profilePictureUrl: $profilePictureUrl)';
}


}

/// @nodoc
abstract mixin class $FamilyMemberUserSnippetCopyWith<$Res>  {
  factory $FamilyMemberUserSnippetCopyWith(FamilyMemberUserSnippet value, $Res Function(FamilyMemberUserSnippet) _then) = _$FamilyMemberUserSnippetCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? profilePictureUrl
});




}
/// @nodoc
class _$FamilyMemberUserSnippetCopyWithImpl<$Res>
    implements $FamilyMemberUserSnippetCopyWith<$Res> {
  _$FamilyMemberUserSnippetCopyWithImpl(this._self, this._then);

  final FamilyMemberUserSnippet _self;
  final $Res Function(FamilyMemberUserSnippet) _then;

/// Create a copy of FamilyMemberUserSnippet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? profilePictureUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,profilePictureUrl: freezed == profilePictureUrl ? _self.profilePictureUrl : profilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FamilyMemberUserSnippet].
extension FamilyMemberUserSnippetPatterns on FamilyMemberUserSnippet {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilyMemberUserSnippet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilyMemberUserSnippet() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilyMemberUserSnippet value)  $default,){
final _that = this;
switch (_that) {
case _FamilyMemberUserSnippet():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilyMemberUserSnippet value)?  $default,){
final _that = this;
switch (_that) {
case _FamilyMemberUserSnippet() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? profilePictureUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilyMemberUserSnippet() when $default != null:
return $default(_that.id,_that.name,_that.profilePictureUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? profilePictureUrl)  $default,) {final _that = this;
switch (_that) {
case _FamilyMemberUserSnippet():
return $default(_that.id,_that.name,_that.profilePictureUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? profilePictureUrl)?  $default,) {final _that = this;
switch (_that) {
case _FamilyMemberUserSnippet() when $default != null:
return $default(_that.id,_that.name,_that.profilePictureUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilyMemberUserSnippet implements FamilyMemberUserSnippet {
  const _FamilyMemberUserSnippet({required this.id, this.name, this.profilePictureUrl});
  factory _FamilyMemberUserSnippet.fromJson(Map<String, dynamic> json) => _$FamilyMemberUserSnippetFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? profilePictureUrl;

/// Create a copy of FamilyMemberUserSnippet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilyMemberUserSnippetCopyWith<_FamilyMemberUserSnippet> get copyWith => __$FamilyMemberUserSnippetCopyWithImpl<_FamilyMemberUserSnippet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilyMemberUserSnippetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilyMemberUserSnippet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.profilePictureUrl, profilePictureUrl) || other.profilePictureUrl == profilePictureUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,profilePictureUrl);

@override
String toString() {
  return 'FamilyMemberUserSnippet(id: $id, name: $name, profilePictureUrl: $profilePictureUrl)';
}


}

/// @nodoc
abstract mixin class _$FamilyMemberUserSnippetCopyWith<$Res> implements $FamilyMemberUserSnippetCopyWith<$Res> {
  factory _$FamilyMemberUserSnippetCopyWith(_FamilyMemberUserSnippet value, $Res Function(_FamilyMemberUserSnippet) _then) = __$FamilyMemberUserSnippetCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? profilePictureUrl
});




}
/// @nodoc
class __$FamilyMemberUserSnippetCopyWithImpl<$Res>
    implements _$FamilyMemberUserSnippetCopyWith<$Res> {
  __$FamilyMemberUserSnippetCopyWithImpl(this._self, this._then);

  final _FamilyMemberUserSnippet _self;
  final $Res Function(_FamilyMemberUserSnippet) _then;

/// Create a copy of FamilyMemberUserSnippet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? profilePictureUrl = freezed,}) {
  return _then(_FamilyMemberUserSnippet(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,profilePictureUrl: freezed == profilePictureUrl ? _self.profilePictureUrl : profilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FamilyCheckIn {

 String get id; String get circleId; String get memberId;@JsonKey(unknownEnumValue: FamilyCheckInStatus.safe) FamilyCheckInStatus get status; String? get message; double? get latitude; double? get longitude; String? get requestId; String? get hazardId; FamilyMemberSnippet? get member; DateTime? get createdAt;
/// Create a copy of FamilyCheckIn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyCheckInCopyWith<FamilyCheckIn> get copyWith => _$FamilyCheckInCopyWithImpl<FamilyCheckIn>(this as FamilyCheckIn, _$identity);

  /// Serializes this FamilyCheckIn to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilyCheckIn&&(identical(other.id, id) || other.id == id)&&(identical(other.circleId, circleId) || other.circleId == circleId)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.hazardId, hazardId) || other.hazardId == hazardId)&&(identical(other.member, member) || other.member == member)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,circleId,memberId,status,message,latitude,longitude,requestId,hazardId,member,createdAt);

@override
String toString() {
  return 'FamilyCheckIn(id: $id, circleId: $circleId, memberId: $memberId, status: $status, message: $message, latitude: $latitude, longitude: $longitude, requestId: $requestId, hazardId: $hazardId, member: $member, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FamilyCheckInCopyWith<$Res>  {
  factory $FamilyCheckInCopyWith(FamilyCheckIn value, $Res Function(FamilyCheckIn) _then) = _$FamilyCheckInCopyWithImpl;
@useResult
$Res call({
 String id, String circleId, String memberId,@JsonKey(unknownEnumValue: FamilyCheckInStatus.safe) FamilyCheckInStatus status, String? message, double? latitude, double? longitude, String? requestId, String? hazardId, FamilyMemberSnippet? member, DateTime? createdAt
});


$FamilyMemberSnippetCopyWith<$Res>? get member;

}
/// @nodoc
class _$FamilyCheckInCopyWithImpl<$Res>
    implements $FamilyCheckInCopyWith<$Res> {
  _$FamilyCheckInCopyWithImpl(this._self, this._then);

  final FamilyCheckIn _self;
  final $Res Function(FamilyCheckIn) _then;

/// Create a copy of FamilyCheckIn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? circleId = null,Object? memberId = null,Object? status = null,Object? message = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? requestId = freezed,Object? hazardId = freezed,Object? member = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,circleId: null == circleId ? _self.circleId : circleId // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FamilyCheckInStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,hazardId: freezed == hazardId ? _self.hazardId : hazardId // ignore: cast_nullable_to_non_nullable
as String?,member: freezed == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as FamilyMemberSnippet?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of FamilyCheckIn
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyMemberSnippetCopyWith<$Res>? get member {
    if (_self.member == null) {
    return null;
  }

  return $FamilyMemberSnippetCopyWith<$Res>(_self.member!, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// Adds pattern-matching-related methods to [FamilyCheckIn].
extension FamilyCheckInPatterns on FamilyCheckIn {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilyCheckIn value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilyCheckIn() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilyCheckIn value)  $default,){
final _that = this;
switch (_that) {
case _FamilyCheckIn():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilyCheckIn value)?  $default,){
final _that = this;
switch (_that) {
case _FamilyCheckIn() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String circleId,  String memberId, @JsonKey(unknownEnumValue: FamilyCheckInStatus.safe)  FamilyCheckInStatus status,  String? message,  double? latitude,  double? longitude,  String? requestId,  String? hazardId,  FamilyMemberSnippet? member,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilyCheckIn() when $default != null:
return $default(_that.id,_that.circleId,_that.memberId,_that.status,_that.message,_that.latitude,_that.longitude,_that.requestId,_that.hazardId,_that.member,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String circleId,  String memberId, @JsonKey(unknownEnumValue: FamilyCheckInStatus.safe)  FamilyCheckInStatus status,  String? message,  double? latitude,  double? longitude,  String? requestId,  String? hazardId,  FamilyMemberSnippet? member,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FamilyCheckIn():
return $default(_that.id,_that.circleId,_that.memberId,_that.status,_that.message,_that.latitude,_that.longitude,_that.requestId,_that.hazardId,_that.member,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String circleId,  String memberId, @JsonKey(unknownEnumValue: FamilyCheckInStatus.safe)  FamilyCheckInStatus status,  String? message,  double? latitude,  double? longitude,  String? requestId,  String? hazardId,  FamilyMemberSnippet? member,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FamilyCheckIn() when $default != null:
return $default(_that.id,_that.circleId,_that.memberId,_that.status,_that.message,_that.latitude,_that.longitude,_that.requestId,_that.hazardId,_that.member,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilyCheckIn implements FamilyCheckIn {
  const _FamilyCheckIn({required this.id, required this.circleId, required this.memberId, @JsonKey(unknownEnumValue: FamilyCheckInStatus.safe) this.status = FamilyCheckInStatus.safe, this.message, this.latitude, this.longitude, this.requestId, this.hazardId, this.member, this.createdAt});
  factory _FamilyCheckIn.fromJson(Map<String, dynamic> json) => _$FamilyCheckInFromJson(json);

@override final  String id;
@override final  String circleId;
@override final  String memberId;
@override@JsonKey(unknownEnumValue: FamilyCheckInStatus.safe) final  FamilyCheckInStatus status;
@override final  String? message;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? requestId;
@override final  String? hazardId;
@override final  FamilyMemberSnippet? member;
@override final  DateTime? createdAt;

/// Create a copy of FamilyCheckIn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilyCheckInCopyWith<_FamilyCheckIn> get copyWith => __$FamilyCheckInCopyWithImpl<_FamilyCheckIn>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilyCheckInToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilyCheckIn&&(identical(other.id, id) || other.id == id)&&(identical(other.circleId, circleId) || other.circleId == circleId)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.hazardId, hazardId) || other.hazardId == hazardId)&&(identical(other.member, member) || other.member == member)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,circleId,memberId,status,message,latitude,longitude,requestId,hazardId,member,createdAt);

@override
String toString() {
  return 'FamilyCheckIn(id: $id, circleId: $circleId, memberId: $memberId, status: $status, message: $message, latitude: $latitude, longitude: $longitude, requestId: $requestId, hazardId: $hazardId, member: $member, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FamilyCheckInCopyWith<$Res> implements $FamilyCheckInCopyWith<$Res> {
  factory _$FamilyCheckInCopyWith(_FamilyCheckIn value, $Res Function(_FamilyCheckIn) _then) = __$FamilyCheckInCopyWithImpl;
@override @useResult
$Res call({
 String id, String circleId, String memberId,@JsonKey(unknownEnumValue: FamilyCheckInStatus.safe) FamilyCheckInStatus status, String? message, double? latitude, double? longitude, String? requestId, String? hazardId, FamilyMemberSnippet? member, DateTime? createdAt
});


@override $FamilyMemberSnippetCopyWith<$Res>? get member;

}
/// @nodoc
class __$FamilyCheckInCopyWithImpl<$Res>
    implements _$FamilyCheckInCopyWith<$Res> {
  __$FamilyCheckInCopyWithImpl(this._self, this._then);

  final _FamilyCheckIn _self;
  final $Res Function(_FamilyCheckIn) _then;

/// Create a copy of FamilyCheckIn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? circleId = null,Object? memberId = null,Object? status = null,Object? message = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? requestId = freezed,Object? hazardId = freezed,Object? member = freezed,Object? createdAt = freezed,}) {
  return _then(_FamilyCheckIn(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,circleId: null == circleId ? _self.circleId : circleId // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FamilyCheckInStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,hazardId: freezed == hazardId ? _self.hazardId : hazardId // ignore: cast_nullable_to_non_nullable
as String?,member: freezed == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as FamilyMemberSnippet?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of FamilyCheckIn
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyMemberSnippetCopyWith<$Res>? get member {
    if (_self.member == null) {
    return null;
  }

  return $FamilyMemberSnippetCopyWith<$Res>(_self.member!, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// @nodoc
mixin _$FamilyCheckInRequest {

 String get id; String get circleId; String get requestedById; String? get hazardId; String? get message; FamilyMemberSnippet? get requestedBy; List<FamilyCheckIn> get checkIns; DateTime? get createdAt;
/// Create a copy of FamilyCheckInRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyCheckInRequestCopyWith<FamilyCheckInRequest> get copyWith => _$FamilyCheckInRequestCopyWithImpl<FamilyCheckInRequest>(this as FamilyCheckInRequest, _$identity);

  /// Serializes this FamilyCheckInRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilyCheckInRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.circleId, circleId) || other.circleId == circleId)&&(identical(other.requestedById, requestedById) || other.requestedById == requestedById)&&(identical(other.hazardId, hazardId) || other.hazardId == hazardId)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&const DeepCollectionEquality().equals(other.checkIns, checkIns)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,circleId,requestedById,hazardId,message,requestedBy,const DeepCollectionEquality().hash(checkIns),createdAt);

@override
String toString() {
  return 'FamilyCheckInRequest(id: $id, circleId: $circleId, requestedById: $requestedById, hazardId: $hazardId, message: $message, requestedBy: $requestedBy, checkIns: $checkIns, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FamilyCheckInRequestCopyWith<$Res>  {
  factory $FamilyCheckInRequestCopyWith(FamilyCheckInRequest value, $Res Function(FamilyCheckInRequest) _then) = _$FamilyCheckInRequestCopyWithImpl;
@useResult
$Res call({
 String id, String circleId, String requestedById, String? hazardId, String? message, FamilyMemberSnippet? requestedBy, List<FamilyCheckIn> checkIns, DateTime? createdAt
});


$FamilyMemberSnippetCopyWith<$Res>? get requestedBy;

}
/// @nodoc
class _$FamilyCheckInRequestCopyWithImpl<$Res>
    implements $FamilyCheckInRequestCopyWith<$Res> {
  _$FamilyCheckInRequestCopyWithImpl(this._self, this._then);

  final FamilyCheckInRequest _self;
  final $Res Function(FamilyCheckInRequest) _then;

/// Create a copy of FamilyCheckInRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? circleId = null,Object? requestedById = null,Object? hazardId = freezed,Object? message = freezed,Object? requestedBy = freezed,Object? checkIns = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,circleId: null == circleId ? _self.circleId : circleId // ignore: cast_nullable_to_non_nullable
as String,requestedById: null == requestedById ? _self.requestedById : requestedById // ignore: cast_nullable_to_non_nullable
as String,hazardId: freezed == hazardId ? _self.hazardId : hazardId // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,requestedBy: freezed == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as FamilyMemberSnippet?,checkIns: null == checkIns ? _self.checkIns : checkIns // ignore: cast_nullable_to_non_nullable
as List<FamilyCheckIn>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of FamilyCheckInRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyMemberSnippetCopyWith<$Res>? get requestedBy {
    if (_self.requestedBy == null) {
    return null;
  }

  return $FamilyMemberSnippetCopyWith<$Res>(_self.requestedBy!, (value) {
    return _then(_self.copyWith(requestedBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [FamilyCheckInRequest].
extension FamilyCheckInRequestPatterns on FamilyCheckInRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilyCheckInRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilyCheckInRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilyCheckInRequest value)  $default,){
final _that = this;
switch (_that) {
case _FamilyCheckInRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilyCheckInRequest value)?  $default,){
final _that = this;
switch (_that) {
case _FamilyCheckInRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String circleId,  String requestedById,  String? hazardId,  String? message,  FamilyMemberSnippet? requestedBy,  List<FamilyCheckIn> checkIns,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilyCheckInRequest() when $default != null:
return $default(_that.id,_that.circleId,_that.requestedById,_that.hazardId,_that.message,_that.requestedBy,_that.checkIns,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String circleId,  String requestedById,  String? hazardId,  String? message,  FamilyMemberSnippet? requestedBy,  List<FamilyCheckIn> checkIns,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FamilyCheckInRequest():
return $default(_that.id,_that.circleId,_that.requestedById,_that.hazardId,_that.message,_that.requestedBy,_that.checkIns,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String circleId,  String requestedById,  String? hazardId,  String? message,  FamilyMemberSnippet? requestedBy,  List<FamilyCheckIn> checkIns,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FamilyCheckInRequest() when $default != null:
return $default(_that.id,_that.circleId,_that.requestedById,_that.hazardId,_that.message,_that.requestedBy,_that.checkIns,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilyCheckInRequest implements FamilyCheckInRequest {
  const _FamilyCheckInRequest({required this.id, required this.circleId, required this.requestedById, this.hazardId, this.message, this.requestedBy, final  List<FamilyCheckIn> checkIns = const <FamilyCheckIn>[], this.createdAt}): _checkIns = checkIns;
  factory _FamilyCheckInRequest.fromJson(Map<String, dynamic> json) => _$FamilyCheckInRequestFromJson(json);

@override final  String id;
@override final  String circleId;
@override final  String requestedById;
@override final  String? hazardId;
@override final  String? message;
@override final  FamilyMemberSnippet? requestedBy;
 final  List<FamilyCheckIn> _checkIns;
@override@JsonKey() List<FamilyCheckIn> get checkIns {
  if (_checkIns is EqualUnmodifiableListView) return _checkIns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checkIns);
}

@override final  DateTime? createdAt;

/// Create a copy of FamilyCheckInRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilyCheckInRequestCopyWith<_FamilyCheckInRequest> get copyWith => __$FamilyCheckInRequestCopyWithImpl<_FamilyCheckInRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilyCheckInRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilyCheckInRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.circleId, circleId) || other.circleId == circleId)&&(identical(other.requestedById, requestedById) || other.requestedById == requestedById)&&(identical(other.hazardId, hazardId) || other.hazardId == hazardId)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&const DeepCollectionEquality().equals(other._checkIns, _checkIns)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,circleId,requestedById,hazardId,message,requestedBy,const DeepCollectionEquality().hash(_checkIns),createdAt);

@override
String toString() {
  return 'FamilyCheckInRequest(id: $id, circleId: $circleId, requestedById: $requestedById, hazardId: $hazardId, message: $message, requestedBy: $requestedBy, checkIns: $checkIns, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FamilyCheckInRequestCopyWith<$Res> implements $FamilyCheckInRequestCopyWith<$Res> {
  factory _$FamilyCheckInRequestCopyWith(_FamilyCheckInRequest value, $Res Function(_FamilyCheckInRequest) _then) = __$FamilyCheckInRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, String circleId, String requestedById, String? hazardId, String? message, FamilyMemberSnippet? requestedBy, List<FamilyCheckIn> checkIns, DateTime? createdAt
});


@override $FamilyMemberSnippetCopyWith<$Res>? get requestedBy;

}
/// @nodoc
class __$FamilyCheckInRequestCopyWithImpl<$Res>
    implements _$FamilyCheckInRequestCopyWith<$Res> {
  __$FamilyCheckInRequestCopyWithImpl(this._self, this._then);

  final _FamilyCheckInRequest _self;
  final $Res Function(_FamilyCheckInRequest) _then;

/// Create a copy of FamilyCheckInRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? circleId = null,Object? requestedById = null,Object? hazardId = freezed,Object? message = freezed,Object? requestedBy = freezed,Object? checkIns = null,Object? createdAt = freezed,}) {
  return _then(_FamilyCheckInRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,circleId: null == circleId ? _self.circleId : circleId // ignore: cast_nullable_to_non_nullable
as String,requestedById: null == requestedById ? _self.requestedById : requestedById // ignore: cast_nullable_to_non_nullable
as String,hazardId: freezed == hazardId ? _self.hazardId : hazardId // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,requestedBy: freezed == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as FamilyMemberSnippet?,checkIns: null == checkIns ? _self._checkIns : checkIns // ignore: cast_nullable_to_non_nullable
as List<FamilyCheckIn>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of FamilyCheckInRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyMemberSnippetCopyWith<$Res>? get requestedBy {
    if (_self.requestedBy == null) {
    return null;
  }

  return $FamilyMemberSnippetCopyWith<$Res>(_self.requestedBy!, (value) {
    return _then(_self.copyWith(requestedBy: value));
  });
}
}


/// @nodoc
mixin _$FamilySosEvent {

 String get id; String get circleId; String get memberId;@JsonKey(unknownEnumValue: FamilySosStatus.active) FamilySosStatus get status; double? get latitude; double? get longitude; String? get locationLabel; FamilyMemberSnippet? get member; List<FamilySosResponse> get responses; DateTime? get resolvedAt; DateTime? get createdAt;
/// Create a copy of FamilySosEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilySosEventCopyWith<FamilySosEvent> get copyWith => _$FamilySosEventCopyWithImpl<FamilySosEvent>(this as FamilySosEvent, _$identity);

  /// Serializes this FamilySosEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilySosEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.circleId, circleId) || other.circleId == circleId)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.status, status) || other.status == status)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationLabel, locationLabel) || other.locationLabel == locationLabel)&&(identical(other.member, member) || other.member == member)&&const DeepCollectionEquality().equals(other.responses, responses)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,circleId,memberId,status,latitude,longitude,locationLabel,member,const DeepCollectionEquality().hash(responses),resolvedAt,createdAt);

@override
String toString() {
  return 'FamilySosEvent(id: $id, circleId: $circleId, memberId: $memberId, status: $status, latitude: $latitude, longitude: $longitude, locationLabel: $locationLabel, member: $member, responses: $responses, resolvedAt: $resolvedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FamilySosEventCopyWith<$Res>  {
  factory $FamilySosEventCopyWith(FamilySosEvent value, $Res Function(FamilySosEvent) _then) = _$FamilySosEventCopyWithImpl;
@useResult
$Res call({
 String id, String circleId, String memberId,@JsonKey(unknownEnumValue: FamilySosStatus.active) FamilySosStatus status, double? latitude, double? longitude, String? locationLabel, FamilyMemberSnippet? member, List<FamilySosResponse> responses, DateTime? resolvedAt, DateTime? createdAt
});


$FamilyMemberSnippetCopyWith<$Res>? get member;

}
/// @nodoc
class _$FamilySosEventCopyWithImpl<$Res>
    implements $FamilySosEventCopyWith<$Res> {
  _$FamilySosEventCopyWithImpl(this._self, this._then);

  final FamilySosEvent _self;
  final $Res Function(FamilySosEvent) _then;

/// Create a copy of FamilySosEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? circleId = null,Object? memberId = null,Object? status = null,Object? latitude = freezed,Object? longitude = freezed,Object? locationLabel = freezed,Object? member = freezed,Object? responses = null,Object? resolvedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,circleId: null == circleId ? _self.circleId : circleId // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FamilySosStatus,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,locationLabel: freezed == locationLabel ? _self.locationLabel : locationLabel // ignore: cast_nullable_to_non_nullable
as String?,member: freezed == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as FamilyMemberSnippet?,responses: null == responses ? _self.responses : responses // ignore: cast_nullable_to_non_nullable
as List<FamilySosResponse>,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of FamilySosEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyMemberSnippetCopyWith<$Res>? get member {
    if (_self.member == null) {
    return null;
  }

  return $FamilyMemberSnippetCopyWith<$Res>(_self.member!, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// Adds pattern-matching-related methods to [FamilySosEvent].
extension FamilySosEventPatterns on FamilySosEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilySosEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilySosEvent() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilySosEvent value)  $default,){
final _that = this;
switch (_that) {
case _FamilySosEvent():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilySosEvent value)?  $default,){
final _that = this;
switch (_that) {
case _FamilySosEvent() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String circleId,  String memberId, @JsonKey(unknownEnumValue: FamilySosStatus.active)  FamilySosStatus status,  double? latitude,  double? longitude,  String? locationLabel,  FamilyMemberSnippet? member,  List<FamilySosResponse> responses,  DateTime? resolvedAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilySosEvent() when $default != null:
return $default(_that.id,_that.circleId,_that.memberId,_that.status,_that.latitude,_that.longitude,_that.locationLabel,_that.member,_that.responses,_that.resolvedAt,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String circleId,  String memberId, @JsonKey(unknownEnumValue: FamilySosStatus.active)  FamilySosStatus status,  double? latitude,  double? longitude,  String? locationLabel,  FamilyMemberSnippet? member,  List<FamilySosResponse> responses,  DateTime? resolvedAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FamilySosEvent():
return $default(_that.id,_that.circleId,_that.memberId,_that.status,_that.latitude,_that.longitude,_that.locationLabel,_that.member,_that.responses,_that.resolvedAt,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String circleId,  String memberId, @JsonKey(unknownEnumValue: FamilySosStatus.active)  FamilySosStatus status,  double? latitude,  double? longitude,  String? locationLabel,  FamilyMemberSnippet? member,  List<FamilySosResponse> responses,  DateTime? resolvedAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FamilySosEvent() when $default != null:
return $default(_that.id,_that.circleId,_that.memberId,_that.status,_that.latitude,_that.longitude,_that.locationLabel,_that.member,_that.responses,_that.resolvedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilySosEvent implements FamilySosEvent {
  const _FamilySosEvent({required this.id, required this.circleId, required this.memberId, @JsonKey(unknownEnumValue: FamilySosStatus.active) this.status = FamilySosStatus.active, this.latitude, this.longitude, this.locationLabel, this.member, final  List<FamilySosResponse> responses = const <FamilySosResponse>[], this.resolvedAt, this.createdAt}): _responses = responses;
  factory _FamilySosEvent.fromJson(Map<String, dynamic> json) => _$FamilySosEventFromJson(json);

@override final  String id;
@override final  String circleId;
@override final  String memberId;
@override@JsonKey(unknownEnumValue: FamilySosStatus.active) final  FamilySosStatus status;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? locationLabel;
@override final  FamilyMemberSnippet? member;
 final  List<FamilySosResponse> _responses;
@override@JsonKey() List<FamilySosResponse> get responses {
  if (_responses is EqualUnmodifiableListView) return _responses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_responses);
}

@override final  DateTime? resolvedAt;
@override final  DateTime? createdAt;

/// Create a copy of FamilySosEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilySosEventCopyWith<_FamilySosEvent> get copyWith => __$FamilySosEventCopyWithImpl<_FamilySosEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilySosEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilySosEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.circleId, circleId) || other.circleId == circleId)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.status, status) || other.status == status)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationLabel, locationLabel) || other.locationLabel == locationLabel)&&(identical(other.member, member) || other.member == member)&&const DeepCollectionEquality().equals(other._responses, _responses)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,circleId,memberId,status,latitude,longitude,locationLabel,member,const DeepCollectionEquality().hash(_responses),resolvedAt,createdAt);

@override
String toString() {
  return 'FamilySosEvent(id: $id, circleId: $circleId, memberId: $memberId, status: $status, latitude: $latitude, longitude: $longitude, locationLabel: $locationLabel, member: $member, responses: $responses, resolvedAt: $resolvedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FamilySosEventCopyWith<$Res> implements $FamilySosEventCopyWith<$Res> {
  factory _$FamilySosEventCopyWith(_FamilySosEvent value, $Res Function(_FamilySosEvent) _then) = __$FamilySosEventCopyWithImpl;
@override @useResult
$Res call({
 String id, String circleId, String memberId,@JsonKey(unknownEnumValue: FamilySosStatus.active) FamilySosStatus status, double? latitude, double? longitude, String? locationLabel, FamilyMemberSnippet? member, List<FamilySosResponse> responses, DateTime? resolvedAt, DateTime? createdAt
});


@override $FamilyMemberSnippetCopyWith<$Res>? get member;

}
/// @nodoc
class __$FamilySosEventCopyWithImpl<$Res>
    implements _$FamilySosEventCopyWith<$Res> {
  __$FamilySosEventCopyWithImpl(this._self, this._then);

  final _FamilySosEvent _self;
  final $Res Function(_FamilySosEvent) _then;

/// Create a copy of FamilySosEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? circleId = null,Object? memberId = null,Object? status = null,Object? latitude = freezed,Object? longitude = freezed,Object? locationLabel = freezed,Object? member = freezed,Object? responses = null,Object? resolvedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_FamilySosEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,circleId: null == circleId ? _self.circleId : circleId // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FamilySosStatus,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,locationLabel: freezed == locationLabel ? _self.locationLabel : locationLabel // ignore: cast_nullable_to_non_nullable
as String?,member: freezed == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as FamilyMemberSnippet?,responses: null == responses ? _self._responses : responses // ignore: cast_nullable_to_non_nullable
as List<FamilySosResponse>,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of FamilySosEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyMemberSnippetCopyWith<$Res>? get member {
    if (_self.member == null) {
    return null;
  }

  return $FamilyMemberSnippetCopyWith<$Res>(_self.member!, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// @nodoc
mixin _$FamilyLocationRequest {

 String get id; String get circleId; String get requesterId; String get targetMemberId;@JsonKey(unknownEnumValue: FamilyLocationRequestStatus.pending) FamilyLocationRequestStatus get status; String? get message; FamilyMemberSnippet? get requester; DateTime? get respondedAt; DateTime? get expiresAt; DateTime? get createdAt;
/// Create a copy of FamilyLocationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyLocationRequestCopyWith<FamilyLocationRequest> get copyWith => _$FamilyLocationRequestCopyWithImpl<FamilyLocationRequest>(this as FamilyLocationRequest, _$identity);

  /// Serializes this FamilyLocationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilyLocationRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.circleId, circleId) || other.circleId == circleId)&&(identical(other.requesterId, requesterId) || other.requesterId == requesterId)&&(identical(other.targetMemberId, targetMemberId) || other.targetMemberId == targetMemberId)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,circleId,requesterId,targetMemberId,status,message,requester,respondedAt,expiresAt,createdAt);

@override
String toString() {
  return 'FamilyLocationRequest(id: $id, circleId: $circleId, requesterId: $requesterId, targetMemberId: $targetMemberId, status: $status, message: $message, requester: $requester, respondedAt: $respondedAt, expiresAt: $expiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FamilyLocationRequestCopyWith<$Res>  {
  factory $FamilyLocationRequestCopyWith(FamilyLocationRequest value, $Res Function(FamilyLocationRequest) _then) = _$FamilyLocationRequestCopyWithImpl;
@useResult
$Res call({
 String id, String circleId, String requesterId, String targetMemberId,@JsonKey(unknownEnumValue: FamilyLocationRequestStatus.pending) FamilyLocationRequestStatus status, String? message, FamilyMemberSnippet? requester, DateTime? respondedAt, DateTime? expiresAt, DateTime? createdAt
});


$FamilyMemberSnippetCopyWith<$Res>? get requester;

}
/// @nodoc
class _$FamilyLocationRequestCopyWithImpl<$Res>
    implements $FamilyLocationRequestCopyWith<$Res> {
  _$FamilyLocationRequestCopyWithImpl(this._self, this._then);

  final FamilyLocationRequest _self;
  final $Res Function(FamilyLocationRequest) _then;

/// Create a copy of FamilyLocationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? circleId = null,Object? requesterId = null,Object? targetMemberId = null,Object? status = null,Object? message = freezed,Object? requester = freezed,Object? respondedAt = freezed,Object? expiresAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,circleId: null == circleId ? _self.circleId : circleId // ignore: cast_nullable_to_non_nullable
as String,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as String,targetMemberId: null == targetMemberId ? _self.targetMemberId : targetMemberId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FamilyLocationRequestStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,requester: freezed == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as FamilyMemberSnippet?,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of FamilyLocationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyMemberSnippetCopyWith<$Res>? get requester {
    if (_self.requester == null) {
    return null;
  }

  return $FamilyMemberSnippetCopyWith<$Res>(_self.requester!, (value) {
    return _then(_self.copyWith(requester: value));
  });
}
}


/// Adds pattern-matching-related methods to [FamilyLocationRequest].
extension FamilyLocationRequestPatterns on FamilyLocationRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilyLocationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilyLocationRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilyLocationRequest value)  $default,){
final _that = this;
switch (_that) {
case _FamilyLocationRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilyLocationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _FamilyLocationRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String circleId,  String requesterId,  String targetMemberId, @JsonKey(unknownEnumValue: FamilyLocationRequestStatus.pending)  FamilyLocationRequestStatus status,  String? message,  FamilyMemberSnippet? requester,  DateTime? respondedAt,  DateTime? expiresAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilyLocationRequest() when $default != null:
return $default(_that.id,_that.circleId,_that.requesterId,_that.targetMemberId,_that.status,_that.message,_that.requester,_that.respondedAt,_that.expiresAt,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String circleId,  String requesterId,  String targetMemberId, @JsonKey(unknownEnumValue: FamilyLocationRequestStatus.pending)  FamilyLocationRequestStatus status,  String? message,  FamilyMemberSnippet? requester,  DateTime? respondedAt,  DateTime? expiresAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FamilyLocationRequest():
return $default(_that.id,_that.circleId,_that.requesterId,_that.targetMemberId,_that.status,_that.message,_that.requester,_that.respondedAt,_that.expiresAt,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String circleId,  String requesterId,  String targetMemberId, @JsonKey(unknownEnumValue: FamilyLocationRequestStatus.pending)  FamilyLocationRequestStatus status,  String? message,  FamilyMemberSnippet? requester,  DateTime? respondedAt,  DateTime? expiresAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FamilyLocationRequest() when $default != null:
return $default(_that.id,_that.circleId,_that.requesterId,_that.targetMemberId,_that.status,_that.message,_that.requester,_that.respondedAt,_that.expiresAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilyLocationRequest implements FamilyLocationRequest {
  const _FamilyLocationRequest({required this.id, required this.circleId, required this.requesterId, required this.targetMemberId, @JsonKey(unknownEnumValue: FamilyLocationRequestStatus.pending) this.status = FamilyLocationRequestStatus.pending, this.message, this.requester, this.respondedAt, this.expiresAt, this.createdAt});
  factory _FamilyLocationRequest.fromJson(Map<String, dynamic> json) => _$FamilyLocationRequestFromJson(json);

@override final  String id;
@override final  String circleId;
@override final  String requesterId;
@override final  String targetMemberId;
@override@JsonKey(unknownEnumValue: FamilyLocationRequestStatus.pending) final  FamilyLocationRequestStatus status;
@override final  String? message;
@override final  FamilyMemberSnippet? requester;
@override final  DateTime? respondedAt;
@override final  DateTime? expiresAt;
@override final  DateTime? createdAt;

/// Create a copy of FamilyLocationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilyLocationRequestCopyWith<_FamilyLocationRequest> get copyWith => __$FamilyLocationRequestCopyWithImpl<_FamilyLocationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilyLocationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilyLocationRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.circleId, circleId) || other.circleId == circleId)&&(identical(other.requesterId, requesterId) || other.requesterId == requesterId)&&(identical(other.targetMemberId, targetMemberId) || other.targetMemberId == targetMemberId)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,circleId,requesterId,targetMemberId,status,message,requester,respondedAt,expiresAt,createdAt);

@override
String toString() {
  return 'FamilyLocationRequest(id: $id, circleId: $circleId, requesterId: $requesterId, targetMemberId: $targetMemberId, status: $status, message: $message, requester: $requester, respondedAt: $respondedAt, expiresAt: $expiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FamilyLocationRequestCopyWith<$Res> implements $FamilyLocationRequestCopyWith<$Res> {
  factory _$FamilyLocationRequestCopyWith(_FamilyLocationRequest value, $Res Function(_FamilyLocationRequest) _then) = __$FamilyLocationRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, String circleId, String requesterId, String targetMemberId,@JsonKey(unknownEnumValue: FamilyLocationRequestStatus.pending) FamilyLocationRequestStatus status, String? message, FamilyMemberSnippet? requester, DateTime? respondedAt, DateTime? expiresAt, DateTime? createdAt
});


@override $FamilyMemberSnippetCopyWith<$Res>? get requester;

}
/// @nodoc
class __$FamilyLocationRequestCopyWithImpl<$Res>
    implements _$FamilyLocationRequestCopyWith<$Res> {
  __$FamilyLocationRequestCopyWithImpl(this._self, this._then);

  final _FamilyLocationRequest _self;
  final $Res Function(_FamilyLocationRequest) _then;

/// Create a copy of FamilyLocationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? circleId = null,Object? requesterId = null,Object? targetMemberId = null,Object? status = null,Object? message = freezed,Object? requester = freezed,Object? respondedAt = freezed,Object? expiresAt = freezed,Object? createdAt = freezed,}) {
  return _then(_FamilyLocationRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,circleId: null == circleId ? _self.circleId : circleId // ignore: cast_nullable_to_non_nullable
as String,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as String,targetMemberId: null == targetMemberId ? _self.targetMemberId : targetMemberId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FamilyLocationRequestStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,requester: freezed == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as FamilyMemberSnippet?,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of FamilyLocationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyMemberSnippetCopyWith<$Res>? get requester {
    if (_self.requester == null) {
    return null;
  }

  return $FamilyMemberSnippetCopyWith<$Res>(_self.requester!, (value) {
    return _then(_self.copyWith(requester: value));
  });
}
}


/// @nodoc
mixin _$FamilySosResponse {

 String get id; String get sosEventId; String get memberId;@JsonKey(unknownEnumValue: FamilySosResponseType.seen) FamilySosResponseType get type; FamilyMemberSnippet? get member; DateTime? get createdAt;
/// Create a copy of FamilySosResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilySosResponseCopyWith<FamilySosResponse> get copyWith => _$FamilySosResponseCopyWithImpl<FamilySosResponse>(this as FamilySosResponse, _$identity);

  /// Serializes this FamilySosResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilySosResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.sosEventId, sosEventId) || other.sosEventId == sosEventId)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.type, type) || other.type == type)&&(identical(other.member, member) || other.member == member)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sosEventId,memberId,type,member,createdAt);

@override
String toString() {
  return 'FamilySosResponse(id: $id, sosEventId: $sosEventId, memberId: $memberId, type: $type, member: $member, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FamilySosResponseCopyWith<$Res>  {
  factory $FamilySosResponseCopyWith(FamilySosResponse value, $Res Function(FamilySosResponse) _then) = _$FamilySosResponseCopyWithImpl;
@useResult
$Res call({
 String id, String sosEventId, String memberId,@JsonKey(unknownEnumValue: FamilySosResponseType.seen) FamilySosResponseType type, FamilyMemberSnippet? member, DateTime? createdAt
});


$FamilyMemberSnippetCopyWith<$Res>? get member;

}
/// @nodoc
class _$FamilySosResponseCopyWithImpl<$Res>
    implements $FamilySosResponseCopyWith<$Res> {
  _$FamilySosResponseCopyWithImpl(this._self, this._then);

  final FamilySosResponse _self;
  final $Res Function(FamilySosResponse) _then;

/// Create a copy of FamilySosResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sosEventId = null,Object? memberId = null,Object? type = null,Object? member = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sosEventId: null == sosEventId ? _self.sosEventId : sosEventId // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FamilySosResponseType,member: freezed == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as FamilyMemberSnippet?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of FamilySosResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyMemberSnippetCopyWith<$Res>? get member {
    if (_self.member == null) {
    return null;
  }

  return $FamilyMemberSnippetCopyWith<$Res>(_self.member!, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// Adds pattern-matching-related methods to [FamilySosResponse].
extension FamilySosResponsePatterns on FamilySosResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilySosResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilySosResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilySosResponse value)  $default,){
final _that = this;
switch (_that) {
case _FamilySosResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilySosResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FamilySosResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sosEventId,  String memberId, @JsonKey(unknownEnumValue: FamilySosResponseType.seen)  FamilySosResponseType type,  FamilyMemberSnippet? member,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilySosResponse() when $default != null:
return $default(_that.id,_that.sosEventId,_that.memberId,_that.type,_that.member,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sosEventId,  String memberId, @JsonKey(unknownEnumValue: FamilySosResponseType.seen)  FamilySosResponseType type,  FamilyMemberSnippet? member,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FamilySosResponse():
return $default(_that.id,_that.sosEventId,_that.memberId,_that.type,_that.member,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sosEventId,  String memberId, @JsonKey(unknownEnumValue: FamilySosResponseType.seen)  FamilySosResponseType type,  FamilyMemberSnippet? member,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FamilySosResponse() when $default != null:
return $default(_that.id,_that.sosEventId,_that.memberId,_that.type,_that.member,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilySosResponse implements FamilySosResponse {
  const _FamilySosResponse({required this.id, required this.sosEventId, required this.memberId, @JsonKey(unknownEnumValue: FamilySosResponseType.seen) this.type = FamilySosResponseType.seen, this.member, this.createdAt});
  factory _FamilySosResponse.fromJson(Map<String, dynamic> json) => _$FamilySosResponseFromJson(json);

@override final  String id;
@override final  String sosEventId;
@override final  String memberId;
@override@JsonKey(unknownEnumValue: FamilySosResponseType.seen) final  FamilySosResponseType type;
@override final  FamilyMemberSnippet? member;
@override final  DateTime? createdAt;

/// Create a copy of FamilySosResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilySosResponseCopyWith<_FamilySosResponse> get copyWith => __$FamilySosResponseCopyWithImpl<_FamilySosResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilySosResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilySosResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.sosEventId, sosEventId) || other.sosEventId == sosEventId)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.type, type) || other.type == type)&&(identical(other.member, member) || other.member == member)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sosEventId,memberId,type,member,createdAt);

@override
String toString() {
  return 'FamilySosResponse(id: $id, sosEventId: $sosEventId, memberId: $memberId, type: $type, member: $member, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FamilySosResponseCopyWith<$Res> implements $FamilySosResponseCopyWith<$Res> {
  factory _$FamilySosResponseCopyWith(_FamilySosResponse value, $Res Function(_FamilySosResponse) _then) = __$FamilySosResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String sosEventId, String memberId,@JsonKey(unknownEnumValue: FamilySosResponseType.seen) FamilySosResponseType type, FamilyMemberSnippet? member, DateTime? createdAt
});


@override $FamilyMemberSnippetCopyWith<$Res>? get member;

}
/// @nodoc
class __$FamilySosResponseCopyWithImpl<$Res>
    implements _$FamilySosResponseCopyWith<$Res> {
  __$FamilySosResponseCopyWithImpl(this._self, this._then);

  final _FamilySosResponse _self;
  final $Res Function(_FamilySosResponse) _then;

/// Create a copy of FamilySosResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sosEventId = null,Object? memberId = null,Object? type = null,Object? member = freezed,Object? createdAt = freezed,}) {
  return _then(_FamilySosResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sosEventId: null == sosEventId ? _self.sosEventId : sosEventId // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FamilySosResponseType,member: freezed == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as FamilyMemberSnippet?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of FamilySosResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyMemberSnippetCopyWith<$Res>? get member {
    if (_self.member == null) {
    return null;
  }

  return $FamilyMemberSnippetCopyWith<$Res>(_self.member!, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}

// dart format on
