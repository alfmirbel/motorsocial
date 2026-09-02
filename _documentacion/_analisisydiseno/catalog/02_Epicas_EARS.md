# Épicas del módulo Catalog — MotorSocial

**Módulo:** `lib/catalog/` (catálogo de objetos sociales / productos / servicios genéricos)
**Fecha:** 2026-08-13
**Estado de la implementación:** Ingeniería inversa sobre código existente. El módulo es mayoritariamente **scaffold** (clases y extensiones declaradas pero con cuerpos vacíos o retornos constantes). Los requisitos EARS describen el comportamiento **esperado** del módulo; donde el código aún no lo implementa se marca `(Pendiente)`.

> Nota sobre nomenclatura: el código referencia objetos genéricos `SocialObject` (con `type`, `title`, `attributes`). AGENTS.md menciona la DB `motorsocial_alimentos`, pero el código de `lib/catalog/` **no** referencia alimentos específicamente; trata ítems sociales genéricos. Ver `06_BD.md` para la convención adoptada.

---

## Épica E1 — Gestión de ítems del catálogo (CRUD genérico)

Gobernar el ciclo de vida de un `SocialObject` (crear, listar, ver detalle, opcionalmente editar/eliminar) tipado mediante el campo `type`.

- **Ubicuo:** El sistema deberá exponer un `CatalogRepository` que abstraiga el acceso a los ítems sociales y permita consultarlos sin exponer credenciales CouchDB al cliente Flutter.
- **Evento:** Cuando el usuario abre `CatalogListPage`, el sistema deberá observar `catalogProvider` y mostrar los ítems de la página cargada (`SocialObjectPage.items`) o el mensaje «Sin resultados» si la lista está vacía.
- **Estado:** Mientras `CatalogState.isLoading` sea `true` o `state.page.value` sea `null`, el sistema deberá mostrar un `CircularProgressIndicator` centrado en lugar del listado.
- **No Deseado:** Si el repositorio retorna una página nula o vacía, entonces el sistema deberá renderizar `Center(child: Text('Sin resultados'))` en `CatalogListPage`.
- **Opcional:** Donde la función de detalle esté incluida, el sistema deberá navegar a `ObjectDetailPage(objectId, objectType)` mostrando el `type` y el identificador del ítem.
- **Complejo:** Mientras el detalle del objeto esté cargando, cuando el `ObjectDetailNotifier` exponga `AsyncValue.loading`, el sistema deberá diferir la renderización hasta disponer del `SocialObject?` (Pendiente — el notificador sólo retorna `AsyncValue.data(null)`).

---

## Épica E2 — Búsqueda y consulta filtrada del catálogo

Proveer un mecanismo de búsqueda con `SocialObjectQuery` (filtro, orden, paginación `skip/limit`, tipo preferido).

- **Ubicuo:** El sistema deberá aceptar un `SocialObjectQuery` con `preferredType`, `skip`, `limit`, `filter` y `sort` para parametrizar las consultas al catálogo.
- **Evento:** Cuando se invoque `CatalogRepository.search(query, limit)`, el sistema deberá devolver una `List<SocialObjectQuery>` resultante de la búsqueda.
- **Estado:** Mientras `CatalogContract.enableSearch` sea `true`, el sistema deberá habilitar la superficie de búsqueda del catálogo.
- **No Deseado:** Si `CatalogContract.enableSearch` es `false`, entonces el sistema deberá ocultar la entrada de búsqueda y operar en modo sólo-listado.
- **Opcional:** Donde la función de búsqueda esté incluida, el sistema deberá respetar `CatalogContract.defaultPageSize` (por defecto 20) como tamaño de página por defecto.
- **Complejo:** Mientras el contrato indique `supportedTypes` no vacío, cuando se seleccione un `preferredType`, el sistema deberá acotar la consulta a los tipos soportados (Pendiente — `InMemoryCatalogRepository.search` retorna `const []`).

---

## Épica E3 — Contrato de capacidades del catálogo (`CatalogContract`)

Declarar de forma declarativa las capacidades del catálogo para vinculable a UI y otros módulos.

