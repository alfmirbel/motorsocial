# language: es
Característica: Monitoreo de Conectividad
  Como plataforma
  Quiero conocer el estado de conectividad del dispositivo
  Para activar modo offline y reintentar operaciones cuando vuelva la conexión

  Escenario: Estado inicial de conexión
    Dado el `ConnectionNotifier` recién creado
    Cuando se invoca `build()`
    Entonces el sistema debe retornar `false` (offline por defecto)

  Escenario: Consulta de conectividad
    Dado el `StubConnectivityRepository` activo
    Cuando se invoca `isConnected()`
    Entonces el sistema debe devolver `true`

  Escenario: Reconstrucción de ConnectionStatus desde JSON incompleto
    Dado un JSON de `ConnectionStatus` sin `isOnline` y sin `connectivityType`
    Cuando se invoca `ConnectionStatus.fromJson(json)`
    Entonces el sistema debe asignar `false` a `isOnline`
    Y `null` a `connectivityType`

---

Característica: Sincronización Diferida (Cola de Operaciones)
  Como plataforma
  Quiero encolar operaciones offline y sincronizarlas cuando haya conexión
  Para garantizar que las acciones del usuario no se pierdan

  Escenario: Encolar operación
    Dado el `InMemorySyncRepository` activo
    Y un `payload` de operación
    Cuando se invoca `enqueue(payload)`
    Entonces el sistema debe añadir el payload a la cola (hoy no-op por `_queue` const)

  Escenario: Conteo de pendientes
    Dado el `InMemorySyncRepository` activo
    Cuando se invoca `pendingCount()`
    Entonces el sistema debe devolver `_queue.length`

  Escenario: Ejecutar la cola
    Dado el `InMemorySyncRepository` activo
    Cuando se invoca `run()`
    Entonces el sistema debe procesar las operaciones encoladas (hoy no-op)

  Escenario: Estado inicial de sincronización
    Dado el `SyncNotifier` recién creado
    Cuando se invoca `build()`
    Entonces el sistema debe retornar `0`

---

Característica: Información de Plataforma
  Como plataforma
  Quiero conocer la plataforma/versión del dispositivo
  Para adaptar comportamientos (web, iOS, Android, Windows)

  Escenario: Consulta de plataforma
    Dado el `StubPlatformRepository` activo
    Cuando se invoca `current()`
    Entonces el sistema debe devolver `"unknown"`

  Escenario: Estado inicial de plataforma
    Dado el `PlatformNotifier` recién creado
    Cuando se invoca `build()`
    Entonces el sistema debe retornar `"unknown"`

  Escenario: Reconstrucción de PlatformInfo desde JSON incompleto
    Dado un JSON de `PlatformInfo` sin `platform` y sin `version`
    Cuando se invoca `PlatformInfo.fromJson(json)`
    Entonces el sistema debe asignar `"unknown"` a `platform`
    Y `null` a `version`

---

Característica: Motor de Resiliencia e Inicialización
  Como desarrollador
  Quiero un motor que inicialice los providers de resiliencia
  Para cablear conectividad/sync al arranque

  Escenario: Inicializar providers de conexión
    Dado un `WidgetRef` válido
    Cuando se invoca `ResilienceEngine.initializeProviders(ref)`
    Entonces el sistema debe leer `connectionProvider.notifier`
    Y debe inicializar el `ConnectionNotifier`
