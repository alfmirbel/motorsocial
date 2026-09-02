# Plan de implementación y diseño de API — MotorSocial

## 1. Objetivo
Definir el diseño de API y plan de ejecución para cerrar las brechas identificadas en `/mnt/motorsocial/lib`:
- Completar implementaciones de repositorios reales.
- Cerrar shells UI y navegación dinámica.
- Integrar contratos de backend (CouchDB/Qdrant).
- Añadir validaciones de identidad y rate limiting por feature.

Restricción operativa: toda modificación se ejecutará **solo después de aprobación explícita** por archivo (vista previa tipo PR).

---

## 2. Supuestos y lineamientos
- No mezclar dominio Buscobien/inmobiliaria.
- Mantener barrel exports por feature.
- Usar exclusivamente dependencias declaradas en `pubspec.yaml`.
- Priorizar comportamiento ejecutable/verificable.
- Navegación dinámica debe coexistir sin romper pantallas existentes.

---

## 3. Alcance por fases

| Fase | Enfoque | Entregable principal |
|---|---|---|
| 1 | Núcleo común / wiring | `lib/core/` ampliado y `main.dart` concontratos locales | 
| 2 | Shell UI y navegación dinámica | BottomNav, drawer, rutas por contrato |
| 3 | Backends CouchDB/Qdrant | `DatabaseModule` + repositories reales + modo stub |
| 4 | Validaciones y rate limiting | Validadores + providers + hooks por feature |
| 5 | Verificación formal contra SDD | Brechas cerradas y docs actualizados |

---

## 4. Diseño de API por módulo (consolidado)

### 4.1 Configuración y núcleo (`lib/core/config`, `lib/core/database`, `lib/core/providers`)

**SocialAppConfig extendida**
```text
SocialAppConfig
├── appName: String
├── themeId: String
├── identity: SocialIdentityContract
├── navigation: NavigationContract
├── location: LocationContract
├── catalog: CatalogContract
├── media: MediaContract
├── activity: ActivityContract
├── modules: List<String>
├── useStubRepositories: bool
├── couchdb: CouchDbConfig?
└── qdrant: QdrantConfig?
```

**DatabaseModule**
- Selecciona implementaciones por flag `useStubRepositories`.
- Expone factories tipadas por dominio: `activitiesRepository`, `objectsRepository`, `mediaRepository`, `usersRepository`, `groupsRepository`, `relationshipsRepository`, `invitationsRepository`, `securityEventsRepository`, `syncStateRepository`.
- Modo stub retorna colecciones vacías / `null` / `0` sin lanzar.
- Modo online usa `CouchDbRepository` o clientes específicos por dominio.

**CouchDbRepository API**
```text
CouchDbRepository(config: CouchDbConfig)
├── ping(): Future<bool>
├── createDatabase(db): Future<bool>
├── ensureDatabase(db): Future<bool>
├── get(db, id): Future<Map<String,dynamic>>
├── put(db, doc): Future<String> // doc incluye _id opcional
├── delete(db, id, rev): Future<void>
├── queryView(db, design, view, queryParams?): Future<Map<String,dynamic>>
└── query(db, view, {key?, startKey?, endKey?, descending?, limit?}): Future<Map<String,dynamic>>
```
- Cliente HTTP reutilizable con autenticación básica.
- Headers `Content-Type: application/json`.
- Manejo de errores como excepciones tipadas cuando sea posible.

**QdrantRepository API**
```text
QdrantRepository(config: QdrantConfig)
└── upsertPoints(collection, payload): Future<void>
```
- Payload incluye `points`, `vectors`, `payload` opcional por punto.
- Respuesta válida: 200/202. Otros -> excepción.

---

### 4.2 Repositorios por feature

Principio: interfaces abstractas en cada feature; implementaciones “reales” viven en `lib/core/database/repositories/` y son inyectadas por `DatabaseModule`.

