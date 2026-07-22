class RoleProfile {
  final String key;
  final String name;
  final List<String> permissions;

  const RoleProfile({
    required this.key,
    required this.name,
    this.permissions = const <String>[],
  });

  factory RoleProfile.fromJson(Map<String, dynamic> json) => RoleProfile(
        key: json['key'] as String? ?? '',
        name: json['name'] as String? ?? '',
        permissions: (json['permissions'] as List<dynamic>? ?? const [])
            .whereType<String>()
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': key,
        'name': name,
        'permissions': permissions,
      };

  bool hasPermission(String permission) => permissions.contains(permission);
}
