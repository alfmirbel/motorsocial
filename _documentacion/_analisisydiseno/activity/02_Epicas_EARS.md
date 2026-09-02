# Épicas y Especificaciones (EARS) — Módulo Activity

**Ruta código:** `lib\activity\` (22 archivos `.dart`: 11 en árbol plano + 11 anidados en `lib\activity\activity\`)
**Subdirectorios:** `data_models`, `engine`, `pages`, `providers`, `repositories`, `widgets`, raíz (`activity.dart` barrel).
**Semilla reutilizada:** `_documentacion\_activity\02_Epicas.md` (completada con código real).
**Fecha:** 2026-08-13

---

## Épica 1: Feed de Actividad Social
Como usuario de MotorSocial, quiero visualizar un feed dinámico con las actividades recientes de mis conexiones, para interactuar y mantenerme actualizado sobre sus interacciones con el catálogo y otros usuarios.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá presentar las actividades en orden cronológico inverso (las más recientes primero).
- El sistema deberá mostrar el nombre del actor (`actorName`), el verbo de la acción (`verb`) y el objeto (`objectType`) de forma clara en el componente `SocialActivityTile`.
- El sistema deberá modelar la página del feed con `FeedState` (`activities`, `query`, `isLoading`, `hasMore`) gestionado por el `FeedNotifier` (Riverpod `Notifier`).

#### 2. Requerimientos Controlados por Eventos
- Cuando un usuario haga scroll hasta el final de la lista en `ActivityFeedPage`, el sistema deberá solicitar la siguiente página de actividades mediante `FeedNotifier.nextPage()`.
- Cuando se invoque `FeedNotifier.load(query)`, el sistema deberá actualizar `state` con `isLoading: true` y `hasMore: false` (comportamiento actual; la persistencia queda pendiente de cableado al repositorio).
- Cuando se invoque `FeedNotifier.reset()`, el sistema deberá devolver el estado al `FeedState` inicial vacío.

#### 3. Requerimientos Controlados por Estados
- Mientras el sistema se encuentre en estado "Cargando" (`FeedState.isLoading == true`), el sistema deberá mostrar un indicador visual (ProgressIndicator) en la pantalla `ActivityFeedPage`.

#### 4. Requerimientos de Comportamiento No Deseado
- Si falla la conexión al `ActivityRepository`, entonces el sistema deberá mostrar un mensaje de error amigable indicando que no se pudo actualizar el feed, junto con un botón para reintentar.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de Geolocalización esté habilitada, el sistema deberá permitir filtrar el feed por proximidad geográfica (extensión futura de `ActivityQuery`).

#### 6. Requerimientos Complejos
- Mientras el usuario visualice el `ActivityFeedPage`, cuando se detecte una desconexión de red prolongada, el sistema deberá usar el `InMemoryActivitiesRepository` temporalmente y mostrar un aviso de "Modo sin conexión".

---

## Épica 2: Conversaciones y Mensajería
Como usuario, quiero mantener conversaciones con otros usuarios de la plataforma, para interactuar de forma privada y sin fricciones.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá representar el estado de cada conversación con `ConversationState` (`messages`, `isSending`, `lastError`) gestionado por `ConversationNotifier`.
- El sistema deberá presentar la pantalla `ConversationPage` identificada por su `chatKey`.

#### 2. Requerimientos Controlados por Eventos
- Cuando el usuario presione el botón de envío (icono `Icons.send`), el sistema deberá validar que el campo de texto no esté vacío antes de procesar el envío.
- Cuando el campo de texto esté vacío, el sistema deberá ignorar el envío (instrucción `return`).

#### 3. Requerimientos Controlados por Estados
- Mientras `ConversationState.isSending == true`, el sistema deberá deshabilitar el control de entrada y mostrar un indicador de envío en curso.

#### 4. Requerimientos de Comportamiento No Deseado
- Si el envío de un mensaje falla, entonces el sistema deberá exponer el error en `ConversationState.lastError` y conservar el contenido del mensaje en el campo para reintento.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de multimedia adjunta esté incluida, el sistema deberá permitir adjuntar imágenes al mensaje en `ConversationPage` (extensión futura).

#### 6. Requerimientos Complejos
- Mientras el usuario teclea un mensaje, cuando presiona el botón de envío, el sistema deberá limpiar el control (controller) tras un envío exitoso.

---

## Épica 3: Reacciones (Like / Comentario)
Como usuario, quiero reaccionar a las actividades del feed, para expresar mi interés y participar en la dinámica social.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá modelar el estado de reacciones con `ReactionState` (`reactions`, `isToggling`, `lastError`) gestionado por `ReactionNotifier`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se registre una nueva reacción (Like/Comentario) en un elemento, el sistema deberá notificar al `ReactionNotifier` para actualizar la UI sin recargar toda la página.

#### 3. Requerimientos Controlados por Estados
- Mientras `ReactionState.isToggling == true`, el sistema deberá reflejar visualmente el estado pendiente en el control de reacción afectado.

#### 4. Requerimientos de Comportamiento No Deseado
- Si el toggle de reacción falla, entonces el sistema deberá exponer el error en `ReactionState.lastError` y revertir el estado visual de la reacción.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de reacciones personalizadas (emojis) esté incluida, el sistema deberá permitir al usuario elegir el tipo de reacción antes de confirmar.

#### 6. Requerimientos Complejos
- Mientras el usuario visualiza el feed, cuando pulse el botón de reacción, el sistema deberá alternar (`toggle`) el estado de la reacción sin recargar el feed.

---

## Épica 4: Repositorio y Persistencia de Actividades
Como plataforma, quiero abstraer la persistencia del feed en un repositorio intercambiable (in-memory ↔ backend), para permitir desarrollo sin backend y despliegue contra CouchDB sin acoplar la UI.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer el contrato `ActivityRepository` con las operaciones `recentFeed(query)`, `getById(id)`, `create(activity)`, `delete(id)`.
- El sistema deberá exponer el repositorio vía `activityRepositoryProvider` (Riverpod `Provider`).

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `recentFeed(ActivityQuery)`, el sistema deberá filtrar por `actorId` (si no es nulo) y aplicar `limit` devolviendo la lista ordenada por `createdAt` descendente.

#### 3. Requerimientos Controlados por Estados
- Mientras el `ActivityEngine` esté inicializado, el sistema deberá mantener una referencia al `ActivityRepository` (`ActivityEngine(this.activityRepository)`); el cuerpo de `initialize()` está pendiente de implementación.

#### 4. Requerimientos de Comportamiento No Deseado
- Si se busca `getById(id)` y la actividad no existe, entonces el sistema deberá devolver `null` (sin lanzar excepción).

#### 5. Requerimientos de Funciones Opcionales
- Donde la implementación in-memory esté incluida (`InMemoryActivitiesRepository` con `seed`), el sistema deberá insertar los nuevos registros al inicio de la lista y permitir operar fuera de línea.

#### 6. Requerimientos Complejos
- Mientras la BD CouchDB esté disponible, cuando `activityRepositoryProvider` se resuelva, el sistema deberá entregar un `ActivityRepository` conectado al backend Express/nano en lugar de la implementación en memoria.

---

## Notas de Estado del Módulo
- **Cascarones:**
  - `ActivityFeedPage` muestra únicamente `Text('Feed')`.
  - `ActivityEngine.initialize()` está vacío.
  - `ReactionNotifier` y `ConversationNotifier` solo implementan `build()` sin lógica.
  - `FeedNotifier.load` actualiza estado pero **no llama** al repositorio (no completa `activities`).
- **Implementaciones reales:**
  - `ConversationPage` tiene UI funcional (AppBar, TextField, botón de envío con validación de vacío y limpieza del controller).
  - `SocialActivityTile` widget funcional (`ListTile` con título, subtítulo y `trailing`).
  - `InMemoryActivitiesRepository` (en archivo independiente `in_memory_activities_repository.dart`) tiene CRUD funcional con `seed` y ordenamiento.
  - `FeedState`/`ConversationState`/`ReactionState` con `copyWith`.
- **Doble definición `InMemoryActivitiesRepository`:**
  - `repositories\activity_repository.dart` (cascarón: `recentFeed → []`, `getById → null`, `create → activity`, `delete → {}`).
  - `repositories\in_memory_activities_repository.dart` (real, `final class` con `seed` y `_items`).
  El `activityRepositoryProvider` en `activity_repository.dart` resuelve al cascarón. **Inconsistencia: el provider no usa la implementación real.** Deuda técnica.
- **Duplicación interna:** `lib\activity\activity\` (11 archivos) replica el árbol plano con diferencias triviales en `SocialActivity` (formato) y `ActivityContract` (añade `const` constructor). Anotado para D14/Fase IV.
