# SDD — Feature: Activity

## 1. Resumen
El feature `activity` modela la capa social de actividad del MotorSocial: generación, consumo y reacción sobre eventos del feed. La implementación actual cubre contratos, motor de dominio, estado reactivo y pantalla mínima.

## 2. Alcance
Refleja funcionalidad existente en `/mnt/motorsocial/lib/activity`.

## 3. Modelos de dominio

### 3.1 ActivityQuery
- `actorId`: filtro por actor.
- `limit`: tamaño de página.

### 3.2 SocialActivity
- `id`, `actorId`, `actorName`, `verb`, `objectType`, `objectId`.
- `payload`: metadatos libres.
- `createdAt`.

### 3.3 ActivityContract
Marcador de dominio sin campos operativos.

## 4. Repositorio
`ActivityRepository` define: `recentFeed`, `getById`, `create`, `delete`.

## 5. Motor
`ActivityEngine` resuelve instancia de repositorio directa o factoría y expone métodos alias.

## 6. Proveedores
- `FeedState` / `FeedNotifier`: carga, paginación básica y reset.
- `ConversationState` / `ConversationNotifier`: estado de chat sin comportamiento.
- `ReactionState` / `ReactionNotifier`: estado de reacciones sin comportamiento.

## 7. UI
- `ActivityFeedPage`: placeholder.
- `ConversationPage`: chat mínimo con título, entrada de texto y send.
- `SocialActivityTile`: tarjeta básica con verb y actor.

## 8. Estados relevantes
`activities`, `isLoading`, `hasMore`, `messages`, `reactions`, `isToggling`, `isSending`, `lastError`.

## 9. Requisitos funcionionales derivados
| ID | Requisito | Evidencia |
|-----|-----------|-----------|
| RF-ACT-01 | Consultar feed reciente por actor y límite. | `ActivityQuery`, `recentFeed`, `ActivityRepository`, `FeedState`. |
| RF-ACT-02 | Crear y eliminar actividad. | `create`, `delete` en `ActivityRepository`. |
| RF-ACT-03 | Leer actividad por identificador. | `getById`. |
| RF-ACT-04 | Presentar lista de actividades tipo feed. | `ActivityFeedPage`, `SocialActivityTile`, `catalogProvider`. |
| RF-ACT-05 | Presentar conversación con emisión de mensajes. | `ConversationPage`, `ConversationProvider`. |
| RF-ACT-06 | Toggle reacciones tipo like. | `ReactionState`, `ReactionNotifier`. |

## 10. No funcionales
- Integración Riverpod.
- Sin implementación concreta de almacenamiento actual.
