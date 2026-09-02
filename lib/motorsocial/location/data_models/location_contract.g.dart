// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationContract _$LocationContractFromJson(Map<String, dynamic> json) =>
    _LocationContract(
      enableGeolocation: json['enableGeolocation'] as bool? ?? true,
      enablePostalCode: json['enablePostalCode'] as bool? ?? true,
      defaultLocalityLimit:
          (json['defaultLocalityLimit'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$LocationContractToJson(_LocationContract instance) =>
    <String, dynamic>{
      'enableGeolocation': instance.enableGeolocation,
      'enablePostalCode': instance.enablePostalCode,
      'defaultLocalityLimit': instance.defaultLocalityLimit,
    };

_SocialPlace _$SocialPlaceFromJson(Map<String, dynamic> json) => _SocialPlace(
      id: json['id'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      postalCode: json['postalCode'] as String?,
    );

Map<String, dynamic> _$SocialPlaceToJson(_SocialPlace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'postalCode': instance.postalCode,
    };

_PostalCodeLookupResult _$PostalCodeLookupResultFromJson(
        Map<String, dynamic> json) =>
    _PostalCodeLookupResult(
      postalCode: json['postalCode'] as String,
      localities: (json['localities'] as List<dynamic>?)
              ?.map((e) => LocalityEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LocalityEntry>[],
    );

Map<String, dynamic> _$PostalCodeLookupResultToJson(
        _PostalCodeLookupResult instance) =>
    <String, dynamic>{
      'postalCode': instance.postalCode,
      'localities': instance.localities.map((e) => e.toJson()).toList(),
    };

_LocalityEntry _$LocalityEntryFromJson(Map<String, dynamic> json) =>
    _LocalityEntry(
      name: json['name'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$LocalityEntryToJson(_LocalityEntry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'state': instance.state,
      'country': instance.country,
    };
