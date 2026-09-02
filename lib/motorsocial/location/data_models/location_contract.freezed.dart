// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationContract {
  bool get enableGeolocation;
  bool get enablePostalCode;
  int get defaultLocalityLimit;

  /// Create a copy of LocationContract
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationContractCopyWith<LocationContract> get copyWith =>
      _$LocationContractCopyWithImpl<LocationContract>(
          this as LocationContract, _$identity);

  /// Serializes this LocationContract to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationContract &&
            (identical(other.enableGeolocation, enableGeolocation) ||
                other.enableGeolocation == enableGeolocation) &&
            (identical(other.enablePostalCode, enablePostalCode) ||
                other.enablePostalCode == enablePostalCode) &&
            (identical(other.defaultLocalityLimit, defaultLocalityLimit) ||
                other.defaultLocalityLimit == defaultLocalityLimit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, enableGeolocation, enablePostalCode, defaultLocalityLimit);

  @override
  String toString() {
    return 'LocationContract(enableGeolocation: $enableGeolocation, enablePostalCode: $enablePostalCode, defaultLocalityLimit: $defaultLocalityLimit)';
  }
}

/// @nodoc
abstract mixin class $LocationContractCopyWith<$Res> {
  factory $LocationContractCopyWith(
          LocationContract value, $Res Function(LocationContract) _then) =
      _$LocationContractCopyWithImpl;
  @useResult
  $Res call(
      {bool enableGeolocation,
      bool enablePostalCode,
      int defaultLocalityLimit});
}

