// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_report_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateReportProviderState {

/// The date and time of the hazard.
 DateTime? get dateTime;/// The selected category of the hazard.
 HazardCategory? get category;/// The name of the new category if [category] represents "Other" category.
///
/// This field is required if [category] represents "Other" category.
/// Otherwise, it will be ignored.
 String? get otherCategoryName;/// The location of the hazard.
 AlrtLocation? get location;/// The description of the hazard.
 String? get description;/// The list of media associated with the hazard report.
 List<AlrtMedia> get medias;/// The list of [CreatingHazardReport.id]s that have been acknowledged.
///
/// i.e A success or error toast has been shown for these reports.
 List<String> get acknowledgedReportIds;/// The the state of creating the hazard report.
 List<CreatingHazardReport> get creatingHazardReports;
/// Create a copy of CreateReportProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateReportProviderStateCopyWith<CreateReportProviderState> get copyWith => _$CreateReportProviderStateCopyWithImpl<CreateReportProviderState>(this as CreateReportProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateReportProviderState&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.category, category) || other.category == category)&&(identical(other.otherCategoryName, otherCategoryName) || other.otherCategoryName == otherCategoryName)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.medias, medias)&&const DeepCollectionEquality().equals(other.acknowledgedReportIds, acknowledgedReportIds)&&const DeepCollectionEquality().equals(other.creatingHazardReports, creatingHazardReports));
}


@override
int get hashCode => Object.hash(runtimeType,dateTime,category,otherCategoryName,location,description,const DeepCollectionEquality().hash(medias),const DeepCollectionEquality().hash(acknowledgedReportIds),const DeepCollectionEquality().hash(creatingHazardReports));

@override
String toString() {
  return 'CreateReportProviderState(dateTime: $dateTime, category: $category, otherCategoryName: $otherCategoryName, location: $location, description: $description, medias: $medias, acknowledgedReportIds: $acknowledgedReportIds, creatingHazardReports: $creatingHazardReports)';
}


}

/// @nodoc
abstract mixin class $CreateReportProviderStateCopyWith<$Res>  {
  factory $CreateReportProviderStateCopyWith(CreateReportProviderState value, $Res Function(CreateReportProviderState) _then) = _$CreateReportProviderStateCopyWithImpl;
@useResult
$Res call({
 DateTime? dateTime, HazardCategory? category, String? otherCategoryName, AlrtLocation? location, String? description, List<AlrtMedia> medias, List<String> acknowledgedReportIds, List<CreatingHazardReport> creatingHazardReports
});


$HazardCategoryCopyWith<$Res>? get category;$AlrtLocationCopyWith<$Res>? get location;

}
/// @nodoc
class _$CreateReportProviderStateCopyWithImpl<$Res>
    implements $CreateReportProviderStateCopyWith<$Res> {
  _$CreateReportProviderStateCopyWithImpl(this._self, this._then);

  final CreateReportProviderState _self;
  final $Res Function(CreateReportProviderState) _then;

/// Create a copy of CreateReportProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateTime = freezed,Object? category = freezed,Object? otherCategoryName = freezed,Object? location = freezed,Object? description = freezed,Object? medias = null,Object? acknowledgedReportIds = null,Object? creatingHazardReports = null,}) {
  return _then(_self.copyWith(
dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HazardCategory?,otherCategoryName: freezed == otherCategoryName ? _self.otherCategoryName : otherCategoryName // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as AlrtLocation?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,medias: null == medias ? _self.medias : medias // ignore: cast_nullable_to_non_nullable
as List<AlrtMedia>,acknowledgedReportIds: null == acknowledgedReportIds ? _self.acknowledgedReportIds : acknowledgedReportIds // ignore: cast_nullable_to_non_nullable
as List<String>,creatingHazardReports: null == creatingHazardReports ? _self.creatingHazardReports : creatingHazardReports // ignore: cast_nullable_to_non_nullable
as List<CreatingHazardReport>,
  ));
}
/// Create a copy of CreateReportProviderState
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
}/// Create a copy of CreateReportProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlrtLocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $AlrtLocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateReportProviderState].
extension CreateReportProviderStatePatterns on CreateReportProviderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateReportProviderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateReportProviderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateReportProviderState value)  $default,){
final _that = this;
switch (_that) {
case _CreateReportProviderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateReportProviderState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateReportProviderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? dateTime,  HazardCategory? category,  String? otherCategoryName,  AlrtLocation? location,  String? description,  List<AlrtMedia> medias,  List<String> acknowledgedReportIds,  List<CreatingHazardReport> creatingHazardReports)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateReportProviderState() when $default != null:
return $default(_that.dateTime,_that.category,_that.otherCategoryName,_that.location,_that.description,_that.medias,_that.acknowledgedReportIds,_that.creatingHazardReports);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? dateTime,  HazardCategory? category,  String? otherCategoryName,  AlrtLocation? location,  String? description,  List<AlrtMedia> medias,  List<String> acknowledgedReportIds,  List<CreatingHazardReport> creatingHazardReports)  $default,) {final _that = this;
switch (_that) {
case _CreateReportProviderState():
return $default(_that.dateTime,_that.category,_that.otherCategoryName,_that.location,_that.description,_that.medias,_that.acknowledgedReportIds,_that.creatingHazardReports);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? dateTime,  HazardCategory? category,  String? otherCategoryName,  AlrtLocation? location,  String? description,  List<AlrtMedia> medias,  List<String> acknowledgedReportIds,  List<CreatingHazardReport> creatingHazardReports)?  $default,) {final _that = this;
switch (_that) {
case _CreateReportProviderState() when $default != null:
return $default(_that.dateTime,_that.category,_that.otherCategoryName,_that.location,_that.description,_that.medias,_that.acknowledgedReportIds,_that.creatingHazardReports);case _:
  return null;

}
}

}

