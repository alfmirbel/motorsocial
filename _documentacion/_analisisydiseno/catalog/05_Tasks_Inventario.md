# Tasks / Inventario técnico — módulo Catalog

**Alcance:** todos los `.dart` bajo `lib/catalog/` recursivo (26 archivos).
**Estructura del árbol:** existe un clon anidado `lib/catalog/catalog/*` casi idéntico al árbol plano `lib/catalog/*`. La diferencia observable es `widgets/social_widgets.dart` (ruta de importación de `SocialActivity` relativa vs raíz-de-package) y `data_models/social_object_page.dart` (versión simple `id+object`). En las tablas se documenta el árbol plano `lib/catalog/*` y se anotan divergencias con el clon anidado.

> Todas las implementaciones son **scaffold**: notificadores y repositorios devuelven constantes/`null` o están vacíos. Salvo `CatalogContract`/`SocialObject`/`SocialObjectPage`/`SocialObjectQuery` (modelos con serialización), el resto está sin lógica.

---

## Tabla A — Inventario de componentes

| Subdirectorio | Archivo | Tipo de componente | Nombre del componente | Parámetros que requiere | Variables que utiliza | Variables internas | Estilos que le aplican |
|---|---|---|---|---|---|---|---|
| `data_models` | `catalog_contract.dart` | Modelo de contrato | `CatalogContract` | `providerName`(req), `supportedTypes`, `defaultPageSize`=20, `enableSearch`=true, `enablePdfExport`=false, `primaryCtaLabel`='Contactar' | — | — | Sin estilos (puro dato) |
| `data_models` | `catalog_query.dart` | Modelo de consulta | `SocialObjectQuery` | `preferredType`, `skip`=0, `limit`=20, `filter`={}, `sort`=[] | — | — | Sin estilos |
| `data_models` | `social_object.dart` | Modelo de entidad + paginación | `SocialObject`, `SocialObjectPage` | `SocialObject`: `id`(req),`type`(req),`title`,`attributes`={},`ownerId`,`createdAt`(req),`updatedAt`(req). `SocialObjectPage`: `items`=[],`total`=0,`offset`=0,`hasMore`=false | — | — | Sin estilos |
| `data_models` | `social_object_page.dart` | Modelo de página (variante simple) ¹ | `SocialObjectPage` | `id`(req),`object`(req, SocialObject) | — | — | Sin estilos. Oculto en el barrel (`hide SocialObjectPage`); la clase exportada es la de `social_object.dart` |
| `engine` | `catalog_engine.dart` | Cableador de providers | `CatalogEngine` | `CatalogRepository`(req) | `catalogRepository` | — | Sin estilos |
| `providers` | `catalog_notifier.dart` | Notificador Riverpod + Estado | `CatalogState`, `CatalogNotifier`, `catalogProvider` | `CatalogState`: `page`=AsyncValue.data(null),`isLoading`=false,`error`. `CatalogNotifier.build()` | `catalogProvider` | — | Sin estilos |
| `providers` | `object_detail_notifier.dart` | Notificador Riverpod | `ObjectDetailNotifier`, `objectDetailProvider` | retorno `AsyncValue<SocialObject?>` | — | — | Sin estilos |
| `providers` | `export_notifier.dart` | Provider de repositorio | `catalogRepositoryProvider` | ninguno (instancia `InMemoryCatalogRepository`) | `InMemoryCatalogRepository` | — | Sin estilos |
| `repositories` | `catalog_repository.dart` | Repositorio abstracto + impl | `CatalogRepository` (abstract), `InMemoryCatalogRepository` | `search(query, {limit=20})` | `SocialObjectQuery` | — | Sin estilos |
| `pages` | `catalog_list_page.dart` | Página UI (ConsumerWidget) | `CatalogListPage`, `ObjectDetailPage` | `CatalogListPage`: super.key. `ObjectDetailPage`: `objectId`(req),`objectType`(req) | `catalogProvider`, `CatalogState`, `SocialObjectPage`, `SocialObject` | — | `Scaffold`, `AppBar` (título «Catálogo»/«Detalle»), `Center`, `CircularProgressIndicator`, `ListView`, `ListTile`, `Text` (Material sin tema global explícito) |
| `widgets` | `object_widgets.dart` | Widget helper | `ObjectWidgets` | `SocialObject`(req) | `object`, `Card`, `ListTile`, `Text` | — | `Card`+`ListTile` (Material) |
| `widgets` | `social_widgets.dart` | Widget helper | `SocialWidgets` | `SocialActivity`(req) | `activity`, `ListTile`, `Text` | — | `ListTile` (Material) |
| (raíz) | `catalog.dart` | Barrel/export | `catalog.dart` | ninguno | exporta los 10 archivos | — | Sin estilos |

