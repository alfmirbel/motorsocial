# Inventario Técnico y Tareas — Módulo Social Graph

**Ruta código:** `lib\social_graph\` (34 archivos `.dart`: 17 planos + 17 anidados en `lib\social_graph\social_graph\`)
**Inventario basado en el árbol plano** `lib\social_graph\` (canónico); divergencias anotadas al final.

---

## Tabla A — Inventario de Componentes

| Subdirectorio | Archivo | Tipo de componente | Nombre del componente | Parámetros que requiere | Variables que utiliza | Variables internas | Estilos que le aplican |
|---|---|---|---|---|---|---|---|
| (raíz) | `social_graph.dart` | Barrel | — | N/A | — | — | N/A |
| `data_models` | `invitation.dart` | Clase de Datos | `Invitation` | `id`, `senderId`, `recipientId`, `status` (def `'pending'`), `createdAt` | — | — | N/A |
| `data_models` | `social_group.dart` | Clase de Datos | `SocialGroup` | `id`, `name`, `memberIds` (def `[]`), `isPublic` (def `true`) | — | — | N/A |
| `data_models` | `social_invitation.dart` | Clase de Datos | `SocialInvitation` | `id`, `senderId`, `receiverId`, `status`, `createdAt` | — | — | N/A |
| `data_models` | `social_relationship.dart` | Clase de Datos | `SocialRelationship` | `id`, `actorId`, `targetId`, `type`, `createdAt` | — | — | N/A |
| `engine` | `social_graph_engine.dart` | Lógica/Servicio | `SocialGraphEngine` (Pendiente) | — | — | — | N/A |
| `pages` | `contacts_page.dart` | Widget (UI) | `ContactsPage` (Pendiente) | `key` | `ref`, `context` | — | Scaffold, AppBar, Center, Text |
| `pages` | `group_pages.dart` | Constantes | `GroupViews` | — | — | — | N/A |
| `pages` | `group_pages.dart` | Widget (UI) | `InvitationsPage` (v1, con AppBar) | `key` | `context` | — | Scaffold, AppBar, Center, Text |
| `pages` | `group_pages.dart` | Builder | `GroupPages` (Pendiente) | — | — | — | Center, Text |
| `pages` | `invitations_page.dart` | Widget (UI) | `InvitationsPage` (v2, simple) | `key` | `context` | — | Scaffold, Center, Text |
| `providers` | `group_notifier.dart` | Clase de Estado | `GroupState` | `groups`, `isLoading`, `error` | — | — | N/A |
| `providers` | `group_notifier.dart` | Riverpod Provider | `GroupNotifier` (Pendiente) | — | — | — | N/A |
| `providers` | `group_notifier.dart` | Provider | `groupProvider` | N/A | — | — | N/A |
| `providers` | `invitation_notifier.dart` | Riverpod Provider | `InvitationNotifier` (Pendiente, `Notifier<void>`) | — | — | — | N/A |
| `providers` | `invitation_notifier.dart` | Provider | `invitationNotifierProvider` | N/A | — | — | N/A |
| `providers` | `social_query.dart` | Clase de Datos | `SocialQuery` (vacía) | — | — | — | N/A |
| `providers` | `social_query.dart` | Provider | `socialQueryProvider` | N/A | — | — | N/A |
| `repositories` | `groups_repository.dart` | Interfaz/Repositorio | `GroupsRepository` (abstract) | — | — | — | N/A |
| `repositories` | `groups_repository.dart` | Repositorio MOCK | `InMemoryGroupsRepository` | — | — | — | N/A |
| `repositories` | `invitations_repository.dart` | Interfaz/Repositorio | `InvitationsRepository` (abstract) | — | — | — | N/A |
| `repositories` | `invitations_repository.dart` | Repositorio MOCK | `InMemoryInvitationsRepository` | — | — | — | N/A |
| `repositories` | `relationships_repository.dart` | Interfaz/Repositorio | `RelationshipsRepository` (abstract) | — | — | — | N/A |
| `repositories` | `relationships_repository.dart` | Repositorio MOCK | `InMemoryRelationshipsRepository` | — | — | — | N/A |
| `repositories` | `social_graph_repository.dart` | Interfaz/Repositorio | `SocialGraphRepository` (abstract) | — | — | — | N/A |
| `widgets` | `social_tiles.dart` | Widget (UI) | `SocialRelationshipTile` | `key`, `relationship` (req) | `relationship` | — | ListTile, Text |
| `widgets` | `social_tiles.dart` | Widget (UI) | `SocialGroupTile` | `key`, `group` (req) | `group` | — | ListTile, Text |
| `widgets` | `social_tiles.dart` | Widget (UI) | `InvitationTile` | `key`, `invitation` (req) | `invitation` | — | ListTile, Text |

---

## Tabla B — Inventario de Elementos Internos

| Subdirectorio | Archivo | Variables definidas en el archivo | Clases | Variables de la clase | Funciones/Widgets definidos en la clase | Variables que utiliza | Llamadas a otras clases/widgets |
|---|---|---|---|---|---|---|---|
| (raíz) | `social_graph.dart` | — | — | — | export `social_group.dart`, `social_invitation.dart`, repositorios (4), providers `group_notifier`, `invitation_notifier`, `engine` | — | barrel |
| `data_models` | `invitation.dart` | — | `Invitation` | `id`, `senderId`, `recipientId`, `status`, `createdAt` | `const Invitation(...)`, `Invitation.fromJson` | `json['id']`, `json['_id']`, `DateTime.parse` | `DateTime` |
| `data_models` | `social_group.dart` | — | `SocialGroup` | `id`, `name`, `memberIds`, `isPublic` | `const SocialGroup(...)` | — | — |
| `data_models` | `social_invitation.dart` | — | `SocialInvitation` | `id`, `senderId`, `receiverId`, `status`, `createdAt` | `const SocialInvitation(...)` | — | — |
| `data_models` | `social_relationship.dart` | — | `SocialRelationship` | `id`, `actorId`, `targetId`, `type`, `createdAt` | `const SocialRelationship(...)`, `SocialRelationship.fromJson` | `json['id']`, `json['_id']`, `json['actorId']`, `json['targetId']`, `json['type']`, `json['createdAt']`, `DateTime.parse` | `DateTime` |
| `engine` | `social_graph_engine.dart` | — | `SocialGraphEngine` | — | `const SocialGraphEngine()`, `initializeProviders(ref)` (no-op, Pendiente) | — | `WidgetRef` |
| `pages` | `contacts_page.dart` | — | `ContactsPage` (ConsumerWidget) | — | `build(context, ref)` → Scaffold/AppBar/Center/Text | — | `Scaffold`, `AppBar`, `Center`, `Text` |
| `pages` | `group_pages.dart` | — | `GroupViews` | — | constantes `contacts='contactos'`, `groups='grupos'`, `invitations='invitations'` | — | — |
| `pages` | `group_pages.dart` | — | `InvitationsPage` (v1) (StatelessWidget) | — | `build(context)` → Scaffold/AppBar/Center/Text | — | `Scaffold`, `AppBar`, `Center`, `Text` |
| `pages` | `group_pages.dart` | — | `GroupPages` | — | `buildContacts()`, `buildGroups()`, `buildInvitations()` | — | `Center`, `Text`, `InvitationsPage` |
| `pages` | `invitations_page.dart` | — | `InvitationsPage` (v2) (StatelessWidget) | — | `build(context)` → Scaffold/Center/Text | — | `Scaffold`, `Center`, `Text` |
| `providers` | `group_notifier.dart` | `groupProvider` | `GroupState` | `groups`, `isLoading`, `error` | `const GroupState(...)`, `copyWith` | — | `SocialGroup` |
| `providers` | `group_notifier.dart` | — | `GroupNotifier` (Pendiente) | — | `build()` → `GroupState()` | — | `Notifier`, `GroupState` |
| `providers` | `invitation_notifier.dart` | `invitationNotifierProvider` | `InvitationNotifier` (Pendiente) | — | `build()` (no-op) | — | `Notifier` |
| `providers` | `social_query.dart` | `socialQueryProvider` | `SocialQuery` | — | `const SocialQuery()` | — | — |
| `repositories` | `groups_repository.dart` | — | `GroupsRepository` (abstract) | — | `discoverable({visibility, joinable})` (abstract) | — | `SocialGroup` |
| `repositories` | `groups_repository.dart` | — | `InMemoryGroupsRepository` | — | `discoverable → []` | — | `SocialGroup`, `GroupsRepository` |
| `repositories` | `invitations_repository.dart` | — | `InvitationsRepository` (abstract) | — | `pendingFor(receiverId)` (abstract), `send(invitation)` (abstract) | — | `SocialInvitation` |
| `repositories` | `invitations_repository.dart` | — | `InMemoryInvitationsRepository` | — | `pendingFor → []`, `send → no-op` | — | `SocialInvitation`, `InvitationsRepository` |
| `repositories` | `relationships_repository.dart` | — | `RelationshipsRepository` (abstract) | — | `byActor(actorId, {status})` (abstract), `byOther(otherId, {status})` (abstract) | — | `SocialRelationship` |
| `repositories` | `relationships_repository.dart` | — | `InMemoryRelationshipsRepository` | — | `byActor → []`, `byOther → []` | — | `SocialRelationship`, `RelationshipsRepository` |
| `repositories` | `social_graph_repository.dart` | — | `SocialGraphRepository` (abstract) | — | `invitations(userId)` (abstract) | — | `SocialInvitation` |
| `widgets` | `social_tiles.dart` | — | `SocialRelationshipTile` (StatelessWidget) | `relationship` | `build(context)` → ListTile | `relationship.type`, `relationship.targetId` | `ListTile`, `Text` |
| `widgets` | `social_tiles.dart` | — | `SocialGroupTile` (StatelessWidget) | `group` | `build(context)` → ListTile | `group.name`, `group.memberIds.length` | `ListTile`, `Text` |
| `widgets` | `social_tiles.dart` | — | `InvitationTile` (StatelessWidget) | `invitation` | `build(context)` → ListTile | `invitation.status`, `invitation.senderId` | `ListTile`, `Text` |

---

## Duplicaciones / Inconsistencias Detectadas

1. **Doble modelo de invitación:** `Invitation` (`recipientId`, con `fromJson`) y `SocialInvitation` (`receiverId`, sin `fromJson`) coexisten. El repositorio `InvitationsRepository` usa `SocialInvitation`, mientras `InvitationTile` consume `Invitation`. Deuda técnica a consolidar.
2. **Doble `InvitationsPage`:** en `pages\group_pages.dart` (con AppBar) y en `pages\invitations_page.dart` (scaffold simple). Colisión de nombres si ambos se importan en el mismo contexto.
3. **Modelos sin serialización:** `SocialGroup` y `SocialInvitation` carecen de `fromJson`/`toJson`; deben añadirse al cablear el backend.
4. **Barrel incompleto:** `social_graph.dart` NO re-exporta `data_models/invitation.dart`, `data_models/social_relationship.dart`, `widgets/social_tiles.dart` ni `pages/*`.
5. **Cascarones:** `SocialGraphEngine.initializeProviders`, `GroupNotifier.build`, `InvitationNotifier.build` vacíos; `SocialQuery` vacío; las 3 `InMemory*Repository` devuelven `[]`/no-op.
6. **Duplicación interna del árbol:** `lib\social_graph\social_graph\` (17 archivos) es byte-idéntica al árbol plano (verificada por diff).
