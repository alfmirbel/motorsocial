// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialActivity {
  String get id;
  String get actorId;
  String get actorName;
  String get verb;
  String get objectType;
  String get objectId;
  Map<String, dynamic> get payload;
  int get createdAt;

  /// Create a copy of SocialActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialActivityCopyWith<SocialActivity> get copyWith =>
      _$SocialActivityCopyWithImpl<SocialActivity>(
          this as SocialActivity, _$identity);

  /// Serializes this SocialActivity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialActivity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            (identical(other.actorName, actorName) ||
                other.actorName == actorName) &&
            (identical(other.verb, verb) || other.verb == verb) &&
            (identical(other.objectType, objectType) ||
                other.objectType == objectType) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            const DeepCollectionEquality().equals(other.payload, payload) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      actorId,
      actorName,
      verb,
      objectType,
      objectId,
      const DeepCollectionEquality().hash(payload),
      createdAt);

  @override
  String toString() {
    return 'SocialActivity(id: $id, actorId: $actorId, actorName: $actorName, verb: $verb, objectType: $objectType, objectId: $objectId, payload: $payload, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $SocialActivityCopyWith<$Res> {
  factory $SocialActivityCopyWith(
          SocialActivity value, $Res Function(SocialActivity) _then) =
      _$SocialActivityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String actorId,
      String actorName,
      String verb,
      String objectType,
      String objectId,
      Map<String, dynamic> payload,
      int createdAt});
}

/// @nodoc
class _$SocialActivityCopyWithImpl<$Res>
    implements $SocialActivityCopyWith<$Res> {
  _$SocialActivityCopyWithImpl(this._self, this._then);

  final SocialActivity _self;
  final $Res Function(SocialActivity) _then;

  /// Create a copy of SocialActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actorId = null,
    Object? actorName = null,
    Object? verb = null,
    Object? objectType = null,
    Object? objectId = null,
    Object? payload = null,
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
      actorName: null == actorName
          ? _self.actorName
          : actorName // ignore: cast_nullable_to_non_nullable
              as String,
      verb: null == verb
          ? _self.verb
          : verb // ignore: cast_nullable_to_non_nullable
              as String,
      objectType: null == objectType
          ? _self.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as String,
      objectId: null == objectId
          ? _self.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [SocialActivity].
extension SocialActivityPatterns on SocialActivity {
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
    TResult Function(_SocialActivity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialActivity() when $default != null:
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
    TResult Function(_SocialActivity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialActivity():
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
    TResult? Function(_SocialActivity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialActivity() when $default != null:
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
            String actorId,
            String actorName,
            String verb,
            String objectType,
            String objectId,
            Map<String, dynamic> payload,
            int createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialActivity() when $default != null:
        return $default(_that.id, _that.actorId, _that.actorName, _that.verb,
            _that.objectType, _that.objectId, _that.payload, _that.createdAt);
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
            String actorId,
            String actorName,
            String verb,
            String objectType,
            String objectId,
            Map<String, dynamic> payload,
            int createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialActivity():
        return $default(_that.id, _that.actorId, _that.actorName, _that.verb,
            _that.objectType, _that.objectId, _that.payload, _that.createdAt);
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
            String actorId,
            String actorName,
            String verb,
            String objectType,
            String objectId,
            Map<String, dynamic> payload,
            int createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialActivity() when $default != null:
        return $default(_that.id, _that.actorId, _that.actorName, _that.verb,
            _that.objectType, _that.objectId, _that.payload, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SocialActivity implements SocialActivity {
  const _SocialActivity(
      {required this.id,
      required this.actorId,
      required this.actorName,
      required this.verb,
      required this.objectType,
      required this.objectId,
      final Map<String, dynamic> payload = const <String, dynamic>{},
      this.createdAt = 0})
      : _payload = payload;
  factory _SocialActivity.fromJson(Map<String, dynamic> json) =>
      _$SocialActivityFromJson(json);

  @override
  final String id;
  @override
  final String actorId;
  @override
  final String actorName;
  @override
  final String verb;
  @override
  final String objectType;
  @override
  final String objectId;
  final Map<String, dynamic> _payload;
  @override
  @JsonKey()
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  @JsonKey()
  final int createdAt;

  /// Create a copy of SocialActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialActivityCopyWith<_SocialActivity> get copyWith =>
      __$SocialActivityCopyWithImpl<_SocialActivity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SocialActivityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialActivity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            (identical(other.actorName, actorName) ||
                other.actorName == actorName) &&
            (identical(other.verb, verb) || other.verb == verb) &&
            (identical(other.objectType, objectType) ||
                other.objectType == objectType) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      actorId,
      actorName,
      verb,
      objectType,
      objectId,
      const DeepCollectionEquality().hash(_payload),
      createdAt);

  @override
  String toString() {
    return 'SocialActivity(id: $id, actorId: $actorId, actorName: $actorName, verb: $verb, objectType: $objectType, objectId: $objectId, payload: $payload, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$SocialActivityCopyWith<$Res>
    implements $SocialActivityCopyWith<$Res> {
  factory _$SocialActivityCopyWith(
          _SocialActivity value, $Res Function(_SocialActivity) _then) =
      __$SocialActivityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String actorId,
      String actorName,
      String verb,
      String objectType,
      String objectId,
      Map<String, dynamic> payload,
      int createdAt});
}

/// @nodoc
class __$SocialActivityCopyWithImpl<$Res>
    implements _$SocialActivityCopyWith<$Res> {
  __$SocialActivityCopyWithImpl(this._self, this._then);

  final _SocialActivity _self;
  final $Res Function(_SocialActivity) _then;

  /// Create a copy of SocialActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? actorId = null,
    Object? actorName = null,
    Object? verb = null,
    Object? objectType = null,
    Object? objectId = null,
    Object? payload = null,
    Object? createdAt = null,
  }) {
    return _then(_SocialActivity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      actorId: null == actorId
          ? _self.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as String,
      actorName: null == actorName
          ? _self.actorName
          : actorName // ignore: cast_nullable_to_non_nullable
              as String,
      verb: null == verb
          ? _self.verb
          : verb // ignore: cast_nullable_to_non_nullable
              as String,
      objectType: null == objectType
          ? _self.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as String,
      objectId: null == objectId
          ? _self.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _self._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
