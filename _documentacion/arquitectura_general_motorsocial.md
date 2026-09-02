# Arquitectura General — Motor Social
Basado en el código fuente de `/mnt/motorsocial/lib`.

## 1. Propósito
Motor Social es una aplicación Flutter modular orientada a funcionalidades sociales: identidad, catálogo, actividad, grafo social, navegación, diseño, medios, ubicación y seguridad. Existe además un flujo de sincronización hacia `/mnt/pruebamotorsocial` que actúa como versión canónica de `lib/features`.

## 2. Estructura de dominio (motor social)
La aplicación separa concerns en módulos bajo `lib/motorsocial/`:

- `activity`: feed, conversación, reacciones.
- `catalog`: objetos sociales, listado y detalle.
- `design`: tema, tokens, layout adaptativo, tipografía.
- `identity`: autenticación, sesión, usuarios, roles.
- `location`: geolocalización, picker de localidad.
- `media`: biblioteca, selector, slideshow, assets.
- `navigation`: rutas, shell, menú por tabs.
- `resilience`: conectividad, sincronización, estado de plataforma.
- `security`: motor de seguridad, rate limit, eventos.
- `social_graph`: contactos, grupos, invitaciones.

Cada módulo expone, cuando aplica:
- `data_models/`: contratos.
- `engine/`: orquestación del dominio.
- `pages/`: UI por feature.
- `providers/`: estado con Riverpod.
- `repositories/`: acceso a datos.
- `widgets/`: componentes visuales reutilizables.

## 3. Estructura complementaria
Además de `lib/motorsocial/`, existen capas transversales:

- `core/`: configuración (`social_app_config.dart`), base de datos (`couchdb_repository.dart`, `qdrant_repository.dart`, `database_module.dart`) y providers base (`app_providers.dart`).
- `features/`: implementación UI de flujos principales, mantenida sincronizada desde `/mnt/pruebamotorsocial/lib/features`.
- `navigation/`: `app_router.dart`, `route_guard.dart`, `social_scaffold.dart`, `tab_menu_notifier.dart`.
- `versiones.dart`: registro de versiones y cambios.

## 4. Flujo principal
1. Inicio en `main.dart` con bootstrap Material 3.
2. Navegación por `app_router.dart` y shell social.
3. Login/registro en `identity`.
4. Acceso a catálogo, actividad, chat, perfil y ubicación.
5. Persistencia y API remota por módulos `core/database`.

## 5. Datos y backend
- CouchDB remoto: `https://citigov.cloud:6984`
- Qdrant remoto: `http://100.82.190.54:6333`
- Credenciales inyectadas por `defines.json`; no incluidas en repo.
- Colecciones Qdrant: `motorsocial_users`, `motorsocial_objects`, `motorsocial_activities`.
- Bases CouchDB: `motorsocial_users`, `motorsocial_relationships`, `motorsocial_groups`, `motorsocial_group_members`, `motorsocial_invitations`, `motorsocial_activities`, `motorsocial_objects`, `motorsocial_media`, `motorsocial_security_events`, `motorsocial_sync_state`.

## 6. Calidad y entrega
- Análisis: `flutter analyze lib` en 0 errores.
- Formato: `dart format` aplicado.
- Control de cambios: Git con CI en `.github/workflows/ci.yml`.
- Documentación: `_documentacion/02_BDD` con ingeniería reversa Gherkin.

## 7. Convenciones
- Imports locales dentro de cada proyecto; no se permite `package:pruebamotorsocial/...` dentro de `/mnt/motorsocial`.
- Features de UI: `/mnt/pruebamotorsocial/lib/features` es la versión canónica.
- `/mnt/motorsocial/lib/features` se mantiene como copia sincronizada.