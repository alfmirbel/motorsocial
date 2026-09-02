import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_relationship.freezed.dart';
part 'social_relationship.g.dart';

/// Relación dirigida entre dos usuarios. Persistida en `motorsocial_social_graph`.
///
/// Doc CouchDB con prefijo `relationship:<uuid>`.
/// El campo de negocio `type` se serializa como `relationshipType` en JSON
/// para evitar colisión con el discriminador CouchDB `type`.
@freezed
abstract class SocialRelationship with _$SocialRelationship {
  const factory SocialRelationship({
    required String id,
    required String actorId,
    required String targetId,
    @Default('contact') String type,
    required DateTime createdAt,
  }) = _SocialRelationship;

  factory SocialRelationship.fromJson(Map<String, dynamic> json) =>
      _$SocialRelationshipFromJson(json);
}