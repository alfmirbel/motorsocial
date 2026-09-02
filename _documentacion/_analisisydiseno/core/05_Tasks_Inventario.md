# Inventario Técnico y Tareas - Módulo Core / Infraestructura

> Alcance: `lib/core/app_shell.dart`, `lib/core/config/social_app_config.dart`,
> `lib/core/database/{couchdb_repository,database_module,qdrant_repository}.dart`,
> `lib/core/providers/app_providers.dart`. El subdirectorio `lib/core/repositories/`
> existe pero está **vacío**. El directorio raíz `lib/providers/` **no existe**
> en el árbol actual; su contenido se encuentra en `lib/core/providers/`.

## Tabla A - Inventario de Componentes

| Subdirectorio | Archivo | Tipo de componente | Nombre | Parámetros | Variables que usa | Variables internas | Estilos |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `core` (raíz) | `app_shell.dart` | Widget (UI) | `MainShell` | `key` (super.key) | — | — | `Scaffold`, `Text` |
| `core\config` | `social_app_config.dart` | Clase de configuración (@immutable) | `SocialAppConfig` | `appName`, `themeId`, `identity`, `navigation`, `location`, `catalog`, `media`, `activity`, `modules`, `useStubRepositories`, `couchdb`, `qdrant` | — | — | — |
| `core\config` | `social_app_config.dart` | Clase de configuración (@immutable) | `CouchDbConfig` | `url`, `username`, `password` | — | — | — |
| `core\config` | `social_app_config.dart` | Clase de configuración (@immutable) | `QdrantConfig` | `url`, `apiKey` | — | — | — |
| `core\database` | `couchdb_repository.dart` | Repositorio | `CouchDbRepository` | `config` (CouchDbConfig), `client?` (http.Client) | `config`, `client` | — | — |
| `core\database` | `couchdb_repository.dart` | Config (duplicada) | `CouchDbConfig` | `url`, `username`, `password` | — | — | — |
| `core\database` | `couchdb_repository.dart` | Excepción | `CouchDbException` | `message` | `message` | — | — |
| `core\database` | `database_module.dart` | Riverpod Provider | `databaseModuleProvider` | (ninguno) | — | — | — |
| `core\database` | `qdrant_repository.dart` | Modelo de datos | `QdrantRecord` | `id`, `payload`, `score?` | — | — | — |
| `core\providers` | `app_providers.dart` | Riverpod Notifier | `SessionNotifier` | — | — | — | — |
| `core\providers` | `app_providers.dart` | Riverpod Provider | `sessionProvider` | — | — | — | — |
| `core\repositories` | (vacío) | — | (Pendiente) | — | — | — | — |
| `providers` (raíz) | (no existe en el árbol) | — | (Pendiente / fusionado en `core\providers`) | — | — | — | — |

### Constantes globales (top-level) en `couchdb_repository.dart`
| Nombre | Tipo | Valor |
| :--- | :--- | :--- |
| `httpMethodPost` | `String` | `'POST'` |
| `httpMethodPut` | `String` | `'PUT'` |

## Tabla B - Inventario de Elementos Internos

### `lib\core\app_shell.dart`

| Archivo | Variables definidas | Clases | Variables de clase | Funciones/Widgets | Variables que utiliza | Llamadas a otras clases/widgets |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `app_shell.dart` | (ninguna global) | `MainShell` (extends `StatelessWidget`) | — | `build(BuildContext context)` | `context` | `Scaffold`, `Text` |

### `lib\core\config\social_app_config.dart`

| Archivo | Variables definidas | Clases | Variables de clase | Funciones/Widgets | Variables que utiliza | Llamadas a otras clases/widgets |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `social_app_config.dart` | (ninguna global) | `SocialAppConfig` | `appName`, `themeId`, `identity`, `navigation`, `location`, `catalog`, `media`, `activity`, `modules`, `useStubRepositories`, `couchdb`, `qdrant` | `SocialAppConfig(...)`, `SocialAppConfig.fromJson(json)`, `SocialAppConfig.defaults()`, `toJson()` | `json` (parámetro), `couch`, `qdrant` (locales en `fromJson`) | `CouchDbConfig.fromJson`, `QdrantConfig.fromJson`, `CouchDbConfig.toJson`, `QdrantConfig.toJson` |
| `social_app_config.dart` | — | `CouchDbConfig` | `url`, `username`, `password` | `CouchDbConfig(...)`, `CouchDbConfig.fromJson(json)`, `toJson()` | `json` | — |
| `social_app_config.dart` | — | `QdrantConfig` | `url`, `apiKey` | `QdrantConfig(...)`, `QdrantConfig.fromJson(json)`, `toJson()` | `json` | — |

