# Historias de Usuario (User Stories) - Módulo Core / Infraestructura

> Una User Story por cada `.feature` del archivo `03_Features.feature`.
> Técnica 3 C's: **Card** (tarjeta), **Conversation** (detalles acordados),
> **Confirmation** (criterios de aceptación).

---

## US-CORE-001: Configuración de la aplicación

### 1. Card (Tarjeta)
**Como** desarrollador de MotorSocial
**Quiero** disponer de una configuración central inmutable `SocialAppConfig`
**Para** que cada módulo de dominio se inicialice con parámetros versionados y consistentes.

### 2. Conversation (Conversación)
- `SocialAppConfig` es `@immutable` y se construye por `const` constructor.
- Los mapas por módulo (`identity`, `navigation`, `location`, `catalog`, `media`, `activity`) permiten inyectar configuración específica de cada dominio sin ensuciar la clase madre.
- `useStubRepositories` por defecto a `true`: en fases tempranas se usan repositorios en memoria; al pasar a `false` se usan los reales de CouchDB.
- `CouchDbConfig` define `url` con default `'http://localhost:5984'`; `QdrantConfig` define `url` con default `'http://localhost:6333'`.
- Existe una clase `CouchDbConfig` duplicada en `lib/core/database/couchdb_repository.dart` (misma forma que la de `config/social_app_config.dart`): se debe refactorizar a un único origen en iteraciones futuras.
- Las credenciales reales (`defines.json`) llegan vía `String.fromEnvironment()` en otros módulos; Core solo define el contenedor de configuración, no las obtiene.

### 3. Confirmation (Criterios de Aceptación)
- [ ] `SocialAppConfig.defaults()` retorna una instancia `const` con los valores del cuadro de defaults.
- [ ] `SocialAppConfig.fromJson` no lanza excepción ante un JSON con claves ausentes y aplica defaults.
- [ ] `toJson()` omite `couchdb` y `qdrant` cuando son `null` (usa `if (x != null)`).
- [ ] `CouchDbConfig` y `QdrantConfig` son `@immutable` y exponen `fromJson` / `toJson`.
- [ ] Las instancias se pueden usar como `const` cuando todos sus campos lo son.

---

## US-CORE-002: Repositorio base CouchDB

### 1. Card (Tarjeta)
**Como** capa de datos de MotorSocial
**Quiero** un repositorio genérico `CouchDbRepository` con operaciones CRUD y consultas por vistas
**Para** que los módulos de dominio persistan documentos en bases `motorsocial_*` con autenticación uniforme.

### 2. Conversation (Conversación)
- El repositorio usa `package:http/http.dart` directamente (no `dio`), por lo que es independiente del interceptor JWT de la app. Esto significa que gestiona su propia Basic Auth.
- `_uri(db, docId)` construye rutas: raíz del db cuando `docId` es `null`, o `<base>/<db>/<docId>` cuando se provee.
- `ping()` hace GET a la raíz (`db=""`) — en la práctica esto apunta a `<base>/` (root del servidor CouchDB), no a una base concreta.
- `put` decide método HTTP según presencia de `_id` en el `doc`: POST si no existe (CouchDB genera el `_id`), PUT si existe.
- `createDatabase` considera `412` (precondition failed = ya existe) como éxito.
- `queryView` usa MapReduce (`_design/.../_view/...`) — según AGENTS.md se **prefiere Mango** sobre MapReduce; este método se mantiene para vistas legacy.
- `close()` cierra el `http.Client`.
- Errores se encapsulan en `CouchDbException` con mensaje legible.

### 3. Confirmation (Criterios de Aceptación)
- [ ] `_headers()` produce `Authorization: Basic <base64>` correcto a partir de `config.username:config.password`.
- [ ] `ping()` retorna `true` solo ante status `200`.
- [ ] `ensureDatabase` retorna `true` sin recrear cuando `ping()` es `true`.
- [ ] `get` retorna `null` ante status no `200` (no lanza).
- [ ] `put` devuelve el id resultante (de la respuesta, o el `_id` existente, o `''`).
- [ ] `put`/`queryView`/`delete` lanzan `CouchDbException` con el status ante fallos.
- [ ] La inyección de `http.Client` personalizado funciona (para tests).

---

## US-CORE-003: Registro vectorial Qdrant

### 1. Card (Tarjeta)
**Como** módulo de búsqueda semántica de MotorSocial
**Quiero** un modelo de registro `QdrantRecord` inmutable
**Para** representar resultados de búsqueda con identificador, payload opcional y puntuación de relevancia.

### 2. Conversation (Conversación)
- Archivo `lib/core/database/qdrant_repository.dart` es un **cascarón**: solo define `QdrantRecord`; el repositorio `QdrantRepository` real aún no existe (Pendiente).
- El `score` es opcional (`double?`) para soportar tanto resultados con relevancia como registros sin puntuar.
- `payload` es un `Map<String, dynamic>` para acoplarse a Qdrant (donde cada punto tiene un payload arbitrario).
- La clase `QdrantConfig` vive en `config/social_app_config.dart`; la capa de cliente HTTP Qdrant está pendiente.

### 3. Confirmation (Criterios de Aceptación)
- [ ] `QdrantRecord` es `const`-constructible con `id` y `payload` obligatorios.
- [ ] `score` se puede omitir (defaults a `null`).
- [ ] Las instancias son inmutables (todos los campos `final`).

---

## US-CORE-004: Estado de sesión y módulo de base de datos

### 1. Card (Tarjeta)
**Como** aplicación Flutter
**Quiero** un provider Riverpod de sesión mínimo (`sessionProvider`) y un provider de módulo de base de datos
**Para** mantener en memoria datos de sesión de forma reactiva y preparar el hook de inicialización de persistencia.

### 2. Conversation (Conversación)
- `SessionNotifier` extiende `Notifier<Map<String, String?>>` (Riverpod 3.x, estilo generado/manual).
- `sessionProvider` es un `NotifierProvider` creado con `SessionNotifier.new`.
- El valor de sesión es un `Map<String, String?>` (valores nullable): por ejemplo `{"user": "user:abc", "token": "jwt", "refresh": null}`.
- `databaseModuleProvider = Provider<void>((_) {})` es un **cascarón**: no inicializa nada, solo reserva el símbolo para futura inyección de dependencias de persistencia.
- La lista `modules` en `SocialAppConfig` y el `databaseModuleProvider` están pensados para activar/desactivar módulos y la persistencia real en el arranque — hoy no conectados.

### 3. Confirmation (Criterios de Aceptación)
- [ ] El estado inicial de `sessionProvider` es `<String, String?>{}`.
- [ ] `setSession(value)` reemplaza (no mergea) el estado.
- [ ] Los listeners de Riverpod son notificados al cambiar el estado.
- [ ] `databaseModuleProvider` compila y expone `void` (placeholder).
- [ ] No se introducen efectos secundarios al leer `databaseModuleProvider`.
