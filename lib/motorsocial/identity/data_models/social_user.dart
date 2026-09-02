import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_user.freezed.dart';
part 'social_user.g.dart';

/// Usuario de la red social. Documento persistido en CouchDB `motorsocial_usuarios`.
///
/// Campos FESP documentados en `_documentacion/_analisisydiseno/identity/06_BD.md`:
/// `email`, `passwordHash`, `roleKey`, `createdAt`, `updatedAt`.
@freezed
abstract class SocialUser with _$SocialUser {
  const factory SocialUser({
    required String id,
    String? email,
    required String displayName,
    String? photoUrl,
    String? passwordHash,
    String? roleKey,
    @Default(0) int createdAt,
    @Default(0) int updatedAt,
  }) = _SocialUser;

  factory SocialUser.fromJson(Map<String, dynamic> json) =>
      _$SocialUserFromJson(json);
}
