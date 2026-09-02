// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'design_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DesignToken {
  String get key;
  String get category;
  String get value;

  /// Create a copy of DesignToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DesignTokenCopyWith<DesignToken> get copyWith =>
      _$DesignTokenCopyWithImpl<DesignToken>(this as DesignToken, _$identity);

  /// Serializes this DesignToken to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DesignToken &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, category, value);

  @override
  String toString() {
    return 'DesignToken(key: $key, category: $category, value: $value)';
  }
}

/// @nodoc
abstract mixin class $DesignTokenCopyWith<$Res> {
  factory $DesignTokenCopyWith(
          DesignToken value, $Res Function(DesignToken) _then) =
      _$DesignTokenCopyWithImpl;
  @useResult
  $Res call({String key, String category, String value});
}

/// @nodoc
class _$DesignTokenCopyWithImpl<$Res> implements $DesignTokenCopyWith<$Res> {
  _$DesignTokenCopyWithImpl(this._self, this._then);

  final DesignToken _self;
  final $Res Function(DesignToken) _then;

  /// Create a copy of DesignToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? category = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DesignToken].
extension DesignTokenPatterns on DesignToken {
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
    TResult Function(_DesignToken value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DesignToken() when $default != null:
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
    TResult Function(_DesignToken value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DesignToken():
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
    TResult? Function(_DesignToken value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DesignToken() when $default != null:
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
    TResult Function(String key, String category, String value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DesignToken() when $default != null:
        return $default(_that.key, _that.category, _that.value);
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
    TResult Function(String key, String category, String value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DesignToken():
        return $default(_that.key, _that.category, _that.value);
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
    TResult? Function(String key, String category, String value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DesignToken() when $default != null:
        return $default(_that.key, _that.category, _that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DesignToken implements DesignToken {
  const _DesignToken(
      {required this.key, required this.category, required this.value});
  factory _DesignToken.fromJson(Map<String, dynamic> json) =>
      _$DesignTokenFromJson(json);

  @override
  final String key;
  @override
  final String category;
  @override
  final String value;

  /// Create a copy of DesignToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DesignTokenCopyWith<_DesignToken> get copyWith =>
      __$DesignTokenCopyWithImpl<_DesignToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DesignTokenToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DesignToken &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, category, value);

  @override
  String toString() {
    return 'DesignToken(key: $key, category: $category, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$DesignTokenCopyWith<$Res>
    implements $DesignTokenCopyWith<$Res> {
  factory _$DesignTokenCopyWith(
          _DesignToken value, $Res Function(_DesignToken) _then) =
      __$DesignTokenCopyWithImpl;
  @override
  @useResult
  $Res call({String key, String category, String value});
}

/// @nodoc
class __$DesignTokenCopyWithImpl<$Res> implements _$DesignTokenCopyWith<$Res> {
  __$DesignTokenCopyWithImpl(this._self, this._then);

  final _DesignToken _self;
  final $Res Function(_DesignToken) _then;

  /// Create a copy of DesignToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? category = null,
    Object? value = null,
  }) {
    return _then(_DesignToken(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
