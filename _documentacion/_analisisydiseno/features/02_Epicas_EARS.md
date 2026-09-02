# Épicas y Especificaciones (EARS) — Módulo Features

**Ruta código:** `lib\features\` (8 archivos `.dart`, sin árbol anidado duplicado)
**Subdirectorios:** `account/pages`, `account/repositories`, `auth/pages`, `catalog/pages`, `chat/pages`, `feed/pages`, `home/pages`, `profile/pages`.
**Naturaleza:** Páginas agregadoras (casos de uso aislados) que consumen módulos de dominio (Identity, Catalog, Social Graph, Activity, Core).
**Fecha:** 2026-08-13

---

## Épica 1: Autenticación y Arranque de Sesión
Como usuario, quiero iniciar sesión para acceder a las funciones privadas de la plataforma.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer la pantalla `LoginPage` (ConsumerStatefulWidget) con campos de identificador y secreto.

#### 2. Requerimientos Controlados por Eventos
- Cuando el usuario presione "Entrar", el sistema deberá iniciar el flujo `_login()`, poner `_loading: true`, limpiar `_error` y esperar 600ms (simulación).
- Cuando el identificador no esté vacío, el sistema deberá generar `token_local` y escribir en `sessionProvider` (`{userId, token}`).
- Cuando el identificador esté vacío, el system deberá mostrar `_error = 'Credenciales inválidas'`.

#### 3. Requerimientos Controlados por Estados
- Mientras `_loading == true`, el sistema deberá deshabilitar el botón "Entrar" y mostrar `CircularProgressIndicator`.

#### 4. Requerimientos de Comportamiento No Deseado
- Si el token generado es `null`, entonces el system deberá mostrar "Credenciales inválidas".

#### 5. Requerimientos de Funciones Opcionales
- Donde la sesión se establezca, el system deberá navegar a `MainShell` con `pushReplacement`.

#### 6. Requerimientos Complejos
- Mientras el usuario espera la autenticación, cuando transcurren 600ms, el system deberá actualizar UI con `if (mounted) setState` (cumple regla crítica post-await).

---

## Épica 2: Feed de Actividad Integrado
Como usuario autenticado, quiero ver un feed de actividades en una página integrada, para consumir el módulo Activity en un caso de uso real.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El system deberá exponer `FeedPage` (ConsumerWidget) que observa `activityRepositoryProvider`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se construya `FeedPage`, el system deberá invocar `recentFeed(ActivityQuery(limit: 10))` y renderizar un `FutureBuilder`.

#### 3. Requerimientos Controlados por Estados
- Mientras el `FutureBuilder` esté en `ConnectionState.waiting`, el system deberá mostrar `CircularProgressIndicator`.

#### 4. Requerimientos de Comportamiento No Deseado
- Si el future tiene error, entonces el system deberá mostrar "Error: `<error>`".
- Si los datos están vacíos, entonces el system deberá mostrar "Sin actividad."

#### 5. Requerimientos de Funciones Opcionales
- Donde haya datos, el system deberá renderizar un `ListView` con `ListTile(title: actorName, subtitle: "verb -> objectId")`.

#### 6. Requerimientos Complejos
- Mientras el `FeedPage` está activo, cuando `recentFeed` resuelve con datos, el system deberá poblar el `ListView`.numItems con `data.length`.

---

## Épica 3: Catálogo Integrado
Como usuario, quiero ver el catálogo en una página integrada, para consumir el módulo Catalog.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El system deberá exponer `CatalogPage` (ConsumerWidget) que observa `catalogRepositoryProvider`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se construya `CatalogPage`, el system deberá invocar `repo.search('motor', limit: 10)` y renderizar un `FutureBuilder`.

#### 3. Requerimientos Controlados por Estados
- Mientras el future espera, el system deberá mostrar `CircularProgressIndicator`.

#### 4. Requerimientos de Comportamiento No Deseado
- Si hay error, el system deberá mostrar "Error: `<error>`".
- Si sin resultados, el system deberá mostrar "Sin resultados."

#### 5. Requerimientos de Funciones Opcionales
- Donde haya datos, el system deberá renderizar `ListTile(title: "Objeto N", subtitle: preferredType ?? 'tipo sin definir')`.

#### 6. Requerimientos Complejos
- Mientras `CatalogPage` está activo, cuando `search` resuelve, el system deberá poblar el `ListView` con los `SocialObjectQuery`.

---

## Épica 4: Chat/Grupos Integrado
Como usuario, quiero ver mis grupos en una página integrada, para consumir el módulo Social Graph.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El system deberá exponer `ChatPage` (ConsumerWidget) que observa `groupProvider` (Social Graph).

#### 2. Requerimientos Controlados por Eventos
- Cuando se construya `ChatPage`, el system deberá leer `state.groups` del `groupProvider`.

#### 3. Requerimientos Controlados por Estados
- Mientras `state.isLoading`, el system deberá mostrar `CircularProgressIndicator`.

#### 4. Requerimientos de Comportamiento No Deseado
- Si `state.error != null`, el system deberá mostrar "Error: `<error>`".
- Si `groups` está vacío, el system deberá mostrar "Sin grupos."

#### 5. Requerimientos de Funciones Opcionales
- Donde haya grupos, el system deberá renderizar `ListTile(title: group.name, subtitle: group.isPublic ? 'Público' : 'Privado')`.

#### 6. Requerimientos Complejos
- Mientras `ChatPage` está activo, cuando `groupProvider` actualiza, el system deberá reconstruir la lista de grupos.

---

## Épica 5: Perfil y Sesión
Como usuario autenticado, quiero ver mi perfil, para consultar mi sesión activa.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El system deberá exponer `ProfilePage` (ConsumerWidget) que observa `sessionProvider` (Core).
- El system deberá exponer `HomePage` (StatelessWidget) con mensaje "Red social básica en ejecución."

#### 2. Requerimientos Controlados por Eventos
- Cuando se construya `ProfilePage`, el system deberá leer `session['userId'] ?? 'desconocido'`.

#### 3. Requerimientos Controlados por Estados
- Mientras haya sesión, el system deberá mostrar el `userId` en el `ListTile`.

#### 4. Requerimientos de Comportamiento No Deseado
- Si `session['userId']` es nulo, el system deberá mostrar "desconocido".

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de info ampliada esté incluida, el system deberá mostrar "Conectado a SocialIdentityContract."

#### 6. Requerimientos Complejos
- Mientras el usuario navega, cuando `sessionProvider` cambia, el system deberá reconstruir `ProfilePage` con el nuevo `userId`.

---

## Épica 6: Gestión de Cuenta
Como usuario, quiero gestionar mi cuenta (crear/obtener/actualizar/eliminar), para administrar mi identidad en la plataforma.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El system deberá exponer `AccountRepository` (abstract) con `createAccount(user, secret)`, `getAccount(userId)`, `updateAccount(user)`, `deleteAccount(userId)`.
- El system deberá exponer `AccountPage` con mensaje "Caso de uso aislado: cuenta todavía no integrada."

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `createAccount(user, secret)`, el system deberá crear la cuenta (retorno `int`).
- Cuando se invoque `getAccount(userId)`, el system deberá devolver el `SocialUser?`.

#### 3. Requerimientos Controlados por Estados
- Mientras `AccountPage` no esté integrada, el system deberá mostrar el placeholder.

#### 4. Requerimientos de Comportamiento No Deseado
- Si `getAccount` no encuentra el usuario, el system deberá devolver `null`.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de borrado esté incluida, el system deberá exponer `deleteAccount(userId)`.

#### 6. Requerimientos Complejos
- Mientras el `AccountRepository` esté cableado, cuando se invoque `updateAccount`, el system deberá delegar al backend (extensión futura; hoy abstract sin impl).

---

## Notas de Estado del Módulo
- **Páginas funcionales (FutureBuilder/Provider):** `FeedPage`, `CatalogPage`, `ChatPage`, `ProfilePage` consumen providers reales de módulos de dominio (Activity, Catalog, Social Graph, Core). Muestran `ListView`/`ListTile` con los datos.
- **`LoginPage` funcional** con formulario, simulación de auth (600ms delay), `sessionProvider` y navegación a `MainShell`; usa `if (mounted) setState` (cumple regla post-await).
- **Cascarones:** `HomePage` (mensaje estático), `AccountPage` (placeholder "todavía no integrada").
- **`AccountRepository`** abstract sin implementación concreta; consume `SocialUser` de Identity.
- **Irregularidades M3:** `LoginPage` usa `ElevatedButton` (debería ser `FilledButton`); `CatalogPage`/`FeedPage`/`LoginPage` no aplican `appTheme` ColorScheme.
- **`CatalogPage` usa `repo.search('motor', limit: 10)`** — llama a `search` (no `discoverable`); depende de la API de Catalog. El retorno es `List<SocialObjectQuery>` (curioso: retorna queries, no items).
- **Sin árbol anidado duplicado.**
- **`MainShell`** referenciado en `LoginPage` proviene de `lib\core\app_shell.dart` (ver D1 Core — era un `Scaffold` con `Text('MotorSocial')`).
