# Épicas y Especificaciones (EARS) - Módulo Identity

> Subsistema de identidad del módulo `lib/identity/`: autenticación (login), registro de usuarios, recuperación de contraseña, perfil de usuario (`SocialUser`), roles/perfiles (`RoleProfile`), sesión (`SessionData` / `AuthState`) y abstracciones de persistencia (repositorios). El módulo está en estado de cascarón/esqueleto (stubs `Stub*` e `InMemory*`); las especificaciones EARS a continuación describen el comportamiento **objetivo** deducido del contrato de las clases y páginas, marcando cuando una capacidad aún no está implementada.

---

## Épica 1: Autenticación y Registro de Usuario
Como visitante de MotorSocial, quiero poder crear una cuenta (registro) e iniciar sesión (login) con mi email y contraseña, para acceder a la red social con una identidad persistente reconocida por el sistema.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer tres casos de uso de autenticación a través del contrato `AuthRepository`: `signIn`, `register` y `recoverPassword`.
- El sistema deberá representar el resultado de toda operación de autenticación con un valor `AuthState` que contenga los campos `isAuthenticated`, `userId`, `accessToken`, `isUserDataLoaded`, `errorCode` y `errorMessage`.
- El sistema deberá ofrecer la pantalla `LoginPage` para el ingreso de credenciales y la pantalla `RegisterPage` para la creación de cuenta, ambas como `ConsumerWidget` que obtienen `authRepositoryProvider` vía Riverpod.
- El sistema deberá exponer el repositorio de autenticación a través del provider `authRepositoryProvider` para desacoplar las páginas del backend.

#### 2. Requerimientos Controlados por Eventos
- Cuando el usuario pulse el botón "Entrar" en `LoginPage`, el sistema deberá invocar `AuthRepository.signIn(email, password)` con los valores de `emailController` y `passwordController`.
- Cuando el `AuthState` retornado por `signIn` tenga `isAuthenticated == true`, el sistema deberá navegar a `AppRouter.home` reemplazando la pila (`pushReplacementNamed`).
- Cuando el usuario pulse "Crear cuenta" en `RegisterPage`, el sistema deberá invocar `AuthRepository.register(email, password, displayName)` y, ante éxito, navegar a `AppRouter.home`.
- Cuando el usuario pulse "Enviar enlace" en `PasswordRecoveryPage`, el sistema deberá invocar `AuthRepository.recoverPassword(email)` y mostrar un `SnackBar` informativo, sin revelar si el email existe.

#### 3. Requerimientos Controlados por Estados
- Mientras `PasswordRecoveryPage` se encuentre en estado "Enviando..." (`isSaving == true`), el sistema deberá deshabilitar el botón de envío y mostrar el texto "Enviando..." en lugar de "Enviar enlace".
- Mientras el `AuthState` permanezca con `isUserDataLoaded == false`, el sistema deberá considerar que los datos del usuario aún no están disponibles para el resto del módulo.

#### 4. Requerimientos de Comportamiento No Deseado
- Si `AuthRepository.signIn` retorna `isAuthenticated == false`, entonces el sistema deberá permanecer en `LoginPage` y (objetivo) mostrar el `errorCode`/`errorMessage` correspondiente al usuario.
- Si la llamada a `AuthRepository.register` falla o el `AuthState` no está autenticado, entonces el sistema deberá permanecer en `RegisterPage` sin navegar a `home`.
- Si el contexto se desmonta durante una operación `await` en las páginas (`!context.mounted`), entonces el sistema deberá abortar cualquier navegación posterior para evitar llamadas a-widgets-desmontados.
- Si la implementación activa de `AuthRepository` es `StubAuthRepository` (sin backend real), entonces el sistema deberá tratarla como cascarón de desarrollo y no como flujo de producción (Pendiente de implementación real).

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de almacenamiento de credenciales esté incluida, el sistema deberá usar `flutter_secure_storage` (iOS/Android) o `shared_preferences` (Web/Windows) para persistir el `accessToken`, conforme a las convenciones globales del proyecto.
- Donde la función de recuperación de sesión local esté incluida, el sistema deberá proveer `SessionRepository` (`read`/`write`/`clear`) y `LocalSessionRepository` para restaurar el `AuthState` al reabrir la app.

#### 6. Requerimientos Complejos
- Mientras el usuario no tenga una sesión activa almacenada (`SessionRepository.read()` retorna `null`), cuando la app se inicie, el sistema deberá presentar `LoginPage` como pantalla inicial y no permitir acceso a rutas protegidas.
- Mientras el sistema esté en modo esqueleto (`StubSessionRepository` con `_session` en memoria), cuando se invoque `write`, el sistema deberá conservar `userId` y `accessToken` en el mapa interno y devolverlos en `read` hasta que se invoque `clear`.

---

## Épica 2: Perfil e Identidad Social del Usuario
Como usuario autenticado, quiero tener una identidad social (`SocialUser`) con nombre visible y foto, y opcionalmente un perfil de rol (`RoleProfile`) con permisos, para ser identificado de forma consistente dentro de la red social y namespaces anidados.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá modelar al usuario social mediante la clase `SocialUser` con los campos `id`, `displayName` y `photoUrl`.
- El sistema deberá modelar un perfil de rol mediante la clase `RoleProfile` con `key`, `name` y `permissions` (lista de Strings), exponiendo `fromJson`, `toJson` y `hasPermission(permission)`.
- El sistema deberá ofrecer un contrato de identidad social `SocialIdentityContract` que envuelve un `AuthState` a través del provider `socialIdentityContractProvider`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se construya el provider `socialIdentityContractProvider`, el sistema deberá entregar un `SocialIdentityContract` con un `AuthState` por defecto (estado inicial vacío, marcado como no autenticado).
- Cuando se invoque `UsersRepository.save(user)`, el sistema deberá persistir el `SocialUser` (objetivo: en CouchDB; actualmente `InMemoryUsersRepository` es un cascarón no-op).

