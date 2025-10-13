// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hazard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Hazard {

/// The id of the hazard.
 String? get id;/// The title of the hazard.
 String? get title;/// The detailed description of the hazard.
 String? get description;/// The short description of the hazard.
 String? get shortDescription;/// Whether the hazard is visible to others.
 bool get visibility;/// The severity level of the hazard as per user input or source.
 HazardSeverity? get severity;/// The latitude of the hazard location.
 double? get latitude;/// The longitude of the hazard location.
 double? get longitude;/// The id of the category the hazard belongs to.
 String? get categoryId;/// The category the hazard belongs to.
 HazardCategory? get category;/// The source details of the hazard.
 HazardSource? get source;/// The AI-generated summary of the hazard.
 String? get aiSummary;/// The AI-generated feedback on the hazard.
 String? get aiFeedback;/// The AI-determined severity of the hazard.
 HazardSeverity? get aiSeverity;/// The AI-determined confidence level of the hazard.
 AIConfidence? get aiConfidence;/// The user who reported the hazard.
 AppUser? get reportedBy;/// The vote type (upvote or downvote) by the current user.
 HazardVoteType? get userVoteType;/// The total number of upvotes for the hazard.
 int get upvoteCount;/// The total number of downvotes for the hazard.
 int get downvoteCount;/// The date and time when the hazard occurred.
 DateTime? get occurredAt;/// The date and time when the hazard was reported.
 DateTime? get createdAt;/// The date and time when the hazard was last updated.
 DateTime? get updatedAt;/// The date and time when the hazard expires.
 DateTime? get expiresAt;
/// Create a copy of Hazard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HazardCopyWith<Hazard> get copyWith => _$HazardCopyWithImpl<Hazard>(this as Hazard, _$identity);

  /// Serializes this Hazard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hazard&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary)&&(identical(other.aiFeedback, aiFeedback) || other.aiFeedback == aiFeedback)&&(identical(other.aiSeverity, aiSeverity) || other.aiSeverity == aiSeverity)&&(identical(other.aiConfidence, aiConfidence) || other.aiConfidence == aiConfidence)&&(identical(other.reportedBy, reportedBy) || other.reportedBy == reportedBy)&&(identical(other.userVoteType, userVoteType) || other.userVoteType == userVoteType)&&(identical(other.upvoteCount, upvoteCount) || other.upvoteCount == upvoteCount)&&(identical(other.downvoteCount, downvoteCount) || other.downvoteCount == downvoteCount)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,shortDescription,visibility,severity,latitude,longitude,categoryId,category,source,aiSummary,aiFeedback,aiSeverity,aiConfidence,reportedBy,userVoteType,upvoteCount,downvoteCount,occurredAt,createdAt,updatedAt,expiresAt]);

