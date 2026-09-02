# Épicas y Especificaciones (EARS) — Módulo Security

**Ruta código:** `lib\security\` (7 archivos `.dart`)
**Subdirectorios:** `data_models`, `engine`, `providers`, `repositories`, raíz (`security.dart` barrel).
**Fecha:** 2026-08-13

---

## Épica 1: Auditoría y Eventos de Seguridad
Como administrador de la plataforma MotorSocial, quiero registrar y consultar los eventos de seguridad (login, logout, accesos sospechosos) asociados a cada usuario, para auditar la actividad y detectar comportamientos anómalos.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá representar cada evento de seguridad mediante la estructura `SecurityEvent` con los campos `id`, `type`, `actorId`/`payload` y `createdAt`.
- El sistema deberá exponer el repositorio de seguridad a través de `securityRepositoryProvider` para su consumo por los Notifiers de Riverpod.

#### 2. Requerimientos Controlados por Eventos
- Cuando se produzca una acción sensible (inicio de sesión, cierre de sesión, cambio de credenciales), el sistema deberá persistir un `SecurityEvent` con el `type` correspondiente.
- Cuando se invoque `SecurityRepository.byUser(userId)`, el sistema deberá devolver la lista de eventos de seguridad de ese usuario.

#### 3. Requerimientos Controlados por Estados
- Mientras el `SecurityEngine` esté inicializado, el sistema deberá mantener una referencia al `SecurityRepository` para delegar las operaciones de persistencia.

#### 4. Requerimientos de Comportamiento No Deseado
- Si el repositorio de seguridad no puede recuperar los eventos de un usuario, entonces el sistema deberá devolver una lista vacía en la implementación `InMemorySecurityRepository` (comportamiento de respaldo) y registrar la incidencia.
- Si el campo `type` de un evento leído desde JSON no existe, entonces el sistema deberá asignar el valor por defecto `'unknown'`.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de rate limiting esté incluida, el sistema deberá exponer el estado `RateLimitState` con los campos `remaining` y `resetAt`.

#### 6. Requerimientos Complejos
- Mientras el módulo de seguridad esté activo, cuando el `SecurityNotifier` reciba un evento, el sistema deberá delegar su persistencia al `SecurityRepository` y actualizar el estado observable de Riverpod.

---

## Épica 2: Gestión de Dispositivos y Rate Limiting
Como usuario de MotorSocial, quiero que el sistema identifique mi dispositivo y controle la tasa de peticiones, para prevenir abusos desde un mismo dispositivo y proteger la integridad de la plataforma.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá representar el dispositivo mediante la estructura `DeviceInfo` con `id`, `model` y `osVersion`, serializable vía `fromJson`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se reconozca un nuevo dispositivo, el sistema deberá construir un `DeviceInfo` a partir de la información del entorno del dispositivo.

#### 3. Requerimientos Controlados por Estados
- Mientras el estado de rate limiting indique un `resetAt` futuro (`isLimited == true`), el sistema deberá bloquear las peticiones adicionales del dispositivo/usuario asociado.

#### 4. Requerimientos de Comportamiento No Deseado
- Si el campo `id` del JSON de `DeviceInfo` no existe o es nulo, entonces el sistema deberá asignar el valor por defecto `''` (cadena vacía).

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de identificación de hardware opcional esté incluida, el sistema deberá completar los campos `model` y `osVersion` del `DeviceInfo`.

#### 6. Requerimientos Complejos
- Mientras la plataforma esté en modo "protección ante pico de tráfico", cuando un dispositivo agote su cuota de peticiones, el sistema deberá RootState `RateLimitState(remaining: 0, resetAt: <futuro>)` y rechazar las solicitudes hasta ese instante.

---

## Épica 3: Validación y Contratos de Seguridad
Como desarrollador del módulo de seguridad, quiero disponer de contratos de validación reutilizables y un barrel de exportación, para asegurar que las entradas (p. ej. contraseñas, tokens, IPs) cumplan las reglas de la plataforma de forma consistente.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer todos los subsistemas de seguridad desde el barrel `lib\security\security.dart` (`SecurityEvent`, `SecurityEngine`, `SecurityNotifier`).
- El sistema deberá representar el resultado de una validación mediante la estructura `ValidationResult` con campos `isValid` y `message`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se ejecute una validación de entrada, el sistema deberá devolver un `ValidationResult` indicando el éxito o el mensaje de error.

#### 3. Requerimientos Controlados por Estados
- Mientras el `SecurityEngine` no haya recibido una implementación concreta de persistencia, el sistema deberá permanecer como un contenedor de referencia al repositorio (`SecurityEngine(this.securityRepository)`).

#### 4. Requerimientos de Comportamiento No Deseado
- Si la validación de una entrada falla, entonces el sistema deberá devolver `ValidationResult(isValid: false, message: '<descripción>')`.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de exportación del barrel esté incluida, el sistema deberá re-exportar únicamente los contratos públicos (`data_models\security_event.dart`, `engine\security_engine.dart`, `providers\security_notifier.dart`).

#### 6. Requerimientos Complejos
- Mientras el módulo de seguridad esté siendo extendido, cuando se incorpore un nuevo contrato de validación, el sistema deberá exponerlo a través del barrel `security.dart` y cablear su uso al `SecurityEngine`.

---

## Notas de Estado del Módulo
- **Cascarón:** `SecurityEngine` y `SecurityNotifier` están vacíos (solo constructor + `build()` no-op).
- **Implementación por defecto:** `InMemorySecurityRepository.byUser()` devuelve siempre `[]` (vía `securityRepositoryProvider`).
- **Duplicación interna:** `SecurityEvent` y `RateLimitState` están definidos en múltiples archivos (`data_models\*` y `repositories\security_repository.dart`). Ver sección 6 de `05_Tasks_Inventario.md`.
