# Inventario Técnico y Tareas - Módulo Identity

> Cobertura: **36 archivos `.dart`** bajo `lib/identity/` (18 en el árbol "outer" + 18 duplicados bajo `lib/identity/identity/`). La columna **Subdirectorio** usa rutas relativas a `lib/`: el árbol outer se nombra con el subdirectorio directo (`data_models`, `pages`, `providers`, `repositories`, `` para el barrel raíz), y el árbol anidado con prefijo `identity\` para distinguirlo (`identity\data_models`, `identity\pages`, `identity\repositories`, `identity\` para su barrel).
> **Divergencias detectadas** (sólo 4 archivos difieren entre el árbol outer y el anidado):
> - `social_identity_contract.dart`: el anidado usa `const AuthState()` en el provider; el outer usa `AuthState()` sin `const`.
> - `login_page.dart` / `register_page.dart`: el anidado importa `AppRouter` con `../../../../navigation/routing/app_router.dart` (4 niveles hacia arriba); el outer usa `../../navigation/routing/app_router.dart`.
> - `auth_repository.dart`: el anidado retorna `const AuthState(...)` en el `StubAuthRepository`; el outer retorna `AuthState(...)` sin `const`.
> En todo lo demás, los 18 archivos del árbol anidado son **idénticos** a sus homólogos del árbol outer. Líneas marcadas "Pendiente" = cascarón/vacío.

---

## Tabla A — Inventario de Componentes

| Subdirectorio | Archivo | Tipo de componente | Nombre del componente | Parámetros que requiere | Variables que utiliza | Variables internas | Estilos que le aplican |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `` (raíz) | `identity.dart` | Barrel / export | `identity` (barrel archivo) | N/A | exporta 13 rutas | N/A | N/A |
| `data_models` | `auth_state.dart` | Clase de Datos | `AuthState` | `isUserDataLoaded`, `errorCode`, `errorMessage`, `isAuthenticated`, `userId`, `accessToken` | N/A | N/A | N/A |
| `data_models` | `identity_models.dart` | Barrel / export | `identity_models` | N/A | exporta `auth_state`, `session_data`, `social_user`, `role_profile` | N/A | N/A |
| `data_models` | `role_profile.dart` | Clase de Datos | `RoleProfile` | `key`, `name`, `permissions` | N/A | N/A | N/A |
| `data_models` | `session_data.dart` | Clase de Datos | `SessionData` | `key`, `token`, `expiresAt`, `payload` | N/A | N/A | N/A |
| `data_models` | `social_identity_contract.dart` | Interfaz/Clase + Provider | `SocialIdentityContract`, `socialIdentityContractProvider` | `authState` | `AuthState` | N/A | N/A |
| `data_models` | `social_user.dart` | Clase de Datos | `SocialUser` | `id`, `displayName`, `photoUrl` | N/A | N/A | N/A |
| `pages` | `login_page.dart` | Widget (UI) | `LoginPage` | `key` (super) | `emailController`, `passwordController`, `ref`, `context`, `state` | N/A | `Scaffold`, `AppBar`, `Padding`, `Column`, `TextField`, `SizedBox`, `ElevatedButton`, `Text`, `InputDecoration` |
| `pages` | `password_recovery_page.dart` | Widget (UI) | `PasswordRecoveryPage` | `key` (super) | `emailController`, `isSaving` (`ValueNotifier<bool>`), `ref`, `context`, `saving` | `isSaving` | `Scaffold`, `AppBar`, `Padding`, `Column`, `TextField`, `SizedBox`, `ValueListenableBuilder`, `ElevatedButton`, `Text`, `SnackBar`, `ScaffoldMessenger` |
| `pages` | `register_page.dart` | Widget (UI) | `RegisterPage` | `key` (super) | `identifierController`, `secretController`, `displayNameController`, `ref`, `context`, `state` | N/A | `Scaffold`, `AppBar`, `Padding`, `Column`, `TextField`, `SizedBox`, `ElevatedButton`, `Text`, `InputDecoration` |
| `providers` | `auth_notifier.dart` | Riverpod Provider (Pendiente) | `AuthNotifier`, `authNotifierProvider` | N/A | N/A | N/A | N/A |
| `providers` | `session_notifier.dart` | Riverpod Provider (Pendiente) | `SessionNotifier`, `sessionNotifierProvider` | N/A | N/A | N/A | N/A |
| `repositories` | `auth_repository.dart` | Repositorio (Interfaz + Stub) | `AuthRepository`, `StubAuthRepository`, `authRepositoryProvider` | `email` (`signIn`), `email`+`password`+`displayName` (`register`), `email` (`recoverPassword`) | `AuthState` | N/A | N/A |
| `repositories` | `auth_notifier.dart` | Riverpod StateProvider | `AuthStateNotifier`, `authStateProvider` | N/A | `AuthState` | N/A | N/A |
| `repositories` | `local_session_repository.dart` | Repositorio (Pendiente) | `LocalSessionRepository`, `localSessionRepositoryProvider` | N/A | `AuthState` | N/A | N/A |
| `repositories` | `session_repository.dart` | Repositorio (Interfaz + Stub) | `SessionRepository`, `StubSessionRepository`, `sessionRepositoryProvider` | `read`/`write`/`clear` | `AuthState`, `userId`, `accessToken` | `_session` (`Map<String,dynamic>`) | N/A |
| `repositories` | `users_repository.dart` | Repositorio (Interfaz + InMemory) | `UsersRepository`, `InMemoryUsersRepository`, `usersRepositoryProvider` | `email` (`findByEmail`), `SocialUser` (`save`) | `SocialUser` | N/A | N/A |
| `` (raíz) | `social_identity_engine.dart` | Lógica/Servicio (Pendiente) | `SocialIdentityEngine` | N/A | N/A | N/A | N/A |
| `identity\` | `identity.dart` | Barrel / export | `identity` (barrel anidado) | N/A | exporta 13 rutas | N/A | N/A |
| `identity\data_models` | `auth_state.dart` | Clase de Datos (dup) | `AuthState` | `isUserDataLoaded`, `errorCode`, `errorMessage`, `isAuthenticated`, `userId`, `accessToken` | N/A | N/A | N/A |
| `identity\data_models` | `identity_models.dart` | Barrel / export (dup) | `identity_models` | N/A | exporta `auth_state`, `session_data`, `social_user`, `role_profile` | N/A | N/A |
| `identity\data_models` | `role_profile.dart` | Clase de Datos (dup) | `RoleProfile` | `key`, `name`, `permissions` | N/A | N/A | N/A |
| `identity\data_models` | `session_data.dart` | Clase de Datos (dup) | `SessionData` | `key`, `token`, `expiresAt`, `payload` | N/A | N/A | N/A |
| `identity\data_models` | `social_identity_contract.dart` | Interfaz/Clase + Provider (divergente) | `SocialIdentityContract`, `socialIdentityContractProvider` | `authState` | `AuthState` (const) | N/A | N/A |
| `identity\data_models` | `social_user.dart` | Clase de Datos (dup) | `SocialUser` | `id`, `displayName`, `photoUrl` | N/A | N/A | N/A |
| `identity\pages` | `login_page.dart` | Widget (UI) (divergente) | `LoginPage` | `key` (super) | `emailController`, `passwordController`, `ref`, `context`, `state` | N/A | `Scaffold`, `AppBar`, `Padding`, `Column`, `TextField`, `SizedBox`, `ElevatedButton`, `Text`, `InputDecoration` |
| `identity\pages` | `password_recovery_page.dart` | Widget (UI) (dup) | `PasswordRecoveryPage` | `key` (super) | `emailController`, `isSaving`, `ref`, `context`, `saving` | `isSaving` | `Scaffold`, `AppBar`, `Padding`, `Column`, `TextField`, `SizedBox`, `ValueListenableBuilder`, `ElevatedButton`, `Text`, `SnackBar`, `ScaffoldMessenger` |
| `identity\pages` | `register_page.dart` | Widget (UI) (divergente) | `RegisterPage` | `key` (super) | `identifierController`, `secretController`, `displayNameController`, `ref`, `context`, `state` | N/A | `Scaffold`, `AppBar`, `Padding`, `Column`, `TextField`, `SizedBox`, `ElevatedButton`, `Text`, `InputDecoration` |
| `identity\providers` | `auth_notifier.dart` | Riverpod Provider (Pendiente, dup) | `AuthNotifier`, `authNotifierProvider` | N/A | N/A | N/A | N/A |
| `identity\providers` | `session_notifier.dart` | Riverpod Provider (Pendiente, dup) | `SessionNotifier`, `sessionNotifierProvider` | N/A | N/A | N/A | N/A |
| `identity\repositories` | `auth_repository.dart` | Repositorio (divergente) | `AuthRepository`, `StubAuthRepository`, `authRepositoryProvider` | `email`, `email`+`password`+`displayName`, `email` | `AuthState` (const) | N/A | N/A |
| `identity\repositories` | `auth_notifier.dart` | Riverpod StateProvider (dup) | `AuthStateNotifier`, `authStateProvider` | N/A | `AuthState` | N/A | N/A |
| `identity\repositories` | `local_session_repository.dart` | Repositorio (Pendiente, dup) | `LocalSessionRepository`, `localSessionRepositoryProvider` | N/A | `AuthState` | N/A | N/A |
| `identity\repositories` | `session_repository.dart` | Repositorio (Interfaz + Stub, dup) | `SessionRepository`, `StubSessionRepository`, `sessionRepositoryProvider` | `read`/`write`/`clear` | `AuthState`, `userId`, `accessToken` | `_session` (`Map<String,dynamic>`) | N/A |
| `identity\repositories` | `users_repository.dart` | Repositorio (Interfaz + InMemory, dup) | `UsersRepository`, `InMemoryUsersRepository`, `usersRepositoryProvider` | `email`, `SocialUser` | `SocialUser` | N/A | N/A |
| `identity\` | `social_identity_engine.dart` | Lógica/Servicio (Pendiente, dup) | `SocialIdentityEngine` | N/A | N/A | N/A | N/A |

---

## Tabla B — Inventario de Elementos Internos

| Subdirectorio | Archivo | Variables definidas en el archivo | Clases | Variables de la clase | Funciones o widgets definidos en la clase | Variables que utiliza | Llamadas a otras clases o widgets |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `` (raíz) | `identity.dart` | ninguna | ninguna (barrel) | N/A | N/A | N/A | export de 13 archivos hijos |
| `data_models` | `auth_state.dart` | ninguna | `AuthState` | `isUserDataLoaded:bool`, `errorCode:String?`, `errorMessage:String?`, `isAuthenticated:bool`, `userId:String?`, `accessToken:String?` | `AuthState(...)` (const ctor), `copyWith(...)` | N/A | ninguna |
| `data_models` | `identity_models.dart` | ninguna | ninguna (barrel) | N/A | N/A | N/A | export de `auth_state`, `session_data`, `social_user`, `role_profile` |
| `data_models` | `role_profile.dart` | ninguna | `RoleProfile` | `key:String`, `name:String`, `permissions:List<String>` | `RoleProfile(...)`, `RoleProfile.fromJson(json)`, `toJson()`, `hasPermission(permission)` | `json`, `permission` | `List<String>` |
| `data_models` | `session_data.dart` | ninguna | `SessionData` | `key:String`, `token:String`, `expiresAt:DateTime`, `payload:Map<String,dynamic>` | `SessionData(...)`, `SessionData.fromJson(json)`, `toJson()`, getter `isExpired` | `json['key']`, `json['sessionKey']`, `json['token']`, `json['accessToken']`, `json['expiresAt']`, `json['payload']` | `DateTime`, `Duration` |
| `data_models` | `social_identity_contract.dart` | `socialIdentityContractProvider` | `SocialIdentityContract` (`@immutable`) | `authState:AuthState` | `SocialIdentityContract({required authState})` | `AuthState` | `Provider`, `AuthState` |
| `data_models` | `social_user.dart` | ninguna | `SocialUser` | `id:String`, `displayName:String`, `photoUrl:String` | `SocialUser({required id, required displayName, required photoUrl})` | N/A | ninguna |
| `pages` | `login_page.dart` | ninguna | `LoginPage` (extiende `ConsumerWidget`) | ninguna de instancia (locales en `build`) | `build(BuildContext, WidgetRef)` | `emailController`, `passwordController`, `repo`, `state` | `Scaffold`, `AppBar`, `Padding`, `Column`, `TextField`, `SizedBox`, `ElevatedButton`, `Text`, `TextEditingController`, `InputDecoration`, `authRepositoryProvider`, `AppRouter.home`, `Navigator.of(context).pushReplacementNamed` |
| `pages` | `password_recovery_page.dart` | ninguna | `PasswordRecoveryPage` (extiende `ConsumerWidget`) | ninguna de instancia | `build(BuildContext, WidgetRef)` | `emailController`, `isSaving`, `repo`, `saving` | `Scaffold`, `AppBar`, `Padding`, `Column`, `TextField`, `SizedBox`, `ValueListenableBuilder`, `ElevatedButton`, `Text`, `TextEditingController`, `ValueNotifier<bool>`, `ScaffoldMessenger`, `SnackBar`, `InputDecoration`, `authRepositoryProvider` |
| `pages` | `register_page.dart` | ninguna | `RegisterPage` (extiende `ConsumerWidget`) | ninguna de instancia | `build(BuildContext, WidgetRef)` | `identifierController`, `secretController`, `displayNameController`, `repo`, `state` | `Scaffold`, `AppBar`, `Padding`, `Column`, `TextField`, `SizedBox`, `ElevatedButton`, `Text`, `TextEditingController`, `InputDecoration`, `authRepositoryProvider`, `AppRouter.home`, `Navigator.of(context).pushReplacementNamed` |
| `providers` | `auth_notifier.dart` | `authNotifierProvider` (`NotifierProvider<AuthNotifier,void>`) | `AuthNotifier` (extiende `Notifier<void>`) | ninguna | `build()` (vacío) | N/A | `Notifier`, `NotifierProvider` |
| `providers` | `session_notifier.dart` | `sessionNotifierProvider` (`NotifierProvider<SessionNotifier,void>`) | `SessionNotifier` (extiende `Notifier<void>`) | ninguna | `build()` (vacío) | N/A | `Notifier`, `NotifierProvider` |
| `repositories` | `auth_repository.dart` | `authRepositoryProvider` (`Provider<AuthRepository>`) | `AuthRepository` (abstracta), `StubAuthRepository` | ninguna | `signIn(email,password)`, `register(email,password,displayName)`, `recoverPassword(email)` | `email`, `password`, `displayName` | `AuthState`, `Provider` |
| `repositories` | `auth_notifier.dart` | `authStateProvider` (`StateProvider<AuthState>`) | `AuthStateNotifier` (extiende `StateNotifier<AuthState>`) | ninguna | `AuthStateNotifier()` (ctor) | `AuthState` | `StateNotifier`, `StateProvider`, `AuthState` |
| `repositories` | `local_session_repository.dart` | `localSessionRepositoryProvider` (`Provider<LocalSessionRepository>`) | `LocalSessionRepository` (`const`) | ninguna | `read()`→`null`, `write(session)`→`{}`, `clear()`→`{}` | `AuthState` | `Provider` |
| `repositories` | `session_repository.dart` | `sessionRepositoryProvider` (`Provider<SessionRepository>`) | `SessionRepository` (abstracta), `StubSessionRepository` | `_session: Map<String,dynamic>` (privada) | `read()`, `write(session)`, `clear()` | `_session['userId']`, `_session['accessToken']`, `session.userId`, `session.accessToken` | `AuthState`, `Provider` |
| `repositories` | `users_repository.dart` | `usersRepositoryProvider` (`Provider<UsersRepository>`) | `UsersRepository` (abstracta), `InMemoryUsersRepository` | ninguna | `findByEmail(email)`→`null`, `save(user)`→`{}` | `email`, `user` | `SocialUser`, `Provider` |
| `` (raíz) | `social_identity_engine.dart` | ninguna | `SocialIdentityEngine` (`const`) | ninguna | `initializeProviders()` (vacío) | N/A | ninguna |
| `identity\` | `identity.dart` | ninguna | ninguna (barrel) | N/A | N/A | N/A | export de 13 archivos hijos (anidado) |
| `identity\data_models` | `auth_state.dart` | ninguna | `AuthState` (dup) | `isUserDataLoaded`, `errorCode`, `errorMessage`, `isAuthenticated`, `userId`, `accessToken` | `AuthState(...)`, `copyWith(...)` | N/A | ninguna |
| `identity\data_models` | `identity_models.dart` | ninguna | ninguna (barrel, dup) | N/A | N/A | N/A | export de `auth_state`, `session_data`, `social_user`, `role_profile` |
| `identity\data_models` | `role_profile.dart` | ninguna | `RoleProfile` (dup) | `key`, `name`, `permissions` | `RoleProfile(...)`, `fromJson`, `toJson`, `hasPermission` | `json`, `permission` | `List<String>` |
| `identity\data_models` | `session_data.dart` | ninguna | `SessionData` (dup) | `key`, `token`, `expiresAt`, `payload` | `SessionData(...)`, `fromJson`, `toJson`, `isExpired` | claves `json['key'/'sessionKey'/'token'/'accessToken'/'expiresAt'/'payload']` | `DateTime`, `Duration` |
| `identity\data_models` | `social_identity_contract.dart` | `socialIdentityContractProvider` | `SocialIdentityContract` (`@immutable`) | `authState:AuthState` | `SocialIdentityContract({required authState})` | `AuthState` (const) | `Provider`, `const AuthState` |
| `identity\data_models` | `social_user.dart` | ninguna | `SocialUser` (dup) | `id`, `displayName`, `photoUrl` | `SocialUser({required id, displayName, photoUrl})` | N/A | ninguna |
| `identity\pages` | `login_page.dart` | ninguna | `LoginPage` (extiende `ConsumerWidget`) | ninguna | `build(...)` | `emailController`, `passwordController`, `repo`, `state` | Igual que el outer; importa `AppRouter` con `../../../../navigation/routing/app_router.dart` |
| `identity\pages` | `password_recovery_page.dart` | ninguna | `PasswordRecoveryPage` (extiende `ConsumerWidget`) | ninguna | `build(...)` | `emailController`, `isSaving`, `repo`, `saving` | Igual que el outer |
| `identity\pages` | `register_page.dart` | ninguna | `RegisterPage` (extiende `ConsumerWidget`) | ninguna | `build(...)` | `identifierController`, `secretController`, `displayNameController`, `repo`, `state` | Igual que el outer; ruta de import `../../../../navigation/routing/app_router.dart` |
| `identity\providers` | `auth_notifier.dart` | `authNotifierProvider` | `AuthNotifier` (`Notifier<void>`) | ninguna | `build()` (vacío) | N/A | `Notifier`, `NotifierProvider` |
| `identity\providers` | `session_notifier.dart` | `sessionNotifierProvider` | `SessionNotifier` (`Notifier<void>`) | ninguna | `build()` (vacío) | N/A | `Notifier`, `NotifierProvider` |
| `identity\repositories` | `auth_repository.dart` | `authRepositoryProvider` | `AuthRepository` (abstracta), `StubAuthRepository` | ninguna | `signIn`, `register`, `recoverPassword` (retornos `const AuthState(...)`) | `email`, `password`, `displayName` | `AuthState` (const), `Provider` |
| `identity\repositories` | `auth_notifier.dart` | `authStateProvider` | `AuthStateNotifier` (`StateNotifier<AuthState>`) | ninguna | `AuthStateNotifier()` | `AuthState` | `StateNotifier`, `StateProvider`, `AuthState` |
| `identity\repositories` | `local_session_repository.dart` | `localSessionRepositoryProvider` | `LocalSessionRepository` (`const`) | ninguna | `read`/`write`/`clear` (no-op) | `AuthState` | `Provider` |
| `identity\repositories` | `session_repository.dart` | `sessionRepositoryProvider` | `SessionRepository`, `StubSessionRepository` | `_session: Map<String,dynamic>` | `read`, `write`, `clear` | `_session['userId'/'accessToken']`, `session.userId`, `session.accessToken` | `AuthState`, `Provider` |
| `identity\repositories` | `users_repository.dart` | `usersRepositoryProvider` | `UsersRepository`, `InMemoryUsersRepository` | ninguna | `findByEmail`→`null`, `save`→`{}` | `email`, `user` | `SocialUser`, `Provider` |
| `identity\` | `social_identity_engine.dart` | ninguna | `SocialIdentityEngine` (`const`) | ninguna | `initializeProviders()` (vacío) | N/A | ninguna |

---

## Tareas derivadas del inventario (Pendientes)

1. Implementar `AuthRepository` real (Dio + JWT) sustituyendo `StubAuthRepository` — sin credenciales en el cliente (vía API/back).
2. Conectar `authStateProvider`/`SessionNotifier` con el resultado de `signIn`/`register` (gatillo de navegación post-login).
3. Implementar `LocalSessionRepository` con `flutter_secure_storage` (iOS/Android) / `shared_preferences` (Web/Windows) para persistir `accessToken`.
4. Implementar `UsersRepository` real sobre `motorsocial_usuarios`; `SocialUser` necesita `fromJson`/`toJson` (hoy no tiene).
5. Implementar `SocialIdentityEngine.initializeProviders()` (hoy vacío).
6. Reemplazar `ElevatedButton` por `FilledButton` (regla M3 del AGENTS.md) en `LoginPage`, `RegisterPage`, `PasswordRecoveryPage`.
7. Aplicar ColorScheme `appTheme` (sin colores hardcoded) en las tres páginas.
8. Resolver el árbol duplicado `lib\identity\identity\` (mismo contenido en 18 archivos, sólo 4 con divergencias mínimas) — consolidar o mantener por motivo de namespaces anidados del motor genérico de red social.
9. Añadir manejo de `errorCode`/`errorMessage` del `AuthState` en `LoginPage`/`RegisterPage`.
10. Validar formato de email y fortaleza de contraseña antes de la llamada a registro.
