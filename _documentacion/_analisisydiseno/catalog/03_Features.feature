# language: es
# Features BDD del módulo Catalog — MotorSocial
# Generado por ingeniería inversa desde lib/catalog/. El código actual es
# mayormente scaffold; los escenarios reflejan el comportamiento esperado.

Característica: Listado del catálogo de objetos sociales
  Como usuario del catálogo
  quiero ver una lista de ítems sociales paginados
  para explorar productos/servicios disponibles.

  Escenario: Catálogo cargado con ítems
    Dado que catalogProvider contiene una SocialObjectPage con varios items
    Cuando el usuario abre CatalogListPage
    Entonces el sistema muestra un ListTile por cada item
    Y el título del tile es object.title o, si es nulo, object.type
    Y el subtítulo del tile es object.id

  Escenario: Catálogo vacío
    Dado que catalogProvider contiene una SocialObjectPage con items vacío
    Cuando el usuario abre CatalogListPage
    Entonces el sistema muestra el texto "Sin resultados" centrado

  Escenario: Cargando el catálogo
    Dado que CatalogState.isLoading es true o state.page.value es null
    Cuando el usuario abre CatalogListPage
    Entonces el sistema muestra un CircularProgressIndicator centrado

---

Característica: Detalle de un objeto social
  Como usuario del catálogo
  quiero abrir el detalle de un ítem
  para ver su tipo e identificador.

  Escenario: Apertura de detalle
    Dado un ítem identificado por objectId y objectType
    Cuando el usuario navega a ObjectDetailPage(objectId, objectType)
    Entonces el sistema muestra una AppBar con título "Detalle"
    Y el cuerpo muestra "<objectType>: <objectId>"

  Escenario: Detalle aún no cargado
    Dado que objectDetailProvider es AsyncValue.data(null)
    Cuando el usuario abre ObjectDetailPage
    Entonces el sistema muestra el identificador recibido por parámetro
    Y la carga asíncrona del objeto queda Pendiente

---

Característica: Búsqueda filtrada del catálogo
  Como usuario del catálogo
  quiero buscar ítems con filtros, orden y paginación
  para encontrarlos rápidamente.

  Escenario: Búsqueda con SocialObjectQuery
    Dado un CatalogRepository y un SocialObjectQuery con filter, sort, skip y limit
    Cuando se invoca search(query, limit)
    Entonces el sistema retorna una List<SocialObjectQuery> con resultados

  Escenario: Repositorio en memoria sin implementar
    Dado InMemoryCatalogRepository como repositorio por defecto
    Cuando se invoca search(query, limit)
    Entonces el sistema retorna la lista vacía constante
    Y la búsqueda real queda Pendiente

  Escenario: Búsqueda deshabilitada por contrato
    Dado un CatalogContract con enableSearch = false
    Cuando el módulo construye su UI
    Entonces el sistema oculta la entrada de búsqueda

---

Característica: Contrato de capacidades del catálogo
  Como integrador del módulo
  quiero un CatalogContract serializable
  para declarar las capacidades de un proveedor de catálogo.

  Escenario: Serialización a JSON
    Dado un CatalogContract con providerName y supportedTypes
    Cuando se invoca toJson
    Entonces el sistema produce un mapa con providerName, supportedTypes, defaultPageSize, enableSearch, enablePdfExport y primaryCtaLabel

  Escenario: Deserialización con valores por defecto
    Dado un JSON parcial sin algunos campos
    Cuando se invoca CatalogContract.fromJson
    Entonces el sistema asigna defaultPageSize = 20
    Y enableSearch = true
    Y enablePdfExport = false
    Y primaryCtaLabel = "Contactar"

---

Característica: Exportación a PDF del catálogo
  Como usuario del catálogo
  quiero exportar la lista actual a PDF
  para compartirla fuera de la app.

  Escenario: Exportación habilitada
    Dado un CatalogContract con enablePdfExport = true
    Cuando el usuario dispara la exportación
    Entonces el sistema genera un documento PDF con los items cargados

  Escenario: Exportación deshabilitada
    Dado un CatalogContract con enablePdfExport = false
    Cuando el módulo construye su UI
    Entonces el sistema omite la acción de exportación

---

Característica: Integración social del catálogo
  Como usuario del catálogo
  quiero ver la actividad social asociada a un ítem
  para seguir las interacciones relacionadas.

  Escenario: Tile de actividad social
    Dado un SocialActivity con verb y actorName
    Cuando se invoca SocialWidgets(activity).buildActivityTile()
    Entonces el sistema devuelve un ListTile
    Y el título es activity.verb.toUpperCase()
    Y el subtítulo es activity.actorName

  Escenario: Tarjeta de objeto
    Dado un SocialObject con title o type
    Cuando se invoca ObjectWidgets(object).buildCard()
    Entonces el sistema devuelve un Card con ListTile
    Y el título es object.title si no es nulo, si no object.type
    Y el subtítulo es object.id
