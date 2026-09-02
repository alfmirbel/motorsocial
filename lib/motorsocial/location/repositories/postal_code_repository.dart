import 'dart:convert';

import 'package:dio/dio.dart';

import '../data_models/location_contract.dart';

/// Contrato de búsqueda de código postal.
abstract class PostalCodeRepository {
  Future<PostalCodeLookupResult> lookup(String postalCode);
}

/// Implementación basada en un endpoint HTTP GET `<baseUri>/<postalCode>`.
///
/// Usa [Dio] (con `JwtInterceptor` y reintentos inteligentes cuando seObtiene
/// la instancia compartida vía `dioProvider`). Se puede inyectar un [Dio]
/// propio para tests.
class PostalCodeRepositoryImpl implements PostalCodeRepository {
  final Uri baseUri;
  final Dio _dio;

  PostalCodeRepositoryImpl({required this.baseUri, Dio? dio})
      : _dio = dio ?? Dio();

  @override
  Future<PostalCodeLookupResult> lookup(String postalCode) async {
    final target = '$baseUri/$postalCode';
    final response = await _dio.get<dynamic>(target);
    if (response.statusCode == 200) {
      final body = response.data;
      final Map<String, dynamic> decoded = body is String
          ? jsonDecode(body) as Map<String, dynamic>
          : Map<String, dynamic>.from(body as Map);
      return PostalCodeLookupResult.fromJson(decoded);
    }
    throw Exception('Error al buscar CP');
  }
}
