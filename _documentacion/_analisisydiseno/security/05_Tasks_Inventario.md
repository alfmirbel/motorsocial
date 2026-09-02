# Inventario Técnico y Tareas — Módulo Security

**Ruta código:** `lib\security\` (7 archivos `.dart`)

---

## Tabla A — Inventario de Componentes

| Subdirectorio | Archivo | Tipo de componente | Nombre del componente | Parámetros que requiere | Variables que utiliza | Variables internas | Estilos que le aplican |
|---|---|---|---|---|---|---|---|
| `data_models` | `device_info.dart` | Clase de Datos | `DeviceInfo` | `id` (String, req), `model` (String?), `osVersion` (String?) | — | — | N/A |
| `data_models` | `device_info.dart` | Clase de Datos | `RateLimitState` (v1) | `remaining` (int, def 0), `resetAt` (DateTime?) | — | — | N/A |
| `data_models` | `device_info.dart` | Clase de Datos | `SecurityEvent` (v1) | `id`, `type`, `actorId?`, `payload`, `createdAt` | — | — | N/A |
| `data_models` | `device_info.dart` | Clase de Datos | `ValidationResult` | `isValid` (bool, def true), `message` (String?) | — | — | N/A |
| `data_models` | `rate_limit_state.dart` | Clase de Datos | `RateLimitState` (v2) | `remaining` (int, def -1), `resetAt` (DateTime?) | — | — | N/A |
| `data_models` | `security_event.dart` | Clase de Datos | `SecurityEvent` (v2) | `id`, `type`, `createdAt`, `payload` | — | — | N/A |
| `engine` | `security_engine.dart` | Lógica/Servicio | `SecurityEngine` (Pendiente) | `securityRepository` (SecurityRepository) | — | — | N/A |
| `providers` | `security_notifier.dart` | Riverpod Provider | `SecurityNotifier` (Pendiente) | `securityRepository` (SecurityRepository) | — | — | N/A |
| `providers` | `security_notifier.dart` | Riverpod Provider | `securityNotifierProvider` | `ref` | `securityRepositoryProvider` | — | N/A |
| `repositories` | `security_repository.dart` | Interfaz/Clase | `SecurityEvent` (v3) | `id`, `type`, `createdAt`, `payload` | — | — | N/A |
| `repositories` | `security_repository.dart` | Interfaz/Repositorio | `SecurityRepository` (abstract) | N/A | — | — | N/A |
| `repositories` | `security_repository.dart` | Repositorio MOCK | `InMemorySecurityRepository` | N/A | — | — | N/A |
| `repositories` | `security_repository.dart` | Riverpod Provider | `securityRepositoryProvider` | `ref` | — | — | N/A |
| (raíz) | `security.dart` | Barrel | — | N/A | — | — | N/A |

---

## Tabla B — Inventario de Elementos Internos

| Subdirectorio | Archivo | Variables definidas en el archivo | Clases | Variables de la clase | Funciones/Widgets definidos en la clase | Variables que utiliza | Llamadas a otras clases/widgets |
|---|---|---|---|---|---|---|---|
| `data_models` | `device_info.dart` | — | `DeviceInfo` | `id`, `model`, `osVersion` | `const DeviceInfo(...)`, `DeviceInfo.fromJson` | `json['id']`, `json['model']`, `json['osVersion']` | — |
| `data_models` | `device_info.dart` (RateLimitState v1) | — | `RateLimitState` | `remaining`, `resetAt` | `const RateLimitState(...)`, getter `isLimited` | `DateTime.now()`, `resetAt` | — |
| `data_models` | `device_info.dart` (SecurityEvent v1) | — | `SecurityEvent` | `id`, `type`, `actorId`, `payload`, `createdAt` | `const SecurityEvent(...)`, `SecurityEvent.fromJson` | `json['id']`, `json['_id']`, `json['type']`, `json['actorId']`, `json['payload']`, `json['createdAt']` | `DateTime.parse` |
| `data_models` | `device_info.dart` (ValidationResult) | — | `ValidationResult` | `isValid`, `message` | `const ValidationResult(...)` | — | — |
| `data_models` | `rate_limit_state.dart` | — | `RateLimitState` | `remaining`, `resetAt` | `const RateLimitState(...)`, `copyWith` | — | — |
| `data_models` | `security_event.dart` | — | `SecurityEvent` | `id`, `type`, `createdAt`, `payload` | `const SecurityEvent(...)` | — | — |
| `engine` | `security_engine.dart` | — | `SecurityEngine` | `securityRepository` | `SecurityEngine(this.securityRepository)` (constructor, Pendiente) | — | `SecurityRepository` |
| `providers` | `security_notifier.dart` | `securityNotifierProvider` | `SecurityNotifier` | `securityRepository` | `build()` (no-op, Pendiente) | — | `Notifier`, `securityRepositoryProvider` |
| `repositories` | `security_repository.dart` | `securityRepositoryProvider` | `SecurityEvent` (v3) | `id`, `type`, `createdAt`, `payload` | `const SecurityEvent(...)` | — | — |
| `repositories` | `security_repository.dart` (interfaz) | — | `SecurityRepository` (abstract) | — | `byUser(String userId, {DateTime? since})` (abstract) | — | `SecurityEvent` |
| `repositories` | `security_repository.dart` (InMemory) | — | `InMemorySecurityRepository` | — | `byUser(...)` → `[]` | — | `SecurityEvent`, `SecurityRepository` |
| (raíz) | `security.dart` | — | — | — | export `data_models/security_event.dart`, `engine/security_engine.dart`, `providers/security_notifier.dart` | — | barrel |

---

## Duplicaciones / Inconsistencias Detectadas
1. **`SecurityEvent` definida 3 veces:**
   - `data_models\device_info.dart` (v1: con `actorId` + `fromJson`)
   - `data_models\security_event.dart` (v2: sin `actorId`, sin `fromJson`)
   - `repositories\security_repository.dart` (v3: sin `actorId`, sin `fromJson`)
   Solo la v1 es serializable; el repositorio usa la v3 local. **Deuda técnica a consolidar.**
2. **`RateLimitState` definida 2 veces:**
   - `data_models\device_info.dart` (v1: con `isLimited`, `remaining` def 0)
   - `data_models\rate_limit_state.dart` (v2: con `copyWith`, `remaining` def -1, sin `isLimited`)
3. **Barrel incompleto:** `security.dart` no expone `DeviceInfo`, `ValidationResult` ni `rate_limit_state.dart`.
4. **Cascarones:** `SecurityEngine`, `SecurityNotifier` vacíos.

*(Nota: Los componentes marcados como "Pendiente" están vacíos/reservados — se mapearon como cascarones durante la ingeniería inversa.)*
