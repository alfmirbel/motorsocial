# Plan de Implementación — MotorSocial

**Fecha:** 2026-08-17 (actualización de avance)
**Base:** `_documentacion/code_review_recommendations.md` (v. 2026-08-14)  
**Estado actual:** — P0 ✅ | P1-A ✅ | P1-B ✅ | P1-C 🔄 en curso —

---

## 1. Estado Actual (2026-08-17)

| Dimensión | Estado | Evidencia |
|---|---|---|
| Archivos `.dart` | 138 | `find lib -name "*.dart" \| wc -l` |
| Archivos generados (`.freezed.dart` / `.g.dart`) | 41 | Pipeline Freezed + json_serializable operativo |
| Duplicación `lib/motorsocial/` | Eliminada | Confirmado |
| Duplicación residual | `lib/catalog/catalog/` eliminado | Consolidado en árbol plano |
| Riverpod | v3.x (`flutter_riverpod: ^3.0.0`, `riverpod_generator: ^3.0.0`) | `@freezed` + `build_runner` operativo |
| Freezed / JSON | ✅ Operativo | 10 módulos migrados, `flutter analyze` verde |
| Dio / JWT | 🔄 Core operativo, repos pendientes | `dio_client.dart` + `dio_provider.dart` + `JwtInterceptor` implementados |
| Almacenamiento seguro | ✅ Operativo | `FlutterSecureStorage` (móvil) + `SharedPreferences` (web/Windows) |
| M3 widgets | Parcial | `useMaterial3: true`; `appTheme` creado; faltan `FilledButton`, `NavigationBar` |
| Routing | Parcial | `AppRouter` estático; falta `onGenerateRoute` y `setPathUrlStrategy()` |
| Tests | 1 smoke + legacy con errores | `test/unit/repositories/activity_repository_test.dart` requiere actualización |

---

## 2. Estrategia General

1. **No romper el build en ninguna fase.** Cada paso debe dejar el proyecto compilable (`flutter analyze` verde).
2. **Incremento seguro:** P0 → P1 → P2 → P3 → P4. No saltar fases.
3. **Feature flags donde corresponda:** La migración a Dio/Freezed se hace archivo por archivo, no volcar 128 modelos de una vez.
4. **Respetar AGENTS.md:** Todo cambio UI usa `appTheme` (una vez creado), M3 widgets, y `--wasm` en web.

---

## 3. Fases de Implementación

### Fase P0 — Fundación (Días 1-3, 2-3 d-h)

**Objetivo:** Dejar el proyecto con las herramientas de generación funcionando y secrets accesibles.

| # | Tarea | Archivo(s) | Criterio de aceptación |
|---|---|---|---|
| 1 | Añadir dependencias de generación | `pubspec.yaml` | `flutter pub get` añade sin error: `build_runner`, `riverpod_generator`, `freezed`, `freezed_annotation`, `json_serializable`, `json_annotation`, `dio`, `dio_smart_retry`, `flutter_secure_storage` |
| 2 | Crear `build.yaml` | `build.yaml` (raíz) | Contiene targets para `freezed`, `json_serializable`, `riverpod_generator` |
| 3 | Crear `defines.json` | `defines.json` (raíz, `.gitignore`) | Contiene placeholders `COUCHDB_PASSWORD`, `GOOGLE_MAPS_API_KEY` |
| 4 | Ejecutar generación de código (dry-run) | Consola | `dart run build_runner build --delete-conflicting-outputs` finaliza sin error (aunque no haya outputs aún) |
| 5 | Verificar compilación | Todo proyecto | `flutter analyze` retorna 0 errores |

**Riesgo:** Conflictos de versiones entre `flutter_riverpod` 2.4.9 y `riverpod_generator` 2.x (requiere Riverpod 3.x para `@riverpod` óptimo).  
**Mitigación:** Actualizar `flutter_riverpod` a `^3.x` en paralelo al paso 1.

---

### Fase P1-A — Consolidación Residual (Día 4, 0.5 d-h)

**Objetivo:** Eliminar el último duplicado `lib/catalog/catalog/`.

| # | Tarea | Archivo(s) | Criterio de aceptación |
|---|---|---|---|
| 6 | Auditar imports a `catalog/catalog/` | `grep -r "catalog/catalog" lib/` | Lista de archivos que lo usan |
| 7 | Migrar imports al árbol plano | `lib/catalog/data_models/*`, `lib/catalog/pages/*`, etc. | Todos los imports apuntan a `package:motorsocial/catalog/...` |
| 8 | Eliminar directorio anidado | `lib/catalog/catalog/` | Directorio eliminado; build verde |

