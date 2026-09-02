# Inventario Técnico y Tareas — Módulo Features

**Ruta código:** `lib\features\` (8 archivos `.dart`, sin árbol anidado duplicado)

---

## Tabla A — Inventario de Componentes

| Subdirectorio | Archivo | Tipo de componente | Nombre del componente | Parámetros que requiere | Variables que utiliza | Variables internas | Estilos que le aplican |
|---|---|---|---|---|---|---|---|
| `account/pages` | `account_page.dart` | Widget (UI) | `AccountPage` (Pendiente) | `key` | `context` | — | Scaffold, Center, Text |
| `account/repositories` | `account_repository.dart` | Interfaz/Repositorio | `AccountRepository` (abstract) | — | — | — | N/A |
| `auth/pages` | `login_page.dart` | Widget (UI) | `LoginPage` | `key` | `ref`, `context` | `_LoginPageState` | Scaffold, AppBar, Padding, Column, TextField, SizedBox, Text, ElevatedButton, CircularProgressIndicator |
| `auth/pages` | `login_page.dart` | State | `_LoginPageState` | — | `_identifierController`, `_secretController`, `_loading`, `_error` | — | TextEditingController, InputDecoration |
| `catalog/pages` | `catalog_page.dart` | Widget (UI) | `CatalogPage` | `key` | `ref`, `repo`, `items` | — | Scaffold, AppBar, Column, ListTile, Padding, Text, Expanded, FutureBuilder, ListView, CircularProgressIndicator |
| `chat/pages` | `chat_page.dart` | Widget (UI) | `ChatPage` | `key` | `ref`, `state`, `groups` | — | Scaffold, AppBar, Center, CircularProgressIndicator, ListView, ListTile, Text |
| `feed/pages` | `feed_page.dart` | Widget (UI) | `FeedPage` | `key` | `ref`, `activities` | — | Scaffold, AppBar, FutureBuilder, Center, CircularProgressIndicator, ListView, ListTile, Text |
| `home/pages` | `home_page.dart` | Widget (UI) | `HomePage` (Pendiente) | `key` | `context` | — | Scaffold, Center, Text |
| `profile/pages` | `profile_page.dart` | Widget (UI) | `ProfilePage` | `key` | `ref`, `session`, `userId` | — | Scaffold, AppBar, ListView, Padding, ListTile, Icon, SizedBox, Text |

---

## Tabla B — Inventario de Elementos Internos

| Subdirectorio | Archivo | Variables definidas en el archivo | Clases | Variables de la clase | Funciones/Widgets definidos en la clase | Variables que utiliza | Llamadas a otras clases/widgets |
|---|---|---|---|---|---|---|---|
| `account/pages` | `account_page.dart` | — | `AccountPage` (StatelessWidget) | — | `build(context)` → Scaffold/Center/Text | — | `Scaffold`, `Center`, `Text` |
| `account/repositories` | `account_repository.dart` | — | `AccountRepository` (abstract) | — | `createAccount(user, secret)`, `getAccount(userId)`, `updateAccount(user)`, `deleteAccount(userId)` (abstract) | — | `SocialUser` (de `identity`) |
| `auth/pages` | `login_page.dart` | — | `LoginPage` (ConsumerStatefulWidget) | — | `createState()` → `_LoginPageState` | — | `ConsumerState` |
| `auth/pages` | `login_page.dart` | — | `_LoginPageState` | `_identifierController`, `_secretController`, `_loading`, `_error` | `_login()`, `build(context)` → Scaffold/AppBar/Padding/Column | `_identifierController.text.trim()`, `Future.delayed`, `ref.read(sessionProvider.notifier).state`, `Navigator.of(context).pushReplacement`, `MainShell`, `mounted` | `TextEditingController`, `Scaffold`, `AppBar`, `TextField`, `ElevatedButton`, `CircularProgressIndicator`, `sessionProvider`, `MainShell`, `MaterialPageRoute` |
| `catalog/pages` | `catalog_page.dart` | — | `CatalogPage` (ConsumerWidget) | — | `build(context, ref)` → Scaffold/Column/FutureBuilder | `ref.watch(catalogRepositoryProvider)`, `repo.search('motor', limit: 10)`, `snapshot.connectionState`, `snapshot.hasError`, `snapshot.data`, `preferredType` | `catalogRepositoryProvider`, `SocialObjectQuery`, `Scaffold`, `FutureBuilder`, `ListView`, `ListTile`, `CircularProgressIndicator` |
| `chat/pages` | `chat_page.dart` | — | `ChatPage` (ConsumerWidget) | — | `build(context, ref)` → Scaffold/condicional/ListView | `ref.watch(groupProvider)`, `state.groups`, `state.isLoading`, `state.error`, `group.name`, `group.isPublic` | `groupProvider` (Social Graph), `Scaffold`, `ListView`, `ListTile`, `CircularProgressIndicator` |
| `feed/pages` | `feed_page.dart` | — | `FeedPage` (ConsumerWidget) | — | `build(context, ref)` → Scaffold/FutureBuilder | `ref.watch(activityRepositoryProvider).recentFeed(ActivityQuery(limit:10))`, `snapshot.data`, `item.actorName`, `item.verb`, `item.objectId` | `activityRepositoryProvider`, `ActivityQuery`, `SocialActivity`, `Scaffold`, `FutureBuilder`, `ListView`, `ListTile` |
| `home/pages` | `home_page.dart` | — | `HomePage` (StatelessWidget) | — | `build(context)` → Scaffold/Center/Text | — | `Scaffold`, `Center`, `Text` |
| `profile/pages` | `profile_page.dart` | — | `ProfilePage` (ConsumerWidget) | — | `build(context, ref)` → Scaffold/ListView | `ref.watch(sessionProvider)`, `session['userId']`, `'desconocido'` | `sessionProvider` (Core), `Scaffold`, `ListView`, `ListTile`, `Icon` |

---

## Duplicaciones / Inconsistencias Detectadas

1. **Irregularidades M3:** `LoginPage` usa `ElevatedButton` (debería `FilledButton`); `CatalogPage`/`FeedPage`/`ChatPage`/`LoginPage` no aplican `appTheme` ColorScheme (regla crítica de AGENTS.md).
2. **`LoginPage._login()` es simulación** (`Future.delayed(600ms)`, `token_local` harcodeado) — no integra Identity real.
3. **`AccountRepository` abstract sin implementación concreta** — consume `SocialUser` de Identity pero no lo cablea.
4. **`CatalogPage` retorna `List<SocialObjectQuery>`** (llama a `search` que curiosamente retorna queries, no items — posible bug de contrato de Catalog).
5. **`MainShell`** referenciado desde `LoginPage` proviene de `lib\core\app_shell.dart` (placeholder `Scaffold(Text('MotorSocial'))` según D1 Core).
6. **Cascarones:** `HomePage` (mensaje estático), `AccountPage` (placeholder).
7. **Sin árbol anidado duplicado.**
8. **Cross-module dependencies:** Features depende de Core (`sessionProvider`), Identity (`SocialUser`), Catalog (`catalogRepositoryProvider`), Activity (`activityRepositoryProvider`), Social Graph (`groupProvider`). Es la capa de integración/agregación.