/// @nodoc


class _CreateReportProviderState implements CreateReportProviderState {
  const _CreateReportProviderState({this.dateTime, this.category, this.otherCategoryName, this.location, this.description, final  List<AlrtMedia> medias = const <AlrtMedia>[], final  List<String> acknowledgedReportIds = const <String>[], final  List<CreatingHazardReport> creatingHazardReports = const <CreatingHazardReport>[]}): _medias = medias,_acknowledgedReportIds = acknowledgedReportIds,_creatingHazardReports = creatingHazardReports;
  

/// The date and time of the hazard.
@override final  DateTime? dateTime;
/// The selected category of the hazard.
@override final  HazardCategory? category;
/// The name of the new category if [category] represents "Other" category.
///
/// This field is required if [category] represents "Other" category.
/// Otherwise, it will be ignored.
@override final  String? otherCategoryName;
/// The location of the hazard.
@override final  AlrtLocation? location;
/// The description of the hazard.
@override final  String? description;
/// The list of media associated with the hazard report.
 final  List<AlrtMedia> _medias;
/// The list of media associated with the hazard report.
@override@JsonKey() List<AlrtMedia> get medias {
  if (_medias is EqualUnmodifiableListView) return _medias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_medias);
}

/// The list of [CreatingHazardReport.id]s that have been acknowledged.
///
/// i.e A success or error toast has been shown for these reports.
 final  List<String> _acknowledgedReportIds;
/// The list of [CreatingHazardReport.id]s that have been acknowledged.
///
/// i.e A success or error toast has been shown for these reports.
@override@JsonKey() List<String> get acknowledgedReportIds {
  if (_acknowledgedReportIds is EqualUnmodifiableListView) return _acknowledgedReportIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_acknowledgedReportIds);
}

/// The the state of creating the hazard report.
 final  List<CreatingHazardReport> _creatingHazardReports;
/// The the state of creating the hazard report.
@override@JsonKey() List<CreatingHazardReport> get creatingHazardReports {
  if (_creatingHazardReports is EqualUnmodifiableListView) return _creatingHazardReports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_creatingHazardReports);
}


