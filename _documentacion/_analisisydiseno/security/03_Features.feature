# language: es
Característica: Auditoría y Eventos de Seguridad
  Como administrador de la plataforma
  Quiero registrar y consultar los eventos de seguridad asociados a cada usuario
  Para auditar la actividad y detectar comportamientos anómalos

  Escenario: Consulta de eventos de seguridad de un usuario
    Dado que existe un `SecurityRepository` configurado mediante `securityRepositoryProvider`
    Y el usuario con id "user:abc" ha generado eventos de seguridad previos
    Cuando se invoca `byUser("user:abc")` sobre el repositorio
    Entonces el sistema debe devolver una lista de `SecurityEvent` asociados a ese usuario
    Y cada evento debe incluir `id`, `type`, `actorId`, `payload` y `createdAt`

  Escenario: Repositorio de respaldo sin datos
    Dado que el `SecurityRepository` activo es `InMemorySecurityRepository`
    Cuando se invoca `byUser("user:abc")`
    Entonces el sistema debe devolver una lista vacía `<SecurityEvent>[]`
    Y la aplicación debe continuar operando sin errores

  Escenario: Lectura de un evento de seguridad desde JSON con tipo desconocido
    Dado un objeto JSON de un `SecurityEvent` sin el campo `type`
    Cuando se invoca `SecurityEvent.fromJson(json)`
    Entonces el sistema debe asignar el valor `'unknown'` al campo `type`
    Y debe conservar el resto de campos (`id`, `actorId`, `payload`, `createdAt`)

---

Característica: Gestión de Dispositivos y Rate Limiting
  Como usuario de MotorSocial
  Quiero que el sistema identifique mi dispositivo y controle la tasa de peticiones
  Para prevenir abusos y proteger la integridad de la plataforma

  Escenario: Construcción de un DeviceInfo a partir de JSON
    Dado un objeto JSON con `id`, `model` y `osVersion`
    Cuando se invoca `DeviceInfo.fromJson(json)`
    Entonces el sistema debe construir un `DeviceInfo` con esos campos
    Y si algún campo opcional (`model`, `osVersion`) es nulo debe conservarse como nulo

  Escenario: DeviceInfo con id ausente
    Dado un objeto JSON de `DeviceInfo` sin el campo `id`
    Cuando se invoca `DeviceInfo.fromJson(json)`
    Entonces el sistema debe asignar `''` (cadena vacía) al campo `id`

  Escenario: Rate limit activo
    Dado un `RateLimitState` con `resetAt` en una fecha futura
    Cuando se evalúa la propiedad `isLimited`
    Entonces el sistema debe devolver `true`
    Y el dispositivo/usuario debe considerarse limitado hasta `resetAt`

  Escenario: Rate limit expirado
    Dado un `RateLimitState` con `resetAt` en una fecha pasada o nulo
    Cuando se evalúa la propiedad `isLimited`
    Entonces el sistema debe devolver `false`
    Y el dispositivo/usuario debe poder realizar peticiones de nuevo

---

Característica: Validación y Contratos de Seguridad
  Como desarrollador del módulo de seguridad
  Quiero disponer de contratos de validación reutilizables y un barrel de exportación
  Para asegurar que las entradas cumplan las reglas de la plataforma de forma consistente

  Escenario: Validación exitosa
    Dado que se valida una entrada que cumple todas las reglas
    Cuando se ejecuta la validación
    Entonces el sistema debe devolver `ValidationResult(isValid: true)`
    Y el campo `message` debe ser nulo

  Escenario: Validación fallida
    Dado que se valida una entrada que no cumple las reglas
    Cuando se ejecuta la validación
    Entonces el sistema debe devolver `ValidationResult(isValid: false, message: '<descripción>')`

  Escenario: Barrel de exportación expone los componentes públicos
    Dado un consumidor que importa `package:.../security/security.dart`
    Cuando se referencia un componente del módulo
    Entonces el sistema debe disponibilizar `SecurityEvent`, `SecurityEngine` y `SecurityNotifier`
    Y no debe filtrar los contratos internos no listados en el barrel
