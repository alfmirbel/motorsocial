# language: es
Característica: Geolocalización del Usuario
  Como usuario de MotorSocial
  Quiero que la plataforma determine mi ubicación actual
  Para contextualizar el catálogo y el feed por proximidad geográfica

  Escenario: Obtener ubicación actual del sensor
    Dado el `GeolocationRepositoryImpl` con el paquete `location` configurado
    Y la geolocalización habilitada (`enableGeolocation == true`)
    Cuando se invoca `currentPlace()`
    Entonces el sistema debe devolver un `SocialPlace` con `id: "current"`
    Y `name: "Ubicación actual"`
    Y `latitude`/`longitude` obtenidos del sensor

  Escenario: Reconstrucción de SocialPlace desde JSON incompleto
    Dado un JSON de `SocialPlace` sin `id`, `name`, `latitude`, `longitude` y `postalCode`
    Cuando se invoca `SocialPlace.fromJson(json)`
    Entonces el sistema debe asignar `''` a `id` y `name`
    Y `null` a `latitude`, `longitude` y `postalCode`

---

Característica: Búsqueda por Código Postal
  Como usuario
  Quiero buscar localidades por código postal
  Para seleccionar manualmente mi ubicación cuando la geolocalización no esté disponible

  Escenario: Búsqueda exitosa de código postal
    Dado un `PostalCodeRepositoryImpl` con `baseUri` configurado
    Y un código postal "12345"
    Cuando se invoca `lookup("12345")`
    Y el servidor responde con status `200` y un body JSON válido
    Entonces el sistema debe devolver un `PostalCodeLookupResult`
    Y `localities` debe contener las `LocalityEntry` parseadas del body

  Escenario: Búsqueda fallida de código postal
    Dado un `PostalCodeRepositoryImpl` con `baseUri` configurado
    Y un código postal "99999"
    Cuando se invoca `lookup("99999")`
    Y el servidor responde con un status distinto de `200`
    Entonces el sistema debe lanzar una `Exception('Error al buscar CP')`

  Escenario: Reconstrucción de PostalCodeLookupResult desde JSON
    Dado un JSON de `PostalCodeLookupResult` con `localities`
    Cuando se invoca `PostalCodeLookupResult.fromJson(json)`
    Entonces el sistema debe parsear cada `localities` como `LocalityEntry`
    Y omitir las entradas que no sean `Map<String, dynamic>`

---

Característica: Estado de Ubicación y Selección de Localidad
  Como usuario
  Quiero que el sistema recuerde mi localidad seleccionada
  Para personalizar mi experiencia sin repetir la selección

  Escenario: Estado inicial de ubicación
    Dado el `LocationNotifier` recién creado
    Cuando se invoca `build()`
    Entonces el sistema debe retornar un `LocationState` vacío (`locality: ''`, `isLoading: false`, `error: null`)

  Escenario: Inicialización del motor de ubicación
    Dado un `WidgetRef` válido
    Cuando se invoca `LocationEngine.initializeProviders(ref)`
    Entonces el sistema debe leer `locationProvider.notifier`
    Y debe inicializar el `LocationNotifier`

  Escenario: Selector de localidad disponible
    Dado el módulo de ubicación inicializado
    Cuando se navega a `LocalityPickerPage`
    Entonces el sistema debe mostrar un `Scaffold` con el texto "Locality picker"

  Escenario: Configuración de ubicación tolerante
    Dado un JSON de `LocationContract` sin `enableGeolocation`, `enablePostalCode` y `defaultLocalityLimit`
    Cuando se invoca `LocationContract.fromJson(json)`
    Entonces el sistema debe asignar `true`, `true` y `20` por defecto