### `lib\core\database\couchdb_repository.dart`

| Archivo | Variables definidas | Clases | Variables de clase | Funciones/Widgets | Variables que utiliza | Llamadas a otras clases/widgets |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `couchdb_repository.dart` | `httpMethodPost`, `httpMethodPut` (const String) | `CouchDbConfig` | `url`, `username`, `password` | `CouchDbConfig({url, username, password})` | — | — |
| `couchdb_repository.dart` | — | `CouchDbRepository` | `config` (CouchDbConfig), `client` (http.Client) | `CouchDbRepository({config, client?})`, `_uri(db, [docId?])`, `ping()`, `createDatabase(db)`, `ensureDatabase(db)`, `get(db, id)`, `put(db, doc)`, `delete(db, id, rev)`, `queryView(db, design, view, {key, startKey, endKey, descending, limit})`, `_headers()`, `close()` | `config`, `client`, `db`, `docId`, `res`, `existingId`, `method`, `uri`, `params`, `basic` | `http.Client`, `Uri.parse`, `Uri.replace`, `jsonDecode`, `jsonEncode`, `base64Encode`, `CouchDbException` |
| `couchdb_repository.dart` | — | `CouchDbException` (implements `Exception`) | `message` | `CouchDbException(message)`, `toString()` | `message` | — |

### `lib\core\database\database_module.dart`

| Archivo | Variables definidas | Clases | Variables de clase | Funciones/Widgets | Variables que utiliza | Llamadas a otras clases/widgets |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `database_module.dart` | `databaseModuleProvider` (Provider<void>) | (ninguna) | — | lambda `(_) {}` (cascarón) | — | `Provider` (flutter_riverpod) |

### `lib\core\database\qdrant_repository.dart`

| Archivo | Variables definidas | Clases | Variables de clase | Funciones/Widgets | Variables que utiliza | Llamadas a otras clases/widgets |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `qdrant_repository.dart` | (ninguna global) | `QdrantRecord` | `id`, `payload`, `score?` | `QdrantRecord({id, payload, score?})` | `id`, `payload`, `score` | — |

### `lib\core\providers\app_providers.dart`

| Archivo | Variables definidas | Clases | Variables de clase | Funciones/Widgets | Variables que utiliza | Llamadas a otras clases/widgets |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `app_providers.dart` | `sessionProvider` (NotifierProvider) | `SessionNotifier` (extends `Notifier<Map<String, String?>>`) | `state` (heredado) | `build()`, `setSession(value)` | `value` | `Notifier`, `NotifierProvider` (flutter_riverpod) |

## Observaciones de ingeniería inversa
- **`lib\core\repositories\`** existe como directorio pero está totalmente vacío: espacio reservado para futuros repositorios base o genéricos compartidos. Marcado como **Pendiente**.
- La entrada del plan `lib\providers\` (D13, 1 archivo global) **no existe** en el árbol actual: ese archivo fue reubicado a `lib\core\providers\app_providers.dart`. Se mantiene como entrada de índice pero su contenido vive en Core.
- `CouchDbConfig` aparece **dos veces** con la misma estructura (en `social_app_config.dart` y en `couchdb_repository.dart`): deuda técnica a unificar.
- `CouchDbRepository` depende de `package:http` (no de `dio`): queda fuera del interceptor JWT de la app y gestiona su propia Basic Auth.
- `database_module.dart` y `QdrantRepository` (clase) son **cascarones** pendientes de implementación.
- `app_shell.dart` es un shell mínimo provisional (`Scaffold` con un `Text('MotorSocial')`); el shell real vive en `lib/navigation/` (módulo D10) — ver ese módulo.
