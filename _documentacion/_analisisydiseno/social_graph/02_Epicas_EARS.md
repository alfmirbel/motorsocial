# Épicas y Especificaciones (EARS) — Módulo Social Graph

**Ruta código:** `lib\social_graph\` (34 archivos `.dart`: 17 planos + 17 anidados en `lib\social_graph\social_graph\`)
**Subdirectorios:** `data_models`, `engine`, `pages`, `providers`, `repositories`, `widgets`, raíz (`social_graph.dart` barrel).
**Fecha:** 2026-08-13

---

## Épica 1: Contactos y Relaciones
Como usuario de MotorSocial, quiero gestionar mis contactos (relaciones) con otros usuarios, para construir mi red social dentro de la plataforma.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá representar cada relación de contacto mediante `SocialRelationship` con `id`, `actorId`, `targetId`, `type` (por defecto `'contact'`) y `createdAt`.
- El sistema deberá exponer el contrato `RelationshipsRepository` con las operaciones `byActor(actorId, {status})` y `byOther(otherId, {status})`.
- El system deberá presentar la pantalla `ContactsPage` accesible desde la navegación.

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `RelationshipsRepository.byActor(actorId)`, el sistema deberá devolver la lista de relaciones en las que el usuario es actor.
- Cuando se invoque `RelationshipsRepository.byOther(otherId)`, el sistema deberá devolver la lista de relaciones en las que el usuario es destino (`targetId`).
- Cuando se renderice un `SocialRelationshipTile`, el sistema deberá mostrar `type` en el título y `targetId` en el subtítulo.

#### 3. Requerimientos Controlados por Estados
- Mientras el grafo social esté inicializado, el sistema deberá mantener `SocialGraphEngine` disponible con `initializeProviders(ref)` (punto de extensión, actualmente vacío).

#### 4. Requerimientos de Comportamiento No Deseado
- Si los campos `actorId`, `targetId` o `type` faltan en el JSON de `SocialRelationship`, entonces el sistema deberá asignar `''`, `''` y `'contact'` respectivamente (tolerancia de `fromJson`).
- Si el campo `createdAt` falta en el JSON, entonces el sistema deberá asignar `DateTime.now()`.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de filtrado por `status` esté incluida, el sistema deberá permitir filtrar las relaciones por estado (aceptada, pendiente, bloqueada) en `byActor`/`byOther`.

#### 6. Requerimientos Complejos
- Mientras la implementación use `InMemoryRelationshipsRepository`, cuando se consulten relaciones, el sistema deberá devolver `[]` (comportamiento de respaldo stub) sin errores.

---

## Épica 2: Invitaciones entre Usuarios
Como usuario, quiero enviar y recibir invitaciones para conectarme con otros usuarios, para iniciar relaciones de forma consentida.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá representar una invitación mediante `Invitation` (`id`, `senderId`, `recipientId`, `status` def `'pending'`, `createdAt`) y su análoga `SocialInvitation` (`id`, `senderId`, `receiverId`, `status`, `createdAt`).
- El sistema deberá exponer `InvitationsRepository` con `pendingFor(receiverId)` y `send(invitation)`.
- El system deberá exponer `SocialGraphRepository` con `invitations(userId)` como contrato agregador.

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `InvitationsRepository.pendingFor(receiverId)`, el sistema deberá devolver las invitaciones pendientes para ese receptor.
- Cuando se invoque `InvitationsRepository.send(invitation)`, el sistema deberá registrar la invitación con `status='pending'`.
- Cuando se renderice un `InvitationTile`, el system deberá mostrar `status` en el título y `senderId` en el subtítulo.

#### 3. Requerimientos Controlados por Estados
- Mientras una invitación tenga `status == 'pending'`, el sistema deberá mantenerla lista para aceptar/rechazar (operaciones pendientes de implementar).

#### 4. Requerimientos de Comportamiento No Deseado
- Si faltan `senderId`/`recipientId` en el JSON de `Invitation`, entonces el sistema deberá asignar `''` y `'pending'` por defecto (tolerancia de `fromJson`).

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de notificación push esté incluida, el system deberá notificar al `recipientId` al recibir una nueva invitación (extensión futura).

#### 6. Requerimientos Complejos
- Mientras la implementación use `InMemoryInvitationsRepository`, cuando se consulten o envíen invitaciones, el system deberá devolver `[]` o no-op (stub) sin errores.

---

## Épica 3: Grupos
Como usuario, quiero descubrir, ver y unirme a grupos, para participar en comunidades dentro de la plataforma.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El system deberá representar un grupo mediante `SocialGroup` (`id`, `name`, `memberIds`, `isPublic` def `true`).
- El system deberá exponer `GroupsRepository` con `discoverable({visibility, joinable})`.
- El system deberá presentar las vistas `GroupPages.buildContacts()`, `buildGroups()`, `buildInvitations()` y exponer las constantes de `GroupViews` (`'contactos'`, `'grupos'`, `'invitations'`).

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `GroupsRepository.discoverable({visibility, joinable})`, el system deberá devolver los grupos visibles/unibles según los filtros.
- Cuando se renderice un `SocialGroupTile`, el system deberá mostrar `name` en el título y `${memberIds.length} miembros` en el subtítulo.

#### 3. Requerimientos Controlados por Estados
- Mientras `GroupState.isLoading == true`, el system deberá reflejar visualmente la carga de la lista de grupos.

#### 4. Requerimientos de Comportamiento No Deseado
- Si `GroupState.error != null`, entonces el system deberá mostrar el mensaje de error asociado en la UI de grupos.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de grupos privados esté incluida, el system deberá marcar `SocialGroup.isPublic == false` y restringir el acceso (`GroupViews.groups`).

#### 6. Requerimientos Complejos
- Mientras se use `InMemoryGroupsRepository`, cuando se consulten grupos descubribles, el system deberá devolver `[]` (stub) sin errores.

---

## Épica 4: Estado Observable y Consultas del Grafo
Como desarrollador del módulo, quiero estado observable Riverpod y contratos de consulta, para cablear la UI del grafo social reactivamente.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El system deberá exponer `GroupState` (`groups`, `isLoading`, `error`) con `copyWith`, gestionado por `GroupNotifier` (Riverpod `Notifier`).
- El system deberá exponer `InvitationNotifier` (`Notifier<void>`) y `socialQueryProvider` (`Provider<SocialQuery>`).

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `GroupNotifier.build()`, el system deberá retornar `GroupState()` vacío.

#### 3. Requerimientos Controlados por Estados
- Mientras `GroupState.isLoading == true`, el system deberá mantener el indicador de carga activo.

#### 4. Requerimientos de Comportamiento No Deseado
- Si un error ocurre durante la carga de grupos, entonces el system deberá exponerlo en `GroupState.error`.

#### 5. Requerimientos de Funciones Opcional
- Donde la función de consulta compuesta esté incluida, el system deberá permitir parametrizar la búsqueda con `SocialQuery` (extensión futura; `SocialQuery` hoy vacío).

#### 6. Requerimientos Complejos
- Mientras `GroupNotifier` esté activo, cuando se obtenga la lista descubrible, el system deberá poblar `GroupState.groups` y desactivar `isLoading`.

---

## Notas de Estado del Módulo
- **Cascarones UI:** `ContactsPage`, `InvitationsPage` (`group_pages.dart` y `invitations_page.dart`) son placeholders `Center(child: Text(...))`.
- **Cascarones lógica:** `SocialGraphEngine.initializeProviders(ref)`, `GroupNotifier.build()`, `InvitationNotifier.build()` están vacíos. `SocialQuery` vacío.
- **Repositorios stub:** las 3 implementaciones `InMemory*Repository` devuelven `[]` o no-op.
- **Modelos serializables:** `Invitation`, `SocialRelationship` tienen `fromJson` (con tolerancia a ausencias). `SocialGroup` y `SocialInvitation` **no** tienen `fromJson`/`toJson`.
- **Duplicación modelo `Invitation`:** coexisten `Invitation` (`recipientId`, con `fromJson`) y `SocialInvitation` (`receiverId`, sin `fromJson`). Deuda técnica.
- **Doble `InvitationsPage`:** definida en `pages\invitations_page.dart` (scaffold simple) y en `pages\group_pages.dart` (con AppBar). Colisión de nombres en el mismo barrel/screen.
- **Barrel `social_graph.dart` no expone** `data_models/invitation.dart`, `data_models/social_relationship.dart`, `widgets/social_tiles.dart` ni `pages/*` (excepto vías los repositorios). Inconsistencia de diseño.
- **Duplicación interna del árbol:** `lib\social_graph\social_graph\` (17 archivos) replica byte-idénticamente el árbol plano.
