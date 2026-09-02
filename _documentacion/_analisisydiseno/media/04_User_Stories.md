# User Stories — Módulo Media

**Metodología:** 3 C's (Card, Conversation, Confirmation)
**Features fuente:** `03_Features.feature`

---

## US-MED-001 — Biblioteca de Medios del Usuario

### Card
Como usuario, quiero visualizar y gestionar la biblioteca de mis medios, para consultar y reutilizar los assets que he subido.

### Conversation
- `MediaLibraryNotifier` (Riverpod `Notifier`) gestiona `MediaLibraryState` (`mediaIds`) con `copyWith`. `build()` retorna estado vacío.
- `MediaLibraryPage` observa `mediaLibraryProvider` y renderiza `ListView.builder` con `ListTile` por cada `mediaId`.
- `AlbumOrderNotifier` gestiona `AlbumOrderState` (`order`, def 0) con `copyWith`; `build()` retorna estado vacío.

### Confirmation (Criterios de Aceptación)
- ✓ `MediaLibraryPage` observa `mediaLibraryProvider` y renderiza un `ListView`.
- ✓ Con `mediaIds` vacío, la lista no tiene items y no lanza errores.
- ✓ Con `mediaIds` poblado, cada `ListTile` muestra el `mediaId` como título.
- ✓ `albumOrderProvider` resuelve a `AlbumOrderState` con `order: 0` por defecto.

---

## US-MED-002 — Subida, Borrado y Repositorio de Medios

### Card
Como usuario, quiero subir y eliminar mis medios, para mantener actualizada mi biblioteca con el backend.

### Conversation
- `MediaRepository` (abstract) define `byOwner(ownerId)`, `upload(asset)`, `delete(id)`.
- `InMemoryMediaRepository` stub: `byOwner → []`, `upload → asset`, `delete → no-op`.
- `MediaEngine` es `const` con `initialize()` vacío; `mediaEngineFromRepository(repo)` ignora el repo y devuelve `const MediaEngine()`.
- **No existe un provider global** que exponga `MediaRepository` (a diferencia de otros módulos). Deuda técnica.

### Confirmation (Criterios de Aceptación)
- ✓ `upload(asset)` devuelve el asset registrado.
- ✓ `byOwner("user:abc")` devuelve la lista de assets del propietario.
- ✓ `delete("asset:1")` elimina el asset.
- ✓ `InMemoryMediaRepository` no lanza excepciones en ninguna operación.
- ✓ `mediaEngineFromRepository(repo)` devuelve `const MediaEngine()`.

---

## US-MED-003 — Selector, Slideshow y Visualización de Assets

### Card
Como usuario, quiero seleccionar medios y visualizarlos en una presentación, para curar y consumir mis assets.

### Conversation
- `MediaSlideshowPage` (ConsumerStatefulWidget) requiere `assetId` y muestra `Scaffold` con AppBar "Slideshow" y `Text('Slideshow ${widget.assetId}')`.
- `MediaAssetBuilder` (StatelessWidget) requiere `assetId` y renderiza `Placeholder()`.
- `MediaSlider` y `MediaThumbGrid` son StatelessWidget que renderizan `SizedBox.shrink()` (placeholders invisibles).
- `media_selector_page.dart` redefine `SocialMediaAsset` y `MediaAssetBuilder` localmente (duplicación).

### Confirmation (Criterios de Aceptación)
- ✓ `MediaSlideshowPage` con `assetId` muestra "Slideshow `<assetId>`".
- ✓ `MediaAssetBuilder` renderiza un `Placeholder()`.
- ✓ `MediaSlider` y `MediaThumbGrid` renderizan `SizedBox.shrink()`.

---

## US-MED-004 — Barrel y Exportación del Módulo

### Card
Como desarrollador, quiero un barrel coherente que evite colisiones de nombres, para consumir el módulo de medios de forma limpia.

### Conversation
- `media.dart` re-exporta `MediaContract`, `SocialMediaAsset`, `MediaRepository`, `MediaLibraryNotifier`, `MediaEngine`, `MediaLibraryPage`, `MediaSlideshowPage`.
- Usa `hide SocialMediaAsset` en `media_selector_page.dart`, `hide MediaAssetBuilder` en `media_asset_builder.dart`, `hide MediaSlider` en `media_thumb_grid.dart` y `media_slider.dart` para mitigar duplicaciones.
- `MediaContract` es un marker vacío (sin `const` en el árbol plano).

### Confirmation (Criterios de Aceptación)
- ✓ Importar `media.dart` disponibiliza `SocialMediaAsset`, `MediaRepository`, `MediaLibraryNotifier`, `MediaEngine`, `MediaLibraryPage`, `MediaSlideshowPage` sin colisión.
- ✓ Las redefiniciones de `SocialMediaAsset`, `MediaAssetBuilder` y `MediaSlider` quedan ocultas vía `hide`.
- ✓ Referenciar un símbolo oculto produce error de compilación.
