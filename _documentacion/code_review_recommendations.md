# Revisión de Código y Recomendaciones — MotorSocial

**Fecha:** 2026-08-14
**Versión proyecto:** Inspección completa de `lib/` (141 archivos `.dart`, sin generados; post-eliminación de `lib/motorsocial/`)
**Ámbito:** Arquitectura, dependencias, cumplimiento AGENTS.md, patrones de código, deuda técnica
**Nota:** Directorio `lib/motorsocial/` eliminado (6 módulos duplicados removidos en sesión anterior). Subdirectorio anidado `lib/catalog/catalog/` (13 archivos idénticos al árbol plano) pendiente de consolidar.

---

## 1. Resumen Ejecutivo

| Dimensión | Estado | Comentario |
|---|---|---|
| **Arquitectura general** | ��� Parcial | Separación por módulos (feature-first) clara, pero AGENTS.md desactualizado (rutas inexistentes). |
| **Riverpod 3.x + Generator** | ��� **No configurado** | Falta `riverpod_generator`, `build_runner` en `dev_dependencies`, `build.yaml`. Providers usan `NotifierProvider` manual en lugar de `@riverpod`. |
| **Freezed + JSON Serializable** | ��� **Ausente** | 0 archivos `*.freezed.dart` / `*.g.dart`. Modelos con `fromJson`/`toJson` manuales (error-prone). |
| **Dio + JWT Interceptor** | ��� **Ausente** | Solo `package:http`. No hay `dio`, `dio_interceptor`, ni manejo de JWT automático. |
| **Almacenamiento Seguro** | ��� **Ausente** | Falta `flutter_secure_storage`. No hay persistencia de tokens/JWT. |
| **CouchDB (Flutter directo)** | ��� Correcto (por arquitectura) | Flutter **no** tiene credenciales; repositorios son abstracción (stub in-memory). Backend Express/nano separado. |
| **Material Design 3** | ��� Parcial | `useMaterial3: true` en `ThemeData`, pero usa `ElevatedButton`/`BottomNavigationBar` (no `FilledButton`/`NavigationBar`). No hay `appTheme` ColorScheme global. |
| **Navegación** | ��� Parcial | Router estático (`AppRouter.routeFor`) con placeholders; no `onGenerateRoute`/`AppRoutes.routeGenerate()`. `setPathUrlStrategy` no se ve en `main.dart`. |
| **Código generado / build_runner** | ��� No ejecutado | Sin `build.yaml`, sin `freezed`, sin `json_serializable`, sin `riverpod_generator`. |
| **Tests** | ��� Ausentes | 1 smoke test (`test/widget_test.dart`), 0 tests de integración/unidad. |
| **Duplicación de árboles** | ~~🔴 Crítica~~ → **Resuelto** | `lib/motorsocial/` eliminado. Persiste `lib/catalog/catalog/` (13 archivos idénticos al árbol plano). |

---

## 2. Hallazgos por Categoría

### 2.1 Dependencias y Generación de Código (CRÍTICO)

