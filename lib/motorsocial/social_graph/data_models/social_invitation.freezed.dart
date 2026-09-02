// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialInvitation {
  String get id;
  String get senderId;
  String get recipientId;
  String get status;
  DateTime get createdAt;

  /// Create a copy of SocialInvitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialInvitationCopyWith<SocialInvitation> get copyWith =>
      _$SocialInvitationCopyWithImpl<SocialInvitation>(
          this as SocialInvitation, _$identity);

  /// Serializes this SocialInvitation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialInvitation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, senderId, recipientId, status, createdAt);

  @override
  String toString() {
    return 'SocialInvitation(id: $id, senderId: $senderId, recipientId: $recipientId, status: $status, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $SocialInvitationCopyWith<$Res> {
  factory $SocialInvitationCopyWith(
          SocialInvitation value, $Res Function(SocialInvitation) _then) =
      _$SocialInvitationCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String senderId,
      String recipientId,
      String status,
      DateTime createdAt});
}

/// @nodoc
class _$SocialInvitationCopyWithImpl<$Res>
    implements $SocialInvitationCopyWith<$Res> {
  _$SocialInvitationCopyWithImpl(this._self, this._then);

  final SocialInvitation _self;
  final $Res Function(SocialInvitation) _then;

  /// Create a copy of SocialInvitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? recipientId = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recipientId: null == recipientId
          ? _self.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [SocialInvitation].
extension SocialInvitationPatterns on SocialInvitation {
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
    TResult Function(_SocialInvitation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialInvitation() when $default != null:
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
    TResult Function(_SocialInvitation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialInvitation():
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
    TResult? Function(_SocialInvitation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialInvitation() when $default != null:
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
    TResult Function(String id, String senderId, String recipientId,
            String status, DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialInvitation() when $default != null:
        return $default(_that.id, _that.senderId, _that.recipientId,
            _that.status, _that.createdAt);
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
    TResult Function(String id, String senderId, String recipientId,
            String status, DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialInvitation():
        return $default(_that.id, _that.senderId, _that.recipientId,
            _that.status, _that.createdAt);
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
    TResult? Function(String id, String senderId, String recipientId,
            String status, DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialInvitation() when $default != null:
        return $default(_that.id, _that.senderId, _that.recipientId,
            _that.status, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SocialInvitation implements SocialInvitation {
  const _SocialInvitation(
      {required this.id,
      required this.senderId,
      required this.recipientId,
      required this.status,
      required this.createdAt});
  factory _SocialInvitation.fromJson(Map<String, dynamic> json) =>
      _$SocialInvitationFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String recipientId;
  @override
  final String status;
  @override
  final DateTime createdAt;

  /// Create a copy of SocialInvitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialInvitationCopyWith<_SocialInvitation> get copyWith =>
      __$SocialInvitationCopyWithImpl<_SocialInvitation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SocialInvitationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialInvitation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, senderId, recipientId, status, createdAt);

  @override
  String toString() {
    return 'SocialInvitation(id: $id, senderId: $senderId, recipientId: $recipientId, status: $status, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$SocialInvitationCopyWith<$Res>
    implements $SocialInvitationCopyWith<$Res> {
  factory _$SocialInvitationCopyWith(
          _SocialInvitation value, $Res Function(_SocialInvitation) _then) =
      __$SocialInvitationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String senderId,
      String recipientId,
      String status,
      DateTime createdAt});
}

/// @nodoc
class __$SocialInvitationCopyWithImpl<$Res>
    implements _$SocialInvitationCopyWith<$Res> {
  __$SocialInvitationCopyWithImpl(this._self, this._then);

  final _SocialInvitation _self;
  final $Res Function(_SocialInvitation) _then;

  /// Create a copy of SocialInvitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? recipientId = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_SocialInvitation(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recipientId: null == recipientId
          ? _self.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
