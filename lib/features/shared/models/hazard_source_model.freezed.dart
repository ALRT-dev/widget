// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hazard_source_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HazardSource {

/// The unique identifier for the hazard source.
 String get id;/// The name of the hazard source.
 String? get name;/// The URL associated with the hazard source.
 String? get url;/// The license information for the hazard source.
 HazardSourceLicense? get license;/// The copyright information for the hazard source.
 String? get copyrightText;/// The link to the copyright information for the hazard source.
 String? get copyrightLink;/// The advisory text provided by the hazard source.
 String? get advisoryText;/// The marker shape for this source's alerts in the "One Glance" model.
 HazardSourceShape? get shape;/// The severity vocabulary this source speaks.
 HazardSeveritySystem? get severitySystem;/// How this source's severity word/level is rendered.
 SeverityLevelHandling? get levelHandling;/// Minutes a marker lingers after the underlying alert clears.
 int? get stickiness;/// The ceiling on the internal band for this source.
 HazardSeverityBand? get maxInternalBand;/// When alerts from this source generate a push notification.
 SourcePushPolicy? get pushPolicy;
/// Create a copy of HazardSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HazardSourceCopyWith<HazardSource> get copyWith => _$HazardSourceCopyWithImpl<HazardSource>(this as HazardSource, _$identity);

  /// Serializes this HazardSource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HazardSource&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.license, license) || other.license == license)&&(identical(other.copyrightText, copyrightText) || other.copyrightText == copyrightText)&&(identical(other.copyrightLink, copyrightLink) || other.copyrightLink == copyrightLink)&&(identical(other.advisoryText, advisoryText) || other.advisoryText == advisoryText)&&(identical(other.shape, shape) || other.shape == shape)&&(identical(other.severitySystem, severitySystem) || other.severitySystem == severitySystem)&&(identical(other.levelHandling, levelHandling) || other.levelHandling == levelHandling)&&(identical(other.stickiness, stickiness) || other.stickiness == stickiness)&&(identical(other.maxInternalBand, maxInternalBand) || other.maxInternalBand == maxInternalBand)&&(identical(other.pushPolicy, pushPolicy) || other.pushPolicy == pushPolicy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,license,copyrightText,copyrightLink,advisoryText,shape,severitySystem,levelHandling,stickiness,maxInternalBand,pushPolicy);

@override
String toString() {
  return 'HazardSource(id: $id, name: $name, url: $url, license: $license, copyrightText: $copyrightText, copyrightLink: $copyrightLink, advisoryText: $advisoryText, shape: $shape, severitySystem: $severitySystem, levelHandling: $levelHandling, stickiness: $stickiness, maxInternalBand: $maxInternalBand, pushPolicy: $pushPolicy)';
}


}

/// @nodoc
abstract mixin class $HazardSourceCopyWith<$Res>  {
  factory $HazardSourceCopyWith(HazardSource value, $Res Function(HazardSource) _then) = _$HazardSourceCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? url, HazardSourceLicense? license, String? copyrightText, String? copyrightLink, String? advisoryText, HazardSourceShape? shape, HazardSeveritySystem? severitySystem, SeverityLevelHandling? levelHandling, int? stickiness, HazardSeverityBand? maxInternalBand, SourcePushPolicy? pushPolicy
});


$HazardSourceLicenseCopyWith<$Res>? get license;

}
/// @nodoc
class _$HazardSourceCopyWithImpl<$Res>
    implements $HazardSourceCopyWith<$Res> {
  _$HazardSourceCopyWithImpl(this._self, this._then);

  final HazardSource _self;
  final $Res Function(HazardSource) _then;

/// Create a copy of HazardSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? url = freezed,Object? license = freezed,Object? copyrightText = freezed,Object? copyrightLink = freezed,Object? advisoryText = freezed,Object? shape = freezed,Object? severitySystem = freezed,Object? levelHandling = freezed,Object? stickiness = freezed,Object? maxInternalBand = freezed,Object? pushPolicy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as HazardSourceLicense?,copyrightText: freezed == copyrightText ? _self.copyrightText : copyrightText // ignore: cast_nullable_to_non_nullable
as String?,copyrightLink: freezed == copyrightLink ? _self.copyrightLink : copyrightLink // ignore: cast_nullable_to_non_nullable
as String?,advisoryText: freezed == advisoryText ? _self.advisoryText : advisoryText // ignore: cast_nullable_to_non_nullable
as String?,shape: freezed == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as HazardSourceShape?,severitySystem: freezed == severitySystem ? _self.severitySystem : severitySystem // ignore: cast_nullable_to_non_nullable
as HazardSeveritySystem?,levelHandling: freezed == levelHandling ? _self.levelHandling : levelHandling // ignore: cast_nullable_to_non_nullable
as SeverityLevelHandling?,stickiness: freezed == stickiness ? _self.stickiness : stickiness // ignore: cast_nullable_to_non_nullable
as int?,maxInternalBand: freezed == maxInternalBand ? _self.maxInternalBand : maxInternalBand // ignore: cast_nullable_to_non_nullable
as HazardSeverityBand?,pushPolicy: freezed == pushPolicy ? _self.pushPolicy : pushPolicy // ignore: cast_nullable_to_non_nullable
as SourcePushPolicy?,
  ));
}
/// Create a copy of HazardSource
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardSourceLicenseCopyWith<$Res>? get license {
    if (_self.license == null) {
    return null;
  }

  return $HazardSourceLicenseCopyWith<$Res>(_self.license!, (value) {
    return _then(_self.copyWith(license: value));
  });
}
}