| Falta | Impacto | Acción |
|---|---|---|
| `riverpod_generator` en `dev_dependencies` | No se puede usar `@riverpod`; providers manuales propensos a error | `flutter pub add --dev riverpod_generator` + `build_runner` |
| `build_runner` + `build.yaml` | Sin generación automática | Crear `build.yaml` con targets `freezed`, `json_serializable`, `riverpod_generator` |
| `freezed` + `freezed_annotation` | Modelos inmutables con `copyWith`, `==`, `hashCode`, `fromJson`/`toJson` | Migrar todos los modelos (`SocialActivity`, `SocialUser`, `SocialObject`, `SocialRelationship`, `SocialGroup`, `SocialMediaAsset`, `SocialPlace`, `Invitation`, `SecurityEvent`, `DeviceInfo`, `RateLimitState`, `ValidationResult`, `DesignToken`, `SocialMenuItem`, `ThemeTokenSet`, `ThemeState`, `AlbumOrderState`, `MediaLibraryState`, `ConversationState`, `FeedState`, `ReactionState`, `GroupState`, `InvitationState`, `SyncState`, `LocationState`, `PlatformInfo`, `ConnectionStatus`, `PostalCodeLookupResult`, `LocalityEntry`, `ActivityQuery`, `SocialObjectQuery`, `SocialObjectPage`, `CatalogContract`, `SocialObject`, `SocialGroup`, `RoleProfile`, `SocialIdentityContract`, `AuthState`, `SessionState`, `LocationContract`, `SocialPlace`, `PostalCodeLookupResult`, `LocalityEntry`, `SocialMediaAsset`, `SocialInvitation`, `SocialRelationship`, `SocialGroup`, `Invitation`, `SocialActivity`, `SocialObject`, `SocialObjectQuery`, `SocialObjectPage`, `CatalogContract`, `RoleProfile`, `SocialUser`, `AuthState`, `SessionState`, `SocialMenuItem`, `NavigationContract`, `DesignToken`, `ThemeState`, `ThemeTokenSet`, `AlbumOrderState`, `MediaLibraryState`, `ConversationState`, `FeedState`, `ReactionState`, `GroupState`, `InvitationState`, `SyncState`, `LocationState`, `PlatformInfo`, `ConnectionStatus`, `PostalCodeLookupResult`, `LocalityEntry`, `SocialPlace`, `SocialInvitation`, `SocialRelationship`, `SocialGroup`, `Invitation`, `SecurityEvent`, `DeviceInfo`, `RateLimitState`, `ValidationResult`, `SocialMediaAsset`, `SocialMenuItem`, `NavigationContract`, `DesignToken`, `ThemeState`, `ThemeTokenSet`, `AlbumOrderState`, `MediaLibraryState`, `ConversationState`, `FeedState`, `ReactionState`, `GroupState`, `InvitationState`, `SyncState`, `LocationState`, `PlatformInfo`, `ConnectionStatus`, `PostalCodeLookupResult`, `LocalityEntry`, `SocialPlace`, `SocialInvitation`, `SocialRelationship`, `SocialGroup`, `Invitation`, `SecurityEvent`, `DeviceInfo`, `RateLimitState`, `ValidationResult`) |
| `json_serializable` + `json_annotation` | Serialización automática consistente | Mismo set de modelos |
| `dio` + `dio_smart_retry` / interceptor JWT | HTTP client robusto con reintentos, logging, auth automático | Reemplazar `package:http` usos dispersos |
| `flutter_secure_storage` | Guardar JWT/refresh tokens en iOS/Android (Keychain/Keystore) | `shared_preferences` solo para Web/Windows |

### 2.2 Duplicación de Árboles (RESUELTO / RESIDUAL)

| Duplicado | Archivos | Divergencias detectadas | Estado |
|---|---|---|---|
| ~~`lib/motorsocial/activity/activity/`~~ | ~~11~~ | ~~`SocialActivity`, `ActivityContract`~~ | **Eliminado** |
| ~~`lib/motorsocial/catalog/catalog/`~~ | ~~13~~ | ~~`widgets/social_widgets.dart`~~ | **Eliminado** |
| ~~`lib/motorsocial/identity/identity/`~~ | ~~18~~ | ~~`social_identity_contract.dart`, `login_page.dart`~~ | **Eliminado** |
| ~~`lib/motorsocial/media/media/`~~ | ~~14~~ | — | **Eliminado** |
| ~~`lib/motorsocial/navigation/navigation/`~~ | ~~7~~ | — | **Eliminado** |
| ~~`lib/motorsocial/social_graph/social_graph/`~~ | ~~17~~ | — | **Eliminado** |
| `lib/catalog/catalog/` | **13** | **Byte-idénticos** al árbol plano `lib/catalog/` | **Pendiente** — consolidar en `lib/catalog/` y eliminar este subdirectorio |

