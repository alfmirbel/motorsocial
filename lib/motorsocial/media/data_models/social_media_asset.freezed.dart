// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_media_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialMediaAsset {
  String get id;
  String get ownerId;
  String get assetType;
  String get url;
  DateTime get createdAt;

  /// Create a copy of SocialMediaAsset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialMediaAssetCopyWith<SocialMediaAsset> get copyWith =>
      _$SocialMediaAssetCopyWithImpl<SocialMediaAsset>(
          this as SocialMediaAsset, _$identity);

  /// Serializes this SocialMediaAsset to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialMediaAsset &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, ownerId, assetType, url, createdAt);

  @override
  String toString() {
    return 'SocialMediaAsset(id: $id, ownerId: $ownerId, assetType: $assetType, url: $url, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $SocialMediaAssetCopyWith<$Res> {
  factory $SocialMediaAssetCopyWith(
          SocialMediaAsset value, $Res Function(SocialMediaAsset) _then) =
      _$SocialMediaAssetCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String assetType,
      String url,
      DateTime createdAt});
}

/// @nodoc
class _$SocialMediaAssetCopyWithImpl<$Res>
    implements $SocialMediaAssetCopyWith<$Res> {
  _$SocialMediaAssetCopyWithImpl(this._self, this._then);

  final SocialMediaAsset _self;
  final $Res Function(SocialMediaAsset) _then;

  /// Create a copy of SocialMediaAsset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? assetType = null,
    Object? url = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      assetType: null == assetType
          ? _self.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [SocialMediaAsset].
extension SocialMediaAssetPatterns on SocialMediaAsset {
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
    TResult Function(_SocialMediaAsset value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialMediaAsset() when $default != null:
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
    TResult Function(_SocialMediaAsset value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialMediaAsset():
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
    TResult? Function(_SocialMediaAsset value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialMediaAsset() when $default != null:
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
    TResult Function(String id, String ownerId, String assetType, String url,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialMediaAsset() when $default != null:
        return $default(_that.id, _that.ownerId, _that.assetType, _that.url,
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
    TResult Function(String id, String ownerId, String assetType, String url,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialMediaAsset():
        return $default(_that.id, _that.ownerId, _that.assetType, _that.url,
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
    TResult? Function(String id, String ownerId, String assetType, String url,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialMediaAsset() when $default != null:
        return $default(_that.id, _that.ownerId, _that.assetType, _that.url,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SocialMediaAsset implements SocialMediaAsset {
  const _SocialMediaAsset(
      {required this.id,
      required this.ownerId,
      this.assetType = 'image',
      required this.url,
      required this.createdAt});
  factory _SocialMediaAsset.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaAssetFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  @JsonKey()
  final String assetType;
  @override
  final String url;
  @override
  final DateTime createdAt;

  /// Create a copy of SocialMediaAsset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialMediaAssetCopyWith<_SocialMediaAsset> get copyWith =>
      __$SocialMediaAssetCopyWithImpl<_SocialMediaAsset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SocialMediaAssetToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialMediaAsset &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, ownerId, assetType, url, createdAt);

  @override
  String toString() {
    return 'SocialMediaAsset(id: $id, ownerId: $ownerId, assetType: $assetType, url: $url, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$SocialMediaAssetCopyWith<$Res>
    implements $SocialMediaAssetCopyWith<$Res> {
  factory _$SocialMediaAssetCopyWith(
          _SocialMediaAsset value, $Res Function(_SocialMediaAsset) _then) =
      __$SocialMediaAssetCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String assetType,
      String url,
      DateTime createdAt});
}

/// @nodoc
class __$SocialMediaAssetCopyWithImpl<$Res>
    implements _$SocialMediaAssetCopyWith<$Res> {
  __$SocialMediaAssetCopyWithImpl(this._self, this._then);

  final _SocialMediaAsset _self;
  final $Res Function(_SocialMediaAsset) _then;

  /// Create a copy of SocialMediaAsset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? assetType = null,
    Object? url = null,
    Object? createdAt = null,
  }) {
    return _then(_SocialMediaAsset(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      assetType: null == assetType
          ? _self.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
