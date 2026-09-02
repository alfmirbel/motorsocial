# Épicas y Especificaciones (EARS) — Módulo Location

**Ruta código:** `lib\location\` (7 archivos `.dart`, sin árbol anidado duplicado)
**Subdirectorios:** `data_models`, `engine`, `pages`, `providers`, `repositories`, raíz (`location.dart` barrel).
**Fecha:** 2026-08-13

---

## Épica 1: Geolocalización del Usuario
Como usuario de MotorSocial, quiero que la plataforma determine mi ubicación actual, para contextualizar el catálogo y el feed por proximidad geográfica.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá representar un lugar mediante `SocialPlace` con `id`, `name`, `latitude` (double?), `longitude` (double?) y `postalCode` (String?).
- El sistema deberá exponer el contrato `GeolocationRepository` con la operación `currentPlace()`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `GeolocationRepositoryImpl.currentPlace()`, el sistema deberá obtener la ubicación del paquete `location` y devolver un `SocialPlace` con `id: 'current'`, `name: 'Ubicación actual'`, `latitude` y `longitude` del sensor.

#### 3. Requerimientos Controlados por Estados
- Mientras la geolocalización esté habilitada (`LocationContract.enableGeolocation == true`), el sistema deberá permitir invocar `currentPlace()`.

#### 4. Requerimientos de Comportamiento No Deseado
- Si el sensor de ubicación no está disponible o el usuario niega el permiso, entonces el sistema deberá devolver `null` desde `currentPlace()` (comportamiento de respaldo a definir; la implementación actual no captura excepciones).

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de código postal esté incluida (`LocationContract.enablePostalCode == true`), el sistema deberá permitir enriquecer el `SocialPlace` con `postalCode`.

#### 6. Requerimientos Complejos
- Mientras el usuario navega con geolocalización habilitada, cuando `currentPlace()` retorne, el sistema deberá exponer la `latitude` y `longitude` para filtrar el catálogo/feed por proximidad.

---

## Épica 2: Búsqueda por Código Postal
Como usuario, quiero buscar localidades por código postal, para seleccionar manualmente mi ubicación cuando la geolocalización no esté disponible o no sea deseada.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer el contrato `PostalCodeRepository` con la operación `lookup(postalCode)`.
- El sistema deberá modelar el resultado de la búsqueda mediante `PostalCodeLookupResult` (`postalCode`, `localities: List<LocalityEntry>`) y `LocalityEntry` (`name`, `state`, `country`).

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `PostalCodeRepositoryImpl.lookup(postalCode)`, el sistema deberá realizar un `GET` HTTP a `baseUri/<postalCode>` y, si el status es `200`, devolver `PostalCodeLookupResult.fromJson(body)`.

#### 3. Requerimientos Controlados por Estados
- Mientras `LocationState.isLoading == true`, el sistema deberá mostrar un indicador de carga durante la búsqueda (extensión futura; `LocationNotifier.build()` hoy retorna estado vacío).

#### 4. Requerimientos de Comportamiento No Deseado
- Si la respuesta HTTP tiene un status distinto de `200`, entonces el sistema deberá lanzar `Exception('Error al buscar CP')`.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de límite por localidad esté incluida, el sistema deberá aplicar `LocationContract.defaultLocalityLimit` (def 20) al número de resultados.

#### 6. Requerimientos Complejos
- Mientras el usuario visualiza el selector de localidad, cuando invoca `lookup(postalCode)`, el sistema deberá poblar `PostalCodeLookupResult.localities` y permitir al usuario elegir una `LocalityEntry`.

---

## Épica 3: Estado de Ubicación y Selección de Localidad
Como usuario, quiero que el sistema recuerde mi localidad seleccionada, para personalizar mi experiencia sin repetir la selección.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá modelar el estado de ubicación con `LocationState` (`locality`, `isLoading`, `error`) gestionado por `LocationNotifier` (Riverpod `Notifier`).
- El sistema deberá exponer `locationProvider` y la pantalla `LocalityPickerPage`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `LocationEngine.initializeProviders(ref)`, el sistema deberá leer `locationProvider.notifier` (inicializa el notifier).

#### 3. Requerimientos Controlados por Estados
- Mientras `LocationState.locality` esté vacío, el sistema deberá considerar que el usuario no ha seleccionado localidad.

#### 4. Requerimientos de Comportamiento No Deseado
- Si ocurre un error de геолocalización/búsqueda, entonces el sistema deberá exponer el mensaje en `LocationState.error`.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de selector manual esté incluida, el sistema deberá presentar `LocalityPickerPage` (hoy placeholder `Text('Locality picker')`).

#### 6. Requerimientos Complejos
- Mientras el usuario navega, cuando selecciona una `LocalityEntry`, el sistema deberá actualizar `LocationState.locality` vía `LocationNotifier` (extensión futura; hoy `build()` retorna estado vacío sin lógica de actualización).

---

## Notas de Estado del Módulo
- **Modelos serializables:** `LocationContract`, `SocialPlace`, `PostalCodeLookupResult`, `LocalityEntry` tienen `fromJson` funcional con tolerancia a ausencias.
- **Implementaciones reales (no stub):** `GeolocationRepositoryImpl` (usa paquete `location`) y `PostalCodeRepositoryImpl` (usa `package:http` con `baseUri`). **Único módulo con repositorios concretos funcional** (aunque no expuestos como providers globales).
- **Cascarones:** `LocalityPickerPage` (placeholder `Text('Locality picker')`), `LocationNotifier.build()` retorna estado vacío sin lógica.
- **Falta `enableGeolocation` cableado:** `LocationContract.enableGeolocation`/`enablePostalCode` no se comprueban en `GeolocationRepositoryImpl`/`PostalCodeRepositoryImpl`.
- **Sin providers de repositorio:** no existe `geolocationRepositoryProvider` ni `postalCodeRepositoryProvider` (deuda técnica; añadir al cablear).
- **No usa Dio:** `PostalCodeRepositoryImpl` usa `package:http` directamente (no el Dio con JWT interceptor del resto del app). Inconsistencia con la arquitectura.
- **Sin árbol anidado duplicado:** Location tiene solo 7 archivos planos (no replica `lib\location\location\`).
- **AGENTS.md desactualizado:** referencia `lib\14_geolocalizacion\app_keys.dart` y `lib\40_security\direccionip.dart` inexistentes; las claves Google Maps (si existen) deben buscarse en `location_contract.dart` o verificarse.