**Resolución P1 punto 5:** `lib/motorsocial/` eliminado en sesión anterior (2026-08-13/14). La duplicación masiva (~80 archivos, 38% del código) ya no existe.

**Residual pendiente:** `lib/catalog/catalog/` contiene 13 archivos idénticos a `lib/catalog/`. Recomendación eliminar este subdirectorio anidado y consolidar cualquier import que lo referencie.

### 2.3 Cumplimiento AGENTS.md (Parcial)

| Regla AGENTS.md | Estado | Evidencia |
|---|---|---|
| `--wasm` para web | �� Documentado en build commands | |
| `defines.json` para secretos | ��� **Archivo no existe** | Referenciado en AGENTS.md pero no en repo; credenciales no configurables |
| `String.fromEnvironment()` en `app_keys.dart` / `direccionip.dart` | ��� **Rutas inexistentes** | AGENTS.md cita `lib/14_geolocalizacion/app_keys.dart` y `lib/40_security/direccionip.dart` — no existen |
| `if (!mounted) return;` tras cada `await` | ��� Parcial | `LoginPage._login()` cumple; otros `FutureBuilder` no aplican (correcto). `RouteGuard.canAccess` usa `context.mounted` �� |
| No hardcoded colors → `appTheme` ColorScheme | ��� **No existe** | `ThemeSettingsPage`, `LoginPage`, `CatalogPage`, `FeedPage` usan colores por defecto; no hay `var_color_themes.dart` |
| M3 widgets: `NavigationBar` (no `BottomNavigationBar`), `FilledButton` (no `ElevatedButton`) | ��� **Violado** | `SocialScaffold` usa `BottomNavigationBar`; `LoginPage` usa `ElevatedButton` |
| Icon codepoints `0xe000`–`0xe900` (no `0xee00+`) | ��� No verificado | No se observaron iconos fuera de rango en código inspeccionado |
| Vistas tontas (dumb) — lógica en Riverpod notifiers | ��� Generalmente | `FeedPage`/`CatalogPage`/`ChatPage`/`ProfilePage` usan `FutureBuilder` + providers; `LoginPage` tiene lógica en `_LoginPageState` (debería moverse a notifier) |

### 2.4 Arquitectura y Patrones de Código

