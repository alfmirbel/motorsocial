# SDD — Feature: Location

## 1. Resumen
Provee localización por geolocalización y búsqueda por código postal para objetos sociales del MotorSocial.

## 2. Modelos
- `LocationContract`: enableGeolocation, enablePostalCode, defaultLocalityLimit.
- `SocialPlace`: id, name, latitude, longitude, postalCode.
- `PostalCodeLookupResult`: postalCode, localities.
- `LocalityEntry`: name, state, country.

## 3. Repositorios
- `GeolocationRepository` / `GeolocationRepositoryImpl` con paquete `location`.
- `PostalCodeRepository` / `PostalCodeRepositoryImpl` con `http.get`.

## 4. Motor / UI / Estado
- `LocationEngine`: inicializa provider.
- `LocationState` / `LocationNotifier`.
- `LocalityPickerPage`: placeholder mínimo.

## 5. Requisitos
| ID | Requisito | Evidencia |
|-----|-----------|-----------|
| RF-LOC-01 | Obtener ubicación actual del dispositivo. | `getLocation`, `currentPlace`. |
| RF-LOC-02 | Buscar localidades por código postal. | `PostalCodeRepository.lookup`, `LocalityEntry`. |
| RF-LOC-03 | Permitir habilitar/deshabilitar capacidades. | `enableGeolocation`, `enablePostalCode`. |
| RF-LOC-04 | Seleccionar localidad en UI. | `LocalityPickerPage`. |