**Riesgo:** Algún `features/*` importa desde `catalog/catalog/` por error.  
**Mitigación:** El grep previo detecta todos los usos.

---

### Fase P0 — Fundación ✅ COMPLETADA (Días 1-3)

**Objetivo:** Dejar el proyecto con las herramientas de generación funcionando y secrets accesibles.

| # | Tarea | Archivo(s) | Estado |
|---|---|---|---|
| 1 | Añadir dependencias de generación | `pubspec.yaml` | ✅ `flutter_riverpod: ^3.0.0`, `riverpod_generator: ^3.0.0`, `freezed: ^3.0.0`, `json_serializable`, `dio`, `flutter_secure_storage`, `build_runner` |
| 2 | Crear `build.yaml` | `build.yaml` (raíz) | ✅ Targets para freezed, json_serializable, riverpod_generator |
| 3 | Crear `defines.json` | `defines.json` (raíz, `.gitignore`) | ✅ Placeholders COUCHDB_PASSWORD, GOOGLE_MAPS_API_KEY |
| 4 | Ejecutar generación de código (dry-run) | Consola | ✅ `dart run build_runner build` finaliza sin error |
| 5 | Verificar compilación | Todo proyecto | ✅ `flutter analyze` retorna 0 errores |

**Riesgo cumplido:** `flutter_riverpod` actualizado a ^3.0.0; sin conflictos de versión.

---

### Fase P1-A — Consolidación Residual ✅ COMPLETADA (Día 4)

**Objetivo:** Eliminar el último duplicado `lib/catalog/catalog/`.

| # | Tarea | Archivo(s) | Estado |
|---|---|---|---|
| 6 | Auditar imports a `catalog/catalog/` | `grep -r "catalog/catalog" lib/` | ✅ Ningún import activo encontrado |
| 7 | Migrar imports al árbol plano | `lib/catalog/data_models/*`, `lib/catalog/pages/*`, etc. | ✅ Todos los imports apuntan a `package:motorsocial/catalog/...` |
| 8 | Eliminar directorio anidado | `lib/catalog/catalog/` | ✅ Eliminado; build verde |
| — | Fusionar duplicado `SocialObjectPage` | `social_object.dart` + `social_object_page.dart` | ✅ Consolidado en `social_object.dart`; archivo duplicado eliminado |

---

### Fase P1-B — Migración a Freezed + JSON ✅ COMPLETADA (Días 5-15)

**Objetivo:** Convertir modelos de datos a `@freezed` + `@JsonSerializable`, generando `.freezed.dart` y `.g.dart`.

**Resultado:** 10 módulos migrados, 41 archivos generados, `flutter analyze` verde (0 errores).

| # | Módulo | Modelos migrados | Notas |
|---|---|---|---|
| 1 | `identity/` | `AuthState`, `SessionData`, `SocialUser`, `RoleProfile` | getter `isExpired` movido a extensión `SessionDataExtension` |
| 2 | `security/` | `DeviceInfo`, `RateLimitState`, `SecurityEvent`, `ValidationResult` | 3 duplicados de `SecurityEvent` consolidados; `type` → `eventType` en JSON |
| 3 | `catalog/` | `SocialObject`, `SocialObjectPage`, `CatalogContract`, `SocialObjectQuery` | duplicado `SocialObjectPage` resuelto; barrel `catalog.dart` limpio |
| 4 | `activity/` | `SocialActivity`, `ActivityQuery`, `ActivityContract` | separados en 3 archivos (antes 1); barrel + imports actualizados |
| 5 | `social_graph/` | `Invitation`, `SocialInvitation`, `SocialGroup`, `SocialRelationship` | `recipientId` unificado; `type` → relación en `SocialRelationship` |
| 6 | `media/` | `SocialMediaAsset`, `MediaContract` | |
| 7 | `design/` | `DesignToken`, `ThemeState` | |
| 8 | `navigation/` | `SocialMenuItem`, `NavigationContract` | |
| 9 | `resilience/` | `ConnectionStatus`, `PlatformInfo`, `SyncState` | |
| 10 | `location/` | `LocationContract`, `SocialPlace`, `PostalCodeLookupResult`, `LocalityEntry` | |

**Contratos vacíos** (`ActivityContract`, `MediaContract`, `NavigationContract`): solo `.freezed.dart` generado; `part '.g.dart'` eliminado pues `json_serializable` no emite código para clases sin campos.

**Regla de oro cumplida:** Cada módulo validado con `flutter analyze` verde antes de pasar al siguiente.

---

