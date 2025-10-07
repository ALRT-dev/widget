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
  DateTime? get dateTime;

  /// The selected category of the hazard.
  HazardCategory? get category;

  /// The name of the new category if [category] represents "Other" category.
  ///
  /// This field is required if [category] represents "Other" category.
  /// Otherwise, it will be ignored.
  String? get otherCategoryName;

  /// The location of the hazard.
  AlrtLocation? get location;

  /// The description of the hazard.
  String? get description;

  /// The list of media associated with the hazard report.
  List<AlrtMedia> get medias;

  /// Create a copy of CreateReportProviderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateReportProviderStateCopyWith<CreateReportProviderState> get copyWith =>
      _$CreateReportProviderStateCopyWithImpl<CreateReportProviderState>(
          this as CreateReportProviderState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateReportProviderState &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.otherCategoryName, otherCategoryName) ||
                other.otherCategoryName == otherCategoryName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.medias, medias));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      dateTime,
      category,
      otherCategoryName,
      location,
      description,
      const DeepCollectionEquality().hash(medias));

  @override
  String toString() {
    return 'CreateReportProviderState(dateTime: $dateTime, category: $category, otherCategoryName: $otherCategoryName, location: $location, description: $description, medias: $medias)';
  }
}

/// @nodoc
abstract mixin class $CreateReportProviderStateCopyWith<$Res> {
  factory $CreateReportProviderStateCopyWith(CreateReportProviderState value,
          $Res Function(CreateReportProviderState) _then) =
      _$CreateReportProviderStateCopyWithImpl;
  @useResult
  $Res call(
      {DateTime? dateTime,
      HazardCategory? category,
      String? otherCategoryName,
      AlrtLocation? location,
      String? description,
      List<AlrtMedia> medias});

  $HazardCategoryCopyWith<$Res>? get category;
  $AlrtLocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$CreateReportProviderStateCopyWithImpl<$Res>
    implements $CreateReportProviderStateCopyWith<$Res> {
  _$CreateReportProviderStateCopyWithImpl(this._self, this._then);

  final CreateReportProviderState _self;
  final $Res Function(CreateReportProviderState) _then;

  /// Create a copy of CreateReportProviderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? category = freezed,
    Object? otherCategoryName = freezed,
    Object? location = freezed,
    Object? description = freezed,
    Object? medias = null,
  }) {
    return _then(_self.copyWith(
      dateTime: freezed == dateTime
          ? _self.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as HazardCategory?,
      otherCategoryName: freezed == otherCategoryName
          ? _self.otherCategoryName
          : otherCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as AlrtLocation?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      medias: null == medias
          ? _self.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<AlrtMedia>,
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
  }

  /// Create a copy of CreateReportProviderState
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateReportProviderState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateReportProviderState() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateReportProviderState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportProviderState():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateReportProviderState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportProviderState() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            DateTime? dateTime,
            HazardCategory? category,
            String? otherCategoryName,
            AlrtLocation? location,
            String? description,
            List<AlrtMedia> medias)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateReportProviderState() when $default != null:
        return $default(_that.dateTime, _that.category, _that.otherCategoryName,
            _that.location, _that.description, _that.medias);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            DateTime? dateTime,
            HazardCategory? category,
            String? otherCategoryName,
            AlrtLocation? location,
            String? description,
            List<AlrtMedia> medias)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportProviderState():
        return $default(_that.dateTime, _that.category, _that.otherCategoryName,
            _that.location, _that.description, _that.medias);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            DateTime? dateTime,
            HazardCategory? category,
            String? otherCategoryName,
            AlrtLocation? location,
            String? description,
            List<AlrtMedia> medias)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportProviderState() when $default != null:
        return $default(_that.dateTime, _that.category, _that.otherCategoryName,
            _that.location, _that.description, _that.medias);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CreateReportProviderState implements CreateReportProviderState {
  const _CreateReportProviderState(
      {this.dateTime,
      this.category,
      this.otherCategoryName,
      this.location,
      this.description,
      final List<AlrtMedia> medias = const <AlrtMedia>[]})
      : _medias = medias;

  /// The date and time of the hazard.
  @override
  final DateTime? dateTime;

  /// The selected category of the hazard.
  @override
  final HazardCategory? category;

  /// The name of the new category if [category] represents "Other" category.
  ///
  /// This field is required if [category] represents "Other" category.
  /// Otherwise, it will be ignored.
  @override
  final String? otherCategoryName;

  /// The location of the hazard.
  @override
  final AlrtLocation? location;

  /// The description of the hazard.
  @override
  final String? description;

  /// The list of media associated with the hazard report.
  final List<AlrtMedia> _medias;

  /// The list of media associated with the hazard report.
  @override
  @JsonKey()
  List<AlrtMedia> get medias {
    if (_medias is EqualUnmodifiableListView) return _medias;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medias);
  }

  /// Create a copy of CreateReportProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateReportProviderStateCopyWith<_CreateReportProviderState>
      get copyWith =>
          __$CreateReportProviderStateCopyWithImpl<_CreateReportProviderState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateReportProviderState &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.otherCategoryName, otherCategoryName) ||
                other.otherCategoryName == otherCategoryName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._medias, _medias));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      dateTime,
      category,
      otherCategoryName,
      location,
      description,
      const DeepCollectionEquality().hash(_medias));

  @override
  String toString() {
    return 'CreateReportProviderState(dateTime: $dateTime, category: $category, otherCategoryName: $otherCategoryName, location: $location, description: $description, medias: $medias)';
  }
}

/// @nodoc
abstract mixin class _$CreateReportProviderStateCopyWith<$Res>
    implements $CreateReportProviderStateCopyWith<$Res> {
  factory _$CreateReportProviderStateCopyWith(_CreateReportProviderState value,
          $Res Function(_CreateReportProviderState) _then) =
      __$CreateReportProviderStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime? dateTime,
      HazardCategory? category,
      String? otherCategoryName,
      AlrtLocation? location,
      String? description,
      List<AlrtMedia> medias});

  @override
  $HazardCategoryCopyWith<$Res>? get category;
  @override
  $AlrtLocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$CreateReportProviderStateCopyWithImpl<$Res>
    implements _$CreateReportProviderStateCopyWith<$Res> {
  __$CreateReportProviderStateCopyWithImpl(this._self, this._then);

  final _CreateReportProviderState _self;
  final $Res Function(_CreateReportProviderState) _then;

  /// Create a copy of CreateReportProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dateTime = freezed,
    Object? category = freezed,
    Object? otherCategoryName = freezed,
    Object? location = freezed,
    Object? description = freezed,
    Object? medias = null,
  }) {
    return _then(_CreateReportProviderState(
      dateTime: freezed == dateTime
          ? _self.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as HazardCategory?,
      otherCategoryName: freezed == otherCategoryName
          ? _self.otherCategoryName
          : otherCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as AlrtLocation?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      medias: null == medias
          ? _self._medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<AlrtMedia>,
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
  }

  /// Create a copy of CreateReportProviderState
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

// dart format on
