import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_profile.freezed.dart';
part 'role_profile.g.dart';

/// Perfil de rol con lista de permisos. Persistido embebido en `motorsocial_usuarios`.
@freezed
abstract class RoleProfile with _$RoleProfile {
  const factory RoleProfile({
    required String key,
    required String name,
    @Default(<String>[]) List<String> permissions,
  }) = _RoleProfile;

  /// Verifica si este rol incluye un permiso concreto.
  bool hasPermission(String permission) => permissions.contains(permission);

  factory RoleProfile.fromJson(Map<String, dynamic> json) =>
      _$RoleProfileFromJson(json);
}