### Fase P1-C — Reemplazo http → Dio + Interceptor JWT 🔄 EN CURSO (Días 11-14, 4-6 d-h)

**Objetivo:** Centralizar HTTP en Dio con interceptor JWT automático.

| # | Tarea | Archivo(s) | Estado |
|---|---|---|---|
| 9 | Crear `lib/core/database/dio_client.dart` | Nuevo archivo | ✅ `Dio` + `JwtInterceptor` + `RetryInterceptor` + `LogInterceptor` implementados |
| 10 | Crear `lib/core/providers/dio_provider.dart` | Nuevo archivo | ✅ `dioProvider` FutureProvider expone instancia configurada |
| 11 | Implementar `TokenStorage` | `dio_client.dart` | ✅ `SecureTokenStorage` (móvil) + `PreferencesTokenStorage` (web/Windows) |
| 12 | Verificar ausencia de `package:http` | `lib/**/*.dart` | ✅ Solo queda en comentario en `couchdb_repository.dart` |
| — | Cablear `CouchDbRepository` a `dioProvider` | `core/database/couchdb_repository.dart` | 🔄 Acepta Dio por constructor; `database_module.dart` pendiente de inyectar `dioProvider` |
| — | Cablear `PostalCodeRepositoryImpl` a `dioProvider` | `location/repositories/postal_code_repository.dart` | 🔄 Acepta Dio por constructor; proveedor Riverpod pendiente |
| — | Tests legacy rotos | `test/unit/repositories/activity_repository_test.dart` | ⚠️ Requiere actualización de imports (clases migradas a Freezed) |

**Nota:** Tareas 9-12 completadas. Tareas de cableado a repositorios marcadas como adicionales detectadas en ejecución.

**Resumen ejecución P1-C hasta la fecha:**
- `lib/core/database/dio_client.dart` — Interceptor JWT, retry inteligente, logging en debug
- `lib/core/providers/dio_provider.dart` — `dioProvider` expone `Dio` compartido
- `lib/core/database/couchdb_repository.dart` — ya usa Dio (no `package:http`)
- `lib/location/repositories/postal_code_repository.dart` — ya usa Dio

---

### Fase P2 — Cumplimiento AGENTS.md y M3 ✅ COMPLETADA (Días 15-20)

**Objetivo:** Material Design 3, routing correcto, colores globales.

| # | Tarea | Archivo(s) | Estado |
|---|---|---|---|
| 13 | Crear `lib/core/theme/app_theme.dart` | `core/theme/app_theme.dart` | ✅ `ColorScheme` light/dark + `ThemeData` (`appTheme`, `appDarkTheme`); ya existía y estaba completo |
| 14 | Reemplazar widgets M2 → M3 | `navigation/shell/social_scaffold.dart`, `identity/pages/password_recovery_page.dart` | ✅ `NavigationBar` ya estaba; corregido `ElevatedButton` → `FilledButton` en `password_recovery_page.dart` |
| 15 | Implementar `AppRoutes.routeGenerate()` | `lib/navigation/routing/app_router.dart` | ✅ `routeGenerate(RouteSettings)` implementado como `onGenerateRoute` en `MaterialApp` |
| 16 | Activar `setPathUrlStrategy()` | `lib/main.dart` | ✅ `usePathUrlStrategy()` activo para URLs limpias en Web |
| 17 | Conectar `RouteGuard._isLoggedIn()` | `lib/navigation/routing/route_guard.dart` | ✅ Lee `sessionProvider` real (no stub); retorna `true` solo si hay token no vacío |
| 18 | Cablear `InMemoryActivitiesRepository` v2 | `activity/repositories/activity_repository.dart` | ✅ `activityRepositoryProvider` expone `InMemoryActivitiesRepository` con `_defaultSeed` determinista |
| 19 | Cablear `SyncNotifier` + cola mutable | `resilience/repositories/sync_repository.dart` | ✅ `_queue` es `List<Map<String, dynamic>>` mutable; `enqueue()` agrega; `run()` vacía cola |

**Nota:** Todas las tareas P2 estaban parcialmente implementadas en el código; se validaron y corrigieron los puntos faltantes.

---

### Fase P3 — Tests y Calidad (Días 21-25, 5-7 d-h)

**Objetivo:** Cobertura mínima y pipeline de calidad.

