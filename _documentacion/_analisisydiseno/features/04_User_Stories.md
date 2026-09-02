# User Stories — Módulo Features

**Metodología:** 3 C's (Card, Conversation, Confirmation)
**Features fuente:** `03_Features.feature`

---

## US-FEAT-001 — Autenticación y Arranque de Sesión

### Card
Como usuario, quiero iniciar sesión, para acceder a las funciones privadas de la plataforma.

### Conversation
- `LoginPage` (ConsumerStatefulWidget) con `_identifierController`, `_secretController`, `_loading`, `_error`.
- `_login()` simula auth con `Future.delayed(600ms)`; si `userId` no vacío, genera `token_local`, escribe `sessionProvider` (`{userId, token}`) y navega a `MainShell` con `pushReplacement`.
- Usa `if (mounted) setState` tras cada `await` (cumple regla crítica).
- Usa `ElevatedButton` (debería `FilledButton` M3).

### Confirmation (Criterios de Aceptación)
- ✓ Identificador no vacío → escribe `sessionProvider` y navega a `MainShell`.
- ✓ Identificador vacío → muestra "Credenciales inválidas".
- ✓ `_loading == true` deshabilita el botón y muestra `CircularProgressIndicator`.
- ✓ Tras cada await se comprueba `mounted` antes de `setState`/`Navigator`.

---

## US-FEAT-002 — Feed de Actividad Integrado

### Card
Como usuario autenticado, quiero ver un feed de actividades, para consumir el módulo Activity en un caso de uso real.

### Conversation
- `FeedPage` observa `activityRepositoryProvider` e invoca `recentFeed(ActivityQuery(limit: 10))`.
- `FutureBuilder<List<SocialActivity>>` maneja waiting/error/empty/data.
- Cada `ListTile` muestra `actorName` (título) y "verb -> objectId" (subtítulo).

### Confirmation (Criterios de Aceptación)
- ✓ Waiting → `CircularProgressIndicator`.
- ✓ Error → "Error: `<error>`".
- ✓ Vacío → "Sin actividad."
- ✓ Datos → `ListView` con `ListTile(actorName, "verb -> objectId")`.

---

## US-FEAT-003 — Catálogo Integrado

### Card
Como usuario, quiero ver el catálogo, para consumir el módulo Catalog.

### Conversation
- `CatalogPage` observa `catalogRepositoryProvider` e invoca `repo.search('motor', limit: 10)`.
- `FutureBuilder<List<SocialObjectQuery>>` maneja estados; `ListTile` muestra "Objeto N" y `preferredType ?? 'tipo sin definir'`.
- Incluye `ListTile`/`Text` de "Catálogo social integrado" y "Caso de uso aislado: catálogo en modo staging."

### Confirmation (Criterios de Aceptación)
- ✓ Waiting → `CircularProgressIndicator`.
- ✓ Error → "Error: `<error>`".
- ✓ Vacío → "Sin resultados."
- ✓ Datos → `ListView` con "Objeto N" y `preferredType`.

---

## US-FEAT-004 — Chat/Grupos Integrado

### Card
Como usuario, quiero ver mis grupos, para consumir el módulo Social Graph.

### Conversation
- `ChatPage` observa `groupProvider` (de Social Graph); lee `state.groups`.
- Maneja `isLoading`/`error`/empty/data con renderizado condicional.
- `ListTile` muestra `group.name` y `group.isPublic ? 'Público' : 'Privado'`.

### Confirmation (Criterios de Aceptación)
- ✓ `isLoading` → `CircularProgressIndicator`.
- ✓ `error != null` → "Error: `<error>`".
- ✓ Vacío → "Sin grupos."
- ✓ Datos → `ListView` con `group.name` y "Público"/"Privado".

---

## US-FEAT-005 — Perfil y Sesión

### Card
Como usuario autenticado, quiero ver mi perfil, para consultar mi sesión activa.

### Conversation
- `ProfilePage` observa `sessionProvider` (de Core) y lee `session['userId'] ?? 'desconocido'`.
- Muestra `ListTile(person, userId, 'Usuario activo en sesión')` y "Conectado a SocialIdentityContract."
- `HomePage` muestra "Red social básica en ejecución."

### Confirmation (Criterios de Aceptación)
- ✓ `ProfilePage` muestra `userId` o "desconocido".
- ✓ `HomePage` muestra "Red social básica en ejecución."

---

## US-FEAT-006 — Gestión de Cuenta

### Card
Como usuario, quiero gestionar mi cuenta (crear/obtener/actualizar/eliminar), para administrar mi identidad en la plataforma.

### Conversation
- `AccountRepository` (abstract) define `createAccount(SocialUser, secret)→Future<int>`, `getAccount(userId)→Future<SocialUser?>`, `updateAccount(SocialUser)→Future<int>`, `deleteAccount(userId)→Future<int>`.
- `AccountPage` es placeholder "Caso de uso aislado: cuenta todavía no integrada."
- No hay implementación concreta del repositorio (abstract sin impl).

### Confirmation (Criterios de Aceptación)
- ✓ `AccountPage` muestra el placeholder de no integración.
- ✓ `AccountRepository` expone las 4 operaciones CRUD.
