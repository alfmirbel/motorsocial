# Historias de Usuario (User Stories) - Módulo Identity

> Una Historia de Usuario por cada `Característica` de `03_Features.feature`. Documenta lo realmente encontrado en `lib/identity/`; los elementos marcados como *(Pendiente)* aún no están implementados (cascarones stub).

---

## US-ID-001: Inicio de sesión

### 1. Card (Tarjeta)
**Como** visitante de MotorSocial
**Quiero** poder ingresar con mi email y contraseña en la pantalla `LoginPage`
**Para** acceder como usuario autenticado a la red social.

### 2. Conversation (Conversación)
- La pantalla `LoginPage` es un `ConsumerWidget` de Riverpod.
- Lee el repositorio vía `ref.read(authRepositoryProvider)` y llama a `repo.signIn(email, password)`.
- Tras un `await`, se valida `context.mounted` (regla de `!mounted`) antes de navegar a `AppRouter.home` mediante `pushReplacementNamed`.
- No maneja errores visibles hoy; en caso de `isAuthenticated == false` simplemente no navega. *(Pendiente: mostrar `errorCode`/`errorMessage` del `AuthState`.)*
- Implementación activa: `StubAuthRepository` (cascarón que siempre autentica con `userId: 'stub-user'`). El backend real no está conectado en este módulo.

### 3. Confirmation (Criterios de Aceptación)
- [ ] `LoginPage` renderiza dos `TextField` (email, password) y un `ElevatedButton` "Entrar".
- [ ] Al pulsar "Entrar" se invoca `AuthRepository.signIn` con los valores de los controladores.
- [ ] Si `state.isAuthenticated && context.mounted`, se ejecuta `Navigator.pushReplacementNamed(AppRouter.home)`.
- [ ] No hay navegación cuando `context.mounted == false`.
- [ ] *(Objetivo)* Si `isAuthenticated == false`, se muestra el `errorMessage` al usuario.

---

## US-ID-002: Registro de cuenta

### 1. Card (Tarjeta)
**Como** visitante de MotorSocial
**Quiero** poder crear una cuenta con email, contraseña y nombre visible en `RegisterPage`
**Para** disponer de una identidad persistente.

### 2. Conversation (Conversación)
- `RegisterPage` es `ConsumerWidget`; llama a `repo.register(email, password, displayName)`.
- Tras éxito navega a `AppRouter.home`; no valida formato de email/password ni muestra errores.
- Tres `TextField`: "Email", "Password" (obscuro) y "Nombre".
- Mismo flujo de `!context.mounted` que `LoginPage`.

### 3. Confirmation (Criterios de Aceptación)
- [ ] `RegisterPage` ofrece tres `TextField` y un `ElevatedButton` "Crear cuenta".
- [ ] Al pulsar el botón se invoca `AuthRepository.register(email, password, displayName)`.
- [ ] Si `state.isAuthenticated && context.mounted`, se navega a `AppRouter.home`.
- [ ] *(Objetivo)* Validar formato de email y fortaleza de contraseña antes de la llamada.

---

## US-ID-003: Recuperación de contraseña

### 1. Card (Tarjeta)
**Como** usuario que olvidó su contraseña
**Quiero** solicitar un enlace de recuperación por email en `PasswordRecoveryPage`
**Para** restablecer mi acceso sin exponer si la cuenta existe.

### 2. Conversation (Conversación)
- Página `PasswordRecoveryPage` es `ConsumerWidget` con un `ValueNotifier<bool> isSaving`.
- Usa `ValueListenableBuilder<bool>` para alternar el botón entre "Enviar enlace" y "Enviando..." (deshabilitado).
- Tras `await repo.recoverPassword(email)`, si `context.mounted`, muestra `SnackBar` con texto "Si el email existe, recibirás instrucciones." —的消息 intencionalmente genérica (no revela existencia de la cuenta).
- Se valida `context.mounted` antes de mostrar el `SnackBar` y de devolver `isSaving.value = false`.

### 3. Confirmation (Criterios de Aceptación)
- [ ] El botón se deshabilita durante el envío y muestra "Enviando...".
- [ ] Se invoca `AuthRepository.recoverPassword(email)`.
- [ ] Al finalizar (y estando montado) aparece un `SnackBar` con texto genérico.
- [ ] El texto no diferencia cuentas existentes vs inexistentes.

---

