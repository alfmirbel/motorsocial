# User Stories del módulo Catalog — MotorSocial

**Módulo:** `lib/catalog/`
**Técnica 3 C's:** Card · Conversation · Confirmation (criterios de aceptación).
**Estado:** Las stories reflejan el comportamiento esperado; donde el código es scaffold se marca `(Pendiente)`.

---

## US-CT-01 — Listado del catálogo

**Card:** Como usuario del catálogo, quiero ver una lista de ítems sociales paginados, para explorar los productos/servicios disponibles.

**Conversation:**
- La página `CatalogListPage` observa `catalogProvider` (`CatalogNotifier`).
- El estado (`CatalogState`) expone `page` (`AsyncValue<SocialObjectPage?>`), `isLoading` y `error`.
- Mientras `isLoading` o `page == null`: spinner; si `page.items` vacío: «Sin resultados».
- Cada ítem: `ListTile(title: object.title ?? object.type, subtitle: object.id)`.

**Confirmation (Criterios de aceptación):**
- [ ] Dado `catalogProvider` con ítems, al abrir `CatalogListPage` se muestra un `ListTile` por ítem con `object.title ?? object.type` e `object.id`.
- [ ] Dado `page.items` vacío, se muestra `Center(child: Text('Sin resultados'))`.
- [ ] Dado `isLoading == true` o `page == null`, se muestra `CircularProgressActivityIndicator` centrado.
- [ ] La `AppBar` muestra el título «Catálogo».

---

## US-CT-02 — Detalle de un objeto social

**Card:** Como usuario del catálogo, quiero abrir el detalle de un ítem, para ver su tipo e identificador.

**Conversation:**
- `ObjectDetailPage({required objectId, required objectType})`.
- La `AppBar` titula «Detalle». El cuerpo muestra `'$objectType: $objectId'`.
- La carga real del `SocialObject` vía `objectDetailProvider` está **Pendiente** (sólo retorna `AsyncValue.data(null)`).

**Confirmation:**
- [ ] Al navegar con `objectId` y `objectType` válidos, la `AppBar` muestra «Detalle».
- [ ] El cuerpo muestra `"<objectType>: <objectId>"`.
- [ ] (Pendiente) `objectDetailProvider` carga el `SocialObject` desde el repositorio.

---

## US-CT-03 — Búsqueda filtrada del catálogo

**Card:** Como usuario del catálogo, quiero buscar ítems con filtros, orden y paginación, para encontrarlos rápidamente.

**Conversation:**
- `SocialObjectQuery` modela la consulta: `preferredType`, `skip` (0), `limit` (20), `filter` (mapa), `sort` (lista).
- `CatalogRepository.search(String query, {int limit = 20})` retorna `List<SocialObjectQuery>`.
- Implementación por defecto `InMemoryCatalogRepository.search` → `const []` (no implementada).
- `CatalogContract.enableSearch` controla la disponibilidad de la búsqueda en UI (defecto `true`).

**Confirmation:**
- [ ] `SocialObjectQuery` permite configurar `preferredType`, `skip`, `limit`, `filter` y `sort`.
- [ ] `search()` respeta `limit` (defecto 20).
- [ ] Si `CatalogContract.enableSearch == false`, la UI de búsqueda se oculta.
- [ ] (Pendiente) `InMemoryCatalogRepository` retorna resultados reales acorde a `SocialObjectQuery` (actualmente `const []`).

---

## US-CT-04 — Contrato de capacidades del catálogo

**Card:** Como integrador del módulo, quiero un `CatalogContract` serializable, para declarar las capacidades de un proveedor de catálogo.

**Conversation:**
- Campos: `providerName`, `supportedTypes`, `defaultPageSize` (20), `enableSearch` (true), `enablePdfExport` (false), `primaryCtaLabel` ('Contactar').
- `toJson`/`fromJson` con defaults seguros.

**Confirmation:**
- [ ] `CatalogContract.toJson()` produce un `Map<String, dynamic>` con los 6 campos.
- [ ] `CatalogContract.fromJson({})` asigna defaults: `defaultPageSize=20`, `enableSearch=true`, `enablePdfExport=false`, `primaryCtaLabel='Contactar'`, `providerName=''`, `supportedTypes=[]`.
- [ ] `supportedTypes` nulo o no-texto se normaliza a `List<String>`.

---

## US-CT-05 — Exportación a PDF del catálogo

**Card:** Como usuario del catálogo, quiero exportar la lista actual a PDF, para compartirla fuera de la app.

**Conversation:**
- Gobernada por `CatalogContract.enablePdfExport` (defecto `false`).
- No existe notificador de exportación dedicado; sólo `catalogRepositoryProvider` y `export_notifier` (que sólo declara el repositorio en memoria). La generación PDF está **Pendiente**.

**Confirmation:**
- [ ] Si `enablePdfExport == false`, la acción de exportación no se ofrece.
- [ ] Si `enablePdfExport == true`, la acción aparece (Pendiente — sin UI de acción).
- [ ] (Pendiente) La exportación genera un PDF con los `items` de la página actual.

---

## US-CT-06 — Integración social del catálogo (vínculo con Activity)

**Card:** Como usuario del catálogo, quiero ver la actividad social asociada a un ítem, para seguir las interacciones relacionadas.

**Conversation:**
- `SocialWidgets({required SocialActivity activity}).buildActivityTile()` devuelve `ListTile(title: activity.verb.toUpperCase(), subtitle: activity.actorName)`.
- Importa `SocialActivity` desde `activity/data_models/activity_contract.dart` (en el clon anidado `lib/catalog/catalog/...` la ruta relativa es `../../../../activity/...`).
- `ObjectWidgets({required SocialObject object}).buildCard()` devuelve `Card(child: ListTile(title: object.title ?? object.type, subtitle: object.id))`.

**Confirmation:**
- [ ] `buildActivityTile()` muestra `verb.toUpperCase()` como título y `actorName` como subtítulo.
- [ ] `buildCard()` muestra `object.title ?? object.type` como título e `object.id` como subtítulo.
- [ ] La importación de `SocialActivity` resuelve correctamente contra el módulo `activity`.

---

## US-CT-07 — Motor y cableado de providers

**Card:** Como integrador, quiero un `CatalogEngine` que centralice los providers del módulo, para inicializar el catálogo de forma ordenada.

**Conversation:**
- `CatalogEngine({required CatalogRepository catalogRepository})`.
- `CatalogEngine.initializeProviders(WidgetRef ref)` — cuerpo vacío (Pendiente).
- `catalogRepositoryProvider` = `Provider<CatalogRepository>((_) => InMemoryCatalogRepository())`.

**Confirmation:**
- [ ] `CatalogEngine` requiere un `CatalogRepository` no nulo en su constructor.
- [ ] `initializeProviders(ref)` es invocable (aunque no registra nada todavía).
- [ ] `catalogRepositoryProvider` resuelve a `InMemoryCatalogRepository` por defecto.
- [ ] (Pendiente) `initializeProviders` registra los notificadores/state del módulo.
