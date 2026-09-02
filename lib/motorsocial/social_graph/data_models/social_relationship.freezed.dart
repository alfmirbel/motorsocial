// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_relationship.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialRelationship {
  String get id;
  String get actorId;
  String get targetId;
  String get type;
  DateTime get createdAt;

  /// Create a copy of SocialRelationship
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialRelationshipCopyWith<SocialRelationship> get copyWith =>
      _$SocialRelationshipCopyWithImpl<SocialRelationship>(
          this as SocialRelationship, _$identity);

  /// Serializes this SocialRelationship to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialRelationship &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, actorId, targetId, type, createdAt);

  @override
  String toString() {
    return 'SocialRelationship(id: $id, actorId: $actorId, targetId: $targetId, type: $type, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $SocialRelationshipCopyWith<$Res> {
  factory $SocialRelationshipCopyWith(
          SocialRelationship value, $Res Function(SocialRelationship) _then) =
      _$SocialRelationshipCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String actorId,
      String targetId,
      String type,
      DateTime createdAt});
}

/// @nodoc
class _$SocialRelationshipCopyWithImpl<$Res>
    implements $SocialRelationshipCopyWith<$Res> {
  _$SocialRelationshipCopyWithImpl(this._self, this._then);

  final SocialRelationship _self;
  final $Res Function(SocialRelationship) _then;

  /// Create a copy of SocialRelationship
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actorId = null,
    Object? targetId = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      actorId: null == actorId
          ? _self.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _self.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [SocialRelationship].
extension SocialRelationshipPatterns on SocialRelationship {
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
    TResult Function(_SocialRelationship value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialRelationship() when $default != null:
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
    TResult Function(_SocialRelationship value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialRelationship():
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
    TResult? Function(_SocialRelationship value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialRelationship() when $default != null:
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
    TResult Function(String id, String actorId, String targetId, String type,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialRelationship() when $default != null:
        return $default(_that.id, _that.actorId, _that.targetId, _that.type,
            _that.createdAt);
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
    TResult Function(String id, String actorId, String targetId, String type,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialRelationship():
        return $default(_that.id, _that.actorId, _that.targetId, _that.type,
            _that.createdAt);
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
    TResult? Function(String id, String actorId, String targetId, String type,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialRelationship() when $default != null:
        return $default(_that.id, _that.actorId, _that.targetId, _that.type,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SocialRelationship implements SocialRelationship {
  const _SocialRelationship(
      {required this.id,
      required this.actorId,
      required this.targetId,
      this.type = 'contact',
      required this.createdAt});
  factory _SocialRelationship.fromJson(Map<String, dynamic> json) =>
      _$SocialRelationshipFromJson(json);

  @override
  final String id;
  @override
  final String actorId;
  @override
  final String targetId;
  @override
  @JsonKey()
  final String type;
  @override
  final DateTime createdAt;

  /// Create a copy of SocialRelationship
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialRelationshipCopyWith<_SocialRelationship> get copyWith =>
      __$SocialRelationshipCopyWithImpl<_SocialRelationship>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SocialRelationshipToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialRelationship &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, actorId, targetId, type, createdAt);

  @override
  String toString() {
    return 'SocialRelationship(id: $id, actorId: $actorId, targetId: $targetId, type: $type, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$SocialRelationshipCopyWith<$Res>
    implements $SocialRelationshipCopyWith<$Res> {
  factory _$SocialRelationshipCopyWith(
          _SocialRelationship value, $Res Function(_SocialRelationship) _then) =
      __$SocialRelationshipCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String actorId,
      String targetId,
      String type,
      DateTime createdAt});
}

/// @nodoc
class __$SocialRelationshipCopyWithImpl<$Res>
    implements _$SocialRelationshipCopyWith<$Res> {
  __$SocialRelationshipCopyWithImpl(this._self, this._then);

  final _SocialRelationship _self;
  final $Res Function(_SocialRelationship) _then;

  /// Create a copy of SocialRelationship
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? actorId = null,
    Object? targetId = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_SocialRelationship(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      actorId: null == actorId
          ? _self.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _self.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
