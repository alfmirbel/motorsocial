# User Stories — Módulo Navigation

**Metodología:** 3 C's (Card, Conversation, Confirmation)
**Features fuente:** `03_Features.feature`

---

## US-NAV-001 — Shell de Aplicación y Navegación Inferior

### Card
Como usuario, quiero un shell de app con barra de navegación inferior que cambie entre las secciones principales, para moverme por la app sin fricciones.

### Conversation
- `SocialScaffold` (ConsumerWidget) con `body` req, `tabs?`, `initialIndex` def 0.
- Observa `bottomIndexProvider` y renderiza `BottomNavigationBar` con `BottomNavigationBarItem(icon: Icons.circle, label: item.title)` por cada `SocialMenuItem` en `tabs`.
- `onTap(i)`: valida rango; actualiza `bottomIndexProvider`; `pushReplacementNamed(items[i].route)` si no vacío.
- `SocialMenuItem` (`title`, `route`, `enabled` def `true`).

### Confirmation (Criterios de Aceptación)
- ✓ Con `tabs` no vacío, aparece `BottomNavigationBar` con un item por `SocialMenuItem`.
- ✓ Con `tabs` vacío/nulo, no aparece barra inferior.
- ✓ Pulsar un item actualiza `bottomIndexProvider` y navega a su `route` con `pushReplacementNamed`.
- ✓ Pulsar un índice fuera de rango se ignora.

---

## US-NAV-002 — Enrutamiento de la Aplicación

### Card
Como plataforma, quiero un enrutador estático que mapee nombres de ruta a páginas, para centralizar la navegación (sin GoRouter).

### Conversation
- `AppRouter` define constantes `home='/'`, `login='/login'`, `catalog='/catalog'`, `feed='/feed'`, `profile='/profile'`.
- `routeFor(name)` es un switch que devuelve `MaterialPageRoute` a `_PlaceholderPage(title, routeName)` para rutas conocidas, o a `_NotFoundPage(routeName)` para desconocidas.
- `routes()` devuelve `[routeFor(home)]`.
- Las rutas conocidas aún renderizan `_PlaceholderPage` (no las páginas reales).

### Confirmation (Criterios de Aceptación)
- ✓ `routeFor("/feed")` devuelve `MaterialPageRoute` a `_PlaceholderPage(title: "Feed")`.
- ✓ `routeFor("/desconocida")` devuelve `MaterialPageRoute` a `_NotFoundPage`.
- ✓ `_NotFoundPage` muestra "No encontrado" y el nombre de la ruta.
- ✓ `routes()` devuelve la lista con `routeFor(home)`.

---

## US-NAV-003 — Guardias de Ruta y Autenticación

### Card
Como plataforma, quiero una guardia que redirija a `/login` a usuarios no autenticados, para proteger las rutas privadas.

### Conversation
- `RouteGuard.canAccess(context, route) → Future<bool>` es async.
- `publicRoutes = {AppRouter.login}`; retorna `true` para rutas públicas.
- Para rutas privadas, llama `await _isLoggedIn()` (stub TODO que devuelve `true`).
- Si no autenticado y `context.mounted`, hace `Navigator.of(context).pushReplacementNamed(AppRouter.login)` y retorna `false`.
- Usa `context.mounted` tras el await (cumple regla crítica de AGENTS.md).

### Confirmation (Criterios de Aceptación)
- ✓ `canAccess(context, "/login")` devuelve `true` sin verificar sesión.
- ✓ Con `_isLoggedIn() == false` y `context.mounted`, redirige a `/login` y devuelve `false`.
- ✓ Con `_isLoggedIn() == false` y `context.mounted == false`, devuelve `false` y NO llama `Navigator`.
- ✓ Con `_isLoggedIn() == true`, devuelve `true` sin redirigir.

---

## US-NAV-004 — Estado de Menú y Tabs

### Card
Como desarrollador, quiero estado observable para los items de menú y el índice seleccionado, para cablear la navegación reactivamente.

### Conversation
- `TabMenuNotifier` extiende `StateNotifier<TabMenuState>` (Riverpod clásico).
- `selectItem(index)` valida rango y actualiza `selectedIndex`.
- `setEnabled(index, enabled)` reemplaza el item por uno nuevo con `enabled` actualizado.
- `selected()` devuelve `items[selectedIndex]`; `enabledItems` filtra `where((item) => item.enabled)`.
- Providers: `activeRouteProvider` (def `'/'`), `drawerIndexProvider` (def 0), `bottomIndexProvider` (def 0).

### Confirmation (Criterios de Aceptación)
- ✓ `selectItem(2)` con items válidos actualiza `selectedIndex` a 2 y `selected()` devuelve el item 2.
- ✓ `selectItem(5)` con 2 items deja `selectedIndex` sin cambios.
- ✓ `setEnabled(1, false)` reemplaza el item y `enabledItems` lo excluye.
- ✓ `activeRouteProvider`/`drawerIndexProvider`/`bottomIndexProvider` resuelven `'/'`/`0`/`0` por defecto.
