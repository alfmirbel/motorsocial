# User Stories — Módulo Security

**Metodología:** 3 C's (Card, Conversation, Confirmation)
**Features fuente:** `03_Features.feature`

---

## US-SEC-001 — Auditoría de eventos de seguridad por usuario

### Card
Como administrador de la plataforma, quiero consultar los eventos de seguridad de un usuario, para auditar su actividad y detectar comportamientos anómalos.

### Conversation
- El administrador consume el `SecurityRepository` (vía `securityRepositoryProvider`) para un `userId` concreto.
- La implementación por defecto es `InMemorySecurityRepository`, que devuelve `[]` y permite mantener la app operativa sin backend de auditoría.
- Cada evento se modela con `SecurityEvent` (`id`, `type`, `actorId`, `payload`, `createdAt`); al leer desde JSON se toleran ausencias (`type` → `'unknown'`).

### Confirmation (Criterios de Aceptación)
- ✓ `SecurityRepository.byUser(userId)` devuelve una `List<SecurityEvent>` para ese usuario.
- ✓ `InMemorySecurityRepository.byUser()` devuelve `[]` sin excepciones.
- ✓ `SecurityEvent.fromJson` asigna `'unknown'` cuando falta `type`.
- ✓ `securityRepositoryProvider` resuelve a `InMemorySecurityRepository` por defecto.

---

## US-SEC-002 — Identificación de dispositivo y rate limiting

### Card
Como usuario, quiero que el sistema identifique mi dispositivo y controle la tasa de peticiones, para prevenir abusos y proteger la integridad de la plataforma.

### Conversation
- El dispositivo se modela con `DeviceInfo` (`id`, `model`, `osVersion`) serializable vía `fromJson` (tolera `id` nulo → `''`).
- El estado de rate limiting se modela con `RateLimitState` (`remaining`, `resetAt`), con getter `isLimited` que compara `resetAt` con `DateTime.now()`.
- Existe una segunda definición de `RateLimitState` con `copyWith` en `data_models/rate_limit_state.dart` (sin `isLimited`) — divergencia a consolidar.

### Confirmation (Criterios de Aceptación)
- ✓ `DeviceInfo.fromJson` construye un `DeviceInfo` con los campos del JSON.
- ✓ `DeviceInfo.fromJson` asigna `''` si falta `id`.
- ✓ `RateLimitState.isLimited` devuelve `true` cuando `resetAt` es futuro.
- ✓ `RateLimitState.isLimited` devuelve `false` cuando `resetAt` es pasado o nulo.

---

## US-SEC-003 — Contratos de validación y barrel de exportación

### Card
Como desarrollador del módulo, quiero contratos de validación reutilizables y un barrel de exportación, para que las entradas cumplan las reglas de plataforma de forma consistente.

### Conversation
- `ValidationResult` (`isValid`, `message`) representa el resultado hemogéneo de cualquier validación.
- El barrel `lib/security/security.dart` re-exporta `data_models/security_event.dart`, `engine/security_engine.dart` y `providers/security_notifier.dart`.
- **Nota:** el barrel NO re-exporta `DeviceInfo`, `ValidationResult` ni `rate_limit_state.dart`; los consumidores deben importarlos directamente. Inconsistencia de diseño.

### Confirmation (Criterios de Aceptación)
- ✓ Una validación exitosa devuelve `ValidationResult(isValid: true, message: null)`.
- ✓ Una validación fallida devuelve `ValidationResult(isValid: false, message: '<descripción>')`.
- ✓ Importar `security.dart` disponibiliza `SecurityEvent`, `SecurityEngine`, `SecurityNotifier`.
- ✓ El barrel no expone contratos internos no listados.