**Activity**
```text
ActivitiesRepository
├── recentFeed(query): Future<List<SocialActivity>>
├── getById(id): Future<SocialActivity?>
├── create(activity): Future<SocialActivity>
└── delete(id): Future<void>
```
- Implementaciones:
  - Stub: lista vacía / `null` / éxito vacío.
  - Real: CouchDB `activities` db; vista `by_actor_createdAt` para feed.

**Catalog**
```text
ObjectsRepository
└── search(query): Future<List<SocialObject>>
```
- Stub: lista vacía.
- Real: CouchDB `objects` db; vista `by_owner_createdAt`.

**Identity**
```text
AuthRepository
├── signIn(email, password): Future<AuthState>
├── register(user, password): Future<AuthState>
├── recoverPassword(email): Future<AuthState>
└── refresh(): Future<AuthState>
```
```text
SessionRepository
├── read(): Future<AuthState?>
├── write(session): Future<void>
└── clear(): Future<void>
```
```text
UsersRepository
├── findByEmail(email): Future<SocialUser?>
└── save(user): Future<void>
```
- Implementaciones:
  - Stub: éxito con estado vacío / `null`.
  - Real: CouchDB `users` db + `shared_preferences` para sesión local.

**Media**
```text
MediaRepository
├── byOwner(ownerId): Future<List<SocialMediaAsset>>
├── upload(asset): Future<SocialMediaAsset>
└── delete(id): Future<void>
```
- Stub: `[]` / éxito vacío.
- Real: CouchDB `media` db; design doc `by_asset_type` y `by_owner_createdAt`.

**SocialGraph**
```text
GroupsRepository
└── discoverable({visibility, joinable}): Future<List<SocialGroup>>
```
```text
GroupMembersRepository
├── byGroup(groupId): Future<List<dynamic>>
└── add(member): Future<void>
```
```text
InvitationsRepository
├── pendingFor(receiverId): Future<List<dynamic>>
└── send(invitation): Future<void>
```
```text
RelationshipsRepository
├── byActor(actorId, {status}): Future<List<SocialRelationship>>
└── byOther(otherId, {status}): Future<List<SocialRelationship>>
```
- Stub: listas vacías / éxito vacío.
- Real: CouchDB `groups`, `members`, `invitations`, `relationships`.

**Resilience**
```text
ConnectivityRepository
└── isConnected(): Future<bool>
```
```text
PlatformRepository
└── current(): Future<String>
```
```text
SyncRepository
├── enqueue(payload): Future<void>
├── pendingCount(): Future<int>
└── run(): Future<void>
```
- `ConnectivityRepository` con `connectivity_plus`.
- `SyncRepository` stub por defecto; luego dispatcher hacia CouchDB/Qdrant.

**Security**
```text
SecurityRepository
└── byUser(userId, {since}): Future<List<SecurityEvent>>
```
- Stub: lista vacía.
- Real: CouchDB `security_events` db.

**Location**
```text
GeolocationRepository
└── currentPlace(): Future<SocialPlace?>
```
```text
PostalCodeRepository
└── lookup(postalCode): Future<PostalCodeLookupResult>
```
- `GeolocationRepositoryImpl` ya existe; mantenerlo.
- `PostalCodeRepositoryImpl`: usar endpoint configurado por contrato.

---

### 4.3 Motores y proveedores

**Engine por feature**
- `ActivityEngine`, `CatalogEngine`, `DesignEngine`, `SocialIdentityEngine`, `LocationEngine`, `MediaEngine`, `SocialGraphEngine`, `ResilienceEngine`, `SecurityEngine`.
- Responsabilidad: **orquestar** llamadas a repositorios; no debe contener lógica de UI.
- Inicializar providers cuando corresponda.

**Notifiers/Providers**
- Mantener `copyWith`, `AsyncValue`, estados `isLoading`, `error`.
- Añadir comportamiento mínimo donde falte (paginación, refresh, toggle).
- Continuar con `NotifierProvider<X, Y>` para compatibilidad con `flutter_riverpod` 2.4.9.

---

### 4.4 Navegación dinámica y shell UI

