import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../location/repositories/postal_code_repository.dart';
import 'couchdb_repository.dart';
import '../providers/dio_provider.dart';

/// Configuración de CouchDB cargada en runtime desde `defines.json`.
///
/// Usa `const String.fromEnvironment()` para credenciales (nunca hardcodear).
final couchDbConfigProvider = Provider<CouchDbConfig>((_) {
  return CouchDbConfig(
    url: const String.fromEnvironment(
      'COUCHDB_URL',
      defaultValue: 'https://citigov.cloud:6984',
    ),
    username: const String.fromEnvironment(
      'COUCHDB_USER',
      defaultValue: 'admin',
    ),
    password: const String.fromEnvironment('COUCHDB_PASSWORD'),
  );
});

/// Repositorio CouchDB cableado con la instancia Dio compartida.
///
/// Hereda automáticamente `JwtInterceptor`, `RetryInterceptor` y `LogInterceptor`
/// desde `dioProvider`. Es `FutureProvider` porque depende de `dioProvider`
/// que requiere inicialización asíncrona (token storage).
final couchDbRepositoryProvider =
    FutureProvider<CouchDbRepository>((ref) async {
  final config = ref.watch(couchDbConfigProvider);
  final dio = await ref.watch(dioProvider.future);
  return CouchDbRepository(config: config, dio: dio);
});

/// URL del servicio externo de consulta de código postal.
///
/// Se inyecta vía `--dart-define` en build/run; por defecto vacío (el repo
/// lanza `ArgumentError` si no está definido). Ejemplo:
/// ```
/// flutter run --dart-define=POSTAL_CODE_API_URL=http://localhost:3000/api/cp
/// ```
final postalCodeApiUrlProvider = Provider<String>((_) {
  return const String.fromEnvironment(
    'POSTAL_CODE_API_URL',
    defaultValue: '',
  );
});

/// Repositorio de consulta de código postal cableado a `dioProvider`.
///
/// Es `FutureProvider` porque espera a que `dioProvider` (inicialización
/// asíncrona de token storage) esté disponible.
final postalCodeRepositoryProvider =
    FutureProvider<PostalCodeRepositoryImpl>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  final baseUri = Uri.tryParse(ref.watch(postalCodeApiUrlProvider));
  if (baseUri == null) {
    throw ArgumentError(
      'POSTAL_CODE_API_URL no está definido. '
      'Pasa --dart-define=POSTAL_CODE_API_URL=<url> al compilar.',
    );
  }
  return PostalCodeRepositoryImpl(baseUri: baseUri, dio: dio);
});