/// Adds pattern-matching-related methods to [HazardSource].
extension HazardSourcePatterns on HazardSource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HazardSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HazardSource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HazardSource value)  $default,){
final _that = this;
switch (_that) {
case _HazardSource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HazardSource value)?  $default,){
final _that = this;
switch (_that) {
case _HazardSource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? url,  HazardSourceLicense? license,  String? copyrightText,  String? copyrightLink,  String? advisoryText,  HazardSourceShape? shape,  HazardSeveritySystem? severitySystem,  SeverityLevelHandling? levelHandling,  int? stickiness,  HazardSeverityBand? maxInternalBand,  SourcePushPolicy? pushPolicy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HazardSource() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.license,_that.copyrightText,_that.copyrightLink,_that.advisoryText,_that.shape,_that.severitySystem,_that.levelHandling,_that.stickiness,_that.maxInternalBand,_that.pushPolicy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? url,  HazardSourceLicense? license,  String? copyrightText,  String? copyrightLink,  String? advisoryText,  HazardSourceShape? shape,  HazardSeveritySystem? severitySystem,  SeverityLevelHandling? levelHandling,  int? stickiness,  HazardSeverityBand? maxInternalBand,  SourcePushPolicy? pushPolicy)  $default,) {final _that = this;
switch (_that) {
case _HazardSource():
return $default(_that.id,_that.name,_that.url,_that.license,_that.copyrightText,_that.copyrightLink,_that.advisoryText,_that.shape,_that.severitySystem,_that.levelHandling,_that.stickiness,_that.maxInternalBand,_that.pushPolicy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? url,  HazardSourceLicense? license,  String? copyrightText,  String? copyrightLink,  String? advisoryText,  HazardSourceShape? shape,  HazardSeveritySystem? severitySystem,  SeverityLevelHandling? levelHandling,  int? stickiness,  HazardSeverityBand? maxInternalBand,  SourcePushPolicy? pushPolicy)?  $default,) {final _that = this;
switch (_that) {
case _HazardSource() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.license,_that.copyrightText,_that.copyrightLink,_that.advisoryText,_that.shape,_that.severitySystem,_that.levelHandling,_that.stickiness,_that.maxInternalBand,_that.pushPolicy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HazardSource implements HazardSource {
  const _HazardSource({required this.id, this.name, this.url, this.license, this.copyrightText, this.copyrightLink, this.advisoryText, this.shape, this.severitySystem, this.levelHandling, this.stickiness, this.maxInternalBand, this.pushPolicy});
  factory _HazardSource.fromJson(Map<String, dynamic> json) => _$HazardSourceFromJson(json);

/// The unique identifier for the hazard source.
@override final  String id;
/// The name of the hazard source.
@override final  String? name;
/// The URL associated with the hazard source.
@override final  String? url;
/// The license information for the hazard source.
@override final  HazardSourceLicense? license;
/// The copyright information for the hazard source.
@override final  String? copyrightText;
/// The link to the copyright information for the hazard source.
@override final  String? copyrightLink;
/// The advisory text provided by the hazard source.
@override final  String? advisoryText;
/// The marker shape for this source's alerts in the "One Glance" model.
@override final  HazardSourceShape? shape;
/// The severity vocabulary this source speaks.
@override final  HazardSeveritySystem? severitySystem;
/// How this source's severity word/level is rendered.
@override final  SeverityLevelHandling? levelHandling;
/// Minutes a marker lingers after the underlying alert clears.
@override final  int? stickiness;
/// The ceiling on the internal band for this source.
@override final  HazardSeverityBand? maxInternalBand;
/// When alerts from this source generate a push notification.
@override final  SourcePushPolicy? pushPolicy;

/// Create a copy of HazardSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HazardSourceCopyWith<_HazardSource> get copyWith => __$HazardSourceCopyWithImpl<_HazardSource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HazardSourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HazardSource&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.license, license) || other.license == license)&&(identical(other.copyrightText, copyrightText) || other.copyrightText == copyrightText)&&(identical(other.copyrightLink, copyrightLink) || other.copyrightLink == copyrightLink)&&(identical(other.advisoryText, advisoryText) || other.advisoryText == advisoryText)&&(identical(other.shape, shape) || other.shape == shape)&&(identical(other.severitySystem, severitySystem) || other.severitySystem == severitySystem)&&(identical(other.levelHandling, levelHandling) || other.levelHandling == levelHandling)&&(identical(other.stickiness, stickiness) || other.stickiness == stickiness)&&(identical(other.maxInternalBand, maxInternalBand) || other.maxInternalBand == maxInternalBand)&&(identical(other.pushPolicy, pushPolicy) || other.pushPolicy == pushPolicy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,license,copyrightText,copyrightLink,advisoryText,shape,severitySystem,levelHandling,stickiness,maxInternalBand,pushPolicy);

@override
String toString() {
  return 'HazardSource(id: $id, name: $name, url: $url, license: $license, copyrightText: $copyrightText, copyrightLink: $copyrightLink, advisoryText: $advisoryText, shape: $shape, severitySystem: $severitySystem, levelHandling: $levelHandling, stickiness: $stickiness, maxInternalBand: $maxInternalBand, pushPolicy: $pushPolicy)';
}


}

/// @nodoc
abstract mixin class _$HazardSourceCopyWith<$Res> implements $HazardSourceCopyWith<$Res> {
  factory _$HazardSourceCopyWith(_HazardSource value, $Res Function(_HazardSource) _then) = __$HazardSourceCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? url, HazardSourceLicense? license, String? copyrightText, String? copyrightLink, String? advisoryText, HazardSourceShape? shape, HazardSeveritySystem? severitySystem, SeverityLevelHandling? levelHandling, int? stickiness, HazardSeverityBand? maxInternalBand, SourcePushPolicy? pushPolicy
});


@override $HazardSourceLicenseCopyWith<$Res>? get license;

}
/// @nodoc
class __$HazardSourceCopyWithImpl<$Res>
    implements _$HazardSourceCopyWith<$Res> {
  __$HazardSourceCopyWithImpl(this._self, this._then);

  final _HazardSource _self;
  final $Res Function(_HazardSource) _then;

/// Create a copy of HazardSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? url = freezed,Object? license = freezed,Object? copyrightText = freezed,Object? copyrightLink = freezed,Object? advisoryText = freezed,Object? shape = freezed,Object? severitySystem = freezed,Object? levelHandling = freezed,Object? stickiness = freezed,Object? maxInternalBand = freezed,Object? pushPolicy = freezed,}) {
  return _then(_HazardSource(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as HazardSourceLicense?,copyrightText: freezed == copyrightText ? _self.copyrightText : copyrightText // ignore: cast_nullable_to_non_nullable
as String?,copyrightLink: freezed == copyrightLink ? _self.copyrightLink : copyrightLink // ignore: cast_nullable_to_non_nullable
as String?,advisoryText: freezed == advisoryText ? _self.advisoryText : advisoryText // ignore: cast_nullable_to_non_nullable
as String?,shape: freezed == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as HazardSourceShape?,severitySystem: freezed == severitySystem ? _self.severitySystem : severitySystem // ignore: cast_nullable_to_non_nullable
as HazardSeveritySystem?,levelHandling: freezed == levelHandling ? _self.levelHandling : levelHandling // ignore: cast_nullable_to_non_nullable
as SeverityLevelHandling?,stickiness: freezed == stickiness ? _self.stickiness : stickiness // ignore: cast_nullable_to_non_nullable
as int?,maxInternalBand: freezed == maxInternalBand ? _self.maxInternalBand : maxInternalBand // ignore: cast_nullable_to_non_nullable
as HazardSeverityBand?,pushPolicy: freezed == pushPolicy ? _self.pushPolicy : pushPolicy // ignore: cast_nullable_to_non_nullable
as SourcePushPolicy?,
  ));
}

/// Create a copy of HazardSource
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardSourceLicenseCopyWith<$Res>? get license {
    if (_self.license == null) {
    return null;
  }

  return $HazardSourceLicenseCopyWith<$Res>(_self.license!, (value) {
    return _then(_self.copyWith(license: value));
  });
}
}

// dart format on