/// Create a copy of CreateReportProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateReportProviderStateCopyWith<_CreateReportProviderState> get copyWith => __$CreateReportProviderStateCopyWithImpl<_CreateReportProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateReportProviderState&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.category, category) || other.category == category)&&(identical(other.otherCategoryName, otherCategoryName) || other.otherCategoryName == otherCategoryName)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._medias, _medias)&&const DeepCollectionEquality().equals(other._acknowledgedReportIds, _acknowledgedReportIds)&&const DeepCollectionEquality().equals(other._creatingHazardReports, _creatingHazardReports));
}


@override
int get hashCode => Object.hash(runtimeType,dateTime,category,otherCategoryName,location,description,const DeepCollectionEquality().hash(_medias),const DeepCollectionEquality().hash(_acknowledgedReportIds),const DeepCollectionEquality().hash(_creatingHazardReports));

@override
String toString() {
  return 'CreateReportProviderState(dateTime: $dateTime, category: $category, otherCategoryName: $otherCategoryName, location: $location, description: $description, medias: $medias, acknowledgedReportIds: $acknowledgedReportIds, creatingHazardReports: $creatingHazardReports)';
}


}

/// @nodoc
abstract mixin class _$CreateReportProviderStateCopyWith<$Res> implements $CreateReportProviderStateCopyWith<$Res> {
  factory _$CreateReportProviderStateCopyWith(_CreateReportProviderState value, $Res Function(_CreateReportProviderState) _then) = __$CreateReportProviderStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime? dateTime, HazardCategory? category, String? otherCategoryName, AlrtLocation? location, String? description, List<AlrtMedia> medias, List<String> acknowledgedReportIds, List<CreatingHazardReport> creatingHazardReports
});


@override $HazardCategoryCopyWith<$Res>? get category;@override $AlrtLocationCopyWith<$Res>? get location;

}
/// @nodoc
class __$CreateReportProviderStateCopyWithImpl<$Res>
    implements _$CreateReportProviderStateCopyWith<$Res> {
  __$CreateReportProviderStateCopyWithImpl(this._self, this._then);

  final _CreateReportProviderState _self;
  final $Res Function(_CreateReportProviderState) _then;

/// Create a copy of CreateReportProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateTime = freezed,Object? category = freezed,Object? otherCategoryName = freezed,Object? location = freezed,Object? description = freezed,Object? medias = null,Object? acknowledgedReportIds = null,Object? creatingHazardReports = null,}) {
  return _then(_CreateReportProviderState(
dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HazardCategory?,otherCategoryName: freezed == otherCategoryName ? _self.otherCategoryName : otherCategoryName // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as AlrtLocation?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,medias: null == medias ? _self._medias : medias // ignore: cast_nullable_to_non_nullable
as List<AlrtMedia>,acknowledgedReportIds: null == acknowledgedReportIds ? _self._acknowledgedReportIds : acknowledgedReportIds // ignore: cast_nullable_to_non_nullable
as List<String>,creatingHazardReports: null == creatingHazardReports ? _self._creatingHazardReports : creatingHazardReports // ignore: cast_nullable_to_non_nullable
as List<CreatingHazardReport>,
  ));
}

/// Create a copy of CreateReportProviderState
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
}/// Create a copy of CreateReportProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlrtLocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $AlrtLocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

/// @nodoc
mixin _$CreatingHazardReport {

 String get id; Hazard get hazard; CreatingHazardReportState get state;
/// Create a copy of CreatingHazardReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatingHazardReportCopyWith<CreatingHazardReport> get copyWith => _$CreatingHazardReportCopyWithImpl<CreatingHazardReport>(this as CreatingHazardReport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatingHazardReport&&(identical(other.id, id) || other.id == id)&&(identical(other.hazard, hazard) || other.hazard == hazard)&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,id,hazard,state);

@override
String toString() {
  return 'CreatingHazardReport(id: $id, hazard: $hazard, state: $state)';
}


}