| Problema | Módulos afectados | Severidad |
|---|---|---|
| **Providers manuales sin `@riverpod`** | Todos | Media |
| **Modelos sin `fromJson`/`toJson`** | `SocialMediaAsset`, `SocialGroup`, `SocialInvitation`, `ThemeTokenSet`, `DesignToken`, `SocialMenuItem`, `NavigationContract`, `SocialActivity` (parcial), `SocialObject` (parcial), `SocialObjectQuery`, `SocialObjectPage`, `CatalogContract`, `RoleProfile`, `SocialUser` (sin email), `AuthState`, `SessionState`, `LocationContract` (sí tiene), `SocialPlace` (sí), `PostalCodeLookupResult` (sí), `LocalityEntry` (sí), `SocialInvitation` (no), `SocialRelationship` (sí), `SocialGroup` (no), `Invitation` (sí), `SecurityEvent` (parcial 3 versiones), `DeviceInfo` (sí), `RateLimitState` (2 versiones divergentes), `ValidationResult` (no), `SocialMediaAsset` (no), `SocialMenuItem` (no), `NavigationContract` (no), `DesignToken` (no), `ThemeState` (no), `ThemeTokenSet` (no), `AlbumOrderState` (no), `MediaLibraryState` (no), `ConversationState` (no), `FeedState` (no), `ReactionState` (no), `GroupState` (no), `InvitationState` (no), `SyncState` (no), `LocationState` (no), `PlatformInfo` (sí), `ConnectionStatus` (sí), `PostalCodeLookupResult` (sí), `LocalityEntry` (sí), `SocialPlace` (sí), `SocialInvitation` (no), `SocialRelationship` (sí), `SocialGroup` (no), `Invitation` (sí), `SecurityEvent` (parcial), `DeviceInfo` (sí), `RateLimitState` (2 versiones), `ValidationResult` (no) | **Alta** |
| **Doble implementación de repositorio in-memory** | Activity (`InMemoryActivitiesRepository` v1 cascarón ligado al provider vs v2 real no ligado), Media (no provider global), Security (sin provider global), Resilience (`InMemorySyncRepository._queue = const []` inmutable) | **Alta** |
| **Stubs sin cablear a backend** | Todos los módulos de dominio | Media |
| **`package:http` en lugar de Dio + interceptor** | Location (`PostalCodeRepositoryImpl`), Security (`CouchDbRepository`), Core (`CouchDbRepository`) | Media |
| **Barrels incompletos** | Design (`design.dart` solo exporta 2 de 10), Security (`security.dart` no exporta `DeviceInfo`, `ValidationResult`, `RateLimitState`), Navigation (`navigation.dart` OK), Media (`media.dart` OK con `hide`), Activity (`activity.dart` OK), Catalog (`catalog.dart` OK), Social Graph (`social_graph.dart` faltan modelos/widgets/pages) | Baja-Media |
| **Modelos duplicados** | `Invitation` vs `SocialInvitation` (Social Graph), `SecurityEvent` x3, `RateLimitState` x2, `SocialObjectPage` x2 (Catalog) | Media |
| **Cascarones (Pendiente)** | `ActivityEngine.initialize()`, `MediaEngine.initialize()`, `DesignEngine.initialize()`, `LocationEngine.initializeProviders()`, `ResilienceEngine.initializeProviders()`, `SocialGraphEngine.initializeProviders()`, `CatalogEngine.initializeProviders()`, `SecurityEngine`, `AuthNotifier`, `SessionNotifier`, `ConversationNotifier`, `ReactionNotifier`, `FeedNotifier`, `GroupNotifier`, `InvitationNotifier`, `SyncNotifier`, `ConnectionNotifier`, `PlatformNotifier`, `AlbumOrderNotifier`, `MediaLibraryNotifier`, `CatalogNotifier`, `ObjectDetailNotifier`, `TabMenuNotifier`, `ThemeNotifier`, `LocationNotifier` | Media |

### 2.5 Navegación y Routing

| Problema | Detalle |
|---|---|
| `AppRouter.routeFor` estático (switch) | No usa `onGenerateRoute` ni `AppRoutes.routeGenerate()` citado en AGENTS.md |
| `setPathUrlStrategy()` no visible en `main.dart` | AGENTS.md dice "activo en `main.dart`" |
| Rutas conocidas renderizan `_PlaceholderPage` | No conectan a páginas reales de módulos (`FeedPage`, `CatalogPage`, `ChatPage`, `ProfilePage`, `HomePage`) |
| `RouteGuard._isLoggedIn()` es stub `→ true` | No lee `sessionProvider` real (Identity/Core) |

### 2.6 Tests y Calidad

| Métrica | Valor | Objetivo |
|---|---|---|
| Tests unitarios | 0 | >80% cobertura lógica de notifiers/repositorios |
| Tests widget | 1 (smoke) | Tests por página/feature crítica |
| Tests integración | 0 | Pipeline CI con `flutter test` + `flutter drive`/`integration_test` |
| Análisis estático (`flutter analyze`) | No verificado | Debería ser 0 warnings/errors en CI |

---

## 3. Plan de Acción Priorizado

### P0 — Bloqueadores (hacer ya)
1. **Añadir dependencias de generación:**
   ```yaml
   dev_dependencies:
     build_runner: ^2.4.0
     riverpod_generator: ^2.4.0
     freezed: ^2.5.0
     freezed_annotation: ^2.4.0
     json_serializable: ^6.7.0
     json_annotation: ^4.8.0
   dependencies:
     dio: ^5.4.0
     flutter_secure_storage: ^9.0.0
   ```
