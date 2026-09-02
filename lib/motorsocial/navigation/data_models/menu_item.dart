import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item.freezed.dart';
part 'menu_item.g.dart';

/// Ítem individual del menú de navegación.
@freezed
abstract class SocialMenuItem with _$SocialMenuItem {
  const factory SocialMenuItem({
    required String title,
    required String route,
    @Default(true) bool enabled,
  }) = _SocialMenuItem;

  factory SocialMenuItem.fromJson(Map<String, dynamic> json) =>
      _$SocialMenuItemFromJson(json);
}