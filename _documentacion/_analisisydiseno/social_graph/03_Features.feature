# language: es
Característica: Contactos y Relaciones
  Como usuario de MotorSocial
  Quiero gestionar mis contactos (relaciones) con otros usuarios
  Para construir mi red social dentro de la plataforma

  Escenario: Listar relaciones del actor
    Dado un usuario con `actorId: "user:abc"`
    Cuando se invoca `RelationshipsRepository.byActor("user:abc")`
    Entonces el sistema debe devolver la lista de `SocialRelationship` donde el usuario es actor

  Escenario: Listar relaciones donde el usuario es destino
    Dado un usuario con id "user:xyz"
    Cuando se invoca `RelationshipsRepository.byOther("user:xyz")`
    Entonces el sistema debe devolver la lista de relaciones donde `targetId == "user:xyz"`

  Escenario: Tile de relación muestra tipo y destino
    Dada una `SocialRelationship` con `type: "contact"` y `targetId: "user:xyz"`
    Cuando se construye un `SocialRelationshipTile`
    Entonces el título debe mostrar "Relación contact"
    Y el subtítulo debe mostrar "user:xyz"

  Escenario: Reconstrucción de relación desde JSON incompleto
    Dado un JSON de `SocialRelationship` sin `actorId`, `targetId`, `type` y `createdAt`
    Cuando se invoca `SocialRelationship.fromJson(json)`
    Entonces el sistema debe asignar `''` a `actorId` y `targetId`
    Y `'contact'` a `type`
    Y `DateTime.now()` a `createdAt`

---

Característica: Invitaciones entre Usuarios
  Como usuario
  Quiero enviar y recibir invitaciones para conectarme con otros usuarios
  Para iniciar relaciones de forma consentida

  Escenario: Enviar una invitación
    Dado un `senderId` y un `recipientId` válidos
    Cuando se invoca `InvitationsRepository.send(invitation)`
    Entonces el sistema debe registrar la invitación con `status: "pending"`

  Escenario: Listar invitaciones pendientes para un receptor
    Dado un receptor con id "user:xyz"
    Cuando se invoca `InvitationsRepository.pendingFor("user:xyz")`
    Entonces el sistema debe devolver la lista de `SocialInvitation` pendientes para ese receptor

  Escenario: Invitaciones vía repositorio agregador
    Dado un usuario con id "user:abc"
    Cuando se invoca `SocialGraphRepository.invitations("user:abc")`
    Entonces el sistema debe devolver la lista de invitaciones del usuario

  Escenario: Tile de invitación muestra estado y emisor
    Dada una `Invitation` con `status: "pending"` y `senderId: "user:abc"`
    Cuando se construye un `InvitationTile`
    Entonces el título debe mostrar "Invitación pending"
    Y el subtítulo debe mostrar "user:abc"

  Escenario: Reconstrucción de invitación desde JSON incompleto
    Dado un JSON de `Invitation` sin `senderId`, `recipientId` y `status`
    Cuando se invoca `Invitation.fromJson(json)`
    Entonces el sistema debe asignar `''` a `senderId` y `recipientId`
    Y `'pending'` a `status`

---

Característica: Grupos
  Como usuario
  Quiero descubrir, ver y unirme a grupos
  Para participar en comunidades dentro de la plataforma

  Escenario: Listar grupos descubribles
    Dado el `GroupsRepository` activo
    Cuando se invoca `discoverable(visibility: true, joinable: true)`
    Entonces el sistema debe devolver la lista de `SocialGroup` que cumplen los filtros

  Escenario: Tile de grupo muestra nombre y conteo de miembros
    Dado un `SocialGroup` con `name: "Talleres"` y 3 `memberIds`
    Cuando se construye un `SocialGroupTile`
    Entonces el título debe mostrar "Talleres"
    Y el subtítulo debe mostrar "3 miembros"

  Escenario: Vistas de navegación de grupos
    Dado el módulo de grupos inicializado
    Cuando se invoca `GroupPages.buildContacts()`, `buildGroups()` o `buildInvitations()`
    Entonces el sistema debe devolver el widget correspondiente a cada vista
    Y `GroupViews` debe exponer las constantes `'contactos'`, `'grupos'`, `'invitations'`

---

Característica: Estado Observable y Consultas del Grafo
  Como desarrollador del módulo
  Quiero estado observable Riverpod y contratos de consulta
  Para cablear la UI del grafo social reactivamente

  Escenario: Estado inicial de grupos
    Dado el `GroupNotifier` recién creado
    Cuando se invoca `build()`
    Entonces el sistema debe retornar un `GroupState` vacío (`groups: []`, `isLoading: false`, `error: null`)

  Escenario: Indicador de carga de grupos
    Dado que `GroupState.isLoading == true`
    Cuando la UI reconstruye la vista de grupos
    Entonces el sistema debe reflejar visualmente la carga

  Escenario: Error de carga expuesto en el estado
    Dado que ocurre un error durante la carga de grupos
    Cuando el sistema procesa el error
    Entonces el sistema debe exponer el mensaje en `GroupState.error`

  Escenario: Consulta vacía disponible
    Dado el provider `socialQueryProvider`
    Cuando se resuelve
    Entonces el sistema debe devolver un `SocialQuery` válido (vacío por defecto)
