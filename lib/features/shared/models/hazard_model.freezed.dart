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
 String? get shortDescription;/// The severity level of the hazard as per user input or source.
 HazardSeverity? get severity;/// The latitude of the hazard location.
 double? get latitude;/// The longitude of the hazard location.
 double? get longitude;/// The human-readable name of the hazard location.
 String? get locationName;/// The id of the category the hazard belongs to.
 String? get categoryId;/// The category the hazard belongs to.
 HazardCategory? get category;/// The source details of the hazard.
 HazardSource? get source;/// The AI-generated summary of the hazard.
 String? get aiSummary;/// The AI-determined severity of the hazard.
 HazardSeverity? get aiSeverity;/// The AI-determined confidence level of the hazard.
 AIConfidence? get aiConfidence;/// The things users can do to mitigate the hazard.
 String? get callToAction;/// Indicates whether the hazard follows AWS standards.
 bool? get isAwsCompliant;/// The user who reported the hazard.
///
/// If source is provided, this may be null.
 AppUser? get reportedBy;/// The status of the hazard review.
 HazardReviewStatus? get reviewStatus;/// The feedback provided during the review of the hazard.
 String? get reviewFeedback;/// The id of the user who reviewed the hazard.
///
/// If AI reviewed the hazard, this will be "ai",
 String? get reviewedById;/// The date and time when the hazard was reviewed.
@DateTimeConverter() DateTime? get reviewedAt;/// The vote type (upvote or downvote) by the current user.
 HazardVoteType? get userVoteType;/// The total number of upvotes for the hazard.
 int get upvoteCount;/// The total number of downvotes for the hazard.
 int get downvoteCount;/// The confidence score of the hazard (from 0 to 100) to be used in the sorting order.
 int? get confidenceScore;/// The list of media files associated with the hazard.
 List<S3Media> get medias;/// The list of medias that have been processed and are ready for displaying to the UI.
///
/// This field is not included in JSON serialization/deserialization and is generated using [medias].
@JsonKey(includeFromJson: false, includeToJson: false) List<AlrtMedia> get processedMedias;/// The date and time when the hazard occurred.
@DateTimeConverter() DateTime? get occurredAt;/// The date and time when the hazard was reported.
@DateTimeConverter() DateTime? get createdAt;/// The date and time when the hazard was last updated.
@DateTimeConverter() DateTime? get updatedAt;/// The date and time when the hazard expires.
@DateTimeConverter() DateTime? get expiresAt;
/// Create a copy of Hazard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HazardCopyWith<Hazard> get copyWith => _$HazardCopyWithImpl<Hazard>(this as Hazard, _$identity);

  /// Serializes this Hazard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hazard&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary)&&(identical(other.aiSeverity, aiSeverity) || other.aiSeverity == aiSeverity)&&(identical(other.aiConfidence, aiConfidence) || other.aiConfidence == aiConfidence)&&(identical(other.callToAction, callToAction) || other.callToAction == callToAction)&&(identical(other.isAwsCompliant, isAwsCompliant) || other.isAwsCompliant == isAwsCompliant)&&(identical(other.reportedBy, reportedBy) || other.reportedBy == reportedBy)&&(identical(other.reviewStatus, reviewStatus) || other.reviewStatus == reviewStatus)&&(identical(other.reviewFeedback, reviewFeedback) || other.reviewFeedback == reviewFeedback)&&(identical(other.reviewedById, reviewedById) || other.reviewedById == reviewedById)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.userVoteType, userVoteType) || other.userVoteType == userVoteType)&&(identical(other.upvoteCount, upvoteCount) || other.upvoteCount == upvoteCount)&&(identical(other.downvoteCount, downvoteCount) || other.downvoteCount == downvoteCount)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore)&&const DeepCollectionEquality().equals(other.medias, medias)&&const DeepCollectionEquality().equals(other.processedMedias, processedMedias)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,shortDescription,severity,latitude,longitude,locationName,categoryId,category,source,aiSummary,aiSeverity,aiConfidence,callToAction,isAwsCompliant,reportedBy,reviewStatus,reviewFeedback,reviewedById,reviewedAt,userVoteType,upvoteCount,downvoteCount,confidenceScore,const DeepCollectionEquality().hash(medias),const DeepCollectionEquality().hash(processedMedias),occurredAt,createdAt,updatedAt,expiresAt]);

