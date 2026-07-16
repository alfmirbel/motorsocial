class SocialObject {
  final String id;
  final String type;
  final String? title;
  final Map<String, dynamic> attributes;
  final String? ownerId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SocialObject({
    required this.id,
    required this.type,
    this.title,
    this.attributes = const <String, dynamic>{},
    this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SocialObject.fromJson(Map<String, dynamic> json) => SocialObject(
        id: json['id'] as String? ?? json['_id'] as String? ?? '',
        type: json['type'] as String? ?? 'generic',
        title: json['title'] as String?,
        attributes: Map<String, dynamic>.from(
          json['attributes'] is Map<String, dynamic>
              ? json['attributes'] as Map<String, dynamic>
              : <String, dynamic>{},
        ),
        ownerId: json['ownerId'] as String?,
        createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ?? DateTime.now(),
        updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? '') ?? DateTime.now(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'type': type,
        'title': title,
        'attributes': attributes,
        'ownerId': ownerId,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}

class SocialObjectPage {
  final List<SocialObject> items;
  final int total;
  final int offset;
  final bool hasMore;

  const SocialObjectPage({
    this.items = const <SocialObject>[],
    this.total = 0,
    this.offset = 0,
    this.hasMore = false,
  });

  factory SocialObjectPage.fromJson(Map<String, dynamic> json) => SocialObjectPage(
        items: (json['items'] as List<dynamic>? ?? const <dynamic>[])
            .whereType<Map<String, dynamic>>()
            .map(SocialObject.fromJson)
            .toList(),
        total: (json['total'] as int?) ?? 0,
        offset: (json['offset'] as int?) ?? 0,
        hasMore: (json['hasMore'] as bool?) ?? false,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'items': items.map((item) => item.toJson()).toList(),
        'total': total,
        'offset': offset,
        'hasMore': hasMore,
      };
}