## US-ID-004: Persistencia y restauración de sesión

### 1. Card (Tarjeta)
**Como** usuario autenticado
**Quiero** que mi sesión/tokén se almacene localmente y se restaure al reabrir la app
**Para** permanecer conectado entre ejecuciones.

### 2. Conversation (Conversación)
- Interfaz `SessionRepository` con `read`/`write`/`clear`.
- `StubSessionRepository` guarda `userId` y `accessToken` en un `Map<String, dynamic> _session` en memoria (se pierde al cerrar la app).
- `LocalSessionRepository` existe como claseconst `const` con todos sus métodos como *no-op* (`read → null`, `write/clear → {}`). *(Pendiente: implementación con secure storage / shared prefs.)*
- `SessionData` modela `key`, `token`, `expiresAt` y `payload`; provee `fromJson`/`toJson` y `isExpired`. Tolerante: acepta `key` o `sessionKey`, y `token` o `accessToken`; si `expiresAt` no es parseable, usa fallback de +1 hora.

### 3. Confirmation (Criterios de Aceptación)
- [ ] `SessionRepository.write` almacena `userId` y `accessToken`.
- [ ] `SessionRepository.read` retorna el `AuthState` escrito o `null` si vacío.
- [ ] `SessionRepository.clear` deja el repositorio en estado inicial.
- [ ] `SessionData.isExpired` devuelve `true` cuando `expiresAt` ya pasó.
- [ ] `SessionData.fromJson` no lanza excepción cuando faltan claves.

---

## US-ID-005: Identidad social y perfil de rol

### 1. Card (Tarjeta)
**Como** usuario autenticado
**Quiero** tener un `SocialUser` (displayName + photoUrl) y opcionalmente un `RoleProfile` con permisos
**Para** ser identificado en la red social y controlar mis capacidades.

### 2. Conversation (Conversación)
- `SocialUser` es inmutable simple con `id`, `displayName`, `photoUrl`; sin `fromJson`/`toJson`.
- `RoleProfile` con `key`, `name`, `permissions` (List<String>), serializable y `hasPermission(permission)`. `fromJson` filtra no-Strings y acepta `permissions` nulo→lista vacía.
- `UsersRepository` (interfaz) con `findByEmail(email)` y `save(user)`; implementación `InMemoryUsersRepository` es cascarón: `findByEmail → null`, `save → {}` (no-op).
- `SocialIdentityContract` envuelve `AuthState`; `socialIdentityContractProvider` entrega uno con `AuthState()` por defecto.

### 3. Confirmation (Criterios de Aceptación)
- [ ] `UsersRepository.findByEmail(email)` retorna `null` sin excepción cuando no existe.
- [ ] `RoleProfile.hasPermission(p)` retorna `true`/`false` según pertenezca o no a la lista.
- [ ] `RoleProfile.fromJson` con JSON sin permisos produce una lista vacía (no falla).
- [ ] `socialIdentityContractProvider` entrega un contrato válido por defecto.

---

## US-ID-006: Estado de autenticación observable

### 1. Card (Tarjeta)
**Como** capa de presentación
**Quiero** observar el `AuthState` vía Riverpod (`authStateProvider` / `AuthStateNotifier`)
**Para** que los widgets reaccionen a login/logout sin acoplarse al repositorio.

### 2. Conversation (Conversación)
- Existen dos abstracciones paralelas de estado:
  - `authStateProvider` (`StateProvider<AuthState>`) y `AuthStateNotifier` (`StateNotifier<AuthState>`) en `repositories/auth_notifier.dart`.
  - `authNotifierProvider` y `sessionNotifierProvider` (`Notifier<void>`) en `providers/` — con `build()` vacío. *(Pendiente implementación.)*
- No hay cableado entre el repositorio y el `authStateProvider` hoy: las páginas leen el repositorio directamente.
- `SocialIdentityContract` también expone un `AuthState` por defecto.

### 3. Confirmation (Criterios de Aceptación)
- [ ] `authStateProvider` existe y entrega un `AuthState()` por defecto.
- [ ] `AuthStateNotifier` inicializa con `AuthState()` constante.
- [ ] *(Objetivo)* Un `signIn` exitoso actualiza `authStateProvider` para liberar rutas protegidas.
- [ ] *(Pendiente)* `authNotifierProvider` y `sessionNotifierProvider` implementan lógica real.