@override
String toString() {
  return 'Hazard(id: $id, title: $title, description: $description, shortDescription: $shortDescription, severity: $severity, latitude: $latitude, longitude: $longitude, locationName: $locationName, categoryId: $categoryId, category: $category, source: $source, aiSummary: $aiSummary, aiSeverity: $aiSeverity, aiConfidence: $aiConfidence, callToAction: $callToAction, isAwsCompliant: $isAwsCompliant, reportedBy: $reportedBy, reviewStatus: $reviewStatus, reviewFeedback: $reviewFeedback, reviewedById: $reviewedById, reviewedAt: $reviewedAt, userVoteType: $userVoteType, upvoteCount: $upvoteCount, downvoteCount: $downvoteCount, confidenceScore: $confidenceScore, medias: $medias, processedMedias: $processedMedias, occurredAt: $occurredAt, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $HazardCopyWith<$Res>  {
  factory $HazardCopyWith(Hazard value, $Res Function(Hazard) _then) = _$HazardCopyWithImpl;
@useResult
$Res call({
 String? id, String? title, String? description, String? shortDescription, HazardSeverity? severity, double? latitude, double? longitude, String? locationName, String? categoryId, HazardCategory? category, HazardSource? source, String? aiSummary, HazardSeverity? aiSeverity, AIConfidence? aiConfidence, String? callToAction, bool? isAwsCompliant, AppUser? reportedBy, HazardReviewStatus? reviewStatus, String? reviewFeedback, String? reviewedById,@DateTimeConverter() DateTime? reviewedAt, HazardVoteType? userVoteType, int upvoteCount, int downvoteCount, int? confidenceScore, List<S3Media> medias,@JsonKey(includeFromJson: false, includeToJson: false) List<AlrtMedia> processedMedias,@DateTimeConverter() DateTime? occurredAt,@DateTimeConverter() DateTime? createdAt,@DateTimeConverter() DateTime? updatedAt,@DateTimeConverter() DateTime? expiresAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? shortDescription = freezed,Object? severity = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? locationName = freezed,Object? categoryId = freezed,Object? category = freezed,Object? source = freezed,Object? aiSummary = freezed,Object? aiSeverity = freezed,Object? aiConfidence = freezed,Object? callToAction = freezed,Object? isAwsCompliant = freezed,Object? reportedBy = freezed,Object? reviewStatus = freezed,Object? reviewFeedback = freezed,Object? reviewedById = freezed,Object? reviewedAt = freezed,Object? userVoteType = freezed,Object? upvoteCount = null,Object? downvoteCount = null,Object? confidenceScore = freezed,Object? medias = null,Object? processedMedias = null,Object? occurredAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,severity: freezed == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as HazardSeverity?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HazardCategory?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as HazardSource?,aiSummary: freezed == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String?,aiSeverity: freezed == aiSeverity ? _self.aiSeverity : aiSeverity // ignore: cast_nullable_to_non_nullable
as HazardSeverity?,aiConfidence: freezed == aiConfidence ? _self.aiConfidence : aiConfidence // ignore: cast_nullable_to_non_nullable
as AIConfidence?,callToAction: freezed == callToAction ? _self.callToAction : callToAction // ignore: cast_nullable_to_non_nullable
as String?,isAwsCompliant: freezed == isAwsCompliant ? _self.isAwsCompliant : isAwsCompliant // ignore: cast_nullable_to_non_nullable
as bool?,reportedBy: freezed == reportedBy ? _self.reportedBy : reportedBy // ignore: cast_nullable_to_non_nullable
as AppUser?,reviewStatus: freezed == reviewStatus ? _self.reviewStatus : reviewStatus // ignore: cast_nullable_to_non_nullable
as HazardReviewStatus?,reviewFeedback: freezed == reviewFeedback ? _self.reviewFeedback : reviewFeedback // ignore: cast_nullable_to_non_nullable
as String?,reviewedById: freezed == reviewedById ? _self.reviewedById : reviewedById // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userVoteType: freezed == userVoteType ? _self.userVoteType : userVoteType // ignore: cast_nullable_to_non_nullable
as HazardVoteType?,upvoteCount: null == upvoteCount ? _self.upvoteCount : upvoteCount // ignore: cast_nullable_to_non_nullable
as int,downvoteCount: null == downvoteCount ? _self.downvoteCount : downvoteCount // ignore: cast_nullable_to_non_nullable
as int,confidenceScore: freezed == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as int?,medias: null == medias ? _self.medias : medias // ignore: cast_nullable_to_non_nullable
as List<S3Media>,processedMedias: null == processedMedias ? _self.processedMedias : processedMedias // ignore: cast_nullable_to_non_nullable
as List<AlrtMedia>,occurredAt: freezed == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? title,  String? description,  String? shortDescription,  HazardSeverity? severity,  double? latitude,  double? longitude,  String? locationName,  String? categoryId,  HazardCategory? category,  HazardSource? source,  String? aiSummary,  HazardSeverity? aiSeverity,  AIConfidence? aiConfidence,  String? callToAction,  bool? isAwsCompliant,  AppUser? reportedBy,  HazardReviewStatus? reviewStatus,  String? reviewFeedback,  String? reviewedById, @DateTimeConverter()  DateTime? reviewedAt,  HazardVoteType? userVoteType,  int upvoteCount,  int downvoteCount,  int? confidenceScore,  List<S3Media> medias, @JsonKey(includeFromJson: false, includeToJson: false)  List<AlrtMedia> processedMedias, @DateTimeConverter()  DateTime? occurredAt, @DateTimeConverter()  DateTime? createdAt, @DateTimeConverter()  DateTime? updatedAt, @DateTimeConverter()  DateTime? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hazard() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.shortDescription,_that.severity,_that.latitude,_that.longitude,_that.locationName,_that.categoryId,_that.category,_that.source,_that.aiSummary,_that.aiSeverity,_that.aiConfidence,_that.callToAction,_that.isAwsCompliant,_that.reportedBy,_that.reviewStatus,_that.reviewFeedback,_that.reviewedById,_that.reviewedAt,_that.userVoteType,_that.upvoteCount,_that.downvoteCount,_that.confidenceScore,_that.medias,_that.processedMedias,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? title,  String? description,  String? shortDescription,  HazardSeverity? severity,  double? latitude,  double? longitude,  String? locationName,  String? categoryId,  HazardCategory? category,  HazardSource? source,  String? aiSummary,  HazardSeverity? aiSeverity,  AIConfidence? aiConfidence,  String? callToAction,  bool? isAwsCompliant,  AppUser? reportedBy,  HazardReviewStatus? reviewStatus,  String? reviewFeedback,  String? reviewedById, @DateTimeConverter()  DateTime? reviewedAt,  HazardVoteType? userVoteType,  int upvoteCount,  int downvoteCount,  int? confidenceScore,  List<S3Media> medias, @JsonKey(includeFromJson: false, includeToJson: false)  List<AlrtMedia> processedMedias, @DateTimeConverter()  DateTime? occurredAt, @DateTimeConverter()  DateTime? createdAt, @DateTimeConverter()  DateTime? updatedAt, @DateTimeConverter()  DateTime? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _Hazard():
return $default(_that.id,_that.title,_that.description,_that.shortDescription,_that.severity,_that.latitude,_that.longitude,_that.locationName,_that.categoryId,_that.category,_that.source,_that.aiSummary,_that.aiSeverity,_that.aiConfidence,_that.callToAction,_that.isAwsCompliant,_that.reportedBy,_that.reviewStatus,_that.reviewFeedback,_that.reviewedById,_that.reviewedAt,_that.userVoteType,_that.upvoteCount,_that.downvoteCount,_that.confidenceScore,_that.medias,_that.processedMedias,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? title,  String? description,  String? shortDescription,  HazardSeverity? severity,  double? latitude,  double? longitude,  String? locationName,  String? categoryId,  HazardCategory? category,  HazardSource? source,  String? aiSummary,  HazardSeverity? aiSeverity,  AIConfidence? aiConfidence,  String? callToAction,  bool? isAwsCompliant,  AppUser? reportedBy,  HazardReviewStatus? reviewStatus,  String? reviewFeedback,  String? reviewedById, @DateTimeConverter()  DateTime? reviewedAt,  HazardVoteType? userVoteType,  int upvoteCount,  int downvoteCount,  int? confidenceScore,  List<S3Media> medias, @JsonKey(includeFromJson: false, includeToJson: false)  List<AlrtMedia> processedMedias, @DateTimeConverter()  DateTime? occurredAt, @DateTimeConverter()  DateTime? createdAt, @DateTimeConverter()  DateTime? updatedAt, @DateTimeConverter()  DateTime? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _Hazard() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.shortDescription,_that.severity,_that.latitude,_that.longitude,_that.locationName,_that.categoryId,_that.category,_that.source,_that.aiSummary,_that.aiSeverity,_that.aiConfidence,_that.callToAction,_that.isAwsCompliant,_that.reportedBy,_that.reviewStatus,_that.reviewFeedback,_that.reviewedById,_that.reviewedAt,_that.userVoteType,_that.upvoteCount,_that.downvoteCount,_that.confidenceScore,_that.medias,_that.processedMedias,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hazard extends Hazard {
  const _Hazard({this.id, this.title, this.description, this.shortDescription, this.severity, this.latitude, this.longitude, this.locationName, this.categoryId, this.category, this.source, this.aiSummary, this.aiSeverity, this.aiConfidence, this.callToAction, this.isAwsCompliant, this.reportedBy, this.reviewStatus, this.reviewFeedback, this.reviewedById, @DateTimeConverter() this.reviewedAt, this.userVoteType, this.upvoteCount = 0, this.downvoteCount = 0, this.confidenceScore, final  List<S3Media> medias = const <S3Media>[], @JsonKey(includeFromJson: false, includeToJson: false) final  List<AlrtMedia> processedMedias = const <AlrtMedia>[], @DateTimeConverter() this.occurredAt, @DateTimeConverter() this.createdAt, @DateTimeConverter() this.updatedAt, @DateTimeConverter() this.expiresAt}): _medias = medias,_processedMedias = processedMedias,super._();
  factory _Hazard.fromJson(Map<String, dynamic> json) => _$HazardFromJson(json);

/// The id of the hazard.
@override final  String? id;
/// The title of the hazard.
@override final  String? title;
/// The detailed description of the hazard.
@override final  String? description;
/// The short description of the hazard.
@override final  String? shortDescription;
/// The severity level of the hazard as per user input or source.
@override final  HazardSeverity? severity;
/// The latitude of the hazard location.
@override final  double? latitude;
/// The longitude of the hazard location.
@override final  double? longitude;
/// The human-readable name of the hazard location.
@override final  String? locationName;
/// The id of the category the hazard belongs to.
@override final  String? categoryId;
/// The category the hazard belongs to.
@override final  HazardCategory? category;
/// The source details of the hazard.
@override final  HazardSource? source;
/// The AI-generated summary of the hazard.
@override final  String? aiSummary;
/// The AI-determined severity of the hazard.
@override final  HazardSeverity? aiSeverity;
/// The AI-determined confidence level of the hazard.
@override final  AIConfidence? aiConfidence;
/// The things users can do to mitigate the hazard.
@override final  String? callToAction;
/// Indicates whether the hazard follows AWS standards.
@override final  bool? isAwsCompliant;
/// The user who reported the hazard.
///
/// If source is provided, this may be null.
@override final  AppUser? reportedBy;
/// The status of the hazard review.
@override final  HazardReviewStatus? reviewStatus;
/// The feedback provided during the review of the hazard.
@override final  String? reviewFeedback;
/// The id of the user who reviewed the hazard.
///
/// If AI reviewed the hazard, this will be "ai",
@override final  String? reviewedById;
/// The date and time when the hazard was reviewed.
@override@DateTimeConverter() final  DateTime? reviewedAt;
/// The vote type (upvote or downvote) by the current user.
@override final  HazardVoteType? userVoteType;
/// The total number of upvotes for the hazard.
@override@JsonKey() final  int upvoteCount;
/// The total number of downvotes for the hazard.
@override@JsonKey() final  int downvoteCount;
/// The confidence score of the hazard (from 0 to 100) to be used in the sorting order.
@override final  int? confidenceScore;
/// The list of media files associated with the hazard.
 final  List<S3Media> _medias;
/// The list of media files associated with the hazard.
@override@JsonKey() List<S3Media> get medias {
  if (_medias is EqualUnmodifiableListView) return _medias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_medias);
}

/// The list of medias that have been processed and are ready for displaying to the UI.
///
/// This field is not included in JSON serialization/deserialization and is generated using [medias].
 final  List<AlrtMedia> _processedMedias;
/// The list of medias that have been processed and are ready for displaying to the UI.
///
/// This field is not included in JSON serialization/deserialization and is generated using [medias].
@override@JsonKey(includeFromJson: false, includeToJson: false) List<AlrtMedia> get processedMedias {
  if (_processedMedias is EqualUnmodifiableListView) return _processedMedias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_processedMedias);
}

/// The date and time when the hazard occurred.
@override@DateTimeConverter() final  DateTime? occurredAt;
/// The date and time when the hazard was reported.
@override@DateTimeConverter() final  DateTime? createdAt;
/// The date and time when the hazard was last updated.
@override@DateTimeConverter() final  DateTime? updatedAt;
/// The date and time when the hazard expires.
@override@DateTimeConverter() final  DateTime? expiresAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hazard&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary)&&(identical(other.aiSeverity, aiSeverity) || other.aiSeverity == aiSeverity)&&(identical(other.aiConfidence, aiConfidence) || other.aiConfidence == aiConfidence)&&(identical(other.callToAction, callToAction) || other.callToAction == callToAction)&&(identical(other.isAwsCompliant, isAwsCompliant) || other.isAwsCompliant == isAwsCompliant)&&(identical(other.reportedBy, reportedBy) || other.reportedBy == reportedBy)&&(identical(other.reviewStatus, reviewStatus) || other.reviewStatus == reviewStatus)&&(identical(other.reviewFeedback, reviewFeedback) || other.reviewFeedback == reviewFeedback)&&(identical(other.reviewedById, reviewedById) || other.reviewedById == reviewedById)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.userVoteType, userVoteType) || other.userVoteType == userVoteType)&&(identical(other.upvoteCount, upvoteCount) || other.upvoteCount == upvoteCount)&&(identical(other.downvoteCount, downvoteCount) || other.downvoteCount == downvoteCount)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore)&&const DeepCollectionEquality().equals(other._medias, _medias)&&const DeepCollectionEquality().equals(other._processedMedias, _processedMedias)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,shortDescription,severity,latitude,longitude,locationName,categoryId,category,source,aiSummary,aiSeverity,aiConfidence,callToAction,isAwsCompliant,reportedBy,reviewStatus,reviewFeedback,reviewedById,reviewedAt,userVoteType,upvoteCount,downvoteCount,confidenceScore,const DeepCollectionEquality().hash(_medias),const DeepCollectionEquality().hash(_processedMedias),occurredAt,createdAt,updatedAt,expiresAt]);

