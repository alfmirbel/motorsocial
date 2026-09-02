// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialGroup {
  String get id;
  String get name;
  List<String> get memberIds;
  bool get isPublic;

  /// Create a copy of SocialGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialGroupCopyWith<SocialGroup> get copyWith =>
      _$SocialGroupCopyWithImpl<SocialGroup>(this as SocialGroup, _$identity);

  /// Serializes this SocialGroup to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.memberIds, memberIds) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(memberIds), isPublic);

  @override
  String toString() {
    return 'SocialGroup(id: $id, name: $name, memberIds: $memberIds, isPublic: $isPublic)';
  }
}

/// @nodoc
abstract mixin class $SocialGroupCopyWith<$Res> {
  factory $SocialGroupCopyWith(
          SocialGroup value, $Res Function(SocialGroup) _then) =
      _$SocialGroupCopyWithImpl;
  @useResult
  $Res call({String id, String name, List<String> memberIds, bool isPublic});
}

/// @nodoc
class _$SocialGroupCopyWithImpl<$Res> implements $SocialGroupCopyWith<$Res> {
  _$SocialGroupCopyWithImpl(this._self, this._then);

  final SocialGroup _self;
  final $Res Function(SocialGroup) _then;

  /// Create a copy of SocialGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? memberIds = null,
    Object? isPublic = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      memberIds: null == memberIds
          ? _self.memberIds
          : memberIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPublic: null == isPublic
          ? _self.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SocialGroup].
extension SocialGroupPatterns on SocialGroup {
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
    TResult Function(_SocialGroup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialGroup() when $default != null:
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
    TResult Function(_SocialGroup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialGroup():
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
    TResult? Function(_SocialGroup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialGroup() when $default != null:
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
            String id, String name, List<String> memberIds, bool isPublic)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialGroup() when $default != null:
        return $default(_that.id, _that.name, _that.memberIds, _that.isPublic);
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
            String id, String name, List<String> memberIds, bool isPublic)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialGroup():
        return $default(_that.id, _that.name, _that.memberIds, _that.isPublic);
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
            String id, String name, List<String> memberIds, bool isPublic)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialGroup() when $default != null:
        return $default(_that.id, _that.name, _that.memberIds, _that.isPublic);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SocialGroup implements SocialGroup {
  const _SocialGroup(
      {required this.id,
      required this.name,
      final List<String> memberIds = const <String>[],
      this.isPublic = true})
      : _memberIds = memberIds;
  factory _SocialGroup.fromJson(Map<String, dynamic> json) =>
      _$SocialGroupFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<String> _memberIds;
  @override
  @JsonKey()
  List<String> get memberIds {
    if (_memberIds is EqualUnmodifiableListView) return _memberIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberIds);
  }

  @override
  @JsonKey()
  final bool isPublic;

  /// Create a copy of SocialGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialGroupCopyWith<_SocialGroup> get copyWith =>
      __$SocialGroupCopyWithImpl<_SocialGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SocialGroupToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._memberIds, _memberIds) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_memberIds), isPublic);

  @override
  String toString() {
    return 'SocialGroup(id: $id, name: $name, memberIds: $memberIds, isPublic: $isPublic)';
  }
}

/// @nodoc
abstract mixin class _$SocialGroupCopyWith<$Res>
    implements $SocialGroupCopyWith<$Res> {
  factory _$SocialGroupCopyWith(
          _SocialGroup value, $Res Function(_SocialGroup) _then) =
      __$SocialGroupCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, List<String> memberIds, bool isPublic});
}

/// @nodoc
class __$SocialGroupCopyWithImpl<$Res> implements _$SocialGroupCopyWith<$Res> {
  __$SocialGroupCopyWithImpl(this._self, this._then);

  final _SocialGroup _self;
  final $Res Function(_SocialGroup) _then;

  /// Create a copy of SocialGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? memberIds = null,
    Object? isPublic = null,
  }) {
    return _then(_SocialGroup(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      memberIds: null == memberIds
          ? _self._memberIds
          : memberIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPublic: null == isPublic
          ? _self.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
