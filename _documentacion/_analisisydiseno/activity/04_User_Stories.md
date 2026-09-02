# User Stories — Módulo Activity

**Metodología:** 3 C's (Card, Conversation, Confirmation)
**Features fuente:** `03_Features.feature`

---

## US-ACT-001 — Visualización del Feed de Actividad

### Card
Como usuario de la plataforma, quiero ver un listado de las actividades sociales más recientes, para estar enterado de lo que hacen los negocios y mis contactos.

### Conversation
- `FeedNotifier.load(query)` actualiza el `FeedState` con `isLoading:true` y `hasMore:false`, pero **no completa `activities`** (no llama al repositorio) — queda pendiente de cableado.
- `FeedNotifier.nextPage()` preserva `actorId` y `limit` y reelecta `load`.
- `FeedNotifier.reset()` devuelve al estado inicial vacío.
- `SocialActivityTile` renderiza `verb` (mayúsculas, o etiqueta de `verbLabelBuilder`), `actorName` y `objectId`.

### Confirmation (Criterios de Aceptación)
- ✓ `load(query)` pone `isLoading:true`, `hasMore:false` en el estado.
- ✓ `nextPage()` mantiene `actorId`/`limit` de la query activa.
- ✓ `reset()` produce un `FeedState` vacío.
- ✓ `SocialActivityTile` muestra `verb` en título, `actorName` en subtítulo y `objectId` en `trailing`.

---

## US-ACT-002 — Conversaciones y Mensajería

### Card
Como usuario, quiero mantener conversaciones con otros usuarios, para interactuar de forma privada y sin fricciones.

### Conversation
- `ConversationPage` requiere un `chatKey` y usa `TextEditingController` local.
- El botón de envío valida vacío: `if (_controller.text.isEmpty) return;`
- Tras el envío (no vacío) se llama `_controller.clear()`.
- El estado observable es `ConversationState` (`messages`, `isSending`, `lastError`) con `copyWith`; `ConversationNotifier.build()` retorna estado vacío.

### Confirmation (Criterios de Aceptación)
- ✓ Pulsar envío con texto no vacío procesa el mensaje y limpia el control.
- ✓ Pulsar envío con texto vacío no produce efecto y no procesa envío.
- ✓ `ConversationState.isSending == true` se refleja visualmente.
- ✓ Un fallo de envío expone el mensaje en `lastError` y conserva el texto en el campo.

---

## US-ACT-003 — Reacciones (Like / Comentario)

### Card
Como usuario, quiero reaccionar a las actividades del feed, para expresar mi interés y participar en la dinámica social.

### Conversation
- `ReactionState` (`reactions`, `isToggling`, `lastError`) con `copyWith`.
- `ReactionNotifier.build()` retorna `ReactionState` vacío (sin lógica de toggle — pendiente).
- El contrato de notificación al notifier ante una nueva reacción está definido en el EARS pero no implementado.

### Confirmation (Criterios de Aceptación)
- ✓ Al pulsar el botón de reacción, el `ReactionNotifier` es notificado y la UI se actualiza sin recargar el feed.
- ✓ `isToggling:true` se refleja visualmente.
- ✓ Un fallo del toggle expone el error en `lastError` y revierte el estado visual.

---

## US-ACT-004 — Repositorio y Persistencia de Actividades

### Card
Como plataforma, quiero abstraer la persistencia del feed en un repositorio intercambiable (in-memory ↔ backend), para desarrollar sin backend y desplegar contra CouchDB sin acoplar la UI.

### Conversation
- El contrato `ActivityRepository` define `recentFeed`, `getById`, `create`, `delete`.
- Existen **dos implementaciones `InMemoryActivitiesRepository`**:
  - La del propio `activity_repository.dart` (cascarón que devuelve `[]`/`null`/`activity`/`{}`) y a la que está ligado `activityRepositoryProvider`.
  - La del archivo `in_memory_activities_repository.dart` (`final class`, con `seed` y `_items` reales).
  **Inconsistencia crítica:** el provider no usa la implementación real.
- La implementación real filtra por `actorId` (si no es null) y ordena por `createdAt` desc; aplica `limit`.
- `getById` captura `StateError` y devuelve `null`; `create` inserta al inicio; `delete` removeWhere.

### Confirmation (Criterios de Aceptación)
- ✓ `recentFeed(ActivityQuery)` filtra por `actorId`, ordena por `createdAt` desc y aplica `limit`.
- ✓ `getById` de un id inexistente devuelve `null` sin excepción.
- ✓ `create` inserta la actividad al inicio de la lista y la devuelve.
- ✓ `delete` elimina todas las actividades con el `id` especificado.
- ✓ `activityRepositoryProvider` resuelve a una implementación de `ActivityRepository`.
