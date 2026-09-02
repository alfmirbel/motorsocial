# Inventario Técnico y Tareas — Módulo Media

**Ruta código:** `lib\media\` (28 archivos `.dart`: 14 planos + 14 anidados en `lib\media\media\`, byte-idénticos)
**Inventario basado en el árbol plano** `lib\media\` (canónico).

---

## Tabla A — Inventario de Componentes

| Subdirectorio | Archivo | Tipo de componente | Nombre del componente | Parámetros que requiere | Variables que utiliza | Variables internas | Estilos que le aplican |
|---|---|---|---|---|---|---|---|
| (raíz) | `media.dart` | Barrel | — | N/A | — | — | N/A |
| `data_models` | `media.dart` | Barrel (sub) | — | N/A | — | — | N/A |
| `data_models` | `media_contract.dart` | Marker | `MediaContract` | (vacía, sin `const`) | — | — | N/A |
| `data_models` | `social_media_asset.dart` | Clase de Datos | `SocialMediaAsset` | `id`, `ownerId`, `assetType`, `url`, `createdAt` | — | — | N/A |
| `engine` | `media_engine.dart` | Lógica/Servicio | `MediaEngine` (Pendiente) | — | — | — | N/A |
| `engine` | `media_engine.dart` | Factory | `mediaEngineFromRepository` | `repo` (dynamic) | — | — | N/A |
| `pages` | `media_asset_builder.dart` | Widget (UI) | `MediaAssetBuilder` (Pendiente) | `key`, `assetId` (req) | `assetId` | — | Placeholder |
| `pages` | `media_library_page.dart` | Widget (UI) | `MediaLibraryPage` | `key` | `ref`, `ids` | — | Scaffold, AppBar, ListView, ListTile, Text |
| `pages` | `media_selector_page.dart` | Clase de Datos (dup) | `SocialMediaAsset` (local) | `id`, `ownerId`, `assetType`, `url`, `createdAt` | — | — | N/A |
| `pages` | `media_selector_page.dart` | Widget (UI) | `MediaAssetBuilder` (local dup) | `key`, `assetId` | `assetId` | — | Placeholder |
| `pages` | `media_slideshow_page.dart` | Widget (UI) | `MediaSlideshowPage` | `key`, `assetId` (req) | `widget.assetId` | — | Scaffold, AppBar, Center, Text |
| `pages` | `media_slideshow_page.dart` | State | `_MediaSlideshowPageState` | — | `widget.assetId` | — | Scaffold, AppBar, Center, Text |
| `providers` | `album_order_notifier.dart` | Clase de Estado | `AlbumOrderState` | `order` (int, def 0) | — | — | N/A |
| `providers` | `album_order_notifier.dart` | Riverpod Provider | `AlbumOrderNotifier` (Pendiente) | — | — | — | N/A |
| `providers` | `album_order_notifier.dart` | Provider | `albumOrderProvider` | N/A | — | — | N/A |
| `providers` | `media_library_notifier.dart` | Clase de Estado | `MediaLibraryState` | `mediaIds` (List<String>, def `[]`) | — | — | N/A |
| `providers` | `media_library_notifier.dart` | Riverpod Provider | `MediaLibraryNotifier` (Pendiente) | — | — | — | N/A |
| `providers` | `media_library_notifier.dart` | Provider | `mediaLibraryProvider` | N/A | — | — | N/A |
| `repositories` | `media_repository.dart` | Interfaz/Repositorio | `MediaRepository` (abstract) | — | — | — | N/A |
| `repositories` | `media_repository.dart` | Repositorio MOCK | `InMemoryMediaRepository` | — | — | — | N/A |
| `widgets` | `media_slider.dart` | Widget (UI) | `MediaSlider` (v1, Pendiente) | `key` | — | — | SizedBox.shrink |
| `widgets` | `media_thumb_grid.dart` | Widget (UI) | `MediaThumbGrid` (Pendiente) | `key` | — | — | SizedBox.shrink |
| `widgets` | `media_thumb_grid.dart` | Widget (UI) | `MediaSlider` (v2, local dup) | `key` | — | — | SizedBox.shrink |

---

## Tabla B — Inventario de Elementos Internos

| Subdirectorio | Archivo | Variables definidas en el archivo | Clases | Variables de la clase | Funciones/Widgets definidos en la clase | Variables que utiliza | Llamadas a otras clases/widgets |
|---|---|---|---|---|---|---|---|
| (raíz) | `media.dart` | — | — | — | export `data_models/media_contract.dart`, `data_models/social_media_asset.dart`, `repositories/media_repository.dart`, `providers/media_library_notifier.dart`, `engine/media_engine.dart`, `pages/media_library_page.dart`, `pages/media_selector_page.dart hide SocialMediaAsset`, `pages/media_slideshow_page.dart`, `pages/media_asset_builder.dart hide MediaAssetBuilder`, `widgets/media_thumb_grid.dart hide MediaSlider`, `widgets/media_slider.dart hide MediaSlider` | — | barrel |
| `data_models` | `media.dart` | — | — | — | export `media_contract.dart`, `social_media_asset.dart` | — | barrel |
| `data_models` | `media_contract.dart` | — | `MediaContract` | — | (vacía, sin `const`) | — | — |
| `data_models` | `social_media_asset.dart` | — | `SocialMediaAsset` | `id`, `ownerId`, `assetType`, `url`, `createdAt` | `const SocialMediaAsset(...)` | — | `DateTime` |
| `engine` | `media_engine.dart` | — | `MediaEngine` | — | `const MediaEngine()`, `initialize()` (no-op, Pendiente) | — | — |
| `engine` | `media_engine.dart` | `mediaEngineFromRepository` (top-level fn) | — | — | `mediaEngineFromRepository(repo)` → `const MediaEngine()` | `repo` (dynamic, ignorado) | `MediaEngine` |
| `pages` | `media_asset_builder.dart` | — | `MediaAssetBuilder` (StatelessWidget) | `assetId` | `const MediaAssetBuilder(...)`, `build(context)` → `Placeholder()` | `assetId` | `Placeholder` |
| `pages` | `media_library_page.dart` | — | `MediaLibraryPage` (ConsumerWidget) | — | `build(context, ref)` → Scaffold/AppBar/ListView.builder | `ref.watch(mediaLibraryProvider).mediaIds` | `Scaffold`, `AppBar`, `ListView`, `ListTile`, `Text`, `mediaLibraryProvider` |
| `pages` | `media_selector_page.dart` | — | `SocialMediaAsset` (local dup) | `id`, `ownerId`, `assetType`, `url`, `createdAt` | `const SocialMediaAsset(...)` | — | `DateTime` |
| `pages` | `media_selector_page.dart` | — | `MediaAssetBuilder` (local dup) | `assetId` | `const MediaAssetBuilder(...)`, `build(context)` → `Placeholder()` | `assetId` | `Placeholder` |
| `pages` | `media_slideshow_page.dart` | — | `MediaSlideshowPage` (ConsumerStatefulWidget) | `assetId` | `createState()` → `_MediaSlideshowPageState` | `widget.assetId` | `ConsumerState` |
| `pages` | `media_slideshow_page.dart` | — | `_MediaSlideshowPageState` | — | `build(context)` → Scaffold/AppBar/Center/Text | `widget.assetId` | `Scaffold`, `AppBar`, `Center`, `Text` |
| `providers` | `album_order_notifier.dart` | `albumOrderProvider` | `AlbumOrderState` | `order` | `const AlbumOrderState(...)`, `copyWith` | — | — |
| `providers` | `album_order_notifier.dart` | — | `AlbumOrderNotifier` (Pendiente) | — | `build()` → `AlbumOrderState()` | — | `Notifier`, `AlbumOrderState` |
| `providers` | `media_library_notifier.dart` | `mediaLibraryProvider` | `MediaLibraryState` | `mediaIds` | `const MediaLibraryState(...)`, `copyWith` | — | — |
| `providers` | `media_library_notifier.dart` | — | `MediaLibraryNotifier` (Pendiente) | — | `build()` → `MediaLibraryState()` | — | `Notifier`, `MediaLibraryState` |
| `repositories` | `media_repository.dart` | — | `MediaRepository` (abstract) | — | `byOwner(ownerId)` (abstract), `upload(asset)` (abstract), `delete(id)` (abstract) | — | `SocialMediaAsset` |
| `repositories` | `media_repository.dart` | — | `InMemoryMediaRepository` | — | `byOwner → []`, `upload → asset`, `delete → no-op` | — | `SocialMediaAsset`, `MediaRepository` |
| `widgets` | `media_slider.dart` | — | `MediaSlider` (v1) (StatelessWidget) | — | `const MediaSlider(...)`, `build(context)` → `SizedBox.shrink()` | — | `SizedBox` |
| `widgets` | `media_thumb_grid.dart` | — | `MediaThumbGrid` (StatelessWidget) | — | `const MediaThumbGrid(...)`, `build(context)` → `SizedBox.shrink()` | — | `SizedBox` |
| `widgets` | `media_thumb_grid.dart` | — | `MediaSlider` (v2, local dup) (StatelessWidget) | — | `const MediaSlider(...)`, `build(context)` → `SizedBox.shrink()` | — | `SizedBox` |

---

## Duplicaciones / Inconsistencias Detectadas

1. **`SocialMediaAsset` duplicada localmente** en `pages\media_selector_page.dart` (idéntica a `data_models\social_media_asset.dart`). El barrel mitiga con `hide SocialMediaAsset`.
2. **`MediaAssetBuilder` duplicada localmente** en `pages\media_selector_page.dart` (idéntica a `pages\media_asset_builder.dart`). El barrel mitiga con `hide MediaAssetBuilder`.
3. **`MediaSlider` duplicada** en `widgets\media_thumb_grid.dart` y `widgets\media_slider.dart`. El barrel mitiga con `hide MediaSlider` en ambas exportaciones.
4. **`MediaContract`** vacía (sin `const` en el árbol plano; con `const` en el anidado).
5. **Falta `mediaRepositoryProvider`**: a diferencia de otros módulos (que exponen `xxxRepositoryProvider`), Media no define un provider para `MediaRepository`. Deuda técnica.
6. **`SocialMediaAsset` sin serialización** (`fromJson`/`toJson`): debe añadirse al cablear el backend.
7. **Cascarones:** `MediaEngine.initialize()`, `MediaLibraryNotifier.build`, `AlbumOrderNotifier.build` vacíos; `MediaSlider`/`MediaThumbGrid`/`MediaAssetBuilder` son placeholders.
8. **Duplicación interna del árbol:** `lib\media\media\` (14 archivos) es byte-idéntica al árbol plano.