2. **Crear `build.yaml`** con targets para `freezed`, `json_serializable`, `riverpod_generator`.
3. **Crear `defines.json`** (en `.gitignore`) con `COUCHDB_PASSWORD`, `GOOGLE_MAPS_API_KEY`; actualizar `main.dart` / build commands.
4. **Ejecutar `dart run build_runner build --delete-conflicting-outputs`** y corregir errores.

### P1 — Consolidación y Arquitectura (Semana 1-2)
5. **Eliminar `lib/motorsocial/`** tras confirmar que ningún import externo lo usa (solo `lib/features/*` importa `lib/<m>/`). Migrar cualquier referencia residual.
6. **Consolidar modelos duplicados**: `Invitation`/`SocialInvitation` → uno; `SecurityEvent` x3 → uno con `fromJson`/`toJson`; `RateLimitState` x2 → uno; `SocialObjectPage` x2 → uno.
7. **Migrar todos los modelos a Freezed** (`@freezed`, `part '*.freezed.dart'`, `part '*.g.dart'`) + `@JsonSerializable`.
8. **Reemplazar `package:http` por `Dio`** con `InterceptorsWrapper` que inyecte JWT desde `flutter_secure_storage` (iOS/Android) / `shared_preferences` (Web/Windows).

### P2 — Cumplimiento AGENTS.md y M3 (Semana 2-3)
9. **Crear `lib/core/theme/app_theme.dart`** con `appTheme` ColorScheme global (light/dark) referenciado en AGENTS.md.
10. **Reemplazar `ElevatedButton` → `FilledButton`**, `BottomNavigationBar` → `NavigationBar` en `SocialScaffold`.
11. **Implementar `AppRoutes.routeGenerate()`** como `onGenerateRoute` en `MaterialApp`; añadir `setPathUrlStrategy()` en `main.dart`.
12. **Conectar `RouteGuard._isLoggedIn()`** a `sessionProvider` / `AuthRepository` real.
13. **Cablear repositorios in-memory reales a providers** (`activityRepositoryProvider` → v2 real; `mediaRepositoryProvider` nuevo; `securityRepositoryProvider` nuevo; `syncRepositoryProvider` con cola mutable).

### P3 — Tests y Observabilidad (Semana 3-4)
14. **Tests unitarios** para cada `Notifier`/`StateNotifier` (estado, `copyWith`, transiciones).
15. **Tests de repositorios** (mock `Dio`/`ConnectivityRepository`/`PlatformRepository`).
16. **Tests de widget** para páginas críticas (`LoginPage`, `FeedPage`, `CatalogPage`, `SocialScaffold`).
17. **Configurar CI** (`flutter analyze`, `flutter test`, `build_runner` check).

### P4 — Deuda Técnica y Documentación (Continuo)
18. **Actualizar AGENTS.md** con rutas reales, eliminar referencias inexistentes (`lib/14_geolocalizacion/`, `lib/40_security/`, `lib/core_backend_services/`).
19. **Crear `_documentacion/antigravity_ui_rules.md`** (referenciado en AGENTS.md pero inexistente) con guía M3, ColorScheme, iconos, tipografía.
20. **Revisar `_documentacion/` generada** en esta sesión y sincronizar con código real tras refactors.

---

## 4. Estimación de Esfuerzo

| Fase | Días-hombre | Riesgo |
|---|---|---|
| P0 (Generación + deps) | 2-3 | Bajo (mecánico) |
| P1 (Consolidación + Freezed + Dio) | 8-12 | Medio (muchos archivos, migración modelo a modelo) |
| P2 (M3 + Routing + Cableado) | 5-8 | Medio (routing, auth, providers) |
| P3 (Tests + CI) | 5-7 | Bajo (estándar) |
| P4 (Docs + AGENTS.md) | 2-3 | Bajo |

**Total estimado:** 22-33 días-hombre (~4-6 semanas 1 dev full-time).