- **Ubicuo:** El sistema deberá serializar/deserializar `CatalogContract` vía `toJson`/`fromJson` manteniendo `providerName`, `supportedTypes`, `defaultPageSize`, `enableSearch`, `enablePdfExport` y `primaryCtaLabel`.
- **Evento:** Cuando `CatalogContract.fromJson` reciba un JSON con campos ausentes, el sistema deberá aplicar valores por defecto (`defaultPageSize=20`, `enableSearch=true`, `enablePdfExport=false`, `primaryCtaLabel='Contactar'`).
- **Estado:** Mientras `enablePdfExport` sea `false`, el sistema deberá omitir la acción de exportación PDF en la UI.
- **No Deseado:** Si `providerName` llega vacío o nulo, entonces el sistema deberá usar cadena vacía como nombre de proveedor y continuar operando.
- **Opcional:** Donde `primaryCtaLabel` esté incluido, el sistema deberá etiquetar el botón de acción principal con el texto indicado (por defecto «Contactar»).
- **Complejo:** Mientras el contrato cargue, cuando `enablePdfExport` sea `true`, el sistema deberá habilitar la acción de exportación (Pendiente — sin implementación del export).

---

## Épica E4 — Exportación del catálogo (PDF)

Exportar la lista/página de ítems sociales a PDF.

- **Ubicuo:** El sistema deberá mantener un `exportNotifier` (`catalogRepositoryProvider`) listo para ser consumido por la capa de exportación.
- **Evento:** Cuando el usuario dispare la exportación, el sistema deberá recolectar los ítems de la página actual y generar el documento (Pendiente — no hay provider/exportador implementado; sólo `catalogRepositoryProvider` con `InMemoryCatalogRepository`).
- **Estado:** Mientras `CatalogContract.enablePdfExport` sea `false`, el sistema deberá mantener deshabilitada la acción de exportación.
- **No Deseado:** Si la exportación falla o la lista está vacía, entonces el sistema deberá informar al usuario sin generar archivo (Pendiente).
- **Opcional:** Donde la exportación esté incluida, el sistema deberá incluir `providerName` y la metadata de la página en el documento (Pendiente).
- **Complejo:** Mientras la página tenga ítems cargados, cuando `enablePdfExport` sea `true`, el sistema deberá producir un PDF con los `items` serializados (Pendiente — sin implementación).

---

## Épica E5 — Integración con el grafo social (vínculo con `Activity`)

Vincular los ítems del catálogo con la actividad social mediante widgets compartidos.

- **Ubicuo:** El sistema deberá disponer de `SocialWidgets` capaz de construir un tile de actividad (`buildActivityTile`) a partir de un `SocialActivity` del módulo `activity`.
- **Evento:** Cuando se requiera mostrar la actividad asociada a un ítem, el sistema deberá renderizar un `ListTile` con `activity.verb.toUpperCase()` como título y `activity.actorName` como subtítulo.
- **Estado:** Mientras exista un `SocialActivity` válido, `SocialWidgets.buildActivityTile` deberá mostrar verbo y actor.
- **No Deseado:** Si `social_widgets.dart` no puede resolver `SocialActivity` (importación rota `/activity/data_models/activity_contract.dart`), entonces el sistema deberá fallar en compilación (riesgo de desincronía con el módulo `activity`).
- **Opcional:** Donde los widgets de objeto estén incluidos, el sistema deberá exponer `ObjectWidgets.buildCard()` que renderice un `Card`+`ListTile` con `object.title ?? object.type` e `object.id`.
- **Complejo:** Mientras la UI del listado esté activa, cuando cada ítem se construya, el sistema deberá mostrar el `object.title` o, en su ausencia, el `object.type` como título del tile (vigente en `CatalogListPage`).

---

## Épica E6 — Motor y cableado de providers (`CatalogEngine`)

Encapsular el cableado de providers del módulo y su inicialización.

- **Ubicuo:** El sistema deberá proveer `CatalogEngine` que reciba un `CatalogRepository` y ofrezca `initializeProviders(WidgetRef)`.
- **Evento:** Cuando se invoque `CatalogEngine.initializeProviders(ref)`, el sistema deberá registrar las dependencias del módulo (Pendiente — cuerpo vacío).
- **Estado:** Mientras `CatalogEngine` tenga una referencia válida a `CatalogRepository`, el sistema deberá mantener disponible el repositorio inyectado.
- **No Deseado:** Si `CatalogRepository` es nulo o la inyección falla, entonces el sistema deberá impedir la inicialización del motor (Pendiente — sin validación).
- **Opcional:** Donde el motor esté incluido en el árbol de providers, el sistema deberá instanciar `catalogRepositoryProvider` con `InMemoryCatalogRepository` por defecto.
- **Complejo:** Mientras el módulo cargue, cuando `catalogRepositoryProvider` se resuelva, el sistema deberá entregar siempre la misma instancia `InMemoryCatalogRepository` (provider `Provider` sin override).