/// @nodoc
class _$LocationContractCopyWithImpl<$Res>
    implements $LocationContractCopyWith<$Res> {
  _$LocationContractCopyWithImpl(this._self, this._then);

  final LocationContract _self;
  final $Res Function(LocationContract) _then;

  /// Create a copy of LocationContract
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableGeolocation = null,
    Object? enablePostalCode = null,
    Object? defaultLocalityLimit = null,
  }) {
    return _then(_self.copyWith(
      enableGeolocation: null == enableGeolocation
          ? _self.enableGeolocation
          : enableGeolocation // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePostalCode: null == enablePostalCode
          ? _self.enablePostalCode
          : enablePostalCode // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultLocalityLimit: null == defaultLocalityLimit
          ? _self.defaultLocalityLimit
          : defaultLocalityLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [LocationContract].
extension LocationContractPatterns on LocationContract {
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
    TResult Function(_LocationContract value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationContract() when $default != null:
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
    TResult Function(_LocationContract value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationContract():
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
    TResult? Function(_LocationContract value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationContract() when $default != null:
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
    TResult Function(bool enableGeolocation, bool enablePostalCode,
            int defaultLocalityLimit)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationContract() when $default != null:
        return $default(_that.enableGeolocation, _that.enablePostalCode,
            _that.defaultLocalityLimit);
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
    TResult Function(bool enableGeolocation, bool enablePostalCode,
            int defaultLocalityLimit)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationContract():
        return $default(_that.enableGeolocation, _that.enablePostalCode,
            _that.defaultLocalityLimit);
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
    TResult? Function(bool enableGeolocation, bool enablePostalCode,
            int defaultLocalityLimit)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationContract() when $default != null:
        return $default(_that.enableGeolocation, _that.enablePostalCode,
            _that.defaultLocalityLimit);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocationContract implements LocationContract {
  const _LocationContract(
      {this.enableGeolocation = true,
      this.enablePostalCode = true,
      this.defaultLocalityLimit = 20});
  factory _LocationContract.fromJson(Map<String, dynamic> json) =>
      _$LocationContractFromJson(json);

  @override
  @JsonKey()
  final bool enableGeolocation;
  @override
  @JsonKey()
  final bool enablePostalCode;
  @override
  @JsonKey()
  final int defaultLocalityLimit;

  /// Create a copy of LocationContract
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationContractCopyWith<_LocationContract> get copyWith =>
      __$LocationContractCopyWithImpl<_LocationContract>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationContractToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationContract &&
            (identical(other.enableGeolocation, enableGeolocation) ||
                other.enableGeolocation == enableGeolocation) &&
            (identical(other.enablePostalCode, enablePostalCode) ||
                other.enablePostalCode == enablePostalCode) &&
            (identical(other.defaultLocalityLimit, defaultLocalityLimit) ||
                other.defaultLocalityLimit == defaultLocalityLimit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, enableGeolocation, enablePostalCode, defaultLocalityLimit);

  @override
  String toString() {
    return 'LocationContract(enableGeolocation: $enableGeolocation, enablePostalCode: $enablePostalCode, defaultLocalityLimit: $defaultLocalityLimit)';
  }
}

/// @nodoc
abstract mixin class _$LocationContractCopyWith<$Res>
    implements $LocationContractCopyWith<$Res> {
  factory _$LocationContractCopyWith(
          _LocationContract value, $Res Function(_LocationContract) _then) =
      __$LocationContractCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool enableGeolocation,
      bool enablePostalCode,
      int defaultLocalityLimit});
}

/// @nodoc
class __$LocationContractCopyWithImpl<$Res>
    implements _$LocationContractCopyWith<$Res> {
  __$LocationContractCopyWithImpl(this._self, this._then);

  final _LocationContract _self;
  final $Res Function(_LocationContract) _then;

  /// Create a copy of LocationContract
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enableGeolocation = null,
    Object? enablePostalCode = null,
    Object? defaultLocalityLimit = null,
  }) {
    return _then(_LocationContract(
      enableGeolocation: null == enableGeolocation
          ? _self.enableGeolocation
          : enableGeolocation // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePostalCode: null == enablePostalCode
          ? _self.enablePostalCode
          : enablePostalCode // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultLocalityLimit: null == defaultLocalityLimit
          ? _self.defaultLocalityLimit
          : defaultLocalityLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$SocialPlace {
  String get id;
  String get name;
  double? get latitude;
  double? get longitude;
  String? get postalCode;

  /// Create a copy of SocialPlace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialPlaceCopyWith<SocialPlace> get copyWith =>
      _$SocialPlaceCopyWithImpl<SocialPlace>(this as SocialPlace, _$identity);

  /// Serializes this SocialPlace to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialPlace &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, latitude, longitude, postalCode);

  @override
  String toString() {
    return 'SocialPlace(id: $id, name: $name, latitude: $latitude, longitude: $longitude, postalCode: $postalCode)';
  }
}

/// @nodoc
abstract mixin class $SocialPlaceCopyWith<$Res> {
  factory $SocialPlaceCopyWith(
          SocialPlace value, $Res Function(SocialPlace) _then) =
      _$SocialPlaceCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      double? latitude,
      double? longitude,
      String? postalCode});
}

/// @nodoc
class _$SocialPlaceCopyWithImpl<$Res> implements $SocialPlaceCopyWith<$Res> {
  _$SocialPlaceCopyWithImpl(this._self, this._then);

  final SocialPlace _self;
  final $Res Function(SocialPlace) _then;

  /// Create a copy of SocialPlace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? postalCode = freezed,
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
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SocialPlace].
extension SocialPlacePatterns on SocialPlace {
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
    TResult Function(_SocialPlace value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialPlace() when $default != null:
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
    TResult Function(_SocialPlace value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialPlace():
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
    TResult? Function(_SocialPlace value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialPlace() when $default != null:
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
    TResult Function(String id, String name, double? latitude,
            double? longitude, String? postalCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialPlace() when $default != null:
        return $default(_that.id, _that.name, _that.latitude, _that.longitude,
            _that.postalCode);
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
    TResult Function(String id, String name, double? latitude,
            double? longitude, String? postalCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialPlace():
        return $default(_that.id, _that.name, _that.latitude, _that.longitude,
            _that.postalCode);
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
    TResult? Function(String id, String name, double? latitude,
            double? longitude, String? postalCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialPlace() when $default != null:
        return $default(_that.id, _that.name, _that.latitude, _that.longitude,
            _that.postalCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SocialPlace implements SocialPlace {
  const _SocialPlace(
      {required this.id,
      required this.name,
      this.latitude,
      this.longitude,
      this.postalCode});
  factory _SocialPlace.fromJson(Map<String, dynamic> json) =>
      _$SocialPlaceFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? postalCode;

  /// Create a copy of SocialPlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialPlaceCopyWith<_SocialPlace> get copyWith =>
      __$SocialPlaceCopyWithImpl<_SocialPlace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SocialPlaceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialPlace &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, latitude, longitude, postalCode);

  @override
  String toString() {
    return 'SocialPlace(id: $id, name: $name, latitude: $latitude, longitude: $longitude, postalCode: $postalCode)';
  }
}

/// @nodoc
abstract mixin class _$SocialPlaceCopyWith<$Res>
    implements $SocialPlaceCopyWith<$Res> {
  factory _$SocialPlaceCopyWith(
          _SocialPlace value, $Res Function(_SocialPlace) _then) =
      __$SocialPlaceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double? latitude,
      double? longitude,
      String? postalCode});
}

/// @nodoc
class __$SocialPlaceCopyWithImpl<$Res> implements _$SocialPlaceCopyWith<$Res> {
  __$SocialPlaceCopyWithImpl(this._self, this._then);

  final _SocialPlace _self;
  final $Res Function(_SocialPlace) _then;

  /// Create a copy of SocialPlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_SocialPlace(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PostalCodeLookupResult {
  String get postalCode;
  List<LocalityEntry> get localities;

  /// Create a copy of PostalCodeLookupResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostalCodeLookupResultCopyWith<PostalCodeLookupResult> get copyWith =>
      _$PostalCodeLookupResultCopyWithImpl<PostalCodeLookupResult>(
          this as PostalCodeLookupResult, _$identity);

  /// Serializes this PostalCodeLookupResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostalCodeLookupResult &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            const DeepCollectionEquality()
                .equals(other.localities, localities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, postalCode, const DeepCollectionEquality().hash(localities));

  @override
  String toString() {
    return 'PostalCodeLookupResult(postalCode: $postalCode, localities: $localities)';
  }
}

/// @nodoc
abstract mixin class $PostalCodeLookupResultCopyWith<$Res> {
  factory $PostalCodeLookupResultCopyWith(PostalCodeLookupResult value,
          $Res Function(PostalCodeLookupResult) _then) =
      _$PostalCodeLookupResultCopyWithImpl;
  @useResult
  $Res call({String postalCode, List<LocalityEntry> localities});
}

/// @nodoc
class _$PostalCodeLookupResultCopyWithImpl<$Res>
    implements $PostalCodeLookupResultCopyWith<$Res> {
  _$PostalCodeLookupResultCopyWithImpl(this._self, this._then);

  final PostalCodeLookupResult _self;
  final $Res Function(PostalCodeLookupResult) _then;

  /// Create a copy of PostalCodeLookupResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postalCode = null,
    Object? localities = null,
  }) {
    return _then(_self.copyWith(
      postalCode: null == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      localities: null == localities
          ? _self.localities
          : localities // ignore: cast_nullable_to_non_nullable
              as List<LocalityEntry>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PostalCodeLookupResult].
extension PostalCodeLookupResultPatterns on PostalCodeLookupResult {
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
    TResult Function(_PostalCodeLookupResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostalCodeLookupResult() when $default != null:
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
    TResult Function(_PostalCodeLookupResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostalCodeLookupResult():
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
    TResult? Function(_PostalCodeLookupResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostalCodeLookupResult() when $default != null:
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
    TResult Function(String postalCode, List<LocalityEntry> localities)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostalCodeLookupResult() when $default != null:
        return $default(_that.postalCode, _that.localities);
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
    TResult Function(String postalCode, List<LocalityEntry> localities)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostalCodeLookupResult():
        return $default(_that.postalCode, _that.localities);
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
    TResult? Function(String postalCode, List<LocalityEntry> localities)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostalCodeLookupResult() when $default != null:
        return $default(_that.postalCode, _that.localities);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PostalCodeLookupResult implements PostalCodeLookupResult {
  const _PostalCodeLookupResult(
      {required this.postalCode,
      final List<LocalityEntry> localities = const <LocalityEntry>[]})
      : _localities = localities;
  factory _PostalCodeLookupResult.fromJson(Map<String, dynamic> json) =>
      _$PostalCodeLookupResultFromJson(json);

  @override
  final String postalCode;
  final List<LocalityEntry> _localities;
  @override
  @JsonKey()
  List<LocalityEntry> get localities {
    if (_localities is EqualUnmodifiableListView) return _localities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localities);
  }

  /// Create a copy of PostalCodeLookupResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostalCodeLookupResultCopyWith<_PostalCodeLookupResult> get copyWith =>
      __$PostalCodeLookupResultCopyWithImpl<_PostalCodeLookupResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostalCodeLookupResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostalCodeLookupResult &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            const DeepCollectionEquality()
                .equals(other._localities, _localities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, postalCode,
      const DeepCollectionEquality().hash(_localities));

  @override
  String toString() {
    return 'PostalCodeLookupResult(postalCode: $postalCode, localities: $localities)';
  }
}

/// @nodoc
abstract mixin class _$PostalCodeLookupResultCopyWith<$Res>
    implements $PostalCodeLookupResultCopyWith<$Res> {
  factory _$PostalCodeLookupResultCopyWith(_PostalCodeLookupResult value,
          $Res Function(_PostalCodeLookupResult) _then) =
      __$PostalCodeLookupResultCopyWithImpl;
  @override
  @useResult
  $Res call({String postalCode, List<LocalityEntry> localities});
}

/// @nodoc
class __$PostalCodeLookupResultCopyWithImpl<$Res>
    implements _$PostalCodeLookupResultCopyWith<$Res> {
  __$PostalCodeLookupResultCopyWithImpl(this._self, this._then);

  final _PostalCodeLookupResult _self;
  final $Res Function(_PostalCodeLookupResult) _then;

  /// Create a copy of PostalCodeLookupResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? postalCode = null,
    Object? localities = null,
  }) {
    return _then(_PostalCodeLookupResult(
      postalCode: null == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      localities: null == localities
          ? _self._localities
          : localities // ignore: cast_nullable_to_non_nullable
              as List<LocalityEntry>,
    ));
  }
}

/// @nodoc
mixin _$LocalityEntry {
  String get name;
  String get state;
  String get country;

  /// Create a copy of LocalityEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocalityEntryCopyWith<LocalityEntry> get copyWith =>
      _$LocalityEntryCopyWithImpl<LocalityEntry>(
          this as LocalityEntry, _$identity);

  /// Serializes this LocalityEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocalityEntry &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, state, country);

  @override
  String toString() {
    return 'LocalityEntry(name: $name, state: $state, country: $country)';
  }
}

/// @nodoc
abstract mixin class $LocalityEntryCopyWith<$Res> {
  factory $LocalityEntryCopyWith(
          LocalityEntry value, $Res Function(LocalityEntry) _then) =
      _$LocalityEntryCopyWithImpl;
  @useResult
  $Res call({String name, String state, String country});
}

/// @nodoc
class _$LocalityEntryCopyWithImpl<$Res>
    implements $LocalityEntryCopyWith<$Res> {
  _$LocalityEntryCopyWithImpl(this._self, this._then);

  final LocalityEntry _self;
  final $Res Function(LocalityEntry) _then;

  /// Create a copy of LocalityEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? state = null,
    Object? country = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [LocalityEntry].
extension LocalityEntryPatterns on LocalityEntry {
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
    TResult Function(_LocalityEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocalityEntry() when $default != null:
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
    TResult Function(_LocalityEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalityEntry():
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
    TResult? Function(_LocalityEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalityEntry() when $default != null:
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
    TResult Function(String name, String state, String country)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocalityEntry() when $default != null:
        return $default(_that.name, _that.state, _that.country);
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
    TResult Function(String name, String state, String country) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalityEntry():
        return $default(_that.name, _that.state, _that.country);
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
    TResult? Function(String name, String state, String country)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalityEntry() when $default != null:
        return $default(_that.name, _that.state, _that.country);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocalityEntry implements LocalityEntry {
  const _LocalityEntry(
      {required this.name, required this.state, required this.country});
  factory _LocalityEntry.fromJson(Map<String, dynamic> json) =>
      _$LocalityEntryFromJson(json);

  @override
  final String name;
  @override
  final String state;
  @override
  final String country;

  /// Create a copy of LocalityEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocalityEntryCopyWith<_LocalityEntry> get copyWith =>
      __$LocalityEntryCopyWithImpl<_LocalityEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocalityEntryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocalityEntry &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, state, country);

  @override
  String toString() {
    return 'LocalityEntry(name: $name, state: $state, country: $country)';
  }
}

/// @nodoc
abstract mixin class _$LocalityEntryCopyWith<$Res>
    implements $LocalityEntryCopyWith<$Res> {
  factory _$LocalityEntryCopyWith(
          _LocalityEntry value, $Res Function(_LocalityEntry) _then) =
      __$LocalityEntryCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String state, String country});
}

/// @nodoc
class __$LocalityEntryCopyWithImpl<$Res>
    implements _$LocalityEntryCopyWith<$Res> {
  __$LocalityEntryCopyWithImpl(this._self, this._then);

  final _LocalityEntry _self;
  final $Res Function(_LocalityEntry) _then;

  /// Create a copy of LocalityEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? state = null,
    Object? country = null,
  }) {
    return _then(_LocalityEntry(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
