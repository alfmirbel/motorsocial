import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_contract.freezed.dart';
part 'location_contract.g.dart';

/// Configuración del módulo de geolocalización.
@freezed
abstract class LocationContract with _$LocationContract {
  const factory LocationContract({
    @Default(true) bool enableGeolocation,
    @Default(true) bool enablePostalCode,
    @Default(20) int defaultLocalityLimit,
  }) = _LocationContract;

  factory LocationContract.fromJson(Map<String, dynamic> json) =>
      _$LocationContractFromJson(json);
}

/// Lugar geográfico persistido en `motorsocial_places`.
///
/// Doc CouchDB con prefijo `place:<uuid>`.
@freezed
abstract class SocialPlace with _$SocialPlace {
  const factory SocialPlace({
    required String id,
    required String name,
    double? latitude,
    double? longitude,
    String? postalCode,
  }) = _SocialPlace;

  factory SocialPlace.fromJson(Map<String, dynamic> json) =>
      _$SocialPlaceFromJson(json);
}

/// Resultado de consulta de código postal a API externa.
@freezed
abstract class PostalCodeLookupResult with _$PostalCodeLookupResult {
  const factory PostalCodeLookupResult({
    required String postalCode,
    @Default(<LocalityEntry>[]) List<LocalityEntry> localities,
  }) = _PostalCodeLookupResult;

  factory PostalCodeLookupResult.fromJson(Map<String, dynamic> json) =>
      _$PostalCodeLookupResultFromJson(json);
}

/// Entrada individual de localidad (colonia/municipio/estado).
@freezed
abstract class LocalityEntry with _$LocalityEntry {
  const factory LocalityEntry({
    required String name,
    required String state,
    required String country,
  }) = _LocalityEntry;

  factory LocalityEntry.fromJson(Map<String, dynamic> json) =>
      _$LocalityEntryFromJson(json);
}