/// @nodoc
abstract mixin class $CreatingHazardReportCopyWith<$Res>  {
  factory $CreatingHazardReportCopyWith(CreatingHazardReport value, $Res Function(CreatingHazardReport) _then) = _$CreatingHazardReportCopyWithImpl;
@useResult
$Res call({
 String id, Hazard hazard, CreatingHazardReportState state
});


$HazardCopyWith<$Res> get hazard;$CreatingHazardReportStateCopyWith<$Res> get state;

}
/// @nodoc
class _$CreatingHazardReportCopyWithImpl<$Res>
    implements $CreatingHazardReportCopyWith<$Res> {
  _$CreatingHazardReportCopyWithImpl(this._self, this._then);

  final CreatingHazardReport _self;
  final $Res Function(CreatingHazardReport) _then;

/// Create a copy of CreatingHazardReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hazard = null,Object? state = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hazard: null == hazard ? _self.hazard : hazard // ignore: cast_nullable_to_non_nullable
as Hazard,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as CreatingHazardReportState,
  ));
}
/// Create a copy of CreatingHazardReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardCopyWith<$Res> get hazard {
  
  return $HazardCopyWith<$Res>(_self.hazard, (value) {
    return _then(_self.copyWith(hazard: value));
  });
}/// Create a copy of CreatingHazardReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatingHazardReportStateCopyWith<$Res> get state {
  
  return $CreatingHazardReportStateCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreatingHazardReport].
extension CreatingHazardReportPatterns on CreatingHazardReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatingHazardReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatingHazardReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatingHazardReport value)  $default,){
final _that = this;
switch (_that) {
case _CreatingHazardReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatingHazardReport value)?  $default,){
final _that = this;
switch (_that) {
case _CreatingHazardReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Hazard hazard,  CreatingHazardReportState state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatingHazardReport() when $default != null:
return $default(_that.id,_that.hazard,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Hazard hazard,  CreatingHazardReportState state)  $default,) {final _that = this;
switch (_that) {
case _CreatingHazardReport():
return $default(_that.id,_that.hazard,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Hazard hazard,  CreatingHazardReportState state)?  $default,) {final _that = this;
switch (_that) {
case _CreatingHazardReport() when $default != null:
return $default(_that.id,_that.hazard,_that.state);case _:
  return null;

}
}

}

/// @nodoc


class _CreatingHazardReport implements CreatingHazardReport {
  const _CreatingHazardReport({required this.id, required this.hazard, required this.state});
  

@override final  String id;
@override final  Hazard hazard;
@override final  CreatingHazardReportState state;

/// Create a copy of CreatingHazardReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatingHazardReportCopyWith<_CreatingHazardReport> get copyWith => __$CreatingHazardReportCopyWithImpl<_CreatingHazardReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatingHazardReport&&(identical(other.id, id) || other.id == id)&&(identical(other.hazard, hazard) || other.hazard == hazard)&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,id,hazard,state);

@override
String toString() {
  return 'CreatingHazardReport(id: $id, hazard: $hazard, state: $state)';
}


}

/// @nodoc
abstract mixin class _$CreatingHazardReportCopyWith<$Res> implements $CreatingHazardReportCopyWith<$Res> {
  factory _$CreatingHazardReportCopyWith(_CreatingHazardReport value, $Res Function(_CreatingHazardReport) _then) = __$CreatingHazardReportCopyWithImpl;
@override @useResult
$Res call({
 String id, Hazard hazard, CreatingHazardReportState state
});


@override $HazardCopyWith<$Res> get hazard;@override $CreatingHazardReportStateCopyWith<$Res> get state;

}
/// @nodoc
class __$CreatingHazardReportCopyWithImpl<$Res>
    implements _$CreatingHazardReportCopyWith<$Res> {
  __$CreatingHazardReportCopyWithImpl(this._self, this._then);

  final _CreatingHazardReport _self;
  final $Res Function(_CreatingHazardReport) _then;

/// Create a copy of CreatingHazardReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? hazard = null,Object? state = null,}) {
  return _then(_CreatingHazardReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hazard: null == hazard ? _self.hazard : hazard // ignore: cast_nullable_to_non_nullable
as Hazard,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as CreatingHazardReportState,
  ));
}

