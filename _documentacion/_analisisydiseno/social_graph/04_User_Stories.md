# User Stories — Módulo Social Graph

**Metodología:** 3 C's (Card, Conversation, Confirmation)
**Features fuente:** `03_Features.feature`

---

## US-SG-001 — Contactos y Relaciones

### Card
Como usuario, quiero gestionar mis contactos (relaciones) con otros usuarios, para construir mi red social dentro de la plataforma.

### Conversation
- `SocialRelationship` (`id`, `actorId`, `targetId`, `type` def `'contact'`, `createdAt`) con `fromJson` tolerante (asigna `''`/`'contact'`/`DateTime.now()` si faltan campos).
- `RelationshipsRepository.byActor(actorId, {status})` y `byOther(otherId, {status})` devuelven listas de relaciones.
- `SocialRelationshipTile` muestra `type` (título) y `targetId` (subtítulo) en un `ListTile`.
- Implementación actual `InMemoryRelationshipsRepository` devuelve `[]` (stub).

### Confirmation (Criterios de Aceptación)
- ✓ `byActor("user:abc")` devuelve las relaciones con `actorId == "user:abc"`.
- ✓ `byOther("user:xyz")` devuelve las relaciones con `targetId == "user:xyz"`.
- ✓ `SocialRelationshipTile` muestra `type` y `targetId`.
- ✓ `fromJson` asigna `''`, `''`, `'contact'`, `DateTime.now()` ante campos ausentes.

---

## US-SG-002 — Invitaciones entre Usuarios

### Card
Como usuario, quiero enviar y recibir invitaciones para conectarme con otros usuarios, para iniciar relaciones de forma consentida.

### Conversation
- Dos modelos paralelos de invitación: `Invitation` (`recipientId`, con `fromJson` tolerante) y `SocialInvitation` (`receiverId`, sin `fromJson`). Deuda técnica.
- `InvitationsRepository.send(invitation)` registra pendientes; `pendingFor(receiverId)` lista las pendientes.
- `SocialGraphRepository.invitations(userId)` es el contrato agregador (abstract, sin implementación).
- `InvitationTile` muestra `status` (título) y `senderId` (subtítulo).
- Implementación actual `InMemoryInvitationsRepository`: `pendingFor → []`, `send → no-op`.

### Confirmation (Criterios de Aceptación)
- ✓ `send(invitation)` registra una invitación `status='pending'`.
- ✓ `pendingFor("user:xyz")` devuelve las invitaciones para ese receptor.
- ✓ `SocialGraphRepository.invitations("user:abc")` devuelve la lista del usuario.
- ✓ `InvitationTile` muestra `status` y `senderId`.
- ✓ `Invitation.fromJson` asigna `''`/`'pending'` ante campos ausentes.

---

## US-SG-003 — Grupos

### Card
Como usuario, quiero descubrir, ver y unirme a grupos, para participar en comunidades dentro de la plataforma.

### Conversation
- `SocialGroup` (`id`, `name`, `memberIds`, `isPublic` def `true`), sin `fromJson`/`toJson`.
- `GroupsRepository.discoverable({visibility, joinable})` filtra grupos visibles/unibles.
- `GroupViews` expone constantes `'contactos'`, `'grupos'`, `'invitations'`; `GroupPages.buildContacts/buildGroups/buildInvitations` son builders estáticos.
- `SocialGroupTile` muestra `name` (título) y `${memberIds.length} miembros` (subtítulo).
- Implementación actual `InMemoryGroupsRepository.discoverable → []` (stub).

### Confirmation (Criterios de Aceptación)
- ✓ `discoverable(visibility:true, joinable:true)` devuelve los `SocialGroup` que cumplen los filtros.
- ✓ `SocialGroupTile` muestra `name` y el conteo de miembros.
- ✓ `GroupPages.build*()` devuelve el widget correspondiente a cada vista.
- ✓ `GroupViews` expone las 3 constantes.

---

## US-SG-004 — Estado Observable y Consultas del Grafo

### Card
Como desarrollador del módulo, quiero estado observable Riverpod y contratos de consulta, para cablear la UI del grafo social reactivamente.

### Conversation
- `GroupState` (`groups`, `isLoading`, `error`) con `copyWith`, gestionado por `GroupNotifier` (`Notifier`).
- `InvitationNotifier` es `Notifier<void>` (sin estado propio).
- `socialQueryProvider` entrega un `SocialQuery` vacío (contrato reservado para futuros filtros).

### Confirmation (Criterios de Aceptación)
- ✓ `GroupNotifier.build()` retorna `GroupState()` vacío.
- ✓ `GroupState.isLoading == true` se refleja visualmente.
- ✓ Un error de carga queda expuesto en `GroupState.error`.
- ✓ `socialQueryProvider` resuelve a un `SocialQuery` válido.
