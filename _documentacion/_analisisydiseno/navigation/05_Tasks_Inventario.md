# Inventario Técnico y Tareas — Módulo Navigation

**Ruta código:** `lib\navigation\` (14 archivos `.dart`: 7 planos + 7 anidados en `lib\navigation\navigation\`, idénticos)
**Inventario basado en el árbol plano** `lib\navigation\` (canónico).

---

## Tabla A — Inventario de Componentes

| Subdirectorio | Archivo | Tipo de componente | Nombre del componente | Parámetros que requiere | Variables que utiliza | Variables internas | Estilos que le aplican |
|---|---|---|---|---|---|---|---|
| (raíz) | `navigation.dart` | Barrel | — | N/A | — | — | N/A |
| `data_models` | `menu_item.dart` | Clase de Datos | `SocialMenuItem` | `title`, `route`, `enabled` (def `true`) | — | — | N/A |
| `data_models` | `navigation_contract.dart` | Marker | `NavigationContract` | (vacía, sin `const`) | — | — | N/A |
| `providers` | `tab_menu_notifier.dart` | Clase de Estado | `TabMenuState` | `items` (List<SocialMenuItem>), `selectedIndex` (int) | — | — | N/A |
| `providers` | `tab_menu_notifier.dart` | Riverpod Provider | `TabMenuNotifier` (StateNotifier) | `items` (req), `initialIndex` (def 0) | — | — | N/A |
| `providers` | `tab_menu_notifier.dart` | Provider (StateProvider) | `activeRouteProvider` | N/A | — | — | N/A |
| `providers` | `tab_menu_notifier.dart` | Provider (StateProvider) | `drawerIndexProvider` | N/A | — | — | N/A |
| `providers` | `tab_menu_notifier.dart` | Provider (StateProvider) | `bottomIndexProvider` | N/A | — | — | N/A |
| `routing` | `app_router.dart` | Enrutador | `AppRouter` | — | — | — | MaterialPageRoute |
| `routing` | `app_router.dart` | Widget (UI) | `_PlaceholderPage` (private) | `title`, `routeName` (req) | `title`, `routeName` | — | Scaffold, AppBar, Center, Text |
| `routing` | `app_router.dart` | Widget (UI) | `_NotFoundPage` (private) | `routeName` (req) | `routeName` | — | Scaffold, AppBar, Center, Text |
| `routing` | `route_guard.dart` | Guardia | `RouteGuard` | — | — | — | N/A |
| `routing` | `route_guard.dart` | Método (Pendiente) | `_isLoggedIn()` (private stub) | — | — | — | N/A |
| `shell` | `social_scaffold.dart` | Widget (UI) | `SocialScaffold` | `key`, `body` (req), `tabs?`, `initialIndex` (def 0) | `ref`, `index`, `items` | — | Scaffold, AppBar, BottomNavigationBar, BottomNavigationBarItem, Icon |

---

## Tabla B — Inventario de Elementos Internos

| Subdirectorio | Archivo | Variables definidas en el archivo | Clases | Variables de la clase | Funciones/Widgets definidos en la clase | Variables que utiliza | Llamadas a otras clases/widgets |
|---|---|---|---|---|---|---|---|
| (raíz) | `navigation.dart` | — | — | — | export `data_models/menu_item.dart`, `data_models/navigation_contract.dart`, `providers/tab_menu_notifier.dart`, `routing/app_router.dart`, `routing/route_guard.dart`, `shell/social_scaffold.dart` | — | barrel |
| `data_models` | `menu_item.dart` | — | `SocialMenuItem` | `title`, `route`, `enabled` | `const SocialMenuItem(...)` | — | — |
| `data_models` | `navigation_contract.dart` | — | `NavigationContract` | — | (vacía, sin `const`) | — | — |
| `providers` | `tab_menu_notifier.dart` | `activeRouteProvider`, `drawerIndexProvider`, `bottomIndexProvider` | `TabMenuState` | `items`, `selectedIndex` | `const TabMenuState(...)`, `copyWith` | — | `SocialMenuItem` |
| `providers` | `tab_menu_notifier.dart` | — | `TabMenuNotifier` (StateNotifier) | — | `selectItem(index)`, `setEnabled(index, enabled)`, `selected()`, `enabledItems` (getter) | `state.items`, `state.copyWith`, `state.selectedIndex`, `List<SocialMenuItem>.from`, `.where` | `StateNotifier`, `TabMenuState`, `SocialMenuItem` |
| `routing` | `app_router.dart` | — | `AppRouter` | — | constantes `home`/`login`/`catalog`/`feed`/`profile`, `routeFor(name)`, `routes()` | `MaterialPageRoute` | `MaterialPageRoute`, `_PlaceholderPage`, `_NotFoundPage` |
| `routing` | `app_router.dart` | — | `_PlaceholderPage` (StatelessWidget) | `title`, `routeName` | `build(context)` → Scaffold/AppBar/Center/Text | `title`, `routeName` | `Scaffold`, `AppBar`, `Center`, `Text` |
| `routing` | `app_router.dart` | — | `_NotFoundPage` (StatelessWidget) | `routeName` | `build(context)` → Scaffold/AppBar/Center/Text | `routeName` | `Scaffold`, `AppBar`, `Center`, `Text` |
| `routing` | `route_guard.dart` | — | `RouteGuard` | — | `canAccess(context, route)` async, `_isLoggedIn()` async (stub) | `publicRoutes`, `AppRouter.login`, `context.mounted`, `Navigator.of(context).pushReplacementNamed` | `AppRouter`, `Navigator` |
| `shell` | `social_scaffold.dart` | — | `SocialScaffold` (ConsumerWidget) | `body`, `tabs`, `initialIndex` | `build(context, ref)` → Scaffold/AppBar/body/BottomNavigationBar | `ref.watch(bottomIndexProvider)`, `ref.read(bottomIndexProvider.notifier).state`, `items[i].route`, `Navigator.of(context).pushReplacementNamed` | `Scaffold`, `AppBar`, `BottomNavigationBar`, `BottomNavigationBarItem`, `Icon`, `Navigator`, `bottomIndexProvider`, `SocialMenuItem` |

---

## Duplicaciones / Inconsistencias Detectadas

1. **Usa `BottomNavigationBar`** (no `NavigationBar` M3) — viola regla crítica de AGENTS.md ("M3 widgets: `NavigationBar` (not `BottomNavigationBar`)").
2. **Usa `StateNotifier`/`StateProvider`** (Riverpod clásico) para `TabMenuNotifier` y los providers de índice; otros módulos usan `Notifier`/`NotifierProvider` (Riverpod 3). Inconsistencia.
3. **`_isLoggedIn()` es stub TODO** que siempre devuelve `true` — la guardia no protege rutas en la práctica; cablear al repositorio de sesión (Identity).
4. **`_PlaceholderPage`/`_NotFoundPage`** privadas; las rutas conocidas no renderizan las páginas reales de cada módulo.
5. **Inconsistencia con AGENTS.md:** el plan cita `AppRoutes.routeGenerate()` como `onGenerateRoute` y `setPathUrlStrategy()` en `main.dart`; el `AppRouter.routeFor(name)` actual es un switch estático (no `onGenerateRoute`), y no se ve `setPathUrlStrategy` aquí (probablemente en `main.dart`, fuera de `lib\navigation`).
6. **`NavigationContract`** vacío (sin `const` en el árbol plano; con `const` en el anidado).
7. **Duplicación interna del árbol:** `lib\navigation\navigation\` (7 archivos) es idéntica al árbol plano.
