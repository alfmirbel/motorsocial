import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_event.freezed.dart';
part 'security_event.g.dart';

/// Evento de auditoría de seguridad persistido en `motorsocial_security_events`.
///
/// Campo de negocio `type` renombrado a `eventType` en JSON para evitar
/// colisión con el discriminador CouchDB `type`.
@freezed
abstract class SecurityEvent with _$SecurityEvent {
  const factory SecurityEvent({
    required String id,
    @JsonKey(name: 'eventType') required String type,
    String? actorId,
    @Default(<String, dynamic>{}) Map<String, dynamic> payload,
    required DateTime createdAt,
  }) = _SecurityEvent;

  factory SecurityEvent.fromJson(Map<String, dynamic> json) =>
      _$SecurityEventFromJson(json);
}