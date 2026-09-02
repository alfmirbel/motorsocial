import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_query.freezed.dart';
part 'activity_query.g.dart';

/// Parámetros de consulta paginada para el motor de actividades.
@freezed
abstract class ActivityQuery with _$ActivityQuery {
  const factory ActivityQuery({
    String? actorId,
    @Default(20) int limit,
  }) = _ActivityQuery;

  factory ActivityQuery.fromJson(Map<String, dynamic> json) =>
      _$ActivityQueryFromJson(json);
}