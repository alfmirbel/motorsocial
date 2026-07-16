class ConnectionStatus {
  final bool isOnline;
  final String? connectivityType;

  const ConnectionStatus({this.isOnline = false, this.connectivityType});

  factory ConnectionStatus.fromJson(Map<String, dynamic> json) => ConnectionStatus(
        isOnline: json['isOnline'] as bool? ?? false,
        connectivityType: json['connectivityType'] as String?,
      );
}

class PlatformInfo {
  final String platform;
  final String? version;

  const PlatformInfo({required this.platform, this.version});

  factory PlatformInfo.fromJson(Map<String, dynamic> json) => PlatformInfo(
        platform: json['platform'] as String? ?? 'unknown',
        version: json['version'] as String?,
      );
}

class SyncState {
  final bool isSyncing;
  final DateTime? lastSyncedAt;
  final String? error;

  const SyncState({this.isSyncing = false, this.lastSyncedAt, this.error});

  SyncState copyWith({bool? isSyncing, DateTime? lastSyncedAt, String? error}) {
    return SyncState(
      isSyncing: isSyncing ?? this.isSyncing,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      error: error ?? this.error,
    );
  }
}