**NavigationContract extendida**
```text
NavigationContract
├── appName: String
├── startRoute: String
├── bottomTabs: List<SocialMenuItem>
├── drawerItems: List<SocialMenuItem>
├── screenBuilders: Map<String, WidgetBuilder>
└── properties: Map<String, dynamic>
```
- Mantener constructor existente; valores por defecto en vacíos.

**SocialScaffold**
- Aceptar params opcionales: `bottomItems`, `drawerItems`, `onBottomTap`.
- Internamente usa `BottomNavigationBar` cuando `bottomItems` no vacío.
- Drawer solo si `drawerItems` definido.

**BottomNav funcional**
- Reemplazar `SizedBox.shrink` por widget real.
- Usar `bottomIndexProvider` + `TabMenuNotifier` para estado sincronizado.
- `MainShell` lee sesión, muestra `LoginPage` cuando falta `userId`.

---

### 4.5 Rate limiting y validaciones (por feature)

**Rate Limiting**
```text
RateLimitConfig
├── feature: String
├── maxRequests: int
├── windowSeconds: int
└── scope: global | userId | session
```
```text
RateLimitState
├── remaining: int
├── retryAfterSeconds: int
├── isLimited: bool
└── lastViolationAt: DateTime?
```
- Proveedor por feature: `rateLimitProvider(feature)` usando `Family<RateLimitState, String>`.
- Excepción propia: `RateLimitException` con `retryAfter`.
- Hook decorador en llamadas expuestas: `withRateLimit(() async => ...)`.

**Validaciones de identidad**
- `validateEmail(email)`: regex local sin dependencias extra.
- `validatePassword(password)`: mín 8, 1 mayúscula, 1 número.
- `validateDisplayName(name)`: no vacío, trim, máx 60.
- Exponer en `identity` providers y mensajes UI tipo `errorCode`.

---

## 5. Checklist de archivos modificables

### 5.1 Núcleo (Fase 1)
- `lib/core/database/database_module.dart`
- `lib/core/database/couchdb_repository.dart`
- `lib/core/database/qdrant_repository.dart`
- `lib/core/config/social_app_config.dart`
- `lib/core/providers/social_app_config_provider.dart`
- `lib/main.dart`

### 5.2 Shell + navegación (Fase 2)
- `lib/navigation/data_models/navigation_contract.dart`
- `lib/navigation/shell/social_scaffold.dart`
- `lib/navigation/providers/tab_menu_notifier.dart`
- `lib/core/app_shell.dart`

### 5.3 Features (Fase 3-4)
- `lib/identity/...` (repos + validadores)
- `lib/catalog/...` (repos)
- `lib/activity/...` (repos)
- `lib/media/...` (repos)
- `lib/social_graph/...` (repos)
- `lib/resilience/...` (repos, connectivity real)
- `lib/security/...` (rate limit providers)

---

## 6. Estrategia de verificación

| Chequeo | Comando | Criterio |
|---|---|---|
| Compilación | `flutter analyze` | 0 errores |
| Tests unitarios | `flutter test` | Verde (si existen tests) |
| Ejecutable | `flutter run -d chrome` | Pantalla_login -> Home -> tabs |
| Backend stub | Config con `useStubRepositories: true` | No excepciones HTTP |
| Backend online | Config con `couchdb/qdrant` válidos | Ping ok y CRUD mínimo |
| Validaciones | Valores inválidos | Rechazo con mensajes |
| Rate limit | Llamadas repetidas | Estado cambia a `isLimited=true` |

---

## 7. Siguientes pasos (orden estricto)
1. Revisar y aprobar este documento.
2. Confirmar arquitectura por módulo preferida.
3. Una vez aprobado, presentaré **una vista previa por archivo** de Fase 1; aplico cambios solo si autorizas.
4. Iterar Fase 1 completa y repetir vista previa para Fase 2, y así sucesivamente.

---

## 8. Notas
- Todos los archivos están bajo `/mnt/motorsocial/`.
- No se tocará `/mnt/pruebamotorsocial/`.
- Documentación de planeación se depositará en `/mnt/motorsocial/_planes/`.
