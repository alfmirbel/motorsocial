import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_status.freezed.dart';
part 'connection_status.g.dart';

/// Estado de conectividad de red.
@freezed
abstract class ConnectionStatus with _$ConnectionStatus {
  const factory ConnectionStatus({
    @Default(false) bool isOnline,
    String? connectivityType,
  }) = _ConnectionStatus;

  factory ConnectionStatus.fromJson(Map<String, dynamic> json) =>
      _$ConnectionStatusFromJson(json);
}

/// Información de plataforma (OS, versión).
@freezed
abstract class PlatformInfo with _$PlatformInfo {
  const factory PlatformInfo({
    required String platform,
    String? version,
  }) = _PlatformInfo;

  factory PlatformInfo.fromJson(Map<String, dynamic> json) =>
      _$PlatformInfoFromJson(json);
}

/// Estado del motor de sincronización offline-first.
@freezed
abstract class SyncState with _$SyncState {
  const factory SyncState({
    @Default(false) bool isSyncing,
    DateTime? lastSyncedAt,
    String? error,
  }) = _SyncState;

  factory SyncState.fromJson(Map<String, dynamic> json) =>
      _$SyncStateFromJson(json);
}