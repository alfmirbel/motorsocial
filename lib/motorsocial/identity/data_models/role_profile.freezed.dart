// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoleProfile {
  String get key;
  String get name;
  List<String> get permissions;

  /// Create a copy of RoleProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoleProfileCopyWith<RoleProfile> get copyWith =>
      _$RoleProfileCopyWithImpl<RoleProfile>(this as RoleProfile, _$identity);

  /// Serializes this RoleProfile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoleProfile &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other.permissions, permissions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, key, name, const DeepCollectionEquality().hash(permissions));

  @override
  String toString() {
    return 'RoleProfile(key: $key, name: $name, permissions: $permissions)';
  }
}

/// @nodoc
abstract mixin class $RoleProfileCopyWith<$Res> {
  factory $RoleProfileCopyWith(
          RoleProfile value, $Res Function(RoleProfile) _then) =
      _$RoleProfileCopyWithImpl;
  @useResult
  $Res call({String key, String name, List<String> permissions});
}

/// @nodoc
class _$RoleProfileCopyWithImpl<$Res> implements $RoleProfileCopyWith<$Res> {
  _$RoleProfileCopyWithImpl(this._self, this._then);

  final RoleProfile _self;
  final $Res Function(RoleProfile) _then;

  /// Create a copy of RoleProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? permissions = null,
  }) {
    return _then(_self.copyWith(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _self.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [RoleProfile].
extension RoleProfilePatterns on RoleProfile {
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
    TResult Function(_RoleProfile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoleProfile() when $default != null:
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
    TResult Function(_RoleProfile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoleProfile():
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
    TResult? Function(_RoleProfile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoleProfile() when $default != null:
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
    TResult Function(String key, String name, List<String> permissions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoleProfile() when $default != null:
        return $default(_that.key, _that.name, _that.permissions);
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
    TResult Function(String key, String name, List<String> permissions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoleProfile():
        return $default(_that.key, _that.name, _that.permissions);
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
    TResult? Function(String key, String name, List<String> permissions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoleProfile() when $default != null:
        return $default(_that.key, _that.name, _that.permissions);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RoleProfile implements RoleProfile {
  const _RoleProfile(
      {required this.key,
      required this.name,
      final List<String> permissions = const <String>[]})
      : _permissions = permissions;
  factory _RoleProfile.fromJson(Map<String, dynamic> json) =>
      _$RoleProfileFromJson(json);

  @override
  final String key;
  @override
  final String name;
  final List<String> _permissions;
  @override
  @JsonKey()
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  /// Create a copy of RoleProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoleProfileCopyWith<_RoleProfile> get copyWith =>
      __$RoleProfileCopyWithImpl<_RoleProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RoleProfileToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoleProfile &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, name,
      const DeepCollectionEquality().hash(_permissions));

  @override
  String toString() {
    return 'RoleProfile(key: $key, name: $name, permissions: $permissions)';
  }
}

/// @nodoc
abstract mixin class _$RoleProfileCopyWith<$Res>
    implements $RoleProfileCopyWith<$Res> {
  factory _$RoleProfileCopyWith(
          _RoleProfile value, $Res Function(_RoleProfile) _then) =
      __$RoleProfileCopyWithImpl;
  @override
  @useResult
  $Res call({String key, String name, List<String> permissions});
}

/// @nodoc
class __$RoleProfileCopyWithImpl<$Res> implements _$RoleProfileCopyWith<$Res> {
  __$RoleProfileCopyWithImpl(this._self, this._then);

  final _RoleProfile _self;
  final $Res Function(_RoleProfile) _then;

  /// Create a copy of RoleProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? permissions = null,
  }) {
    return _then(_RoleProfile(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _self._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
