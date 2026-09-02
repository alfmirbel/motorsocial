# language: es
Característica: Visualización del Feed de Actividad
  Como usuario de la plataforma
  Quiero poder ver un listado de las actividades sociales más recientes
  Para estar enterado de lo que hacen los negocios y mis contactos

  Escenario: Carga inicial del Feed
    Dado que el usuario ha iniciado sesión
    Y navega a la pantalla "ActivityFeedPage"
    Cuando el sistema realiza un `ActivityQuery` inicial mediante `FeedNotifier.load`
    Entonces el sistema debe actualizar el estado con `isLoading: true` y `hasMore: false`
    Y presentar la lista de `SocialActivity` usando el componente `SocialActivityTile`

  Escenario: Paginación del feed
    Dado que el usuario visualiza la "ActivityFeedPage"
    Y existe una `ActivityQuery` activa con `actorId` y `limit`
    Cuando el usuario hace scroll hasta el final de la lista
    Entonces el sistema debe invocar `FeedNotifier.nextPage()`
    Y debe mantener el `actorId` y `limit` de la query actual

  Escenario: Reinicio del feed
    Dado un feed cargado con actividades previas
    Cuando se invoca `FeedNotifier.reset()`
    Entonces el sistema debe devolver el estado al `FeedState` inicial vacío

  Escenario: Fallo en la conexión al repositorio
    Dado que el usuario navega a "ActivityFeedPage"
    Y el `ActivityRepository` falla al recuperar los datos
    Cuando el sistema procesa la respuesta
    Entonces se debe mostrar un mensaje "No se pudo cargar el feed"
    Y debe aparecer un botón de reintento

  Escenario: Tile de actividad muestra datos del actor y objeto
    Dado una `SocialActivity` con `actorName`, `verb` y `objectId`
    Cuando se construye un `SocialActivityTile`
    Entonces el título debe mostrar el `verb` (mayúsculas o etiqueta del `verbLabelBuilder`)
    Y el subtítulo debe mostrar `activity.actorName`
    Y el `trailing` debe mostrar el `objectId`

---

Característica: Conversaciones y Mensajería
  Como usuario
  Quiero mantener conversaciones con otros usuarios de la plataforma
  Para interactuar de forma privada y sin fricciones

  Escenario: Envío de mensaje válido
    Dado que el usuario está en la "ConversationPage" con `chatKey` "chat-xyz"
    Y ha escrito "Hola" en el campo de texto
    Cuando el usuario presiona el botón de envío (icono `Icons.send`)
    Entonces el sistema debe procesar el envío del mensaje
    Y debe limpiar el control de texto (controller)

  Escenario: Envío bloqueado cuando el campo está vacío
    Dado que el usuario está en la "ConversationPage"
    Y el campo de texto está vacío
    Cuando el usuario presiona el botón de envío
    Entonces el sistema debe ignorar la acción y no procesar ningún envío

  Escenario: Envío en progreso
    Dado que `ConversationState.isSending == true`
    Cuando la UI reconstruye la "ConversationPage"
    Entonces el sistema debe reflejar visualmente el envío en curso

  Escenario: Error de envío conservando el texto
    Dado que el envío de un mensaje falla
    Cuando el sistema procesa el error
    Entonces el sistema debe exponer el mensaje en `ConversationState.lastError`
    Y debe conservar el contenido del mensaje en el campo para reintento

---

Característica: Reacciones (Like / Comentario)
  Como usuario
  Quiero reaccionar a las actividades del feed
  Para expresar mi interés y participar en la dinámica social

  Escenario: Toggle de reacción
    Dado que el usuario visualiza el feed con una actividad
    Cuando pulsa el botón de reacción de esa actividad
    Entonces el sistema debe notificar al `ReactionNotifier`
    Y debe actualizar la UI sin recargar todo el feed

  Escenario: Reacción en proceso
    Dado que `ReactionState.isToggling == true`
    Cuando la UI reconstruye el control de reacción
    Entonces el sistema debe reflejar visualmente el estado pendiente

  Escenario: Reacción fallida revierte el estado
    Dado que el toggle de reacción falla
    Cuando el sistema procesa el error
    Entonces el sistema debe exponer el mensaje en `ReactionState.lastError`
    Y debe revertir el estado visual de la reacción

---

Característica: Repositorio y Persistencia de Actividades
  Como plataforma
  Quiero abstraer la persistencia del feed en un repositorio intercambiable
  Para permitir desarrollo sin backend y despliegue contra CouchDB sin acoplar la UI

  Escenario: Feed filtrado por actor y limitado
    Dado un `ActivityQuery` con `actorId: "user:abc"` y `limit: 10`
    Cuando se invoca `recentFeed(query)` sobre el `InMemoryActivitiesRepository` real
    Entonces el sistema debe devolver sólo las actividades con ese `actorId`
    Y ordenadas por `createdAt` descendente
    Y limitadas a 10 elementos

  Escenario: getById de actividad inexistente
    Dado una actividad con id "activity:no-existe" no presente en el repositorio
    Cuando se invoca `getById("activity:no-existe")`
    Entonces el sistema debe devolver `null`
    Y no debe lanzar excepción

  Escenario: Crear registra la actividad al inicio de la lista
    Dado un `InMemoryActivitiesRepository` con `seed` no vacío
    Cuando se invoca `create(newActivity)`
    Entonces el sistema debe insertar `newActivity` al inicio de `_items`
    Y devolver la actividad creada

  Escenario: Eliminar quita la actividad por id
    Dado un repositorio con una actividad de id "activity:1"
    Cuando se invoca `delete("activity:1")`
    Entonces el sistema debe remover de `_items` toda actividad con `id == "activity:1"`