| # | Tarea | Archivo(s) | Criterio de aceptación |
|---|---|---|---|
| 20 | Tests unitarios notifiers críticos | `test/unit/*` | Cobertura >60% en `AuthNotifier`, `SessionNotifier`, `ActivitiesNotifier`, `FeedNotifier` |
| 21 | Tests de repositorios | `test/unit/repositories/*` | Mock de `Dio`; verifica `fromJson`/`toJson` generados |
| 22 | Tests widget páginas críticas | `test/widget/*` | `LoginPage`, `FeedPage`, `CatalogPage`, `SocialScaffold` renderizan sin error |
| 23 | Configurar CI | `.github/workflows/ci.yml` (nuevo) | Ejecuta `flutter analyze` + `flutter test` en push |

---

### Fase P4 — Deuda Técnica y Documentación (Días 26-28, 2-3 d-h)

**Objetivo:** Cerrar brechas de documentación y mantener consistencia.

| # | Tarea | Archivo(s) | Criterio de aceptación |
|---|---|---|---|
| 24 | Actualizar `AGENTS.md` | `AGENTS.md` | Rutas inexistentes eliminadas; referencias a `defines.json` y rutas reales de temas/routing actualizadas |
| 25 | Crear `_documentacion/antigravity_ui_rules.md` | `_documentacion/antigravity_ui_rules.md` | Guía M3: `ColorScheme`, `FilledButton`, `NavigationBar`, iconos rango, tipografía |
| 26 | Sincronizar documentación generada | `_documentacion/_analisisydiseno/**` | Revisar que tablas de inventario, epicas y BD reflejen el código post-migración |

---

## 4. Orden de Ejecución Recomendado

```
P0 ✅ COMPLETADA
    ↓
P1-A ✅ COMPLETADA (eliminar catalog/catalog/, resolver SocialObjectPage)
    ↓
P1-B ✅ COMPLETADA (migración Freezed+JSON: 10 módulos, 41 archivos generados)
    ↓
P1-C 🔄 EN CURSO (Dio core operativo; cablear repositorios pendiente)
    ↓
P2 (M3 + Routing: primero theme, luego widgets, luego routing)
    ↓
P3 (tests unitarios primero, luego widget, luego CI)
    ↓
P4 (docs)
```

**Regla mantenida:** No ejecutar en paralelo P1-B y P1-C en el mismo módulo.

---

## 5. Checklist por Archivo (Resumen Ejecutivo)

### Dependencias y configuración
- [ ] `pubspec.yaml`: actualizar `flutter_riverpod` a 3.x, añadir `dio`, `flutter_secure_storage`, `build_runner`, `riverpod_generator`, `freezed`, `json_serializable`
- [ ] `build.yaml`: crear en raíz
- [ ] `defines.json`: crear en raíz (`.gitignore`)

### Core (nuevos)
- [ ] `lib/core/theme/app_theme.dart` — `appTheme` ColorScheme
- [ ] `lib/core/database/dio_client.dart` — cliente Dio + interceptores
- [ ] `lib/core/providers/dio_provider.dart`
- [ ] `lib/core/providers/secure_storage_provider.dart` — fallback platform-aware

### Routing
- [ ] `lib/core_backend_services/07_routes/app_routes.dart` — `routeGenerate()`
- [ ] `lib/main.dart` — `onGenerateRoute`, `setPathUrlStrategy()`

### Models (Freezed+JSON)
- [ ] `lib/identity/data_models/auth_state.dart`
- [ ] `lib/identity/data_models/session_data.dart`
- [ ] `lib/identity/data_models/social_user.dart`
- [ ] `lib/identity/data_models/role_profile.dart`
- [ ] `lib/security/data_models/device_info.dart`
- [ ] `lib/security/data_models/security_event.dart`
- [ ] `lib/security/data_models/rate_limit_state.dart`
- [ ] `lib/security/data_models/validation_result.dart`
- [ ] `lib/catalog/data_models/social_object.dart`
- [ ] `lib/catalog/data_models/catalog_contract.dart`
- [ ] `lib/activity/data_models/social_activity.dart`
- [ ] `lib/social_graph/data_models/invitation.dart`
- [ ] `lib/social_graph/data_models/social_invitation.dart`
- [ ] `lib/media/data_models/social_media_asset.dart`
- [ ] `lib/design/data_models/design_token.dart`
- [ ] `lib/design/data_models/theme_token_set.dart`
- [ ] `lib/navigation/data_models/social_menu_item.dart`
- [ ] `lib/resilience/data_models/sync_state.dart`
- [ ] `lib/location/data_models/social_place.dart`

### Consumidores a actualizar (fromJson/toJson)
- [ ] Repositorios en `identity/repositories/*`
- [ ] Repositorios en `catalog/repositories/*`
- [ ] Repositorios en `activity/repositories/*`
- [ ] Repositorios en `social_graph/repositories/*`
- [ ] Repositorios en `media/repositories/*`
- [ ] Repositorios en `security/repositories/*`
- [ ] Repositorios en `location/engine/*`

