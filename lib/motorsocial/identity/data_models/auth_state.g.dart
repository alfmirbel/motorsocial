// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthState _$AuthStateFromJson(Map<String, dynamic> json) => _AuthState(
      isUserDataLoaded: json['isUserDataLoaded'] as bool? ?? false,
      errorCode: json['errorCode'] as String? ?? null,
      errorMessage: json['errorMessage'] as String? ?? null,
      isAuthenticated: json['isAuthenticated'] as bool? ?? false,
      userId: json['userId'] as String? ?? null,
      accessToken: json['accessToken'] as String? ?? null,
    );

Map<String, dynamic> _$AuthStateToJson(_AuthState instance) =>
    <String, dynamic>{
      'isUserDataLoaded': instance.isUserDataLoaded,
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
      'isAuthenticated': instance.isAuthenticated,
      'userId': instance.userId,
      'accessToken': instance.accessToken,
    };
