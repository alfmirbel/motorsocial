// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialObject {
  String get id;
  String get type;
  String? get title;
  Map<String, dynamic> get attributes;
  String? get ownerId;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of SocialObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialObjectCopyWith<SocialObject> get copyWith =>
      _$SocialObjectCopyWithImpl<SocialObject>(
          this as SocialObject, _$identity);

  /// Serializes this SocialObject to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialObject &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other.attributes, attributes) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      title,
      const DeepCollectionEquality().hash(attributes),
      ownerId,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'SocialObject(id: $id, type: $type, title: $title, attributes: $attributes, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $SocialObjectCopyWith<$Res> {
  factory $SocialObjectCopyWith(
          SocialObject value, $Res Function(SocialObject) _then) =
      _$SocialObjectCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String type,
      String? title,
      Map<String, dynamic> attributes,
      String? ownerId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$SocialObjectCopyWithImpl<$Res> implements $SocialObjectCopyWith<$Res> {
  _$SocialObjectCopyWithImpl(this._self, this._then);

  final SocialObject _self;
  final $Res Function(SocialObject) _then;

  /// Create a copy of SocialObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = freezed,
    Object? attributes = null,
    Object? ownerId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      attributes: null == attributes
          ? _self.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      ownerId: freezed == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [SocialObject].
extension SocialObjectPatterns on SocialObject {
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
    TResult Function(_SocialObject value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialObject() when $default != null:
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
    TResult Function(_SocialObject value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialObject():
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
    TResult? Function(_SocialObject value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialObject() when $default != null:
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
            String type,
            String? title,
            Map<String, dynamic> attributes,
            String? ownerId,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialObject() when $default != null:
        return $default(_that.id, _that.type, _that.title, _that.attributes,
            _that.ownerId, _that.createdAt, _that.updatedAt);
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
            String type,
            String? title,
            Map<String, dynamic> attributes,
            String? ownerId,
            DateTime createdAt,
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialObject():
        return $default(_that.id, _that.type, _that.title, _that.attributes,
            _that.ownerId, _that.createdAt, _that.updatedAt);
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
            String type,
            String? title,
            Map<String, dynamic> attributes,
            String? ownerId,
            DateTime createdAt,
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialObject() when $default != null:
        return $default(_that.id, _that.type, _that.title, _that.attributes,
            _that.ownerId, _that.createdAt, _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SocialObject implements SocialObject {
  const _SocialObject(
      {required this.id,
      this.type = 'generic',
      this.title,
      final Map<String, dynamic> attributes = const <String, dynamic>{},
      this.ownerId,
      required this.createdAt,
      required this.updatedAt})
      : _attributes = attributes;
  factory _SocialObject.fromJson(Map<String, dynamic> json) =>
      _$SocialObjectFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String type;
  @override
  final String? title;
  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    if (_attributes is EqualUnmodifiableMapView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  final String? ownerId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of SocialObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialObjectCopyWith<_SocialObject> get copyWith =>
      __$SocialObjectCopyWithImpl<_SocialObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SocialObjectToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialObject &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      title,
      const DeepCollectionEquality().hash(_attributes),
      ownerId,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'SocialObject(id: $id, type: $type, title: $title, attributes: $attributes, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$SocialObjectCopyWith<$Res>
    implements $SocialObjectCopyWith<$Res> {
  factory _$SocialObjectCopyWith(
          _SocialObject value, $Res Function(_SocialObject) _then) =
      __$SocialObjectCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String? title,
      Map<String, dynamic> attributes,
      String? ownerId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$SocialObjectCopyWithImpl<$Res>
    implements _$SocialObjectCopyWith<$Res> {
  __$SocialObjectCopyWithImpl(this._self, this._then);

  final _SocialObject _self;
  final $Res Function(_SocialObject) _then;

  /// Create a copy of SocialObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = freezed,
    Object? attributes = null,
    Object? ownerId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_SocialObject(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      attributes: null == attributes
          ? _self._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      ownerId: freezed == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$SocialObjectPage {
  List<SocialObject> get items;
  int get total;
  int get offset;
  bool get hasMore;

  /// Create a copy of SocialObjectPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialObjectPageCopyWith<SocialObjectPage> get copyWith =>
      _$SocialObjectPageCopyWithImpl<SocialObjectPage>(
          this as SocialObjectPage, _$identity);

  /// Serializes this SocialObjectPage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialObjectPage &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(items), total, offset, hasMore);

  @override
  String toString() {
    return 'SocialObjectPage(items: $items, total: $total, offset: $offset, hasMore: $hasMore)';
  }
}

/// @nodoc
abstract mixin class $SocialObjectPageCopyWith<$Res> {
  factory $SocialObjectPageCopyWith(
          SocialObjectPage value, $Res Function(SocialObjectPage) _then) =
      _$SocialObjectPageCopyWithImpl;
  @useResult
  $Res call({List<SocialObject> items, int total, int offset, bool hasMore});
}

/// @nodoc
class _$SocialObjectPageCopyWithImpl<$Res>
    implements $SocialObjectPageCopyWith<$Res> {
  _$SocialObjectPageCopyWithImpl(this._self, this._then);

  final SocialObjectPage _self;
  final $Res Function(SocialObjectPage) _then;

  /// Create a copy of SocialObjectPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? offset = null,
    Object? hasMore = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SocialObject>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SocialObjectPage].
extension SocialObjectPagePatterns on SocialObjectPage {
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
    TResult Function(_SocialObjectPage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialObjectPage() when $default != null:
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
    TResult Function(_SocialObjectPage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialObjectPage():
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
    TResult? Function(_SocialObjectPage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialObjectPage() when $default != null:
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
            List<SocialObject> items, int total, int offset, bool hasMore)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialObjectPage() when $default != null:
        return $default(_that.items, _that.total, _that.offset, _that.hasMore);
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
            List<SocialObject> items, int total, int offset, bool hasMore)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialObjectPage():
        return $default(_that.items, _that.total, _that.offset, _that.hasMore);
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
            List<SocialObject> items, int total, int offset, bool hasMore)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialObjectPage() when $default != null:
        return $default(_that.items, _that.total, _that.offset, _that.hasMore);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SocialObjectPage implements SocialObjectPage {
  const _SocialObjectPage(
      {final List<SocialObject> items = const <SocialObject>[],
      this.total = 0,
      this.offset = 0,
      this.hasMore = false})
      : _items = items;
  factory _SocialObjectPage.fromJson(Map<String, dynamic> json) =>
      _$SocialObjectPageFromJson(json);

  final List<SocialObject> _items;
  @override
  @JsonKey()
  List<SocialObject> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final bool hasMore;

  /// Create a copy of SocialObjectPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialObjectPageCopyWith<_SocialObjectPage> get copyWith =>
      __$SocialObjectPageCopyWithImpl<_SocialObjectPage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SocialObjectPageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialObjectPage &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), total, offset, hasMore);

  @override
  String toString() {
    return 'SocialObjectPage(items: $items, total: $total, offset: $offset, hasMore: $hasMore)';
  }
}

/// @nodoc
abstract mixin class _$SocialObjectPageCopyWith<$Res>
    implements $SocialObjectPageCopyWith<$Res> {
  factory _$SocialObjectPageCopyWith(
          _SocialObjectPage value, $Res Function(_SocialObjectPage) _then) =
      __$SocialObjectPageCopyWithImpl;
  @override
  @useResult
  $Res call({List<SocialObject> items, int total, int offset, bool hasMore});
}

/// @nodoc
class __$SocialObjectPageCopyWithImpl<$Res>
    implements _$SocialObjectPageCopyWith<$Res> {
  __$SocialObjectPageCopyWithImpl(this._self, this._then);

  final _SocialObjectPage _self;
  final $Res Function(_SocialObjectPage) _then;

  /// Create a copy of SocialObjectPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? offset = null,
    Object? hasMore = null,
  }) {
    return _then(_SocialObjectPage(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SocialObject>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