/// Create a copy of CreatingHazardReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardCopyWith<$Res> get hazard {
  
  return $HazardCopyWith<$Res>(_self.hazard, (value) {
    return _then(_self.copyWith(hazard: value));
  });
}/// Create a copy of CreatingHazardReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatingHazardReportStateCopyWith<$Res> get state {
  
  return $CreatingHazardReportStateCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}

/// @nodoc
mixin _$CreatingHazardReportState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatingHazardReportState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatingHazardReportState()';
}


}

/// @nodoc
class $CreatingHazardReportStateCopyWith<$Res>  {
$CreatingHazardReportStateCopyWith(CreatingHazardReportState _, $Res Function(CreatingHazardReportState) __);
}


/// Adds pattern-matching-related methods to [CreatingHazardReportState].
extension CreatingHazardReportStatePatterns on CreatingHazardReportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreatingHazardReportStateInitial value)?  initial,TResult Function( _CreatingHazardReportStateLoading value)?  loading,TResult Function( _CreatingHazardReportStateSuccess value)?  success,TResult Function( _CreatingHazardReportStateFailure value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatingHazardReportStateInitial() when initial != null:
return initial(_that);case _CreatingHazardReportStateLoading() when loading != null:
return loading(_that);case _CreatingHazardReportStateSuccess() when success != null:
return success(_that);case _CreatingHazardReportStateFailure() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreatingHazardReportStateInitial value)  initial,required TResult Function( _CreatingHazardReportStateLoading value)  loading,required TResult Function( _CreatingHazardReportStateSuccess value)  success,required TResult Function( _CreatingHazardReportStateFailure value)  error,}){
final _that = this;
switch (_that) {
case _CreatingHazardReportStateInitial():
return initial(_that);case _CreatingHazardReportStateLoading():
return loading(_that);case _CreatingHazardReportStateSuccess():
return success(_that);case _CreatingHazardReportStateFailure():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreatingHazardReportStateInitial value)?  initial,TResult? Function( _CreatingHazardReportStateLoading value)?  loading,TResult? Function( _CreatingHazardReportStateSuccess value)?  success,TResult? Function( _CreatingHazardReportStateFailure value)?  error,}){
final _that = this;
switch (_that) {
case _CreatingHazardReportStateInitial() when initial != null:
return initial(_that);case _CreatingHazardReportStateLoading() when loading != null:
return loading(_that);case _CreatingHazardReportStateSuccess() when success != null:
return success(_that);case _CreatingHazardReportStateFailure() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Hazard hazard)?  success,TResult Function( AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatingHazardReportStateInitial() when initial != null:
return initial();case _CreatingHazardReportStateLoading() when loading != null:
return loading();case _CreatingHazardReportStateSuccess() when success != null:
return success(_that.hazard);case _CreatingHazardReportStateFailure() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Hazard hazard)  success,required TResult Function( AppError error)  error,}) {final _that = this;
switch (_that) {
case _CreatingHazardReportStateInitial():
return initial();case _CreatingHazardReportStateLoading():
return loading();case _CreatingHazardReportStateSuccess():
return success(_that.hazard);case _CreatingHazardReportStateFailure():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Hazard hazard)?  success,TResult? Function( AppError error)?  error,}) {final _that = this;
switch (_that) {
case _CreatingHazardReportStateInitial() when initial != null:
return initial();case _CreatingHazardReportStateLoading() when loading != null:
return loading();case _CreatingHazardReportStateSuccess() when success != null:
return success(_that.hazard);case _CreatingHazardReportStateFailure() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CreatingHazardReportStateInitial implements CreatingHazardReportState {
  const _CreatingHazardReportStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatingHazardReportStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatingHazardReportState.initial()';
}


}




/// @nodoc


class _CreatingHazardReportStateLoading implements CreatingHazardReportState {
  const _CreatingHazardReportStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatingHazardReportStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatingHazardReportState.loading()';
}


}