#### 3. Requerimientos Controlados por Estados
- Mientras el `AuthState` interno de `SocialIdentityContract` permanezca en su estado por defecto, el sistema deberá tratar al usuario como anónimo a efectos del motor de identidad.
- Mientras la implementación activa de `UsersRepository` sea `InMemoryUsersRepository`, el sistema deberá declarar la capacidad de búsqueda y persistencia de usuarios como Pendiente.

#### 4. Requerimientos de Comportamiento No Deseado
- Si se invoca `UsersRepository.findByEmail(email)` y no existe el usuario, entonces el sistema deberá retornar `null` (no lanzar excepción).
- Si `RoleProfile.fromJson` recibe un JSON sin el campo `permissions` o con tipo inesperado, entonces el sistema deberá sustituirlo por una lista vacía (`[]`) en lugar de fallar.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de roles esté incluida, el sistema deberá permitir verificar un permiso vía `RoleProfile.hasPermission(permission)` retornando `true`/`false` según pertenezca a la lista.
- Donde la función de motor de identidad esté incluida, el sistema deberá inicializar proveedores vía `SocialIdentityEngine.initializeProviders()` (actualmente cascarón vacío).

#### 6. Requerimientos Complejos
- Mientras el motor de identidad (`SocialIdentityEngine`) no inicialice proveedores reales, cuando un módulo consuma `socialIdentityContractProvider`, el sistema deberá devolver el contrato con `AuthState` vacío por defecto.

---

## Épica 3: Gestión de Sesión y Tokens
Como usuario autenticado, quiero que mi sesión (token JWT, fecha de expiración, payload) sea almacenada localmente y restaurada entre ejecuciones, para mantenerme conectado sin reescribir mis credenciales, y que caduque de forma segura.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá modelar la sesión mediante la clase `SessionData` con `key`, `token`, `expiresAt` (DateTime) y `payload` (Map), soportando serialización `fromJson`/`toJson`.
- El sistema deberá aceptar claves alternativas al deserializar: `key` o `sessionKey`, y `token` o `accessToken` (`SessionData.fromJson`).
- El sistema deberá exponer `SessionData.isExpired` para evaluar si la sesión ha vencido respecto a `DateTime.now()`.
- El sistema deberá abstraer la sesión en `SessionRepository` (interfaz con `read`/`write`/`clear`) y asígnar la implementación activa vía `sessionRepositoryProvider`.

#### 2. Requerimientos Controlados por Eventos
- Cuando `SessionData.expiresAt` sea anterior a `DateTime.now()`, el sistema deberá reportar `isExpired == true`.
- Cuando `SessionRepository.clear()` sea invocado, el sistema deberá eliminar el almacenamiento de sesión activo (en `StubSessionRepository`, vaciar el mapa `_session`).

#### 3. Requerimientos Controlados por Estados
- Mientras `SessionRepository.read()` devuelva `null` (sin sesión almacenada), el sistema deberá considerar al usuario como no autenticado de forma implícita.

#### 4. Requerimientos de Comportamiento No Deseado
- Si `SessionData.fromJson` no puede parsear `expiresAt` como String ISO, entonces el sistema deberá usar como fallback `DateTime.now().add(Duration(hours: 1))` en lugar de fallar.
- Si el `payload` del JSON no es un `Map<String, dynamic>`, entonces el sistema deberá sustituirlo por un mapa vacío (`{}`).

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de repositorio local de sesión esté incluida, el sistema deberá ofrecer `LocalSessionRepository` con `read`/`write`/`clear` (actualmente cascarón que retorna `null` y no-ops).

#### 6. Requerimientos Complejos
- Mientras el backend real de autenticación no esté conectado, cuando se use `StubSessionRepository`, el sistema deberá mantener la sesión únicamente en el mapa `_session` en memoria y perderla al cerrar la app.

---

## Épica 4: Notificación de Estado de Autenticación
Como capa de presentación, quiero que el estado de autenticación (`AuthState`) sea observable vía Riverpod (`authStateProvider` y `AuthStateNotifier`), para que múltiples widgets reaccionen a login/logout sin acoplamiento directo al repositorio.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer el estado de autenticación a través del `StateProvider<AuthState>` llamado `authStateProvider` con un `AuthState` constante por defecto.
- El sistema deberá disponer de `AuthStateNotifier` como `StateNotifier<AuthState>` inicializado con `AuthState()` constante.

#### 2. Requerimientos Controlados por Eventos
- Cuando el resultado de `signIn`/`register` se asigne al `authStateProvider`, el sistema deberá propagar el nuevo `AuthState` a todos los widgets suscritos.

#### 3. Requerimientos Controlados por Estados
- Mientras `authNotifierProvider`/`sessionNotifierProvider` permanezcan sin implementación (`build()` vacío), el sistema deberá declarar ambas capacidades como Pendientes.

#### 4. Requerimientos de Comportamiento No Deseado
- Si un widget intenta leer `authStateProvider` antes de cualquier autenticación, entonces el sistema deberá retornar el `AuthState()` por defecto (no autenticado, sin userId, sin token).

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de notificador dedicado esté incluida, el sistema deberá permitir sustituir el `StateProvider` simple por un `AuthStateNotifier` para custodia de la lógica de transiciones de estado.

#### 6. Requerimientos Complejos
- Mientras la app permanezca en estado no autenticado, cuando se complete un `signIn` exitoso, el sistema deberá actualizar el estado observable a `isAuthenticated == true` para que los gates de navegación liberen el acceso.
