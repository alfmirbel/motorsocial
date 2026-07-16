# SDD — Feature: Identity

## 1. Resumen
Administra autenticación, registro, recuperación de contraseña y sesión local con Riverpod y contratos serializables.

## 2. Modelos
- `AuthState`: isAuthenticated, userId, accessToken, errorCode, errorMessage, isUserDataLoaded.
- `SocialUser`: id, displayName, photoUrl.
- `RoleProfile`: key, name, permissions, `hasPermission`.
- `SessionData`: key, token, expiresAt, payload, `isExpired`.
- `AccountInfo`, `AuthEvent`.
- `SocialIdentityContract`: appName, enableRegister, enablePasswordRecovery, locale.

## 3. Proveedores
- `AuthStateNotifier` + `authStateProvider`.
- `SessionRepository` / `LocalSessionRepository`.

## 4. UI
- `LoginPage`, `RegisterPage`, `PasswordRecoveryPage` placeholders.
- `SocialIdentityEngine`: bootstrap vacío.

## 5. Requisitos
| ID | Requisito | Evidencia |
|-----|-----------|-----------|
| RF-ID-01 | Soportar inicio de sesión, registro y recuperación. | `AuthRepository.signIn`, `register`, `recoverPassword`. |
| RF-ID-02 | Persistir/cachear sesión localmente. | `SessionRepository`, `LocalSessionRepository`. |
| RF-ID-03 | Modelar usuario y roles con permisos. | `SocialUser`, `RoleProfile.hasPermission`. |
| RF-ID-04 | Configurar comportamiento de identidad por contrato. | `SocialIdentityContract`. |

## 6. No funcionales
- Flag de registro y recuperación configurables.
- Esquema JSON con fallbacks hacia campos legacy.
