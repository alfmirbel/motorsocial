
class QdrantRecord {
  final String id;
  final Map<String, dynamic> payload;
  final double? score;

  const QdrantRecord({required this.id, required this.payload, this.score});
}
