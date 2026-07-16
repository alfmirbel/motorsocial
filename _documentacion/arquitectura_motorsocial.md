# AD — Arquitectura de MotorSocial

## 1. Objetivo
Definir la arquitectura de referencia presente en `/mnt/motorsocial/lib` como contrato estructural para evolución, pruebas y replicación.

## 2. Principios fundamentales
- Modularidad por dominio: cada feature aísla modelos, motor, repos, providers y páginas.
- Inversión de dependencias: interfaces abstractas en `repositories`, fábricas/motor central en `engine`.
- Reactividad con Riverpod: `NotifierProvider`/`StateProvider` como capa de estado.
- Configurabilidad por contratos JSON: feature flags y parámetros por módulo.
- Ejecutable mínimo: `main.dart` como app listo para integrar en rama limpia.

## 3. Estructura de capas
```
lib
├── main.dart
└── features
    ├── activity
    ├── catalog
    ├── design
    ├── identity
    ├── location
    ├── media
    ├── navigation
    ├── resilience
    ├── security
    └── social_graph
```

Cada módulo expone:
- `data_models`: contratos y entidades del dominio.
- `engine`: lógica de aplicación y orquestación.
- `repositories`: interfaces + implementaciones.
- `providers`: notifiers Riverpod.
- `pages`: UI representativa.
- `widgets`: componentes reutilizables.
- barrel export: `<feature>.dart` agrupa exports públicos.

## 4. Contratos y configuración
- `CatalogContract`, `LocationContract`, `MediaContract`, `ActivityContract`, `SocialIdentityContract`.
- JSON factories para serialización con defaults robustos.
- `SocialAppConfig(unidad de feature)` centraliza activación y defaults.

## 5. Estado global
- Riverpod 3.x con `NotifierProvider` y `StateProvider`.
- Pattern `State + Notifier` por dominio.
- No existe inyección global obligatoria más allá de `main`.

## 6. Persistencia
- Repositorios abstractos listos para backend real.
- Implementaciones placeholder/in-memory para pruebas/shell.
- `ActivityRepository`, `CatalogRepository`, `MediaRepository`, `AuthRepository`, `SessionRepository`, `GeolocationRepository`, `PostalCodeRepository`, `ThemeRepository`, `ConnectivityRepository`, `PlatformRepository`, `SyncRepository`, `SecurityRepository`.

## 7. Navegación y shell
- `SocialScaffold` envuelve cuerpos.
- `TabMenuState` + `SocialMenuItem` para menús configurables.
- `AppRouter` placeholder preparado para ruteo declarativo.

## 8. Theme
- `DesignToken`, `ThemeTokenSet`, `SocialThemeData`.
- `ThemeNotifier` + `ThemeRepository` permite swap temático.

## 9. UI base
- Material3 con `ColorScheme.fromSeed`.
- Páginas mínimas: login, feed placeholder, chat placeholder, catálogo, perfil, tema, localidad, biblioteca media.

## 10. Backends externos previstos
- CouchDB con design docs para dominios.
- Qdrant para vector embeddings en colecciones: usuarios, objetos, actividades.

## 11. Módulos existentes y madurez
| Feature | Madurez actual | Limitaciones visibles |
|---------|-----------------|----------------------|
| Activity | Media | Providers mínimo, paginación sin implementar |
| Catalog | Media | Repo stub, listado en placeholder |
| Design | Media | Tokens sin defaults de marca completos |
| Identity | Media | Solo login simulado, LocalSession stub |
| Location | Media | Solo contrato + stub geolocalización/CP |
| Media | Media | UI básica, subida sin backend |
| Navigation | Media | Router/Scaffold placeholder |
| Resilience | Media | Providers básicos sin lógica |
| Security | Media | Stubs de rate limit |
| SocialGraph | Media | Contratos y tiles mínimos |

## 12. Patrones recomendados
- Skeleton-first: features vacíos pero con forma ejecutable.
- Extension mechanism: bridges en pruebas integran con `_InMemory*Repositories`.
- Reusabilidad: identidad, navegación y tema pensados para ser reemplazados por implementaciones productivas sin cambiar firmas.

## 13. Dependencias notables
- Flutter SDK.
- `flutter_riverpod` / `flutter/material`.
- `connectivity_plus` para `resilience`.
- `location` para geolocalización.

## 14. Próximos pasos sugeridos
- Completar implementaciones de repositorios reales.
- Cerrar shells UI y navegación dinámica.
- Integrar contratos de backend (CouchDB/Qdrant) acorde a `_documentacion/MotorSocial_SDD.md`.
- Añadir validaciones de identidad y rate limiting por feature.
