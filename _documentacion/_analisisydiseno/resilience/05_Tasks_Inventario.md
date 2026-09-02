# Inventario Técnico y Tareas — Módulo Resilience

**Ruta código:** `lib\resilience\` (9 archivos `.dart`, sin árbol anidado duplicado)

---

## Tabla A — Inventario de Componentes

| Subdirectorio | Archivo | Tipo de componente | Nombre del componente | Parámetros que requiere | Variables que utiliza | Variables internas | Estilos que le aplican |
|---|---|---|---|---|---|---|---|
| (raíz) | `resilience.dart` | Barrel | — | N/A | — | — | N/A |
| `data_models` | `connection_status.dart` | Clase de Datos | `ConnectionStatus` | `isOnline` (bool, def `false`), `connectivityType` (String?) | — | — | N/A |
| `data_models` | `connection_status.dart` | Clase de Datos | `PlatformInfo` | `platform` (req), `version` (String?) | — | — | N/A |
| `data_models` | `connection_status.dart` | Clase de Estado | `SyncState` | `isSyncing` (def false), `lastSyncedAt` (Dateate?), `error` (String?) | — | — | N/A |
| `engine` | `resilience_engine.dart` | Lógica/Servicio | `ResilienceEngine` | — | — | — | N/A |
| `providers` | `connection_notifier.dart` | Riverpod Provider | `ConnectionNotifier` (Notifier<bool>) | — | — | — | N/A |
| `providers` | `connection_notifier.dart` | Provider | `connectionProvider` | N/A | — | — | N/A |
| `providers` | `platform_notifier.dart` | Riverpod Provider | `PlatformNotifier` (Notifier<String>) | — | — | — | N/A |
| `providers` | `platform_notifier.dart` | Provider | `platformProvider` | N/A | — | — | N/A |
| `providers` | `sync_notifier.dart` | Riverpod Provider | `SyncNotifier` (Notifier<int>) | — | — | — | N/A |
| `providers` | `sync_notifier.dart` | Provider | `syncProvider` | N/A | — | — | N/A |
| `repositories` | `connectivity_repository.dart` | Interfaz/Repositorio | `ConnectivityRepository` (abstract) | — | — | — | N/A |
| `repositories` | `connectivity_repository.dart` | Repositorio MOCK | `StubConnectivityRepository` | — | — | — | N/A |
| `repositories` | `connectivity_repository.dart` | Provider | `connectivityRepositoryProvider` | N/A | — | — | N/A |
| `repositories` | `platform_repository.dart` | Interfaz/Repositorio | `PlatformRepository` (abstract) | — | — | — | N/A |
| `repositories` | `platform_repository.dart` | Repositorio MOCK | `StubPlatformRepository` | — | — | — | N/A |
| `repositories` | `platform_repository.dart` | Provider | `platformRepositoryProvider` | N/A | — | — | N/A |
| `repositories` | `sync_repository.dart` | Interfaz/Repositorio | `SyncRepository` (abstract) | — | — | — | N/A |
| `repositories` | `sync_repository.dart` | Repositorio MOCK | `InMemorySyncRepository` | — | — | `_queue` (const []) | N/A |
| `repositories` | `sync_repository.dart` | Provider | `syncRepositoryProvider` | N/A | — | — | N/A |

---

## Tabla B — Inventario de Elementos Internos

| Subdirectorio | Archivo | Variables definidas en el archivo | Clases | Variables de la clase | Funciones/Widgets definidos en la clase | Variables que utiliza | Llamadas a otras clases/widgets |
|---|---|---|---|---|---|---|---|
| (raíz) | `resilience.dart` | — | — | — | export `data_models/connection_status.dart`, repositorios (3), providers (3), `engine/resilience_engine.dart` | — | barrel |
| `data_models` | `connection_status.dart` | — | `ConnectionStatus` | `isOnline`, `connectivityType` | `const ConnectionStatus(...)`, `ConnectionStatus.fromJson` | `json['isOnline']`, `json['connectivityType']` | — |
| `data_models` | `connection_status.dart` | — | `PlatformInfo` | `platform`, `version` | `const PlatformInfo(...)`, `PlatformInfo.fromJson` | `json['platform']`, `json['version']` | — |
| `data_models` | `connection_status.dart` | — | `SyncState` | `isSyncing`, `lastSyncedAt`, `error` | `const SyncState(...)`, `copyWith` | — | `DateTime` |
| `engine` | `resilience_engine.dart` | — | `ResilienceEngine` | — | `const Resiliiance()`, `initializeProviders(ref)` | `ref.read(connectionProvider.notifier)` | `WidgetRef`, `connectionProvider` |
| `providers` | `connection_notifier.dart` | `connectionProvider` | `ConnectionNotifier` (Notifier<bool>) | — | `build()` → `false` | — | `Notifier` |
| `providers` | `platform_notifier.dart` | `platformProvider` | `PlatformNotifier` (Notifier<String>) | — | `build()` → `'unknown'` | — | `Notifier` |
| `providers` | `sync_notifier.dart` | `syncProvider` | `SyncNotifier` (Notifier<int>) | — | `build()` → `0` | — | `Notifier` |
| `repositories` | `connectivity_repository.dart` | `connectivityProviderProvider` | `ConnectivityRepository` (abstract) | — | `isConnected()` (abstract) | — | — |
| `repositories` | `connectivity_repository.dart` | — | `StubConnectivityRepository` | — | `isConnected()` async → `true` | — | `ConnectivityRepository` |
| `repositories` | `platform_repository.dart` | `platformRepositoryProvider` | `PlatformRepository` (abstract) | — | `current()` (abstract) | — | — |
| `repositories` | `platform_repository.dart` | — | `StubPlatformRepository` | — | `current()` async → `'unknown'` | — | `PlatformRepository` |
| `repositories` | `sync_repository.dart` | `syncRepositoryProvider` | `SyncRepository` (abstract) | — | `enqueue(payload)`, `pendingCount()`, `run()` (abstract) | — | — |
| `repositories` | `sync_repository.dart` | — | `InMemorySyncRepository` | `_queue` (const []) | `enqueue(payload)` (no-op), `pendingCount()` → `_queue.length`, `run()` (no-op) | `_queue.length` | `SyncRepository` |

---

## Duplicaciones / Inconsistências Detectadas

1. **`InMemorySyncRepository._queue` es `const []`** (Lista inmutable): `enqueue` no puede añadir elementos — el método es no-op y `pendingCount` siempre devuelve `0`. Bug/deuda técnica: usar `List.from([])` mutable.
2. **`ResilienceEngine.initializeProviders(ref)` solo lee `connectionProvider.notifier`**; no inicializa `syncProvider` ni `platformProvider`. Inicialización incompleta.
3. **`SyncState` existe pero no está cableado** a ningún provider (no hay `syncStateProvider`); `syncProvider` es `NotifierProvider<SyncNotifier, int>` (devuelve int, no `SyncState`).
4. **Cascarones/notifiers vacíos:** `ConnectionNotifier.build`, `PlatformNotifier.build`, `SyncNotifier.build` solo retornan valores por defecto.
5. **Todos los repositorios son stubs** (`Stub*`/`InMemory`).
6. **Sin árbol anidado duplicado.**
7. **Sin carpeta `pages/`** — Resilience es infraestructura cross-cutting sin UI propia.
