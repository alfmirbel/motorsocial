// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivityQuery _$ActivityQueryFromJson(Map<String, dynamic> json) =>
    _ActivityQuery(
      actorId: json['actorId'] as String?,
      limit: (json['limit'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$ActivityQueryToJson(_ActivityQuery instance) =>
    <String, dynamic>{
      'actorId': instance.actorId,
      'limit': instance.limit,
    };
