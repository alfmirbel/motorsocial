// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConnectionStatus _$ConnectionStatusFromJson(Map<String, dynamic> json) =>
    _ConnectionStatus(
      isOnline: json['isOnline'] as bool? ?? false,
      connectivityType: json['connectivityType'] as String?,
    );

Map<String, dynamic> _$ConnectionStatusToJson(_ConnectionStatus instance) =>
    <String, dynamic>{
      'isOnline': instance.isOnline,
      'connectivityType': instance.connectivityType,
    };

_PlatformInfo _$PlatformInfoFromJson(Map<String, dynamic> json) =>
    _PlatformInfo(
      platform: json['platform'] as String,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$PlatformInfoToJson(_PlatformInfo instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'version': instance.version,
    };

_SyncState _$SyncStateFromJson(Map<String, dynamic> json) => _SyncState(
      isSyncing: json['isSyncing'] as bool? ?? false,
      lastSyncedAt: json['lastSyncedAt'] == null
          ? null
          : DateTime.parse(json['lastSyncedAt'] as String),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$SyncStateToJson(_SyncState instance) =>
    <String, dynamic>{
      'isSyncing': instance.isSyncing,
      'lastSyncedAt': instance.lastSyncedAt?.toIso8601String(),
      'error': instance.error,
    };
