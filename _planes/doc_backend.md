# Backend — Contrato integrador CouchDB/Qdrant (modo stub)

## Objetivo
Documentar el mapeo entre dominios de MotorSocial y backends previstos, manteniendo modo stub por defecto en desarrollo/CI. No se incluyen credenciales ni secrets.

## Alcance
- Cobertura por feature: activity, catalog, identity, media, social_graph, security, resilience.
- Integración declarada por `DatabaseModule` y `SocialAppConfig`.
- Modo online queda diferido a Fase 3 completa; este documento describe el estado actual stub y la forma de activar backends.

## Mapeo por dominio

| Feature | Repositorio (interfaz) | Base CouchDB | Colección/Qdrant | Notas |
|---|---|---|---|---|
| Activity | ActivityRepository | `activities` | — | Vista `by_actor_createdAt` para feed. |
| Catalog | ObjectsRepository | `objects` | — | Vista `by_owner_createdAt`. |
| Identity | AuthRepository, SessionRepository, UsersRepository | `users` | — | Auth/sesión en `shared_preferences`. |
| Media | MediaRepository | `media` | — | Diseño `by_asset_type`, `by_owner_createdAt`. |
| SocialGraph | GroupsRepository, RelationshipsRepository, InvitationsRepository | `groups`, `members`, `invitations`, `relationships` | — | Datos relacionales en CouchDB. |
| Security | SecurityRepository | `security_events` | — | Consulta por usuario y ventana `since`. |
| Resilience | ConnectivityRepository, PlatformRepository, SyncRepository | — | — | Sync usa dispatcher hacia CouchDB/Qdrant. |
| Media embeddings | MediaRepository | — | `media_vectors` | Upsert por embedding. |

## Configuración
`SocialAppConfig` incluye:
- `useStubRepositories: bool` — default true en desarrollo.
- `couchdb: CouchDbConfig?` — URI, db, credenciales.
- `qdrant: QdrantConfig?` — URL, colecciones.

## Modo stub
Todas las factories de `DatabaseModule` devuelven implementaciones `InMemory*` cuando `useStubRepositories == true`. No hay llamadas HTTP ni副作用 en compilación/cierre de Fase 3.

## Criterios de activación backend online
- Validar ping ok desde `CouchDbRepository.ping()`.
- Validar colección destino en Qdrant.
- Migrar implementaciones stub por repos reales exclusivamente tras aprobación feature por feature.

## Siguientes pasos sugeridos
- Implementar vistas CouchDB documentadas arriba dentro de `CouchDbActivityRepository`.
- Añadir `QdrantMediaRepository` para upsert de vectores.
- Instrumentar `SecurityRepository` con timeouts y reintentos.
