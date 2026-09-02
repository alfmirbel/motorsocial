# User Stories — Módulo Location

**Metodología:** 3 C's (Card, Conversation, Confirmation)
**Features fuente:** `03_Features.feature`

---

## US-LOC-001 — Geolocalización del Usuario

### Card
Como usuario, quiero que la plataforma determine mi ubicación actual, para contextualizar el catálogo y el feed por proximidad geográfica.

### Conversation
- `GeolocationRepository` (abstract) define `currentPlace() → Future<SocialPlace?>`.
- `GeolocationRepositoryImpl` usa el paquete `location` (`location.getLocation()`) y construye `SocialPlace(id: 'current', name: 'Ubicación actual', latitude, longitude)`.
- `LocationContract.enableGeolocation` (def `true`) es la configuración que debería gatear la operación (hoy no se comprueba en el impl).
- `SocialPlace` tiene `fromJson` tolerante (campos faltantes → `''`/`null`).

### Confirmation (Criterios de Aceptación)
- ✓ `currentPlace()` con sensor disponible devuelve un `SocialPlace` con `id:'current'`, `name:'Ubicación actual'` y `latitude`/`longitude` del sensor.
- ✓ `SocialPlace.fromJson` asigna `''`/`null` ante campos ausentes.

---

## US-LOC-002 — Búsqueda por Código Postal

### Card
Como usuario, quiero buscar localidades por código postal, para seleccionar manualmente mi ubicación cuando la geolocalización no esté disponible o no sea deseada.

### Conversation
- `PostalCodeRepository` (abstract) define `lookup(postalCode) → Future<PostalCodeLookupResult>`.
- `PostalCodeRepositoryImpl` realiza un `GET` HTTP a `baseUri/<postalCode>`; si status `200` parsea `PostalCodeLookupResult.fromJson`, si no, lanza `Exception('Error al buscar CP')`.
- `PostalCodeLookupResult` (`postalCode`, `localities: List<LocalityEntry>`) con `fromJson` que filtra entradas no-Map.
- `LocalityEntry` (`name`, `state`, `country`) con `fromJson` tolerante.
- **Inconsistencia:** usa `package:http` directamente, no Dio con JWT interceptor.

### Confirmation (Criterios de Aceptación)
- ✓ `lookup("12345")` con respuesta `200` devuelve `PostalCodeLookupResult` con `localities` parseadas.
- ✓ `lookup("99999")` con respuesta no-`200` lanza `Exception('Error al buscar CP')`.
- ✓ `PostalCodeLookupResult.fromJson` omite entradas `localities` que no sean `Map<String, dynamic>`.

---

## US-LOC-003 — Estado de Ubicación y Selección de Localidad

### Card
Como usuario, quiero que el sistema recuerde mi localidad seleccionada, para personalizar mi experiencia sin repetir la selección.

### Conversation
- `LocationState` (`locality`, `isLoading`, `error`) con `copyWith`, gestionado por `LocationNotifier.build()` (retorna estado vacío).
- `LocationEngine.initializeProviders(ref)` lee `locationProvider.notifier` (inicializa el notifier, sin lógica de carga).
- `LocalityPickerPage` es un placeholder `Scaffold(body: Center(child: Text('Locality picker')))`.

### Confirmation (Criterios de Aceptación)
- ✓ `LocationNotifier.build()` retorna `LocationState()` vacío.
- ✓ `LocationEngine.initializeProviders(ref)` lee `locationProvider.notifier`.
- ✓ `LocalityPickerPage` muestra el `Scaffold` con "Locality picker".
- ✓ `LocationContract.fromJson` asigna `true`/`true`/`20` por defecto ante campos ausentes.
