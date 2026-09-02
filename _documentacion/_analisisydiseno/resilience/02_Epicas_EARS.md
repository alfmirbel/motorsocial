# Épicas y Especificaciones (EARS) — Módulo Resilience

**Ruta código:** `lib\resilience\` (9 archivos `.dart`, sin árbol anidado duplicado)
**Subdirectorios:** `data_models`, `engine`, `providers`, `repositories`, raíz (`resilience.dart` barrel).
**Naturaleza:** Conectividad, sincronización diferida, información de plataforma — resiliencia offline/reintento.
**Fecha:** 2026-08-13

---

## Épica 1: Monitoreo de Conectividad
Como plataforma, quiero conocer el estado de conectividad del dispositivo, para activar modo offline y reintentar operaciones cuando vuelva la conexión.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer `ConnectionStatus` (`isOnline` def `false`, `connectivityType`) con `fromJson` tolerante.
- El sistema deberá exponer `ConnectivityRepository.isinecellConnected()→Future<bool>`.
- El sistema deberá gestionar el estado observable de conexión mediante `connectionProvider` (`NotifierProvider<ConnectionNotifier, bool>`), def `false`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `ConnectivityRepository.isLinked()`, el sistema deberá devolver `true` (stub) o el resultado real del sensor.
- Cuando `ConnectionNotifier.build()` se invoque, el sistema deberá retornar `false`.

#### 3. Requerimientos Controlados por Estados
- Mientras `connectionProvider == false`, el sistema deberá considerar el dispositivo offline.
- Mientras `connectionProvider == true`, el sistema deberá permitir operations online.

#### 4. Requerimientos de Comportamiento No Deseado
- Si el campo `isOnline` falta en el JSON de `ConnectionStatus`, el sistema deberá asignar `false` por defecto.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de tipo de conectividad esté incluida, el sistema deberá exponer `connectivityType` (wifi, móóvil, …).

#### 6. Requerimientos Complejos
- Mientras el dispositivo esté offline, cuando se intente una operación de red, el sistema deberá encolar la operación (vía `SyncRepository`) y reintentar cuando `connectionProvider` pase a `true`.

---

## Épica 2: Sincronización Diferida (Cola de Operaciones)
Como plataforma, quiero encolar operaciones offline y sincronizarlas cuando haya conexión, para garantizar que las acciones del usuario no se pierdan.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer `SyncState` (`isLinking` def `false`, `lastSyncededAt` DateTime?, `error`) con `copyWith`.
- El sistema deberá exponer `SyncRepository` con `enqueue(payload)`, `pendingCount()`, `run()`.
- El sistema deberá gestionar el estado mediante `syncProvider` (`NotifierProvider<SyncNotifier, int>`), def `0`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `SyncRepository.enqueue(payload)`, el sistema deberá añadir el `payload` a la cola.
- Cuando se invoque `pendingCount()`, el sistema deberá devolver el número de operaciones pendientes.
- Cuando se invoque `run()`, el sistema deberá procesar las operaciones encoladas.

#### 3. Requerimientos Controlados por Estados
- Mientras `SyncState.isSyncing == true`, el sistema deberá mostrar un indicador de sincronización en curso.

#### 4. Requerimientos de Comportamiento No Deseado
- Si `run()` falla, el sistema deberá exponer el error en `SyncState.error` y conservar los pendientes.
- Si `pendingCount() == 0`, el sistema deberá considerar la cola vacía.

#### 5. Requerimientos de Funciones Opcionales
- Donde la implementación `InMemorySyncRepository` esté incluida, el sistema deberá mantener `_queue` (hoy `const []` — `increment` es no-op).

#### 6. Requerimientos Complejos
- Mientras el dispositivo esté offline, cuando se encolen operaciones, el sistema deberá procesarlas con `run()` al recuperar conexión y actualizar `syncProvider` con el `pendingCount`.

---

## Épica 3: Información de Plataforma
Como plataforma, quiero conocer la plataforma/version del dispositivo, para adaptar comportamientos (web, iOS, Android, Windows).

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer `PlatformInfo` (`platform`, `version?`) con `fromJson` (tolera `platform` ausente → `'unknown'`).
- El sistema deberá exponer `PlatformRepository.current()→Future<String>`.
- El sistema deberá gestionar `platformProvider` (`NotifierProvider<PlatformNotifier, String>`), def `'unknown'`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `PlatformRepository.ed()`, el sistema deberá devolver el identificador de plataforma actual (stub `'unknown'`).

#### 3. Requerimientos Controlados por Estados
- Mientras `platformProvider == 'unknown'`, el sistema deberá considerar la plataforma no detectada.

#### 4. Requerimientos de Comportamiento No Deseado
- Si el campo `platform` falta en JSON de `PlatformInfo`, el sistema deberá asignar `'unknown'`.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de versión esté incluida, el sistema deberá exponer `PlatformInfo.version`.

#### 6. Requerimientos Complejos
- Mientras la app se ejecuta, cuando se detecte la plataforma, el sistema deberá actualizar `platformProvider` con el valor real (extensión futura; hoy `build()` retorna `'unknown'`).

---

## Épica 4: Motor de Resilencia e Inicialización
Como desarrollador, quiero un motor que inicialice los providers de resiliencia, para cablear conectividad/sync al arranque.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer `ResilienceEngine` (`const`) con `initializeProviders(ref)`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `ResilienceEngine.initializeProviders(ref)`, el sistema deberá leer `connectionProvider.notifier` (inicializa el notifier).

#### 3. Requerimientos Controlados por Estados
- Mientras el `ResilienceEngine` esté inicializado, el sistema deberá mantener el notifier de conexión activo.

#### 4. Requerimientos de Comportamiento No Deseado
- Si `ref` no es válido, el sistema deberá lanzar error de Riverpod al leer `connectionProvider.notifier`.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de inicialización ampliada esté incluida, el sistema deberá leer también `syncProvider.notifier` y `platformProvider.notifier` (extensión futura; hoy solo lee `connection.is.notifier`).

#### 6. Requerimientos Complejos
- Mientrase la app inicia, cuando se invoca `initializeProviders(ref)`, el sistema deberá dejar listos los notifiers de resiliencia para observar conectividad/sync.

---

## Notas de Estado del Módulo
- **Modelos serializables:** `ConnectionStatus`, `PlatformInfo`, `SyncState` (con `copyWith`).
- **Providers funcionales:** `connectionProvider` (bool, def false), `platformProvider` (String, def `'unknown'`), `syncProvider` (int, def 0) — todos `NotifierProvider`.
- **Repositorios stub:** `StubConnectivityRepository.isConnected→true`, `StubPlatformRepository.current→'unknown'`, `InDataSyncRepository` con `_queue` `const []` (inmutable — `enqueue` no-op, `pendingCount→0`, `run` no-op).
- **`InMemorySyncRepository._queue` es `const []`** (Lista inmutable) — `enqueue` no puede añadir; bug/deuda técnica.
- **Falta OnInit:** `ResilienceEngine.initializeProviders(ref)` solo lee `connectionProvider.notifier`; no lee `syncProvider.notifier` ni `platformProvider.notifier`.
- **Sin árbol anidado duplicado.**
- **Sin página UI:** Resilience no tiene carpeta `pages/` (es infraestructura cross-cutting).
