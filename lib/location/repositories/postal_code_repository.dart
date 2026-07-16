import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../data_models/location_contract.dart';

abstract class PostalCodeRepository {
  Future<PostalCodeLookupResult> lookup(String postalCode);
}

class PostalCodeRepositoryImpl implements PostalCodeRepository {
  final Uri baseUri;
  const PostalCodeRepositoryImpl({required this.baseUri});

  @override
  Future<PostalCodeLookupResult> lookup(String postalCode) async {
    final response = await http.get(Uri.parse('$baseUri/$postalCode'));
    if (response.statusCode == 200) {
      return PostalCodeLookupResult.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }
    throw Exception('Error al buscar CP');
  }
}