---

## 5. Conclusión

El código base de MotorSocial tiene una **estructura modular sólida** (feature-first, Riverpod, separación repositorio/UI) pero sufre **deuda técnica crítica** en:
1. **Ausencia total de generación de código** (Freezed, JSON, Riverpod Generator) → modelos frágiles, boilerplate manual.
2. **Duplicación masiva de 6 módulos** (`lib/motorsocial/`) → mantenimiento doble, riesgo de desincronía.
3. **Incumplimiento de AGENTS.md** en M3 (widgets, colores), routing, secretos (`defines.json` inexistente), y referencias a rutas fantasmas.
4. **HTTP client inconsistente** (`http` vs `Dio` sin interceptor JWT) y sin almacenamiento seguro.

**Recomendación inmediata:** Ejecutar P0 y P1 en bloque antes de añuir features nuevos. La consolidación de `lib/motorsocial/` y la migración a Freezed/JSON/Riverpod Generator son prerequisitos para cualquier trabajo sostenible sobre este código.

---

## 6. Apéndice: Archivos Clave a Crear/Modificar (Checklist)

| Archivo | Acción |
|---|---|
| `pubspec.yaml` | Añadir deps P0 |
| `build.yaml` | Crear (targets freezed/json/riverpod) |
| `defines.json` | Crear (secrets, en .gitignore) |
| `lib/main.dart` | `setPathUrlStrategy()`, `onGenerateRoute: AppRoutes.routeGenerate` |
| `lib/core/theme/app_theme.dart` | **NUEVO** — `appTheme` ColorScheme global |
| `lib/core/routes/app_routes.dart` | **NUEVO** — `AppRoutes.routeGenerate()` |
| `lib/activity/data_models/*.dart` | Migrar a `@freezed` + `@JsonSerializable` |
| `lib/catalog/data_models/*.dart` | Migrar a `@freezed` + `@JsonSerializable` |
| `lib/identity/data_models/*.dart` | Migrar a `@freezed` + `@JsonSerializable` |
| `lib/social_graph/data_models/*.dart` | Migrar a `@freezed` + `@JsonSerializable` |
| `lib/media/data_models/*.dart` | Migrar a `@freezed` + `@JsonSerializable` |
| `lib/location/data_models/*.dart` | Migrar a `@freezed` + `@JsonSerializable` |
| `lib/security/data_models/*.dart` | Migrar a `@freezed` + `@JsonSerializable` (consolidar `SecurityEvent` x3, `RateLimitState` x2) |
| `lib/design/data_models/*.dart` | Migrar a `@freezed` + `@JsonSerializable` |
| `lib/navigation/data_models/*.dart` | Migrar a `@freezed` + `@JsonSerializable` |
| `lib/resilience/data_models/*.dart` | Migrar a `@freezed` + `@JsonSerializable` (corregir `InMemorySyncRepository._queue` mutable) |
| `lib/features/auth/pages/login_page.dart` | `ElevatedButton` → `FilledButton`; lógica → notifier |
| `lib/navigation/shell/social_scaffold.dart` | `BottomNavigationBar` → `NavigationBar` |
| `lib/core/providers/app_providers.dart` | Cablear `RouteGuard._isLoggedIn` a sesión real |
| `lib/activity/repositories/activity_repository.dart` | Provider → v2 real (`InMemoryActivitiesRepository` con `seed`) |
| `lib/media/repositories/media_repository.dart` | Añadir `mediaRepositoryProvider` |
| `lib/security/repositories/security_repository.dart` | Añadir `securityRepositoryProvider` + consolidación `SecurityEvent` |
| `lib/resilience/repositories/sync_repository.dart` | `_queue` mutable, `enqueue` funcional |
| `AGENTS.md` | Actualizar rutas, eliminar referencias inexistentes, añadir `defines.json` real |
| `_documentacion/antigravity_ui_rules.md` | **NUEVO** — Guía M3 obligatoria |