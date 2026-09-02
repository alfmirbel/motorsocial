# User Stories — Módulo Resilience

**Metodología:** 3 C's (Card, Conversation, Confirmation)
**Features fuente:** `03_Features.feature`

---

## US-RES-001 — Monitoreo de Conectividad

### Card
Como plataforma, quiero conocer el estado de conectividad del dispositivo, para activar modo offline y reintentar operaciones cuando vuelva la conexión.

### Conversation
- `ConnectionStatus` (`isOnline` def `false`, `connectivityType`) con `fromJson` tolerante.
- `ConnectionNotifier` (Riverpod `Notifier<bool>`); `build()` retorna `false`.
- `connectionProvider` (`NotifierProvider`).
- `ConnectivityRepository` (abstract) con `isConnected()→Future<bool>`; stub `StubConnectivityRepository` devuelve `true`.

### Confirmation (Criterios de Aceptación)
- ✓ `ConnectionNotifier.build()` retorna `false`.
- ✓ `StubConnectivityRepository.isConnected()` devuelve `true`.
- ✓ `ConnectionStatus.fromJson` asigna `false`/`null` ante campos ausentes.

---

## US-RES-002 — Sincronización Diferida (Cola de Operaciones)

### Card
Como plataforma, quiero encolar operaciones offline y sincronizarlas cuando haya conexión, para garantizar que las acciones del usuario no se pierdan.

### Conversation
- `SyncState` (`isSyncing`, `lastSyncedAt`, `error`) con `copyWith`.
- `SyncRepository` (abstract): `enqueue(payload)`, `pendingCount()`, `run()`.
- `InMemorySyncRepository` con `_queue = const []` (inmutable — `enqueue` no-op, bug).
- `syncProvider` (`NotifierProvider<SyncNotifier, int>`, def `0`).

### Confirmation (Criterios de Aceptación)
- ✓ `enqueue(payload)` añade el payload a la cola (cuando `_queue` sea mutable).
- ✓ `pendingCount()` devuelve `_queue.length`.
- ✓ `run()` procesa la cola (hoy no-op).
- ✓ `SyncNotifier.build()` retorna `0`.

---

## US-RES-003 — Información de Plataforma

### Card
Como plataforma, quiero conocer la plataforma/version del dispositivo, para adaptar comportamientos.

### Conversation
- `PlatformInfo` (`platform`, `version?`) con `fromJson` (tolera `platform` ausente → `'unknown'`).
- `PlatformRepository.current()→Future<String>`; stub `StubPlatformRepository` devuelve `'unknown'`.
- `platformProvider` (`NotifierProvider<PlatformNotifier, String>`, def `'unknown'`).

### Confirmation (Criterios de Aceptación)
- ✓ `StubPlatformRepository.current()` devuelve `"unknown"`.
- ✓ `PlatformNotifier.build()` retorna `"unknown"`.
- ✓ `PlatformInfo.fromJson` asigna `"unknown"`/`null` ante campos ausentes.

---

## US-RES-004 — Motor de Resiliencia e Inicialización

### Card
Como desarrollador, quiero un motor que inicialice los providers de resiliencia, para cablear conectividad/sync al arranque.

### Conversation
- `ResilienceEngine` (`const`) con `initializeProviders(ref)`.
- Solo lee `connectionProvider.notifier` (no lee `syncProvider` ni `platformProvider`).

### Confirmation (Criterios de Aceptación)
- ✓ `initializeProviders(ref)` lee `connectionProvider.notifier`.
- ✓ No lanza errores con un `ref` válido.
