// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityQuery {
  String? get actorId;
  int get limit;

  /// Create a copy of ActivityQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityQueryCopyWith<ActivityQuery> get copyWith =>
      _$ActivityQueryCopyWithImpl<ActivityQuery>(
          this as ActivityQuery, _$identity);

  /// Serializes this ActivityQuery to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityQuery &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, actorId, limit);

  @override
  String toString() {
    return 'ActivityQuery(actorId: $actorId, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class $ActivityQueryCopyWith<$Res> {
  factory $ActivityQueryCopyWith(
          ActivityQuery value, $Res Function(ActivityQuery) _then) =
      _$ActivityQueryCopyWithImpl;
  @useResult
  $Res call({String? actorId, int limit});
}

/// @nodoc
class _$ActivityQueryCopyWithImpl<$Res>
    implements $ActivityQueryCopyWith<$Res> {
  _$ActivityQueryCopyWithImpl(this._self, this._then);

  final ActivityQuery _self;
  final $Res Function(ActivityQuery) _then;

  /// Create a copy of ActivityQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actorId = freezed,
    Object? limit = null,
  }) {
    return _then(_self.copyWith(
      actorId: freezed == actorId
          ? _self.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ActivityQuery].
extension ActivityQueryPatterns on ActivityQuery {
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
    TResult Function(_ActivityQuery value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivityQuery() when $default != null:
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
    TResult Function(_ActivityQuery value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivityQuery():
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
    TResult? Function(_ActivityQuery value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivityQuery() when $default != null:
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
    TResult Function(String? actorId, int limit)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivityQuery() when $default != null:
        return $default(_that.actorId, _that.limit);
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
    TResult Function(String? actorId, int limit) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivityQuery():
        return $default(_that.actorId, _that.limit);
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
    TResult? Function(String? actorId, int limit)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivityQuery() when $default != null:
        return $default(_that.actorId, _that.limit);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ActivityQuery implements ActivityQuery {
  const _ActivityQuery({this.actorId, this.limit = 20});
  factory _ActivityQuery.fromJson(Map<String, dynamic> json) =>
      _$ActivityQueryFromJson(json);

  @override
  final String? actorId;
  @override
  @JsonKey()
  final int limit;

  /// Create a copy of ActivityQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActivityQueryCopyWith<_ActivityQuery> get copyWith =>
      __$ActivityQueryCopyWithImpl<_ActivityQuery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ActivityQueryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActivityQuery &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, actorId, limit);

  @override
  String toString() {
    return 'ActivityQuery(actorId: $actorId, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class _$ActivityQueryCopyWith<$Res>
    implements $ActivityQueryCopyWith<$Res> {
  factory _$ActivityQueryCopyWith(
          _ActivityQuery value, $Res Function(_ActivityQuery) _then) =
      __$ActivityQueryCopyWithImpl;
  @override
  @useResult
  $Res call({String? actorId, int limit});
}

/// @nodoc
class __$ActivityQueryCopyWithImpl<$Res>
    implements _$ActivityQueryCopyWith<$Res> {
  __$ActivityQueryCopyWithImpl(this._self, this._then);

  final _ActivityQuery _self;
  final $Res Function(_ActivityQuery) _then;

  /// Create a copy of ActivityQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? actorId = freezed,
    Object? limit = null,
  }) {
    return _then(_ActivityQuery(
      actorId: freezed == actorId
          ? _self.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
