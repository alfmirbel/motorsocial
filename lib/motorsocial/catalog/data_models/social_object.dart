import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_object.freezed.dart';
part 'social_object.g.dart';

/// Objeto social genérico del catálogo. Persistido en `motorsocial_catalog`.
///
/// Documento CouchDB con prefijo `item:<uuid>` (o `alimento:<uuid>` cuando
/// `type == 'alimento'`).
@freezed
abstract class SocialObject with _$SocialObject {
  const factory SocialObject({
    required String id,
    @Default('generic') String type,
    String? title,
    @Default(<String, dynamic>{}) Map<String, dynamic> attributes,
    String? ownerId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SocialObject;

  factory SocialObject.fromJson(Map<String, dynamic> json) =>
      _$SocialObjectFromJson(json);
}

/// Página de resultados paginados del catálogo.
@freezed
abstract class SocialObjectPage with _$SocialObjectPage {
  const factory SocialObjectPage({
    @Default(<SocialObject>[]) List<SocialObject> items,
    @Default(0) int total,
    @Default(0) int offset,
    @Default(false) bool hasMore,
  }) = _SocialObjectPage;

  factory SocialObjectPage.fromJson(Map<String, dynamic> json) =>
      _$SocialObjectPageFromJson(json);
}