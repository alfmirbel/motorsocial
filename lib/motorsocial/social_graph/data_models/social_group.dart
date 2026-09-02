import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_group.freezed.dart';
part 'social_group.g.dart';

/// Grupo social con miembros. Persistido en `motorsocial_grupos`.
///
/// Doc CouchDB con prefijo `grupo:<uuid>`.
@freezed
abstract class SocialGroup with _$SocialGroup {
  const factory SocialGroup({
    required String id,
    required String name,
    @Default(<String>[]) List<String> memberIds,
    @Default(true) bool isPublic,
  }) = _SocialGroup;

  factory SocialGroup.fromJson(Map<String, dynamic> json) =>
      _$SocialGroupFromJson(json);
}