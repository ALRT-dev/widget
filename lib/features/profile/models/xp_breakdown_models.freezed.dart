// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xp_breakdown_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XpBreakdown {

 int get currentXpPoints; double get reliabilityScore; int get expectedXpFromCalculation; int get rank; int get totalUsers; int get percentile; XpBreakdownStats? get stats; List<XpHazardBreakdown> get hazardBreakdowns;
/// Create a copy of XpBreakdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XpBreakdownCopyWith<XpBreakdown> get copyWith => _$XpBreakdownCopyWithImpl<XpBreakdown>(this as XpBreakdown, _$identity);

  /// Serializes this XpBreakdown to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XpBreakdown&&(identical(other.currentXpPoints, currentXpPoints) || other.currentXpPoints == currentXpPoints)&&(identical(other.reliabilityScore, reliabilityScore) || other.reliabilityScore == reliabilityScore)&&(identical(other.expectedXpFromCalculation, expectedXpFromCalculation) || other.expectedXpFromCalculation == expectedXpFromCalculation)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers)&&(identical(other.percentile, percentile) || other.percentile == percentile)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other.hazardBreakdowns, hazardBreakdowns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentXpPoints,reliabilityScore,expectedXpFromCalculation,rank,totalUsers,percentile,stats,const DeepCollectionEquality().hash(hazardBreakdowns));

@override
String toString() {
  return 'XpBreakdown(currentXpPoints: $currentXpPoints, reliabilityScore: $reliabilityScore, expectedXpFromCalculation: $expectedXpFromCalculation, rank: $rank, totalUsers: $totalUsers, percentile: $percentile, stats: $stats, hazardBreakdowns: $hazardBreakdowns)';
}


}

