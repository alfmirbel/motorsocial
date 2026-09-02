// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ValidationResult _$ValidationResultFromJson(Map<String, dynamic> json) =>
    _ValidationResult(
      isValid: json['isValid'] as bool? ?? true,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ValidationResultToJson(_ValidationResult instance) =>
    <String, dynamic>{
      'isValid': instance.isValid,
      'message': instance.message,
    };
