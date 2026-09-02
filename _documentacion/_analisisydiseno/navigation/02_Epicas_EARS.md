# Épicas y Especificaciones (EARS) — Módulo Navigation

**Ruta código:** `lib\navigation\` (14 archivos `.dart`: 7 planos + 7 anidados en `lib\navigation\navigation\`, idénticos)
**Subdirectorios:** `data_models`, `providers`, `routing`, `shell`, raíz (`navigation.dart` barrel).
**Fecha:** 2026-08-13

---

## Épica 1: Shell de Aplicación y Navegación Inferior
Como usuario, quiero un shell de app con barra de navegación inferior que cambie entre las secciones principales, para moverme por la app sin fricciones.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer el widget `SocialScaffold` (`body` req, `tabs?`, `initialIndex` def 0) como shell de la app.
- El sistema deberá representar un item de menú mediante `SocialMenuItem` (`title`, `route`, `enabled` def `true`).
- El sistema deberá gestionar el índice inferior activo mediante `bottomIndexProvider` (Riverpod `StateProvider<int>`).

#### 2. Requerimientos Controlados por Eventos
- Cuando se construya `SocialScaffold` con `tabs` no vacío, el sistema deberá renderizar un `BottomNavigationBar` con un `BottomNavigationBarItem` por cada `SocialMenuItem`.
- Cuando el usuario pulse un item de la barra inferior, el sistema deberá actualizar `bottomIndexProvider` con el índice pulsado.
- Cuando el `route` del item pulsado no esté vacío, el sistema deberá invocar `Navigator.of(context).pushReplacementNamed(route)`.

#### 3. Requerimientos Controlados por Estados
- Mientras `tabs` sea nulo o vacío, el sistema deberá renderizar el `SocialScaffold` sin barra inferior (`bottomNavigationBar: null`).

#### 4. Requerimientos de Comportamiento No Deseado
- Si el índice pulsado está fuera de rango (`i < 0 || i >= items.length`), entonces el sistema deberá ignorar el evento.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de barra inferior esté incluida, el sistema deberá mostrar `Icons.circle` como icono y `item.title` como etiqueta de cada `BottomNavigationBarItem`.

#### 6. Requerimientos Complejos
- Mientras el usuario navega en el shell, cuando pulse un item de la barra inferior, el sistema deberá actualizar el índice observado y reemplazar la ruta actual por la del item.

---

## Épica 2: Enrutamiento de la Aplicación
Como plataforma, quiero un enrutador estático que mapee nombres de ruta a páginas, para centralizar la navegación (sin GoRouter).

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer `AppRouter` con las constantes de ruta `home='/'`, `login='/login'`, `catalog='/catalog'`, `feed='/feed'`, `profile='/profile'`.
- El sistema deberá exponer `AppRouter.routeFor(name) → Route<dynamic>` que construye la ruta para un nombre dado.

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `routeFor(name)` con un nombre conocido, el sistema deberá devolver un `MaterialPageRoute` a la página correspondiente.
- Cuando se invoque `routeFor(name)` con un nombre desconocido, el sistema deberá devolver un `MaterialPageRoute` a `_NotFoundPage`.

#### 3. Requerimientos Controlados por Estados
- Mientras no haya wiring de páginas reales, el sistema deberá renderizar `_PlaceholderPage` (con `title` y `routeName`) para las rutas conocidas.

#### 4. Requerimientos de Comportamiento No Deseado
- Si la ruta solicitada es desconocida, entonces el sistema deberá mostrar "No encontrado" y el nombre de la ruta.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de rutas iniciales esté incluida, el sistema deberá exponer `AppRouter.routes()` devolviendo `[routeFor(home)]`.

#### 6. Requerimientos Complejos
- Mientras el enrutador esté en uso, cuando se registre una nueva ruta, el sistema deberá ampliar el switch de `routeFor` con el nuevo caso.

---

## Épica 3: Guardias de Ruta y Autenticación
Como plataforma, quiero una guardia que redirija a `/login` a usuarios no autenticados, para proteger las rutas privadas.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer `RouteGuard` con la operación `canAccess(context, route) → Future<bool>`.
- El sistema deberá considerar `/login` como ruta pública (`publicRoutes = {AppRouter.login}`).

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `canAccess(context, route)` para una ruta pública, el sistema deberá devolver `true` inmediatamente.
- Cuando el usuario no esté autenticado y la ruta no sea pública, el sistema deberá redirigir a `/login` vía `Navigator.of(context).pushReplacementNamed(AppRouter.login)` (si `context.mounted`).

#### 3. Requerimientos Controlados por Estados
- Mientras `_isLoggedIn()` devuelva `true` (stub actual), el sistema deberá permitir el acceso a todas las rutas no públicas.

#### 4. Requerimientos de Comportamiento No Deseado
- Si `context` no está montado tras la espera asincrónica, entonces el sistema deberá omitir la redirección (uso de `context.mounted`).

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de roles/permisos esté incluida, el system deberá extender `canAccess` con verificación de permisos por ruta (extensión futura).

#### 6. Requerimientos Complejos
- Mientras el sistema verifica el acceso, cuando `_isLoggedIn()` esté cableado al repositorio de sesión, el system deberá leer el estado real en lugar del stub `true`.

---

## Épica 4: Estado de Menú y Tabs
Como desarrollador, quiero estado observable para los items de menú y el índice seleccionado, para cablear la navegación reactivamente.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer `TabMenuState` (`items: List<SocialMenuItem>`, `selectedIndex`) con `copyWith`.
- El sistema deberá exponer `TabMenuNotifier` (Riverpod `StateNotifier<TabMenuState>`) con `selectItem(index)`, `setEnabled(index, enabled)`, `selected()` y `enabledItems`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `selectItem(index)`, el sistema deberá actualizar `selectedIndex` (si el índice es válido).
- Cuando se invoque `setEnabled(index, enabled)`, el system deberá reemplazar el item en `index` con uno nuevo con `enabled` actualizado.

#### 3. Requerimientos Controlados por Estados
- Mientras `selectedIndex` sea válido, el system deberá mantener `selected()` retornando `items[selectedIndex]`.

#### 4. Requerimientos de Comportamiento No Deseado
- Si `index` está fuera de rango en `selectItem`/`setEnabled`, entonces el system deberá ignorar la operación.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de providers de índice esté incluida, el system deberá exponer `activeRouteProvider` (StateProvider<String>, def `'/'`), `drawerIndexProvider` y `bottomIndexProvider`.

#### 6. Requerimientos Complejos
- Mientras el menú esté activo, cuando se filtre por `enabled`, el system deberá exponer `enabledItems` excluyendo los items deshabilitados.

---

## Notas de Estado del Módulo
- **Componentes funcionales:** `AppRouter.routeFor` (switch con rutas), `RouteGuard.canAccess` (con `context.mounted` y stub `_isLoggedIn()→true`), `SocialScaffold` (shell con `BottomNavigationBar` + `pushReplacementNamed`), `TabMenuNotifier` (`StateNotifier` con `selectItem`/`setEnabled`/`selected`/`enabledItems`).
- **Cascarones:** las rutas conocidas renderizan `_PlaceholderPage` (no las páginas reales de cada módulo); `_isLoggedIn()` es TODO que siempre devuelve `true`.
- **Inconsistencia con AGENTS.md:** el plan cita "Custom `AppRoutes.routeGenerate()` como `onGenerateRoute`" (sin GoRouter, sin Navigator 2.0) en `lib\core_backend_services\07_routes\app_routes.dart` (inexistente). El `AppRouter` actual es un switch estático de `routeFor`, no `onGenerateRoute`. SetPathUrlStrategy (mencionado en AGENTS.md) no se aplica aquí.
- **Usa `BottomNavigationBar`** (no `NavigationBar` M3) — viola regla crítica de AGENTS.md "M3 widgets: `NavigationBar` (not `BottomNavigationBar`)".
- **Usa `StateNotifier`/`StateProvider`** (Riverpod clásico) en lugar de `Notifier`/`NotifierProvider` (Riverpod 3) para `TabMenuNotifier`. Inconsistencia con otros módulos.
- **`NavigationContract`** vacío (sin `const` en el árbol plano; con `const` en el anidado).
- **Duplicación interna del árbol:** `lib\navigation\navigation\` (7 archivos) es idéntica al árbol plano.
