// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUser {

/// The user's unique identifier.
 String? get id;/// The user's display name.
 String? get name;/// The user's email address.
 String? get email;/// The experience points the user has accumulated.
 int get xpPoints;/// The user's reliability score, ranging from 0.0 to 1.0.
 double get reliabilityScore;/// The number of hazards the user has viewed.
 int get hazardsViewedCount;/// The number of hazards the user has reported.
 int get hazardsReportedCount;/// The number of upvotes the user has received on their reports.
 int get upvotesReceivedCount;/// The timestamp when the user account was created.
 DateTime? get createdAt;
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUserCopyWith<AppUser> get copyWith => _$AppUserCopyWithImpl<AppUser>(this as AppUser, _$identity);

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.xpPoints, xpPoints) || other.xpPoints == xpPoints)&&(identical(other.reliabilityScore, reliabilityScore) || other.reliabilityScore == reliabilityScore)&&(identical(other.hazardsViewedCount, hazardsViewedCount) || other.hazardsViewedCount == hazardsViewedCount)&&(identical(other.hazardsReportedCount, hazardsReportedCount) || other.hazardsReportedCount == hazardsReportedCount)&&(identical(other.upvotesReceivedCount, upvotesReceivedCount) || other.upvotesReceivedCount == upvotesReceivedCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,xpPoints,reliabilityScore,hazardsViewedCount,hazardsReportedCount,upvotesReceivedCount,createdAt);

@override
String toString() {
  return 'AppUser(id: $id, name: $name, email: $email, xpPoints: $xpPoints, reliabilityScore: $reliabilityScore, hazardsViewedCount: $hazardsViewedCount, hazardsReportedCount: $hazardsReportedCount, upvotesReceivedCount: $upvotesReceivedCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AppUserCopyWith<$Res>  {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) _then) = _$AppUserCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? email, int xpPoints, double reliabilityScore, int hazardsViewedCount, int hazardsReportedCount, int upvotesReceivedCount, DateTime? createdAt
});




}
/// @nodoc
class _$AppUserCopyWithImpl<$Res>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._self, this._then);

  final AppUser _self;
  final $Res Function(AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? xpPoints = null,Object? reliabilityScore = null,Object? hazardsViewedCount = null,Object? hazardsReportedCount = null,Object? upvotesReceivedCount = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,xpPoints: null == xpPoints ? _self.xpPoints : xpPoints // ignore: cast_nullable_to_non_nullable
as int,reliabilityScore: null == reliabilityScore ? _self.reliabilityScore : reliabilityScore // ignore: cast_nullable_to_non_nullable
as double,hazardsViewedCount: null == hazardsViewedCount ? _self.hazardsViewedCount : hazardsViewedCount // ignore: cast_nullable_to_non_nullable
as int,hazardsReportedCount: null == hazardsReportedCount ? _self.hazardsReportedCount : hazardsReportedCount // ignore: cast_nullable_to_non_nullable
as int,upvotesReceivedCount: null == upvotesReceivedCount ? _self.upvotesReceivedCount : upvotesReceivedCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppUser].
extension AppUserPatterns on AppUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUser value)  $default,){
final _that = this;
switch (_that) {
case _AppUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUser value)?  $default,){
final _that = this;
switch (_that) {
case _AppUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? email,  int xpPoints,  double reliabilityScore,  int hazardsViewedCount,  int hazardsReportedCount,  int upvotesReceivedCount,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.xpPoints,_that.reliabilityScore,_that.hazardsViewedCount,_that.hazardsReportedCount,_that.upvotesReceivedCount,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? email,  int xpPoints,  double reliabilityScore,  int hazardsViewedCount,  int hazardsReportedCount,  int upvotesReceivedCount,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _AppUser():
return $default(_that.id,_that.name,_that.email,_that.xpPoints,_that.reliabilityScore,_that.hazardsViewedCount,_that.hazardsReportedCount,_that.upvotesReceivedCount,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? email,  int xpPoints,  double reliabilityScore,  int hazardsViewedCount,  int hazardsReportedCount,  int upvotesReceivedCount,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.xpPoints,_that.reliabilityScore,_that.hazardsViewedCount,_that.hazardsReportedCount,_that.upvotesReceivedCount,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUser implements AppUser {
  const _AppUser({this.id, this.name, this.email, this.xpPoints = 0, this.reliabilityScore = 0.0, this.hazardsViewedCount = 0, this.hazardsReportedCount = 0, this.upvotesReceivedCount = 0, this.createdAt});
  factory _AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

/// The user's unique identifier.
@override final  String? id;
/// The user's display name.
@override final  String? name;
/// The user's email address.
@override final  String? email;
/// The experience points the user has accumulated.
@override@JsonKey() final  int xpPoints;
/// The user's reliability score, ranging from 0.0 to 1.0.
@override@JsonKey() final  double reliabilityScore;
/// The number of hazards the user has viewed.
@override@JsonKey() final  int hazardsViewedCount;
/// The number of hazards the user has reported.
@override@JsonKey() final  int hazardsReportedCount;
/// The number of upvotes the user has received on their reports.
@override@JsonKey() final  int upvotesReceivedCount;
/// The timestamp when the user account was created.
@override final  DateTime? createdAt;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUserCopyWith<_AppUser> get copyWith => __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.xpPoints, xpPoints) || other.xpPoints == xpPoints)&&(identical(other.reliabilityScore, reliabilityScore) || other.reliabilityScore == reliabilityScore)&&(identical(other.hazardsViewedCount, hazardsViewedCount) || other.hazardsViewedCount == hazardsViewedCount)&&(identical(other.hazardsReportedCount, hazardsReportedCount) || other.hazardsReportedCount == hazardsReportedCount)&&(identical(other.upvotesReceivedCount, upvotesReceivedCount) || other.upvotesReceivedCount == upvotesReceivedCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,xpPoints,reliabilityScore,hazardsViewedCount,hazardsReportedCount,upvotesReceivedCount,createdAt);

@override
String toString() {
  return 'AppUser(id: $id, name: $name, email: $email, xpPoints: $xpPoints, reliabilityScore: $reliabilityScore, hazardsViewedCount: $hazardsViewedCount, hazardsReportedCount: $hazardsReportedCount, upvotesReceivedCount: $upvotesReceivedCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) _then) = __$AppUserCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? email, int xpPoints, double reliabilityScore, int hazardsViewedCount, int hazardsReportedCount, int upvotesReceivedCount, DateTime? createdAt
});




}
/// @nodoc
class __$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(this._self, this._then);

  final _AppUser _self;
  final $Res Function(_AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? xpPoints = null,Object? reliabilityScore = null,Object? hazardsViewedCount = null,Object? hazardsReportedCount = null,Object? upvotesReceivedCount = null,Object? createdAt = freezed,}) {
  return _then(_AppUser(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,xpPoints: null == xpPoints ? _self.xpPoints : xpPoints // ignore: cast_nullable_to_non_nullable
as int,reliabilityScore: null == reliabilityScore ? _self.reliabilityScore : reliabilityScore // ignore: cast_nullable_to_non_nullable
as double,hazardsViewedCount: null == hazardsViewedCount ? _self.hazardsViewedCount : hazardsViewedCount // ignore: cast_nullable_to_non_nullable
as int,hazardsReportedCount: null == hazardsReportedCount ? _self.hazardsReportedCount : hazardsReportedCount // ignore: cast_nullable_to_non_nullable
as int,upvotesReceivedCount: null == upvotesReceivedCount ? _self.upvotesReceivedCount : upvotesReceivedCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
