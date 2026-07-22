
class ActivityQuery {
  final String? actorId;
  final int limit;
  const ActivityQuery({this.actorId, this.limit = 20});
}

class SocialActivity {
  final String id;
  final String actorId;
  final String actorName;
  final String verb;
  final String objectType;
  final String objectId;
  final Map<String, dynamic> payload;
  final int createdAt;
  const SocialActivity({required this.id, required this.actorId, required this.actorName, required this.verb, required this.objectType, required this.objectId, this.payload = const <String, dynamic>{}, required this.createdAt});
}

class ActivityContract {}
