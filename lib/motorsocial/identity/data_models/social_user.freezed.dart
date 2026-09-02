// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialUser {
  String get id;
  String? get email;
  String get displayName;
  String? get photoUrl;
  String? get passwordHash;
  String? get roleKey;
  int get createdAt;
  int get updatedAt;

  /// Create a copy of SocialUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialUserCopyWith<SocialUser> get copyWith =>
      _$SocialUserCopyWithImpl<SocialUser>(this as SocialUser, _$identity);

  /// Serializes this SocialUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.roleKey, roleKey) || other.roleKey == roleKey) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, displayName, photoUrl,
      passwordHash, roleKey, createdAt, updatedAt);

  @override
  String toString() {
    return 'SocialUser(id: $id, email: $email, displayName: $displayName, photoUrl: $photoUrl, passwordHash: $passwordHash, roleKey: $roleKey, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $SocialUserCopyWith<$Res> {
  factory $SocialUserCopyWith(
          SocialUser value, $Res Function(SocialUser) _then) =
      _$SocialUserCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String? email,
      String displayName,
      String? photoUrl,
      String? passwordHash,
      String? roleKey,
      int createdAt,
      int updatedAt});
}

/// @nodoc
class _$SocialUserCopyWithImpl<$Res> implements $SocialUserCopyWith<$Res> {
  _$SocialUserCopyWithImpl(this._self, this._then);

  final SocialUser _self;
  final $Res Function(SocialUser) _then;

  /// Create a copy of SocialUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? displayName = null,
    Object? photoUrl = freezed,
    Object? passwordHash = freezed,
    Object? roleKey = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordHash: freezed == passwordHash
          ? _self.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String?,
      roleKey: freezed == roleKey
          ? _self.roleKey
          : roleKey // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [SocialUser].
extension SocialUserPatterns on SocialUser {
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
    TResult Function(_SocialUser value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialUser() when $default != null:
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
    TResult Function(_SocialUser value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialUser():
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
    TResult? Function(_SocialUser value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialUser() when $default != null:
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
            String id,
            String? email,
            String displayName,
            String? photoUrl,
            String? passwordHash,
            String? roleKey,
            int createdAt,
            int updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialUser() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.displayName,
            _that.photoUrl,
            _that.passwordHash,
            _that.roleKey,
            _that.createdAt,
            _that.updatedAt);
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
            String id,
            String? email,
            String displayName,
            String? photoUrl,
            String? passwordHash,
            String? roleKey,
            int createdAt,
            int updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialUser():
        return $default(
            _that.id,
            _that.email,
            _that.displayName,
            _that.photoUrl,
            _that.passwordHash,
            _that.roleKey,
            _that.createdAt,
            _that.updatedAt);
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
            String id,
            String? email,
            String displayName,
            String? photoUrl,
            String? passwordHash,
            String? roleKey,
            int createdAt,
            int updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialUser() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.displayName,
            _that.photoUrl,
            _that.passwordHash,
            _that.roleKey,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SocialUser implements SocialUser {
  const _SocialUser(
      {required this.id,
      this.email,
      required this.displayName,
      this.photoUrl,
      this.passwordHash,
      this.roleKey,
      this.createdAt = 0,
      this.updatedAt = 0});
  factory _SocialUser.fromJson(Map<String, dynamic> json) =>
      _$SocialUserFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  final String displayName;
  @override
  final String? photoUrl;
  @override
  final String? passwordHash;
  @override
  final String? roleKey;
  @override
  @JsonKey()
  final int createdAt;
  @override
  @JsonKey()
  final int updatedAt;

  /// Create a copy of SocialUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialUserCopyWith<_SocialUser> get copyWith =>
      __$SocialUserCopyWithImpl<_SocialUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SocialUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.roleKey, roleKey) || other.roleKey == roleKey) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, displayName, photoUrl,
      passwordHash, roleKey, createdAt, updatedAt);

  @override
  String toString() {
    return 'SocialUser(id: $id, email: $email, displayName: $displayName, photoUrl: $photoUrl, passwordHash: $passwordHash, roleKey: $roleKey, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$SocialUserCopyWith<$Res>
    implements $SocialUserCopyWith<$Res> {
  factory _$SocialUserCopyWith(
          _SocialUser value, $Res Function(_SocialUser) _then) =
      __$SocialUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String? email,
      String displayName,
      String? photoUrl,
      String? passwordHash,
      String? roleKey,
      int createdAt,
      int updatedAt});
}

/// @nodoc
class __$SocialUserCopyWithImpl<$Res> implements _$SocialUserCopyWith<$Res> {
  __$SocialUserCopyWithImpl(this._self, this._then);

  final _SocialUser _self;
  final $Res Function(_SocialUser) _then;

  /// Create a copy of SocialUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? displayName = null,
    Object? photoUrl = freezed,
    Object? passwordHash = freezed,
    Object? roleKey = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_SocialUser(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordHash: freezed == passwordHash
          ? _self.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String?,
      roleKey: freezed == roleKey
          ? _self.roleKey
          : roleKey // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