¹ El clon anidado `lib/catalog/catalog/data_models/social_object_page.dart` es idéntico al plano. La divergencia de `SocialObjectPage` (simple `id+object`) frente a la `SocialObjectPage` con `items/total/offset/hasMore` definida en `social_object.dart` se resuelve vía el barrel que hace `hide SocialObjectPage`.

---

## Tabla B — Inventario de elementos

| Subdirectorio | Archivo | Variables definidas en el archivo | Clases | Variables de la clase | Funciones o widgets definidos en la clase | Variables que utiliza | Llamadas a otras clases o widgets |
|---|---|---|---|---|---|---|---|
| (raíz) | `catalog.dart` | — | — | — | (barrel `export`) | — | referencia a `data_models/social_object`, `catalog_query`, `social_object_page.hide SocialObjectPage`, `providers/catalog_notifier`, `object_detail_notifier`, `export_notifier`, `repositories/catalog_repository`, `engine/catalog_engine`, `pages/catalog_list_page`, `widgets/object_widgets`, `widgets/social_widgets` |
| `data_models` | `catalog_contract.dart` | — | `CatalogContract` | `providerName: String`, `supportedTypes: List<String>`, `defaultPageSize: int`, `enableSearch: bool`, `enablePdfExport: bool`, `primaryCtaLabel: String` | `CatalogContract(...)` ctor, `CatalogContract.fromJson(json)`, `toJson()` | `json['providerName']`, `json['supportedTypes']`, `json['defaultPageSize']`, `json['enableSearch']`, `json['enablePdfExport']`, `json['primaryCtaLabel']` | `String`, `List<String>`, `int`, `bool` |
| `data_models` | `catalog_query.dart` | — | `SocialObjectQuery` | `preferredType: String?`, `skip: int`, `limit: int`, `filter: Map<String,dynamic>`, `sort: List<String>` | ctor `const SocialObjectQuery(...)` | — | `Map<String,dynamic>`, `List<String>` |
| `data_models` | `social_object.dart` | — | `SocialObject` | `id: String`, `type: String`, `title: String?`, `attributes: Map<String,dynamic>`, `ownerId: String?`, `createdAt: DateTime`, `updatedAt: DateTime` | `fromJson(json)`, `toJson()` | `json['id']`/`json['_id']`, `json['type']`, `json['title']`, `json['attributes']`, `json['ownerId']`, `json['createdAt']`, `json['updatedAt']` | `DateTime.tryParse`, `DateTime.now`, `DateTime.toIso8601String`, `Map<String,dynamic>` |
| `data_models` | `social_object.dart` | — | `SocialObjectPage` (barrel-exportada) | `items: List<SocialObject>`, `total: int`, `offset: int`, `hasMore: bool` | `fromJson(json)`, `toJson()` | `json['items']`, `json['total']`, `json['offset']`, `json['hasMore']` | `SocialObject.fromJson`, `items.map(...).toList()` |
| `data_models` | `social_object_page.dart` | — | `SocialObjectPage` (variante, oculta en barrel) | `id: String`, `object: SocialObject` | ctor `const SocialObjectPage({required id, required object})` | — | `SocialObject` |
| `engine` | `catalog_engine.dart` | — | `CatalogEngine` | `catalogRepository: CatalogRepository` | `CatalogEngine(this.catalogRepository)`, `initializeProviders(WidgetRef ref)` (vacío) | `ref` (no usado) | `CatalogRepository`, `WidgetRef` (flutter_riverpod) |
| `providers` | `catalog_notifier.dart` | `catalogProvider` (NotifierProvider) | `CatalogState`, `CatalogNotifier` | `CatalogState`: `page: AsyncValue<SocialObjectPage?>`, `isLoading: bool`, `error: String?`. `CatalogNotifier`: hereda `Notifier<CatalogState>` | `CatalogState(...)`, `copyWith(...)`, `build()` (retorna `const CatalogState()`) | — | `Notifier`, `NotifierProvider` (flutter_riverpod); `AsyncValue`, `SocialObjectPage` |
| `providers` | `object_detail_notifier.dart` | `objectDetailProvider` (NotifierProvider) | `ObjectDetailNotifier` | hereda `Notifier<AsyncValue<SocialObject?>>` | `build()` (retorna `AsyncValue.data(null)`) | — | `Notifier`, `NotifierProvider`, `AsyncValue`, `SocialObject` |
| `providers` | `export_notifier.dart` | `catalogRepositoryProvider` (Provider) | — | — | `Provider<CatalogRepository>((_) => InMemoryCatalogRepository())` | — | `Provider` (flutter_riverpod); `CatalogRepository`, `InMemoryCatalogRepository` (de `repositories/catalog_repository.dart`) |
| `repositories` | `catalog_repository.dart` | — | `CatalogRepository` (abstract), `InMemoryCatalogRepository` (impl) | — | `CatalogRepository.search(String query, {int limit=20})`; `InMemoryCatalogRepository.search` → `const []` | `query`, `limit` (no usados efectivamente) | `SocialObjectQuery` |
| `pages` | `catalog_list_page.dart` | — | `CatalogListPage`, `ObjectDetailPage` | `CatalogListPage`: (super.key). `ObjectDetailPage`: `objectId: String`, `objectType: String` | `CatalogListPage.build(context, ref)`; `ObjectDetailPage.build(context, ref)` | `ref.watch(catalogProvider)`, `state.page.value`, `state.isLoading`, `page.items`, `item.title`, `item.type`, `item.id` | `ConsumerWidget`, `WidgetRef`; `Scaffold`, `AppBar`, `Center`, `CircularProgressActivityIndicator`, `ListView.builder`, `ListTile`, `Text`; `catalogProvider`, `CatalogState` |
| `widgets` | `object_widgets.dart` | — | `ObjectWidgets` | `object: SocialObject` | `ObjectWidgets(this.object)`, `buildCard()` | `object.title`, `object.type`, `object.id` | `Card`, `ListTile`, `Text`; `SocialObject` |
| `widgets` | `social_widgets.dart` | — | `SocialWidgets` | `activity: SocialActivity` | `SocialWidgets(this.activity)`, `buildActivityTile()` | `activity.verb`, `activity.actorName` | `ListTile`, `Text`; `SocialActivity` (import de `activity/data_models/activity_contract.dart`). En el clon anidado la ruta es `../../../../activity/data_models/activity_contract.dart` |

## Divergencias con el clon anidado `lib/catalog/catalog/*`

Los 13 archivos bajo `lib/catalog/catalog/**` son **idénticos** a los del árbol plano `lib/catalog/**` salvo en:
- `widgets/social_widgets.dart`: la ruta de importación de `SocialActivity` cambia de `/activity/data_models/activity_contract.dart` (package-root, plano) a `../../../../activity/data_models/activity_contract.dart` (relativa, anidado).
- El resto (incluidos `catalog_notifier.dart`, `catalog_repository.dart`, `catalog_list_page.dart`, `export_notifier.dart`, `object_detail_notifier.dart`, `catalog_engine.dart`, `object_widgets.dart`, `catalog_contract.dart`, `catalog_query.dart`, `social_object.dart`, `social_object_page.dart`, `catalog.dart`) son byte-idénticos.

El clon anidado parece ser una copia obsoleta/de respaldo (mismo `export` barrel que el plano). Se recomienda consolidar en un único árbol para evitar desincronía.