@override
String toString() {
  return 'Hazard(id: $id, title: $title, description: $description, shortDescription: $shortDescription, severity: $severity, latitude: $latitude, longitude: $longitude, locationName: $locationName, categoryId: $categoryId, category: $category, source: $source, aiSummary: $aiSummary, aiSeverity: $aiSeverity, aiConfidence: $aiConfidence, callToAction: $callToAction, isAwsCompliant: $isAwsCompliant, reportedBy: $reportedBy, reviewStatus: $reviewStatus, reviewFeedback: $reviewFeedback, reviewedById: $reviewedById, reviewedAt: $reviewedAt, userVoteType: $userVoteType, upvoteCount: $upvoteCount, downvoteCount: $downvoteCount, confidenceScore: $confidenceScore, medias: $medias, processedMedias: $processedMedias, occurredAt: $occurredAt, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$HazardCopyWith<$Res> implements $HazardCopyWith<$Res> {
  factory _$HazardCopyWith(_Hazard value, $Res Function(_Hazard) _then) = __$HazardCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? title, String? description, String? shortDescription, HazardSeverity? severity, double? latitude, double? longitude, String? locationName, String? categoryId, HazardCategory? category, HazardSource? source, String? aiSummary, HazardSeverity? aiSeverity, AIConfidence? aiConfidence, String? callToAction, bool? isAwsCompliant, AppUser? reportedBy, HazardReviewStatus? reviewStatus, String? reviewFeedback, String? reviewedById,@DateTimeConverter() DateTime? reviewedAt, HazardVoteType? userVoteType, int upvoteCount, int downvoteCount, int? confidenceScore, List<S3Media> medias,@JsonKey(includeFromJson: false, includeToJson: false) List<AlrtMedia> processedMedias,@DateTimeConverter() DateTime? occurredAt,@DateTimeConverter() DateTime? createdAt,@DateTimeConverter() DateTime? updatedAt,@DateTimeConverter() DateTime? expiresAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? shortDescription = freezed,Object? severity = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? locationName = freezed,Object? categoryId = freezed,Object? category = freezed,Object? source = freezed,Object? aiSummary = freezed,Object? aiSeverity = freezed,Object? aiConfidence = freezed,Object? callToAction = freezed,Object? isAwsCompliant = freezed,Object? reportedBy = freezed,Object? reviewStatus = freezed,Object? reviewFeedback = freezed,Object? reviewedById = freezed,Object? reviewedAt = freezed,Object? userVoteType = freezed,Object? upvoteCount = null,Object? downvoteCount = null,Object? confidenceScore = freezed,Object? medias = null,Object? processedMedias = null,Object? occurredAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? expiresAt = freezed,}) {
  return _then(_Hazard(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,severity: freezed == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as HazardSeverity?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HazardCategory?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as HazardSource?,aiSummary: freezed == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String?,aiSeverity: freezed == aiSeverity ? _self.aiSeverity : aiSeverity // ignore: cast_nullable_to_non_nullable
as HazardSeverity?,aiConfidence: freezed == aiConfidence ? _self.aiConfidence : aiConfidence // ignore: cast_nullable_to_non_nullable
as AIConfidence?,callToAction: freezed == callToAction ? _self.callToAction : callToAction // ignore: cast_nullable_to_non_nullable
as String?,isAwsCompliant: freezed == isAwsCompliant ? _self.isAwsCompliant : isAwsCompliant // ignore: cast_nullable_to_non_nullable
as bool?,reportedBy: freezed == reportedBy ? _self.reportedBy : reportedBy // ignore: cast_nullable_to_non_nullable
as AppUser?,reviewStatus: freezed == reviewStatus ? _self.reviewStatus : reviewStatus // ignore: cast_nullable_to_non_nullable
as HazardReviewStatus?,reviewFeedback: freezed == reviewFeedback ? _self.reviewFeedback : reviewFeedback // ignore: cast_nullable_to_non_nullable
as String?,reviewedById: freezed == reviewedById ? _self.reviewedById : reviewedById // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userVoteType: freezed == userVoteType ? _self.userVoteType : userVoteType // ignore: cast_nullable_to_non_nullable
as HazardVoteType?,upvoteCount: null == upvoteCount ? _self.upvoteCount : upvoteCount // ignore: cast_nullable_to_non_nullable
as int,downvoteCount: null == downvoteCount ? _self.downvoteCount : downvoteCount // ignore: cast_nullable_to_non_nullable
as int,confidenceScore: freezed == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as int?,medias: null == medias ? _self._medias : medias // ignore: cast_nullable_to_non_nullable
as List<S3Media>,processedMedias: null == processedMedias ? _self._processedMedias : processedMedias // ignore: cast_nullable_to_non_nullable
as List<AlrtMedia>,occurredAt: freezed == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
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
