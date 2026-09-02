// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SecurityEvent {
  String get id;
  @JsonKey(name: 'eventType')
  String get type;
  String? get actorId;
  Map<String, dynamic> get payload;
  DateTime get createdAt;

  /// Create a copy of SecurityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SecurityEventCopyWith<SecurityEvent> get copyWith =>
      _$SecurityEventCopyWithImpl<SecurityEvent>(
          this as SecurityEvent, _$identity);

  /// Serializes this SecurityEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SecurityEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            const DeepCollectionEquality().equals(other.payload, payload) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, actorId,
      const DeepCollectionEquality().hash(payload), createdAt);

  @override
  String toString() {
    return 'SecurityEvent(id: $id, type: $type, actorId: $actorId, payload: $payload, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $SecurityEventCopyWith<$Res> {
  factory $SecurityEventCopyWith(
          SecurityEvent value, $Res Function(SecurityEvent) _then) =
      _$SecurityEventCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'eventType') String type,
      String? actorId,
      Map<String, dynamic> payload,
      DateTime createdAt});
}

/// @nodoc
class _$SecurityEventCopyWithImpl<$Res>
    implements $SecurityEventCopyWith<$Res> {
  _$SecurityEventCopyWithImpl(this._self, this._then);

  final SecurityEvent _self;
  final $Res Function(SecurityEvent) _then;

  /// Create a copy of SecurityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? actorId = freezed,
    Object? payload = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      actorId: freezed == actorId
          ? _self.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: null == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [SecurityEvent].
extension SecurityEventPatterns on SecurityEvent {
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
    TResult Function(_SecurityEvent value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SecurityEvent() when $default != null:
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
    TResult Function(_SecurityEvent value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SecurityEvent():
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
    TResult? Function(_SecurityEvent value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SecurityEvent() when $default != null:
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
    TResult Function(String id, @JsonKey(name: 'eventType') String type,
            String? actorId, Map<String, dynamic> payload, DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SecurityEvent() when $default != null:
        return $default(_that.id, _that.type, _that.actorId, _that.payload,
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
    TResult Function(String id, @JsonKey(name: 'eventType') String type,
            String? actorId, Map<String, dynamic> payload, DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SecurityEvent():
        return $default(_that.id, _that.type, _that.actorId, _that.payload,
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
    TResult? Function(String id, @JsonKey(name: 'eventType') String type,
            String? actorId, Map<String, dynamic> payload, DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SecurityEvent() when $default != null:
        return $default(_that.id, _that.type, _that.actorId, _that.payload,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SecurityEvent implements SecurityEvent {
  const _SecurityEvent(
      {required this.id,
      @JsonKey(name: 'eventType') required this.type,
      this.actorId,
      final Map<String, dynamic> payload = const <String, dynamic>{},
      required this.createdAt})
      : _payload = payload;
  factory _SecurityEvent.fromJson(Map<String, dynamic> json) =>
      _$SecurityEventFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'eventType')
  final String type;
  @override
  final String? actorId;
  final Map<String, dynamic> _payload;
  @override
  @JsonKey()
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  final DateTime createdAt;

  /// Create a copy of SecurityEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SecurityEventCopyWith<_SecurityEvent> get copyWith =>
      __$SecurityEventCopyWithImpl<_SecurityEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SecurityEventToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SecurityEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, actorId,
      const DeepCollectionEquality().hash(_payload), createdAt);

  @override
  String toString() {
    return 'SecurityEvent(id: $id, type: $type, actorId: $actorId, payload: $payload, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$SecurityEventCopyWith<$Res>
    implements $SecurityEventCopyWith<$Res> {
  factory _$SecurityEventCopyWith(
          _SecurityEvent value, $Res Function(_SecurityEvent) _then) =
      __$SecurityEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'eventType') String type,
      String? actorId,
      Map<String, dynamic> payload,
      DateTime createdAt});
}

/// @nodoc
class __$SecurityEventCopyWithImpl<$Res>
    implements _$SecurityEventCopyWith<$Res> {
  __$SecurityEventCopyWithImpl(this._self, this._then);

  final _SecurityEvent _self;
  final $Res Function(_SecurityEvent) _then;

  /// Create a copy of SecurityEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? actorId = freezed,
    Object? payload = null,
    Object? createdAt = null,
  }) {
    return _then(_SecurityEvent(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      actorId: freezed == actorId
          ? _self.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: null == payload
          ? _self._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
