import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_activity.freezed.dart';
part 'social_activity.g.dart';

/// Evento individual del feed de actividades sociales.
///
/// Persistido en `motorsocial_activity_feed` con prefijo `activity:<uuid>`.
@freezed
abstract class SocialActivity with _$SocialActivity {
  const factory SocialActivity({
    required String id,
    required String actorId,
    required String actorName,
    required String verb,
    required String objectType,
    required String objectId,
    @Default(<String, dynamic>{}) Map<String, dynamic> payload,
    @Default(0) int createdAt,
  }) = _SocialActivity;

  factory SocialActivity.fromJson(Map<String, dynamic> json) =>
      _$SocialActivityFromJson(json);
}