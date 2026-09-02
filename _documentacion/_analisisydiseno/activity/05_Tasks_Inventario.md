# Inventario Técnico y Tareas — Módulo Activity

**Ruta código:** `lib\activity\` (22 archivos `.dart`: 11 planos + 11 anidados en `lib\activity\activity\`)
**Inventario basado en el árbol plano** `lib\activity\` (canónico); divergencias del anotado en la sección Duplicaciones.

---

## Tabla A — Inventario de Componentes

| Subdirectorio | Archivo | Tipo de componente | Nombre del componente | Parámetros que requiere | Variables que utiliza | Variables internas | Estilos que le aplican |
|---|---|---|---|---|---|---|---|
| (raíz) | `activity.dart` | Barrel | — | N/A | — | — | N/A |
| `data_models` | `activity_contract.dart` | Clase de Datos | `ActivityQuery` | `actorId` (String?), `limit` (int, def 20) | — | — | N/A |
| `data_models` | `activity_contract.dart` | Clase de Datos | `SocialActivity` | `id`, `actorId`, `actorName`, `verb`, `objectType`, `objectId`, `payload` (Map, def {}), `createdAt` (int) | — | — | N/A |
| `data_models` | `activity_contract.dart` | Interfaz/Clase | `ActivityContract` | (vacía, sin `const`) | — | — | N/A |
| `engine` | `activity_engine.dart` | Lógica/Servicio | `ActivityEngine` | `activityRepository` (ActivityRepository) | — | — | N/A |
| `engine` | `activity_engine.dart` | Método (Pendiente) | `initialize()` | — | — | — | N/A |
| `pages` | `activity_feed_page.dart` | Widget (UI) | `ActivityFeedPage` | `key` | `ref`, `context` | — | Scaffold, Center, Text |
| `pages` | `conversation_page.dart` | Widget (UI) | `ConversationPage` | `key`, `chatKey` (String, req) | `_controller` | `_ConversationPageState` | Scaffold, AppBar, Column, Expanded, Padding, Row, TextField, IconButton, InputDecoration, Icon |
| `pages` | `conversation_page.dart` | State | `_ConversationPageState` | — | `_controller` | — | TextEditingController |
| `providers` | `conversation_notifier.dart` | Clase de Estado | `ConversationState` | `messages` (AsyncValue, def data([])), `isSending` (bool, def false), `lastError` (String?) | — | — | N/A |
| `providers` | `conversation_notifier.dart` | Riverpod Provider | `ConversationNotifier` (Pendiente) | — | — | — | N/A |
| `providers` | `conversation_notifier.dart` | Provider | `conversationProvider` | N/A | — | — | N/A |
| `providers` | `feed_notifier.dart` | Clase de Estado | `FeedState` | `activities`, `query`, `isLoading`, `hasMore` | — | — | N/A |
| `providers` | `feed_notifier.dart` | Riverpod Provider | `FeedNotifier` | — | — | — | N/A |
| `providers` | `feed_notifier.dart` | Provider | `feedProvider` | N/A | — | — | N/A |
| `providers` | `reaction_notifier.dart` | Clase de Estado | `ReactionState` | `reactions`, `isToggling`, `lastError` | — | — | N/A |
| `providers` | `reaction_notifier.dart` | Riverpod Provider | `ReactionNotifier` (Pendiente) | — | — | — | N/A |
| `providers` | `reaction_notifier.dart` | Provider | `reactionProvider` | N/A | — | — | N/A |
| `repositories` | `activity_repository.dart` | Interfaz/Repositorio | `ActivityRepository` (abstract) | N/A | — | — | N/A |
| `repositories` | `activity_repository.dart` | Repositorio MOCK (cascarón) | `InMemoryActivitiesRepository` (v1) | N/A | — | — | N/A |
| `repositories` | `activity_repository.dart` | Provider | `activityRepositoryProvider` | `ref` | — | — | N/A |
| `repositories` | `in_memory_activities_repository.dart` | Repositorio MOCK (real) | `InMemoryActivitiesRepository` (v2, `final class`) | `seed` (List<SocialActivity>?) | `_items` | `_items` | N/A |
| `widgets` | `social_activity_tile.dart` | Widget (UI) | `SocialActivityTile` | `key`, `activity` (req), `verbLabelBuilder`?, `contentBuilder`? | `activity` | `label` | ListTile, Text |

---

## Tabla B — Inventario de Elementos Internos

| Subdirectorio | Archivo | Variables definidas en el archivo | Clases | Variables de la clase | Funciones/Widgets definidos en la clase | Variables que utiliza | Llamadas a otras clases/widgets |
|---|---|---|---|---|---|---|---|
| (raíz) | `activity.dart` | — | — | — | export `data_models/activity_contract.dart`, `providers/feed_notifier.dart`, `providers/conversation_notifier.dart`, `providers/reaction_notifier.dart`, `repositories/activity_repository.dart`, `engine/activity_engine.dart` | — | barrel |
| `data_models` | `activity_contract.dart` | — | `ActivityQuery` | `actorId`, `limit` | `const ActivityQuery({...})` | — | — |
| `data_models` | `activity_contract.dart` | — | `SocialActivity` | `id`, `actorId`, `actorName`, `verb`, `objectType`, `objectId`, `payload`, `createdAt` | `const SocialActivity({...})` | — | — |
| `data_models` | `activity_contract.dart` | — | `ActivityContract` | — | (vacía, sin `const`) | — | — |
| `engine` | `activity_engine.dart` | — | `ActivityEngine` | `activityRepository` | `ActivityEngine(this.activityRepository)`, `initialize()` (Pendiente) | — | `ActivityRepository` |
| `pages` | `activity_feed_page.dart` | — | `ActivityFeedPage` (ConsumerWidget) | — | `build(context, ref)` → Scaffold/Center/Text('Feed') | — | `Scaffold`, `Center`, `Text` |
| `pages` | `conversation_page.dart` | — | `ConversationPage` (ConsumerStatefulWidget) | `chatKey` | `createState()` → `_ConversationPageState` | `widget.chatKey` | `ConsumerState`, `TextEditingController` |
| `pages` | `conversation_page.dart` | — | `_ConversationPageState` | `_controller` | `build(context)` → Scaffold/AppBar/Column/Expanded/Padding/Row/TextField/IconButton | `_controller.text`, `_controller.clear`, `Icons.send` | `Scaffold`, `AppBar`, `Column`, `Expanded`, `Padding`, `Row`, `TextField`, `IconButton`, `InputDecoration`, `Icon` |
| `providers` | `conversation_notifier.dart` | `conversationProvider` | `ConversationState` | `messages`, `isSending`, `lastError` | `const ConversationState(...)`, `copyWith` | — | `AsyncValue`, `SocialActivity` |
| `providers` | `conversation_notifier.dart` | — | `ConversationNotifier` (Pendiente) | — | `build()` → `ConversationState()` | — | `Notifier`, `ConversationState` |
| `providers` | `feed_notifier.dart` | `feedProvider` | `FeedState` | `activities`, `query`, `isLoading`, `hasMore` | `const FeedState(...)`, `copyWith` | — | `AsyncValue`, `ActivityQuery`, `SocialActivity` |
| `providers` | `feed_notifier.dart` | — | `FeedNotifier` | — | `build()` → `FeedState()`, `load(query)`, `nextPage()`, `reset()` | `state`, `state.query`, `state.copyWith` | `Notifier`, `FeedState`, `ActivityQuery` |
| `providers` | `reaction_notifier.dart` | `reactionProvider` | `ReactionState` | `reactions`, `isToggling`, `lastError` | `const ReactionState(...)`, `copyWith` | — | `AsyncValue`, `SocialActivity` |
| `providers` | `reaction_notifier.dart` | — | `ReactionNotifier` (Pendiente) | — | `build()` → `ReactionState()` | — | `Notifier`, `ReactionState` |
| `repositories` | `activity_repository.dart` | — | `ActivityRepository` (abstract) | — | `recentFeed(query)` (abstract), `getById(id)` (abstract), `create(activity)` (abstract), `delete(id)` (abstract) | — | `SocialActivity`, `ActivityQuery` |
| `repositories` | `activity_repository.dart` | `activityRepositoryProvider` | `InMemoryActivitiesRepository` (v1, cascarón) | — | `recentFeed → []`, `getById → null`, `create → activity`, `delete → {}` | — | `ActivityRepository`, `SocialActivity` |
| `repositories` | `in_memory_activities_repository.dart` | — | `InMemoryActivitiesRepository` (v2, `final class`) | `_items` | `create`, `delete`, `getById`, `recentFeed` | `query.actorId`, `query.limit`, `_items`, `b.createdAt.compareTo(a.createdAt)` | `ActivityRepository`, `SocialActivity`, `ActivityQuery` |
| `widgets` | `social_activity_tile.dart` | — | `SocialActivityTile` (StatelessWidget) | `activity`, `verbLabelBuilder`, `contentBuilder` | `build(context)` → ListTile | `verbLabelBuilder`, `activity`, `objectId`, `actorName` | `ListTile`, `Text`, `SocialActivity` |

---

## Duplicaciones / Inconsistencias Detectadas

1. **Doble definición `InMemoryActivitiesRepository`:**
   - `repositories\activity_repository.dart` (v1, cascarón que devuelve `[]`/`null`).
   - `repositories\in_memory_activities_repository.dart` (v2, `final class` con `seed` y CRUD funcional).
   - `activityRepositoryProvider` (en v1) **resuelve al cascarón**, no a la implementación real. **Bug de cableado.**

2. **Duplicación interna del árbol:** `lib\activity\activity\` (11 archivos) replica el árbol plano con divergencias triviales en `data_models\activity_contract.dart`:
   - `SocialActivity`: el plano usa constructor en una sola línea con parámetros en secuencia; el anidado usa `const SocialActivity({...})` con parámetros en líneas independientes.
   - `ActivityContract`: el plano es `class ActivityContract {}` (sin `const`); el anidado es `class ActivityContract { const ActivityContract(); }`.
   El resto de archivos de `lib\activity\activity\` son idénticos al árbol plano.

3. **Cascarones UI/lógica:** `ActivityFeedPage` ('Feed' placeholder), `ActivityEngine.initialize()`, `ConversationNotifier`, `ReactionNotifier` no tienen implementación funcional.

4. **`SocialActivityTile.contentBuilder` no se usa** en el `build` actual: el widget acepta un `contentBuilder` pero la UI siempre renderiza el `ListTile` estándar (ignora el contenido personalizado). Deuda técnica.
