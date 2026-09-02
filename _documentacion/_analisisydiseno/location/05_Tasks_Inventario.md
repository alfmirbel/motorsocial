# Inventario Técnico y Tareas — Módulo Location

**Ruta código:** `lib\location\` (7 archivos `.dart`, sin árbol anidado duplicado)

---

## Tabla A — Inventario de Componentes

| Subdirectorio | Archivo | Tipo de componente | Nombre del componente | Parámetros que requiere | Variables que utiliza | Variables internas | Estilos que le aplican |
|---|---|---|---|---|---|---|---|
| (raíz) | `location.dart` | Barrel | — | N/A | — | — | N/A |
| `data_models` | `location_contract.dart` | Clase de Datos | `LocationContract` | `enableGeolocation` (bool, def `true`), `enablePostalCode` (bool, def `true`), `defaultLocalityLimit` (int, def 20) | — | — | N/A |
| `data_models` | `location_contract.dart` | Clase de Datos | `SocialPlace` | `id`, `name`, `latitude` (double?), `longitude` (double?), `postalCode` (String?) | — | — | N/A |
| `data_models` | `location_contract.dart` | Clase de Datos | `PostalCodeLookupResult` | `postalCode`, `localities` (List<LocalityEntry>, def `[]`) | — | — | N/A |
| `data_models` | `location_contract.dart` | Clase de Datos | `LocalityEntry` | `name`, `state`, `country` | — | — | N/A |
| `engine` | `location_engine.dart` | Lógica/Servicio | `LocationEngine` | — | — | — | N/A |
| `pages` | `locality_picker_page.dart` | Widget (UI) | `LocalityPickerPage` (Pendiente) | `key` | `context` | — | Scaffold, Center, Text |
| `providers` | `location_notifier.dart` | Clase de Estado | `LocationState` | `locality` (String, def `''`), `isLoading` (bool, def false), `error` (String?) | — | — | N/A |
| `providers` | `location_notifier.dart` | Riverpod Provider | `LocationNotifier` (Pendiente) | — | — | — | N/A |
| `providers` | `location_notifier.dart` | Provider | `locationProvider` | N/A | — | — | N/A |
| `repositories` | `geolocation_repository.dart` | Interfaz/Repositorio | `GeolocationRepository` (abstract) | — | — | — | N/A |
| `repositories` | `geolocation_repository.dart` | Repositorio (real) | `GeolocationRepositoryImpl` | `location` (Location, req) | `location.getLocation()` | — | N/A |
| `repositories` | `postal_code_repository.dart` | Interfaz/Repositorio | `PostalCodeRepository` (abstract) | — | — | — | N/A |
| `repositories` | `postal_code_repository.dart` | Repositorio (real) | `PostalCodeRepositoryImpl` | `baseUri` (Uri, req) | `http.get`, `response.statusCode`, `response.body` | — | N/A |

---

## Tabla B — Inventario de Elementos Internos

| Subdirectorio | Archivo | Variables definidas en el archivo | Clases | Variables de la clase | Funciones/Widgets definidos en la clase | Variables que utiliza | Llamadas a otras clases/widgets |
|---|---|---|---|---|---|---|---|
| (raíz) | `location.dart` | — | — | — | export `data_models/location_contract.dart`, `engine/location_engine.dart`, `providers/location_notifier.dart`, `repositories/geolocation_repository.dart`, `repositories/postal_code_repository.dart`, `pages/locality_picker_page.dart` | — | barrel |
| `data_models` | `location_contract.dart` | — | `LocationContract` | `enableGeolocation`, `enablePostalCode`, `defaultLocalityLimit` | `const LocationContract(...)`, `LocationContract.fromJson` | `json['enableGeolocation']`, `json['enablePostalCode']`, `json['defaultLocalityLimit']` | — |
| `data_models` | `location_contract.dart` | — | `SocialPlace` | `id`, `name`, `latitude`, `longitude`, `postalCode` | `const SocialPlace(...)`, `SocialPlace.fromJson` | `json['id']`, `json['_id']`, `json['name']`, `json['latitude']`, `json['longitude']`, `json['postalCode']` | — |
| `data_models` | `location_contract.dart` | — | `PostalCodeLookupResult` | `postalCode`, `localities` | `const PostalCodeLookupResult(...)`, `PostalCodeLookupResult.fromJson` | `json['postalCode']`, `json['localities']`, `whereType<Map<String,dynamic>>().map(LocalityEntry.fromJson)` | `LocalityEntry` |
| `data_models` | `location_contract.dart` | — | `LocalityEntry` | `name`, `state`, `country` | `const LocalityEntry(...)`, `LocalityEntry.fromJson` | `json['name']`, `json['state']`, `json['country']` | — |
| `engine` | `location_engine.dart` | — | `LocationEngine` | — | `const LocationEngine()`, `initializeProviders(ref)` | `ref.read(locationProvider.notifier)` | `WidgetRef`, `locationProvider` |
| `pages` | `locality_picker_page.dart` | — | `LocalityPickerPage` (StatelessWidget) | — | `build(context)` → Scaffold/Center/Text('Locality picker') | — | `Scaffold`, `Center`, `Text` |
| `providers` | `location_notifier.dart` | `locationProvider` | `LocationState` | `locality`, `isLoading`, `error` | `const LocationState(...)`, `copyWith` | — | — |
| `providers` | `location_notifier.dart` | — | `LocationNotifier` (Pendiente) | — | `build()` → `LocationState()` | — | `Notifier`, `LocationState` |
| `repositories` | `geolocation_repository.dart` | — | `GeolocationRepository` (abstract) | — | `currentPlace()` (abstract) | — | `SocialPlace` |
| `repositories` | `geolocation_repository.dart` | — | `GeolocationRepositoryImpl` | `location` (Location) | `const GeolocationRepositoryImpl(this.location)`, `currentPlace()` → SocialPlace | `location.getLocation()` → `result.latitude`, `result.longitude` | `Location`, `SocialPlace` |
| `repositories` | `postal_code_repository.dart` | — | `PostalCodeRepository` (abstract) | — | `lookup(postalCode)` (abstract) | — | `PostalCodeLookupResult` |
| `repositories` | `postal_code_repository.dart` | — | `PostalCodeRepositoryImpl` | `baseUri` (Uri) | `const PostalCodeRepositoryImpl({required baseUri})`, `lookup(postalCode)` | `http.get(Uri.parse('$baseUri/$postalCode'))`, `response.statusCode`, `response.body`, `jsonDecode` | `http`, `Uri`, `jsonDecode`, `PostalCodeLookupResult` |

---

## Duplicaciones / Inconsistencias Detectadas

1. **Sin `locationRepositoryProvider`/`geolocationRepositoryProvider`/`postalCodeRepositoryProvider`:** los repositorios concretos existen pero no se exponen como providers Riverpod. Deuda técnica; añadir al cablear.
2. **`PostalCodeRepositoryImpl` usa `package:http`** (no Dio con JWT interceptor). Inconsistencia con la arquitectura del resto del app.
3. **`LocationContract.enableGeolocation`/`enablePostalCode` no se comprueban** en `GeolocationRepositoryImpl`/`PostalCodeRepositoryImpl`; son solo flags de configuración sin gate.
4. **`GeolocationRepositoryImpl.currentPlace()` no captura excepciones** del paquete `location` (denegación de permiso, sensor no disponible). Debería devolver `null` en esos casos.
5. **Cascarón:** `LocalityPickerPage` es placeholder `Text('Locality picker')`; `LocationNotifier.build()` retorna estado vacío sin lógica de actualización.
6. **Sin árbol anidado duplicado:** Location es el único módulo de dominio sin réplica `lib\location\location\`.
7. **AGENTS.md desactualizado:** referencia `lib\14_geolocalizacion\app_keys.dart` y `lib\40_security\direccionip.dart` inexistentes. Las claves Google Maps (si las hay) no se encuentran en este módulo.