/// @nodoc
abstract mixin class $XpBreakdownCopyWith<$Res>  {
  factory $XpBreakdownCopyWith(XpBreakdown value, $Res Function(XpBreakdown) _then) = _$XpBreakdownCopyWithImpl;
@useResult
$Res call({
 int currentXpPoints, double reliabilityScore, int expectedXpFromCalculation, int rank, int totalUsers, int percentile, XpBreakdownStats? stats, List<XpHazardBreakdown> hazardBreakdowns
});


$XpBreakdownStatsCopyWith<$Res>? get stats;

}
/// @nodoc
class _$XpBreakdownCopyWithImpl<$Res>
    implements $XpBreakdownCopyWith<$Res> {
  _$XpBreakdownCopyWithImpl(this._self, this._then);

  final XpBreakdown _self;
  final $Res Function(XpBreakdown) _then;

/// Create a copy of XpBreakdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentXpPoints = null,Object? reliabilityScore = null,Object? expectedXpFromCalculation = null,Object? rank = null,Object? totalUsers = null,Object? percentile = null,Object? stats = freezed,Object? hazardBreakdowns = null,}) {
  return _then(_self.copyWith(
currentXpPoints: null == currentXpPoints ? _self.currentXpPoints : currentXpPoints // ignore: cast_nullable_to_non_nullable
as int,reliabilityScore: null == reliabilityScore ? _self.reliabilityScore : reliabilityScore // ignore: cast_nullable_to_non_nullable
as double,expectedXpFromCalculation: null == expectedXpFromCalculation ? _self.expectedXpFromCalculation : expectedXpFromCalculation // ignore: cast_nullable_to_non_nullable
as int,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,percentile: null == percentile ? _self.percentile : percentile // ignore: cast_nullable_to_non_nullable
as int,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as XpBreakdownStats?,hazardBreakdowns: null == hazardBreakdowns ? _self.hazardBreakdowns : hazardBreakdowns // ignore: cast_nullable_to_non_nullable
as List<XpHazardBreakdown>,
  ));
}
/// Create a copy of XpBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XpBreakdownStatsCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $XpBreakdownStatsCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [XpBreakdown].
extension XpBreakdownPatterns on XpBreakdown {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XpBreakdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XpBreakdown() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XpBreakdown value)  $default,){
final _that = this;
switch (_that) {
case _XpBreakdown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XpBreakdown value)?  $default,){
final _that = this;
switch (_that) {
case _XpBreakdown() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentXpPoints,  double reliabilityScore,  int expectedXpFromCalculation,  int rank,  int totalUsers,  int percentile,  XpBreakdownStats? stats,  List<XpHazardBreakdown> hazardBreakdowns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XpBreakdown() when $default != null:
return $default(_that.currentXpPoints,_that.reliabilityScore,_that.expectedXpFromCalculation,_that.rank,_that.totalUsers,_that.percentile,_that.stats,_that.hazardBreakdowns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentXpPoints,  double reliabilityScore,  int expectedXpFromCalculation,  int rank,  int totalUsers,  int percentile,  XpBreakdownStats? stats,  List<XpHazardBreakdown> hazardBreakdowns)  $default,) {final _that = this;
switch (_that) {
case _XpBreakdown():
return $default(_that.currentXpPoints,_that.reliabilityScore,_that.expectedXpFromCalculation,_that.rank,_that.totalUsers,_that.percentile,_that.stats,_that.hazardBreakdowns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentXpPoints,  double reliabilityScore,  int expectedXpFromCalculation,  int rank,  int totalUsers,  int percentile,  XpBreakdownStats? stats,  List<XpHazardBreakdown> hazardBreakdowns)?  $default,) {final _that = this;
switch (_that) {
case _XpBreakdown() when $default != null:
return $default(_that.currentXpPoints,_that.reliabilityScore,_that.expectedXpFromCalculation,_that.rank,_that.totalUsers,_that.percentile,_that.stats,_that.hazardBreakdowns);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XpBreakdown implements XpBreakdown {
  const _XpBreakdown({this.currentXpPoints = 0, this.reliabilityScore = 0.0, this.expectedXpFromCalculation = 0, this.rank = 0, this.totalUsers = 0, this.percentile = 0, this.stats, final  List<XpHazardBreakdown> hazardBreakdowns = const <XpHazardBreakdown>[]}): _hazardBreakdowns = hazardBreakdowns;
  factory _XpBreakdown.fromJson(Map<String, dynamic> json) => _$XpBreakdownFromJson(json);

@override@JsonKey() final  int currentXpPoints;
@override@JsonKey() final  double reliabilityScore;
@override@JsonKey() final  int expectedXpFromCalculation;
@override@JsonKey() final  int rank;
@override@JsonKey() final  int totalUsers;
@override@JsonKey() final  int percentile;
@override final  XpBreakdownStats? stats;
 final  List<XpHazardBreakdown> _hazardBreakdowns;
@override@JsonKey() List<XpHazardBreakdown> get hazardBreakdowns {
  if (_hazardBreakdowns is EqualUnmodifiableListView) return _hazardBreakdowns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazardBreakdowns);
}


/// Create a copy of XpBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XpBreakdownCopyWith<_XpBreakdown> get copyWith => __$XpBreakdownCopyWithImpl<_XpBreakdown>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XpBreakdownToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XpBreakdown&&(identical(other.currentXpPoints, currentXpPoints) || other.currentXpPoints == currentXpPoints)&&(identical(other.reliabilityScore, reliabilityScore) || other.reliabilityScore == reliabilityScore)&&(identical(other.expectedXpFromCalculation, expectedXpFromCalculation) || other.expectedXpFromCalculation == expectedXpFromCalculation)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers)&&(identical(other.percentile, percentile) || other.percentile == percentile)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other._hazardBreakdowns, _hazardBreakdowns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentXpPoints,reliabilityScore,expectedXpFromCalculation,rank,totalUsers,percentile,stats,const DeepCollectionEquality().hash(_hazardBreakdowns));

@override
String toString() {
  return 'XpBreakdown(currentXpPoints: $currentXpPoints, reliabilityScore: $reliabilityScore, expectedXpFromCalculation: $expectedXpFromCalculation, rank: $rank, totalUsers: $totalUsers, percentile: $percentile, stats: $stats, hazardBreakdowns: $hazardBreakdowns)';
}


}

/// @nodoc
abstract mixin class _$XpBreakdownCopyWith<$Res> implements $XpBreakdownCopyWith<$Res> {
  factory _$XpBreakdownCopyWith(_XpBreakdown value, $Res Function(_XpBreakdown) _then) = __$XpBreakdownCopyWithImpl;
@override @useResult
$Res call({
 int currentXpPoints, double reliabilityScore, int expectedXpFromCalculation, int rank, int totalUsers, int percentile, XpBreakdownStats? stats, List<XpHazardBreakdown> hazardBreakdowns
});


@override $XpBreakdownStatsCopyWith<$Res>? get stats;

}
/// @nodoc
class __$XpBreakdownCopyWithImpl<$Res>
    implements _$XpBreakdownCopyWith<$Res> {
  __$XpBreakdownCopyWithImpl(this._self, this._then);

  final _XpBreakdown _self;
  final $Res Function(_XpBreakdown) _then;

/// Create a copy of XpBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentXpPoints = null,Object? reliabilityScore = null,Object? expectedXpFromCalculation = null,Object? rank = null,Object? totalUsers = null,Object? percentile = null,Object? stats = freezed,Object? hazardBreakdowns = null,}) {
  return _then(_XpBreakdown(
currentXpPoints: null == currentXpPoints ? _self.currentXpPoints : currentXpPoints // ignore: cast_nullable_to_non_nullable
as int,reliabilityScore: null == reliabilityScore ? _self.reliabilityScore : reliabilityScore // ignore: cast_nullable_to_non_nullable
as double,expectedXpFromCalculation: null == expectedXpFromCalculation ? _self.expectedXpFromCalculation : expectedXpFromCalculation // ignore: cast_nullable_to_non_nullable
as int,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,percentile: null == percentile ? _self.percentile : percentile // ignore: cast_nullable_to_non_nullable
as int,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as XpBreakdownStats?,hazardBreakdowns: null == hazardBreakdowns ? _self._hazardBreakdowns : hazardBreakdowns // ignore: cast_nullable_to_non_nullable
as List<XpHazardBreakdown>,
  ));
}

/// Create a copy of XpBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XpBreakdownStatsCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $XpBreakdownStatsCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$XpBreakdownStats {

 int get totalHazardsReported; int get totalVotesCast; int get totalHazardViews;
/// Create a copy of XpBreakdownStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XpBreakdownStatsCopyWith<XpBreakdownStats> get copyWith => _$XpBreakdownStatsCopyWithImpl<XpBreakdownStats>(this as XpBreakdownStats, _$identity);

  /// Serializes this XpBreakdownStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XpBreakdownStats&&(identical(other.totalHazardsReported, totalHazardsReported) || other.totalHazardsReported == totalHazardsReported)&&(identical(other.totalVotesCast, totalVotesCast) || other.totalVotesCast == totalVotesCast)&&(identical(other.totalHazardViews, totalHazardViews) || other.totalHazardViews == totalHazardViews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalHazardsReported,totalVotesCast,totalHazardViews);

@override
String toString() {
  return 'XpBreakdownStats(totalHazardsReported: $totalHazardsReported, totalVotesCast: $totalVotesCast, totalHazardViews: $totalHazardViews)';
}


}

/// @nodoc
abstract mixin class $XpBreakdownStatsCopyWith<$Res>  {
  factory $XpBreakdownStatsCopyWith(XpBreakdownStats value, $Res Function(XpBreakdownStats) _then) = _$XpBreakdownStatsCopyWithImpl;
@useResult
$Res call({
 int totalHazardsReported, int totalVotesCast, int totalHazardViews
});




}
/// @nodoc
class _$XpBreakdownStatsCopyWithImpl<$Res>
    implements $XpBreakdownStatsCopyWith<$Res> {
  _$XpBreakdownStatsCopyWithImpl(this._self, this._then);

  final XpBreakdownStats _self;
  final $Res Function(XpBreakdownStats) _then;

/// Create a copy of XpBreakdownStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalHazardsReported = null,Object? totalVotesCast = null,Object? totalHazardViews = null,}) {
  return _then(_self.copyWith(
totalHazardsReported: null == totalHazardsReported ? _self.totalHazardsReported : totalHazardsReported // ignore: cast_nullable_to_non_nullable
as int,totalVotesCast: null == totalVotesCast ? _self.totalVotesCast : totalVotesCast // ignore: cast_nullable_to_non_nullable
as int,totalHazardViews: null == totalHazardViews ? _self.totalHazardViews : totalHazardViews // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [XpBreakdownStats].
extension XpBreakdownStatsPatterns on XpBreakdownStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XpBreakdownStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XpBreakdownStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XpBreakdownStats value)  $default,){
final _that = this;
switch (_that) {
case _XpBreakdownStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XpBreakdownStats value)?  $default,){
final _that = this;
switch (_that) {
case _XpBreakdownStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalHazardsReported,  int totalVotesCast,  int totalHazardViews)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XpBreakdownStats() when $default != null:
return $default(_that.totalHazardsReported,_that.totalVotesCast,_that.totalHazardViews);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalHazardsReported,  int totalVotesCast,  int totalHazardViews)  $default,) {final _that = this;
switch (_that) {
case _XpBreakdownStats():
return $default(_that.totalHazardsReported,_that.totalVotesCast,_that.totalHazardViews);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalHazardsReported,  int totalVotesCast,  int totalHazardViews)?  $default,) {final _that = this;
switch (_that) {
case _XpBreakdownStats() when $default != null:
return $default(_that.totalHazardsReported,_that.totalVotesCast,_that.totalHazardViews);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XpBreakdownStats implements XpBreakdownStats {
  const _XpBreakdownStats({this.totalHazardsReported = 0, this.totalVotesCast = 0, this.totalHazardViews = 0});
  factory _XpBreakdownStats.fromJson(Map<String, dynamic> json) => _$XpBreakdownStatsFromJson(json);

@override@JsonKey() final  int totalHazardsReported;
@override@JsonKey() final  int totalVotesCast;
@override@JsonKey() final  int totalHazardViews;

/// Create a copy of XpBreakdownStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XpBreakdownStatsCopyWith<_XpBreakdownStats> get copyWith => __$XpBreakdownStatsCopyWithImpl<_XpBreakdownStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XpBreakdownStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XpBreakdownStats&&(identical(other.totalHazardsReported, totalHazardsReported) || other.totalHazardsReported == totalHazardsReported)&&(identical(other.totalVotesCast, totalVotesCast) || other.totalVotesCast == totalVotesCast)&&(identical(other.totalHazardViews, totalHazardViews) || other.totalHazardViews == totalHazardViews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalHazardsReported,totalVotesCast,totalHazardViews);

@override
String toString() {
  return 'XpBreakdownStats(totalHazardsReported: $totalHazardsReported, totalVotesCast: $totalVotesCast, totalHazardViews: $totalHazardViews)';
}


}

/// @nodoc
abstract mixin class _$XpBreakdownStatsCopyWith<$Res> implements $XpBreakdownStatsCopyWith<$Res> {
  factory _$XpBreakdownStatsCopyWith(_XpBreakdownStats value, $Res Function(_XpBreakdownStats) _then) = __$XpBreakdownStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalHazardsReported, int totalVotesCast, int totalHazardViews
});




}
/// @nodoc
class __$XpBreakdownStatsCopyWithImpl<$Res>
    implements _$XpBreakdownStatsCopyWith<$Res> {
  __$XpBreakdownStatsCopyWithImpl(this._self, this._then);

  final _XpBreakdownStats _self;
  final $Res Function(_XpBreakdownStats) _then;

/// Create a copy of XpBreakdownStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalHazardsReported = null,Object? totalVotesCast = null,Object? totalHazardViews = null,}) {
  return _then(_XpBreakdownStats(
totalHazardsReported: null == totalHazardsReported ? _self.totalHazardsReported : totalHazardsReported // ignore: cast_nullable_to_non_nullable
as int,totalVotesCast: null == totalVotesCast ? _self.totalVotesCast : totalVotesCast // ignore: cast_nullable_to_non_nullable
as int,totalHazardViews: null == totalHazardViews ? _self.totalHazardViews : totalHazardViews // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$XpHazardBreakdown {

 String get hazardId; String get title; String get reviewStatus; int get baseXpPoints; int get engagementXpPoints; int get totalEstimatedXp; DateTime? get createdAt;
/// Create a copy of XpHazardBreakdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XpHazardBreakdownCopyWith<XpHazardBreakdown> get copyWith => _$XpHazardBreakdownCopyWithImpl<XpHazardBreakdown>(this as XpHazardBreakdown, _$identity);

  /// Serializes this XpHazardBreakdown to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XpHazardBreakdown&&(identical(other.hazardId, hazardId) || other.hazardId == hazardId)&&(identical(other.title, title) || other.title == title)&&(identical(other.reviewStatus, reviewStatus) || other.reviewStatus == reviewStatus)&&(identical(other.baseXpPoints, baseXpPoints) || other.baseXpPoints == baseXpPoints)&&(identical(other.engagementXpPoints, engagementXpPoints) || other.engagementXpPoints == engagementXpPoints)&&(identical(other.totalEstimatedXp, totalEstimatedXp) || other.totalEstimatedXp == totalEstimatedXp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hazardId,title,reviewStatus,baseXpPoints,engagementXpPoints,totalEstimatedXp,createdAt);

@override
String toString() {
  return 'XpHazardBreakdown(hazardId: $hazardId, title: $title, reviewStatus: $reviewStatus, baseXpPoints: $baseXpPoints, engagementXpPoints: $engagementXpPoints, totalEstimatedXp: $totalEstimatedXp, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $XpHazardBreakdownCopyWith<$Res>  {
  factory $XpHazardBreakdownCopyWith(XpHazardBreakdown value, $Res Function(XpHazardBreakdown) _then) = _$XpHazardBreakdownCopyWithImpl;
@useResult
$Res call({
 String hazardId, String title, String reviewStatus, int baseXpPoints, int engagementXpPoints, int totalEstimatedXp, DateTime? createdAt
});




}
/// @nodoc
class _$XpHazardBreakdownCopyWithImpl<$Res>
    implements $XpHazardBreakdownCopyWith<$Res> {
  _$XpHazardBreakdownCopyWithImpl(this._self, this._then);

  final XpHazardBreakdown _self;
  final $Res Function(XpHazardBreakdown) _then;

/// Create a copy of XpHazardBreakdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hazardId = null,Object? title = null,Object? reviewStatus = null,Object? baseXpPoints = null,Object? engagementXpPoints = null,Object? totalEstimatedXp = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
hazardId: null == hazardId ? _self.hazardId : hazardId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,reviewStatus: null == reviewStatus ? _self.reviewStatus : reviewStatus // ignore: cast_nullable_to_non_nullable
as String,baseXpPoints: null == baseXpPoints ? _self.baseXpPoints : baseXpPoints // ignore: cast_nullable_to_non_nullable
as int,engagementXpPoints: null == engagementXpPoints ? _self.engagementXpPoints : engagementXpPoints // ignore: cast_nullable_to_non_nullable
as int,totalEstimatedXp: null == totalEstimatedXp ? _self.totalEstimatedXp : totalEstimatedXp // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [XpHazardBreakdown].
extension XpHazardBreakdownPatterns on XpHazardBreakdown {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XpHazardBreakdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XpHazardBreakdown() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XpHazardBreakdown value)  $default,){
final _that = this;
switch (_that) {
case _XpHazardBreakdown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XpHazardBreakdown value)?  $default,){
final _that = this;
switch (_that) {
case _XpHazardBreakdown() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hazardId,  String title,  String reviewStatus,  int baseXpPoints,  int engagementXpPoints,  int totalEstimatedXp,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XpHazardBreakdown() when $default != null:
return $default(_that.hazardId,_that.title,_that.reviewStatus,_that.baseXpPoints,_that.engagementXpPoints,_that.totalEstimatedXp,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hazardId,  String title,  String reviewStatus,  int baseXpPoints,  int engagementXpPoints,  int totalEstimatedXp,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _XpHazardBreakdown():
return $default(_that.hazardId,_that.title,_that.reviewStatus,_that.baseXpPoints,_that.engagementXpPoints,_that.totalEstimatedXp,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hazardId,  String title,  String reviewStatus,  int baseXpPoints,  int engagementXpPoints,  int totalEstimatedXp,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _XpHazardBreakdown() when $default != null:
return $default(_that.hazardId,_that.title,_that.reviewStatus,_that.baseXpPoints,_that.engagementXpPoints,_that.totalEstimatedXp,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XpHazardBreakdown implements XpHazardBreakdown {
  const _XpHazardBreakdown({required this.hazardId, this.title = '', this.reviewStatus = 'pending', this.baseXpPoints = 0, this.engagementXpPoints = 0, this.totalEstimatedXp = 0, this.createdAt});
  factory _XpHazardBreakdown.fromJson(Map<String, dynamic> json) => _$XpHazardBreakdownFromJson(json);

@override final  String hazardId;
@override@JsonKey() final  String title;
@override@JsonKey() final  String reviewStatus;
@override@JsonKey() final  int baseXpPoints;
@override@JsonKey() final  int engagementXpPoints;
@override@JsonKey() final  int totalEstimatedXp;
@override final  DateTime? createdAt;

/// Create a copy of XpHazardBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XpHazardBreakdownCopyWith<_XpHazardBreakdown> get copyWith => __$XpHazardBreakdownCopyWithImpl<_XpHazardBreakdown>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XpHazardBreakdownToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XpHazardBreakdown&&(identical(other.hazardId, hazardId) || other.hazardId == hazardId)&&(identical(other.title, title) || other.title == title)&&(identical(other.reviewStatus, reviewStatus) || other.reviewStatus == reviewStatus)&&(identical(other.baseXpPoints, baseXpPoints) || other.baseXpPoints == baseXpPoints)&&(identical(other.engagementXpPoints, engagementXpPoints) || other.engagementXpPoints == engagementXpPoints)&&(identical(other.totalEstimatedXp, totalEstimatedXp) || other.totalEstimatedXp == totalEstimatedXp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hazardId,title,reviewStatus,baseXpPoints,engagementXpPoints,totalEstimatedXp,createdAt);

@override
String toString() {
  return 'XpHazardBreakdown(hazardId: $hazardId, title: $title, reviewStatus: $reviewStatus, baseXpPoints: $baseXpPoints, engagementXpPoints: $engagementXpPoints, totalEstimatedXp: $totalEstimatedXp, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$XpHazardBreakdownCopyWith<$Res> implements $XpHazardBreakdownCopyWith<$Res> {
  factory _$XpHazardBreakdownCopyWith(_XpHazardBreakdown value, $Res Function(_XpHazardBreakdown) _then) = __$XpHazardBreakdownCopyWithImpl;
@override @useResult
$Res call({
 String hazardId, String title, String reviewStatus, int baseXpPoints, int engagementXpPoints, int totalEstimatedXp, DateTime? createdAt
});




}
/// @nodoc
class __$XpHazardBreakdownCopyWithImpl<$Res>
    implements _$XpHazardBreakdownCopyWith<$Res> {
  __$XpHazardBreakdownCopyWithImpl(this._self, this._then);

  final _XpHazardBreakdown _self;
  final $Res Function(_XpHazardBreakdown) _then;

/// Create a copy of XpHazardBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hazardId = null,Object? title = null,Object? reviewStatus = null,Object? baseXpPoints = null,Object? engagementXpPoints = null,Object? totalEstimatedXp = null,Object? createdAt = freezed,}) {
  return _then(_XpHazardBreakdown(
hazardId: null == hazardId ? _self.hazardId : hazardId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,reviewStatus: null == reviewStatus ? _self.reviewStatus : reviewStatus // ignore: cast_nullable_to_non_nullable
as String,baseXpPoints: null == baseXpPoints ? _self.baseXpPoints : baseXpPoints // ignore: cast_nullable_to_non_nullable
as int,engagementXpPoints: null == engagementXpPoints ? _self.engagementXpPoints : engagementXpPoints // ignore: cast_nullable_to_non_nullable
as int,totalEstimatedXp: null == totalEstimatedXp ? _self.totalEstimatedXp : totalEstimatedXp // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