@override
String toString() {
  return 'Hazard(id: $id, title: $title, description: $description, shortDescription: $shortDescription, visibility: $visibility, severity: $severity, latitude: $latitude, longitude: $longitude, categoryId: $categoryId, category: $category, source: $source, aiSummary: $aiSummary, aiFeedback: $aiFeedback, aiSeverity: $aiSeverity, aiConfidence: $aiConfidence, reportedBy: $reportedBy, userVoteType: $userVoteType, upvoteCount: $upvoteCount, downvoteCount: $downvoteCount, occurredAt: $occurredAt, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $HazardCopyWith<$Res>  {
  factory $HazardCopyWith(Hazard value, $Res Function(Hazard) _then) = _$HazardCopyWithImpl;
@useResult
$Res call({
 String? id, String? title, String? description, String? shortDescription, bool visibility, HazardSeverity? severity, double? latitude, double? longitude, String? categoryId, HazardCategory? category, HazardSource? source, String? aiSummary, String? aiFeedback, HazardSeverity? aiSeverity, AIConfidence? aiConfidence, AppUser? reportedBy, HazardVoteType? userVoteType, int upvoteCount, int downvoteCount, DateTime? occurredAt, DateTime? createdAt, DateTime? updatedAt, DateTime? expiresAt
});


$HazardCategoryCopyWith<$Res>? get category;$HazardSourceCopyWith<$Res>? get source;$AppUserCopyWith<$Res>? get reportedBy;

}
/// @nodoc
class _$HazardCopyWithImpl<$Res>
    implements $HazardCopyWith<$Res> {
  _$HazardCopyWithImpl(this._self, this._then);

  final Hazard _self;
  final $Res Function(Hazard) _then;

/// Create a copy of Hazard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? shortDescription = freezed,Object? visibility = null,Object? severity = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? categoryId = freezed,Object? category = freezed,Object? source = freezed,Object? aiSummary = freezed,Object? aiFeedback = freezed,Object? aiSeverity = freezed,Object? aiConfidence = freezed,Object? reportedBy = freezed,Object? userVoteType = freezed,Object? upvoteCount = null,Object? downvoteCount = null,Object? occurredAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as bool,severity: freezed == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as HazardSeverity?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HazardCategory?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as HazardSource?,aiSummary: freezed == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String?,aiFeedback: freezed == aiFeedback ? _self.aiFeedback : aiFeedback // ignore: cast_nullable_to_non_nullable
as String?,aiSeverity: freezed == aiSeverity ? _self.aiSeverity : aiSeverity // ignore: cast_nullable_to_non_nullable
as HazardSeverity?,aiConfidence: freezed == aiConfidence ? _self.aiConfidence : aiConfidence // ignore: cast_nullable_to_non_nullable
as AIConfidence?,reportedBy: freezed == reportedBy ? _self.reportedBy : reportedBy // ignore: cast_nullable_to_non_nullable
as AppUser?,userVoteType: freezed == userVoteType ? _self.userVoteType : userVoteType // ignore: cast_nullable_to_non_nullable
as HazardVoteType?,upvoteCount: null == upvoteCount ? _self.upvoteCount : upvoteCount // ignore: cast_nullable_to_non_nullable
as int,downvoteCount: null == downvoteCount ? _self.downvoteCount : downvoteCount // ignore: cast_nullable_to_non_nullable
as int,occurredAt: freezed == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Hazard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $HazardCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Hazard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardSourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $HazardSourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of Hazard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserCopyWith<$Res>? get reportedBy {
    if (_self.reportedBy == null) {
    return null;
  }

  return $AppUserCopyWith<$Res>(_self.reportedBy!, (value) {
    return _then(_self.copyWith(reportedBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [Hazard].
extension HazardPatterns on Hazard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hazard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hazard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hazard value)  $default,){
final _that = this;
switch (_that) {
case _Hazard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hazard value)?  $default,){
final _that = this;
switch (_that) {
case _Hazard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? title,  String? description,  String? shortDescription,  bool visibility,  HazardSeverity? severity,  double? latitude,  double? longitude,  String? categoryId,  HazardCategory? category,  HazardSource? source,  String? aiSummary,  String? aiFeedback,  HazardSeverity? aiSeverity,  AIConfidence? aiConfidence,  AppUser? reportedBy,  HazardVoteType? userVoteType,  int upvoteCount,  int downvoteCount,  DateTime? occurredAt,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hazard() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.shortDescription,_that.visibility,_that.severity,_that.latitude,_that.longitude,_that.categoryId,_that.category,_that.source,_that.aiSummary,_that.aiFeedback,_that.aiSeverity,_that.aiConfidence,_that.reportedBy,_that.userVoteType,_that.upvoteCount,_that.downvoteCount,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? title,  String? description,  String? shortDescription,  bool visibility,  HazardSeverity? severity,  double? latitude,  double? longitude,  String? categoryId,  HazardCategory? category,  HazardSource? source,  String? aiSummary,  String? aiFeedback,  HazardSeverity? aiSeverity,  AIConfidence? aiConfidence,  AppUser? reportedBy,  HazardVoteType? userVoteType,  int upvoteCount,  int downvoteCount,  DateTime? occurredAt,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _Hazard():
return $default(_that.id,_that.title,_that.description,_that.shortDescription,_that.visibility,_that.severity,_that.latitude,_that.longitude,_that.categoryId,_that.category,_that.source,_that.aiSummary,_that.aiFeedback,_that.aiSeverity,_that.aiConfidence,_that.reportedBy,_that.userVoteType,_that.upvoteCount,_that.downvoteCount,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? title,  String? description,  String? shortDescription,  bool visibility,  HazardSeverity? severity,  double? latitude,  double? longitude,  String? categoryId,  HazardCategory? category,  HazardSource? source,  String? aiSummary,  String? aiFeedback,  HazardSeverity? aiSeverity,  AIConfidence? aiConfidence,  AppUser? reportedBy,  HazardVoteType? userVoteType,  int upvoteCount,  int downvoteCount,  DateTime? occurredAt,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _Hazard() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.shortDescription,_that.visibility,_that.severity,_that.latitude,_that.longitude,_that.categoryId,_that.category,_that.source,_that.aiSummary,_that.aiFeedback,_that.aiSeverity,_that.aiConfidence,_that.reportedBy,_that.userVoteType,_that.upvoteCount,_that.downvoteCount,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hazard extends Hazard {
  const _Hazard({this.id, this.title, this.description, this.shortDescription, this.visibility = true, this.severity, this.latitude, this.longitude, this.categoryId, this.category, this.source, this.aiSummary, this.aiFeedback, this.aiSeverity, this.aiConfidence, this.reportedBy, this.userVoteType, this.upvoteCount = 0, this.downvoteCount = 0, this.occurredAt, this.createdAt, this.updatedAt, this.expiresAt}): super._();
  factory _Hazard.fromJson(Map<String, dynamic> json) => _$HazardFromJson(json);

/// The id of the hazard.
@override final  String? id;
/// The title of the hazard.
@override final  String? title;
/// The detailed description of the hazard.
@override final  String? description;
/// The short description of the hazard.
@override final  String? shortDescription;
/// Whether the hazard is visible to others.
@override@JsonKey() final  bool visibility;
/// The severity level of the hazard as per user input or source.
@override final  HazardSeverity? severity;
/// The latitude of the hazard location.
@override final  double? latitude;
/// The longitude of the hazard location.
@override final  double? longitude;
/// The id of the category the hazard belongs to.
@override final  String? categoryId;
/// The category the hazard belongs to.
@override final  HazardCategory? category;
/// The source details of the hazard.
@override final  HazardSource? source;
/// The AI-generated summary of the hazard.
@override final  String? aiSummary;
/// The AI-generated feedback on the hazard.
@override final  String? aiFeedback;
/// The AI-determined severity of the hazard.
@override final  HazardSeverity? aiSeverity;
/// The AI-determined confidence level of the hazard.
@override final  AIConfidence? aiConfidence;
/// The user who reported the hazard.
@override final  AppUser? reportedBy;
/// The vote type (upvote or downvote) by the current user.
@override final  HazardVoteType? userVoteType;
/// The total number of upvotes for the hazard.
@override@JsonKey() final  int upvoteCount;
/// The total number of downvotes for the hazard.
@override@JsonKey() final  int downvoteCount;
/// The date and time when the hazard occurred.
@override final  DateTime? occurredAt;
/// The date and time when the hazard was reported.
@override final  DateTime? createdAt;
/// The date and time when the hazard was last updated.
@override final  DateTime? updatedAt;
/// The date and time when the hazard expires.
@override final  DateTime? expiresAt;

/// Create a copy of Hazard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HazardCopyWith<_Hazard> get copyWith => __$HazardCopyWithImpl<_Hazard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HazardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hazard&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary)&&(identical(other.aiFeedback, aiFeedback) || other.aiFeedback == aiFeedback)&&(identical(other.aiSeverity, aiSeverity) || other.aiSeverity == aiSeverity)&&(identical(other.aiConfidence, aiConfidence) || other.aiConfidence == aiConfidence)&&(identical(other.reportedBy, reportedBy) || other.reportedBy == reportedBy)&&(identical(other.userVoteType, userVoteType) || other.userVoteType == userVoteType)&&(identical(other.upvoteCount, upvoteCount) || other.upvoteCount == upvoteCount)&&(identical(other.downvoteCount, downvoteCount) || other.downvoteCount == downvoteCount)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,shortDescription,visibility,severity,latitude,longitude,categoryId,category,source,aiSummary,aiFeedback,aiSeverity,aiConfidence,reportedBy,userVoteType,upvoteCount,downvoteCount,occurredAt,createdAt,updatedAt,expiresAt]);

@override
String toString() {
  return 'Hazard(id: $id, title: $title, description: $description, shortDescription: $shortDescription, visibility: $visibility, severity: $severity, latitude: $latitude, longitude: $longitude, categoryId: $categoryId, category: $category, source: $source, aiSummary: $aiSummary, aiFeedback: $aiFeedback, aiSeverity: $aiSeverity, aiConfidence: $aiConfidence, reportedBy: $reportedBy, userVoteType: $userVoteType, upvoteCount: $upvoteCount, downvoteCount: $downvoteCount, occurredAt: $occurredAt, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$HazardCopyWith<$Res> implements $HazardCopyWith<$Res> {
  factory _$HazardCopyWith(_Hazard value, $Res Function(_Hazard) _then) = __$HazardCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? title, String? description, String? shortDescription, bool visibility, HazardSeverity? severity, double? latitude, double? longitude, String? categoryId, HazardCategory? category, HazardSource? source, String? aiSummary, String? aiFeedback, HazardSeverity? aiSeverity, AIConfidence? aiConfidence, AppUser? reportedBy, HazardVoteType? userVoteType, int upvoteCount, int downvoteCount, DateTime? occurredAt, DateTime? createdAt, DateTime? updatedAt, DateTime? expiresAt
});


@override $HazardCategoryCopyWith<$Res>? get category;@override $HazardSourceCopyWith<$Res>? get source;@override $AppUserCopyWith<$Res>? get reportedBy;

}
/// @nodoc
class __$HazardCopyWithImpl<$Res>
    implements _$HazardCopyWith<$Res> {
  __$HazardCopyWithImpl(this._self, this._then);

  final _Hazard _self;
  final $Res Function(_Hazard) _then;

/// Create a copy of Hazard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? shortDescription = freezed,Object? visibility = null,Object? severity = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? categoryId = freezed,Object? category = freezed,Object? source = freezed,Object? aiSummary = freezed,Object? aiFeedback = freezed,Object? aiSeverity = freezed,Object? aiConfidence = freezed,Object? reportedBy = freezed,Object? userVoteType = freezed,Object? upvoteCount = null,Object? downvoteCount = null,Object? occurredAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? expiresAt = freezed,}) {
  return _then(_Hazard(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as bool,severity: freezed == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as HazardSeverity?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HazardCategory?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as HazardSource?,aiSummary: freezed == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String?,aiFeedback: freezed == aiFeedback ? _self.aiFeedback : aiFeedback // ignore: cast_nullable_to_non_nullable
as String?,aiSeverity: freezed == aiSeverity ? _self.aiSeverity : aiSeverity // ignore: cast_nullable_to_non_nullable
as HazardSeverity?,aiConfidence: freezed == aiConfidence ? _self.aiConfidence : aiConfidence // ignore: cast_nullable_to_non_nullable
as AIConfidence?,reportedBy: freezed == reportedBy ? _self.reportedBy : reportedBy // ignore: cast_nullable_to_non_nullable
as AppUser?,userVoteType: freezed == userVoteType ? _self.userVoteType : userVoteType // ignore: cast_nullable_to_non_nullable
as HazardVoteType?,upvoteCount: null == upvoteCount ? _self.upvoteCount : upvoteCount // ignore: cast_nullable_to_non_nullable
as int,downvoteCount: null == downvoteCount ? _self.downvoteCount : downvoteCount // ignore: cast_nullable_to_non_nullable
as int,occurredAt: freezed == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Hazard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $HazardCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Hazard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardSourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $HazardSourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of Hazard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserCopyWith<$Res>? get reportedBy {
    if (_self.reportedBy == null) {
    return null;
  }

  return $AppUserCopyWith<$Res>(_self.reportedBy!, (value) {
    return _then(_self.copyWith(reportedBy: value));
  });
}
}

// dart format on
