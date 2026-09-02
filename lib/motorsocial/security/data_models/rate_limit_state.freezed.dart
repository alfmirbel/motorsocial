// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_limit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RateLimitState {
  int get remaining;
  DateTime? get resetAt;

  /// Create a copy of RateLimitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RateLimitStateCopyWith<RateLimitState> get copyWith =>
      _$RateLimitStateCopyWithImpl<RateLimitState>(
          this as RateLimitState, _$identity);

  /// Serializes this RateLimitState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RateLimitState &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.resetAt, resetAt) || other.resetAt == resetAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, remaining, resetAt);

  @override
  String toString() {
    return 'RateLimitState(remaining: $remaining, resetAt: $resetAt)';
  }
}

/// @nodoc
abstract mixin class $RateLimitStateCopyWith<$Res> {
  factory $RateLimitStateCopyWith(
          RateLimitState value, $Res Function(RateLimitState) _then) =
      _$RateLimitStateCopyWithImpl;
  @useResult
  $Res call({int remaining, DateTime? resetAt});
}

/// @nodoc
class _$RateLimitStateCopyWithImpl<$Res>
    implements $RateLimitStateCopyWith<$Res> {
  _$RateLimitStateCopyWithImpl(this._self, this._then);

  final RateLimitState _self;
  final $Res Function(RateLimitState) _then;

  /// Create a copy of RateLimitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remaining = null,
    Object? resetAt = freezed,
  }) {
    return _then(_self.copyWith(
      remaining: null == remaining
          ? _self.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
      resetAt: freezed == resetAt
          ? _self.resetAt
          : resetAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RateLimitState].
extension RateLimitStatePatterns on RateLimitState {
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
    TResult Function(_RateLimitState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RateLimitState() when $default != null:
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
    TResult Function(_RateLimitState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateLimitState():
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
    TResult? Function(_RateLimitState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateLimitState() when $default != null:
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
    TResult Function(int remaining, DateTime? resetAt)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RateLimitState() when $default != null:
        return $default(_that.remaining, _that.resetAt);
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
    TResult Function(int remaining, DateTime? resetAt) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateLimitState():
        return $default(_that.remaining, _that.resetAt);
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
    TResult? Function(int remaining, DateTime? resetAt)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateLimitState() when $default != null:
        return $default(_that.remaining, _that.resetAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RateLimitState implements RateLimitState {
  const _RateLimitState({this.remaining = -1, this.resetAt});
  factory _RateLimitState.fromJson(Map<String, dynamic> json) =>
      _$RateLimitStateFromJson(json);

  @override
  @JsonKey()
  final int remaining;
  @override
  final DateTime? resetAt;

  /// Create a copy of RateLimitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RateLimitStateCopyWith<_RateLimitState> get copyWith =>
      __$RateLimitStateCopyWithImpl<_RateLimitState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RateLimitStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RateLimitState &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.resetAt, resetAt) || other.resetAt == resetAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, remaining, resetAt);

  @override
  String toString() {
    return 'RateLimitState(remaining: $remaining, resetAt: $resetAt)';
  }
}

/// @nodoc
abstract mixin class _$RateLimitStateCopyWith<$Res>
    implements $RateLimitStateCopyWith<$Res> {
  factory _$RateLimitStateCopyWith(
          _RateLimitState value, $Res Function(_RateLimitState) _then) =
      __$RateLimitStateCopyWithImpl;
  @override
  @useResult
  $Res call({int remaining, DateTime? resetAt});
}

/// @nodoc
class __$RateLimitStateCopyWithImpl<$Res>
    implements _$RateLimitStateCopyWith<$Res> {
  __$RateLimitStateCopyWithImpl(this._self, this._then);

  final _RateLimitState _self;
  final $Res Function(_RateLimitState) _then;

  /// Create a copy of RateLimitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? remaining = null,
    Object? resetAt = freezed,
  }) {
    return _then(_RateLimitState(
      remaining: null == remaining
          ? _self.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
      resetAt: freezed == resetAt
          ? _self.resetAt
          : resetAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