/// @nodoc


class _CreatingHazardReportStateSuccess implements CreatingHazardReportState {
  const _CreatingHazardReportStateSuccess(this.hazard);
  

 final  Hazard hazard;

/// Create a copy of CreatingHazardReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatingHazardReportStateSuccessCopyWith<_CreatingHazardReportStateSuccess> get copyWith => __$CreatingHazardReportStateSuccessCopyWithImpl<_CreatingHazardReportStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatingHazardReportStateSuccess&&(identical(other.hazard, hazard) || other.hazard == hazard));
}


@override
int get hashCode => Object.hash(runtimeType,hazard);

@override
String toString() {
  return 'CreatingHazardReportState.success(hazard: $hazard)';
}


}

/// @nodoc
abstract mixin class _$CreatingHazardReportStateSuccessCopyWith<$Res> implements $CreatingHazardReportStateCopyWith<$Res> {
  factory _$CreatingHazardReportStateSuccessCopyWith(_CreatingHazardReportStateSuccess value, $Res Function(_CreatingHazardReportStateSuccess) _then) = __$CreatingHazardReportStateSuccessCopyWithImpl;
@useResult
$Res call({
 Hazard hazard
});


$HazardCopyWith<$Res> get hazard;

}
/// @nodoc
class __$CreatingHazardReportStateSuccessCopyWithImpl<$Res>
    implements _$CreatingHazardReportStateSuccessCopyWith<$Res> {
  __$CreatingHazardReportStateSuccessCopyWithImpl(this._self, this._then);

  final _CreatingHazardReportStateSuccess _self;
  final $Res Function(_CreatingHazardReportStateSuccess) _then;

/// Create a copy of CreatingHazardReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hazard = null,}) {
  return _then(_CreatingHazardReportStateSuccess(
null == hazard ? _self.hazard : hazard // ignore: cast_nullable_to_non_nullable
as Hazard,
  ));
}

/// Create a copy of CreatingHazardReportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardCopyWith<$Res> get hazard {
  
  return $HazardCopyWith<$Res>(_self.hazard, (value) {
    return _then(_self.copyWith(hazard: value));
  });
}
}

/// @nodoc


class _CreatingHazardReportStateFailure implements CreatingHazardReportState {
  const _CreatingHazardReportStateFailure(this.error);
  

 final  AppError error;

/// Create a copy of CreatingHazardReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatingHazardReportStateFailureCopyWith<_CreatingHazardReportStateFailure> get copyWith => __$CreatingHazardReportStateFailureCopyWithImpl<_CreatingHazardReportStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatingHazardReportStateFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CreatingHazardReportState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$CreatingHazardReportStateFailureCopyWith<$Res> implements $CreatingHazardReportStateCopyWith<$Res> {
  factory _$CreatingHazardReportStateFailureCopyWith(_CreatingHazardReportStateFailure value, $Res Function(_CreatingHazardReportStateFailure) _then) = __$CreatingHazardReportStateFailureCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$CreatingHazardReportStateFailureCopyWithImpl<$Res>
    implements _$CreatingHazardReportStateFailureCopyWith<$Res> {
  __$CreatingHazardReportStateFailureCopyWithImpl(this._self, this._then);

  final _CreatingHazardReportStateFailure _self;
  final $Res Function(_CreatingHazardReportStateFailure) _then;

/// Create a copy of CreatingHazardReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_CreatingHazardReportStateFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of CreatingHazardReportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res> get error {
  
  return $AppErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
