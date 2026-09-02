// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialMenuItem {
  String get title;
  String get route;
  bool get enabled;

  /// Create a copy of SocialMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialMenuItemCopyWith<SocialMenuItem> get copyWith =>
      _$SocialMenuItemCopyWithImpl<SocialMenuItem>(
          this as SocialMenuItem, _$identity);

  /// Serializes this SocialMenuItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialMenuItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, route, enabled);

  @override
  String toString() {
    return 'SocialMenuItem(title: $title, route: $route, enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $SocialMenuItemCopyWith<$Res> {
  factory $SocialMenuItemCopyWith(
          SocialMenuItem value, $Res Function(SocialMenuItem) _then) =
      _$SocialMenuItemCopyWithImpl;
  @useResult
  $Res call({String title, String route, bool enabled});
}

/// @nodoc
class _$SocialMenuItemCopyWithImpl<$Res>
    implements $SocialMenuItemCopyWith<$Res> {
  _$SocialMenuItemCopyWithImpl(this._self, this._then);

  final SocialMenuItem _self;
  final $Res Function(SocialMenuItem) _then;

  /// Create a copy of SocialMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? route = null,
    Object? enabled = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _self.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SocialMenuItem].
extension SocialMenuItemPatterns on SocialMenuItem {
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
    TResult Function(_SocialMenuItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialMenuItem() when $default != null:
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
    TResult Function(_SocialMenuItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialMenuItem():
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
    TResult? Function(_SocialMenuItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialMenuItem() when $default != null:
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
    TResult Function(String title, String route, bool enabled)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialMenuItem() when $default != null:
        return $default(_that.title, _that.route, _that.enabled);
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
    TResult Function(String title, String route, bool enabled) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialMenuItem():
        return $default(_that.title, _that.route, _that.enabled);
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
    TResult? Function(String title, String route, bool enabled)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialMenuItem() when $default != null:
        return $default(_that.title, _that.route, _that.enabled);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SocialMenuItem implements SocialMenuItem {
  const _SocialMenuItem(
      {required this.title, required this.route, this.enabled = true});
  factory _SocialMenuItem.fromJson(Map<String, dynamic> json) =>
      _$SocialMenuItemFromJson(json);

  @override
  final String title;
  @override
  final String route;
  @override
  @JsonKey()
  final bool enabled;

  /// Create a copy of SocialMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialMenuItemCopyWith<_SocialMenuItem> get copyWith =>
      __$SocialMenuItemCopyWithImpl<_SocialMenuItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SocialMenuItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialMenuItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, route, enabled);

  @override
  String toString() {
    return 'SocialMenuItem(title: $title, route: $route, enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class _$SocialMenuItemCopyWith<$Res>
    implements $SocialMenuItemCopyWith<$Res> {
  factory _$SocialMenuItemCopyWith(
          _SocialMenuItem value, $Res Function(_SocialMenuItem) _then) =
      __$SocialMenuItemCopyWithImpl;
  @override
  @useResult
  $Res call({String title, String route, bool enabled});
}

/// @nodoc
class __$SocialMenuItemCopyWithImpl<$Res>
    implements _$SocialMenuItemCopyWith<$Res> {
  __$SocialMenuItemCopyWithImpl(this._self, this._then);

  final _SocialMenuItem _self;
  final $Res Function(_SocialMenuItem) _then;

  /// Create a copy of SocialMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? route = null,
    Object? enabled = null,
  }) {
    return _then(_SocialMenuItem(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _self.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
