class SocialGroup {
  final String id;
  final String name;
  final List<String> memberIds;
  final bool isPublic;

  const SocialGroup({
    required this.id,
    required this.name,
    this.memberIds = const <String>[],
    this.isPublic = true,
  });
}