### UI (M3)
- [ ] `lib/navigation/shell/social_scaffold.dart` — `NavigationBar`
- [ ] `lib/identity/pages/login_page.dart` — `FilledButton`
- [ ] `lib/identity/pages/register_page.dart` — `FilledButton`
- [ ] `lib/features/account/pages/*` — revisar widgets M2

### Tests
- [ ] `test/unit/providers/auth_notifier_test.dart`
- [ ] `test/unit/repositories/auth_repository_test.dart`
- [ ] `test/unit/repositories/activity_repository_test.dart`
- [ ] `test/widget/login_page_test.dart`
- [ ] `.github/workflows/ci.yml`

### Documentación
- [ ] `AGENTS.md` — actualizar rutas y añadir `defines.json`
- [ ] `_documentacion/antigravity_ui_rules.md` — crear

---

## 6. Criterios de Validación por Fase

| Fase | Comando de validación | Resultado esperado |
|---|---|---|
| P0 | `flutter pub get` + `dart run build_runner build` | Sin errores |
| P0 | `flutter analyze` | 0 errores, 0 warnings |
| P1-A | Buscar `catalog/catalog/` en imports | 0 resultados |
| P1-B | Buscar `part '*.freezed.dart'` | >0 en modelos migrados |
| P1-C | Buscar `package:http` en `lib/` | 0 resultados |
| P2 | `flutter test --driver test_driver/main.dart` | Navegación M3 sin errores visuales |
| P3 | `flutter test` | >80% cobertura en notifiers críticos |
| P4 | Revisión manual de `AGENTS.md` y `antigravity_ui_rules.md` | Ambas existen y referencias son ciertas |

---

## 7. Estimación de Esfuerzo (Actualizada)

| Fase | Días-hombre | Riesgo |
|---|---|---|
| P0 (Fundación) | 2-3 | Bajo (mecánico, pero requiere alinear versiones Riverpod 3.x) |
| P1-A (Consolidación residual) | 0.5 | Bajo |
| P1-B (Freezed+JSON) | 6-8 | Medio (muchos archivos, migración progresiva) |
| P1-C (Dio+JWT) | 4-6 | Medio (interceptor JWT, fallback plataformas) |
| P2 (M3+Routing) | 5-7 | Medio (cambios UI dispersos, routing novo) |
| P3 (Tests+CI) | 5-7 | Bajo (estándar) |
| P4 (Docs) | 2-3 | Bajo |

**Total estimado:** 24.5 – 34.5 d-h (~5-7 semanas, 1 dev full-time).

---

## 8. Riesgos y Mitigaciones

| Riesgo | Probabilidad | Impacto | Mitigación |
|---|---|---|---|
| Conflicto entre Riverpod 2.4.9 y `@riverpod` (Generator) | Alta | Alto | Actualizar a Riverpod 3.x en P0; validar con smoke test |
| Modelos con `fromJson` manual rotos tras migración | Media | Alto | Migrar módulo por módulo, mantener compatibilidad temporal con `factory X.fromJson(Map)` que llame al generado |
| Interceptor JWT rompe flujos sin token (invitado) | Media | Medio | Manejar 401 devolviendo `null`/estado vacío, no crash |
| `flutter_secure_storage` no disponible en web/Windows | Alta | Bajo | Crear wrapper `SecureStorage` con implementaciones: `FlutterSecureStorage` (móvil), `SharedPreferences` (web/Windows) |
| Cambios M3 rompen layout existente | Media | Medio | Usar `Theme.of(context)` consistente; probar en device/emulador tras cada commit de UI |
| CI no disponible por falta de repo git configurado | Media | Bajo | Configurar workflows localmente; GitHub Actions requiere repo con permisos |

---

## 9. Entregables

| Fase | Entregable |
|---|---|
| P0 | `pubspec.yaml`, `build.yaml`, `defines.json`, `build_runner` ejecutable |
| P1 | `lib/catalog/catalog/` eliminado; modelos con `.freezed.dart`/`.g.dart`; Dio funcionando |
| P2 | `app_theme.dart`, `NavigationBar`, `FilledButton`, `AppRoutes.routeGenerate()`, `setPathUrlStrategy()` activo |
| P3 | Suite de tests unitarios/widgets; `.github/workflows/ci.yml` |
| P4 | `AGENTS.md` actualizado; `antigravity_ui_rules.md` creado; documentación sincronizada |