# Épicas y Especificaciones (EARS) — Módulo Media

**Ruta código:** `lib\media\` (28 archivos `.dart`: 14 planos + 14 anidados en `lib\media\media\`, byte-idénticos)
**Subdirectorios:** `data_models`, `engine`, `pages`, `providers`, `repositories`, `widgets`, raíz (`media.dart` barrel).
**Fecha:** 2026-08-13

---

## Épica 1: Biblioteca de Medios del Usuario
Como usuario de MotorSocial, quiero visualizar y gestionar la biblioteca de mis medios (imágenes, vídeos), para consultar y reutilizar los assets que he subido.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá representar cada recurso multimedia mediante `SocialMediaAsset` con `id`, `ownerId`, `assetType`, `url` y `createdAt`.
- El sistema deberá exponer el estado de la biblioteca mediante `MediaLibraryState` (`mediaIds`) gestionado por `MediaLibraryNotifier` (Riverpod `Notifier`).
- El sistema deberá presentar la pantalla `MediaLibraryPage` accesible desde la navegación.

#### 2. Requerimientos Controlados por Eventos
- Cuando se construya `MediaLibraryPage`, el sistema deberá observar `mediaLibraryProvider` y renderizar un `ListView` con los `mediaIds` actuales.
- Cuando `mediaIds` esté vacío, el sistema deberá presentar una lista vacía (sin items) sin errores.

#### 3. Requerimientos Controlados por Estados
- Mientras `MediaLibraryState.mediaIds` contenga elementos, el sistema deberá listarlos como `ListTile` con el id como título.

#### 4. Requerimientos de Comportamiento No Deseado
- Si la observación de `mediaLibraryProvider` falla, entonces el sistema deberá mostrar un indicador de error en lugar de la lista (extensión futura; hoy el estado es estático vacío).

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de orden de álbumes esté incluida, el sistema deberá exponer `AlbumOrderState` (`order`) gestionado por `AlbumOrderNotifier` para ordenar la biblioteca.

#### 6. Requerimientos Complejos
- Mientras el usuario visualiza `MediaLibraryPage`, cuando se pulse un `ListTile`, el sistema deberá navegar al detalle del asset (extensión futura; hoy `ListTile` sin `onTap`).

---

## Épica 2: Subida, Borrado y Repositorio de Medios
Como usuario, quiero subir y eliminar mis medios, para mantener actualizada mi biblioteca con el backend.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer el contrato `MediaRepository` con las operaciones `byOwner(ownerId)`, `upload(asset)`, `delete(id)`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `MediaRepository.byOwner(ownerId)`, el sistema deberá devolver la lista de `SocialMediaAsset` del propietario.
- Cuando se invoque `upload(asset)`, el sistema deberá registrar el asset y devolverlo.
- Cuando se invoque `delete(id)`, el sistema deberá eliminar el asset con ese id.

#### 3. Requerimientos Controlados por Estados
- Mientras el `MediaEngine` esté inicializado, el sistema deberá permitir construirlo desde un repositorio vía `mediaEngineFromRepository(repo)` (factory que ignora el repo y devuelve `const MediaEngine()`).

#### 4. Requerimientos de Comportamiento No Deseado
- Si la implementación activa es `InMemoryMediaRepository`, entonces el sistema deberá devolver `[]` para `byOwner`, el asset para `upload` y no-op para `delete` (comportamiento de respaldo stub).

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de tipos de asset opcionales esté incluida, el sistema deberá aceptar `assetType` variado (`image`, `video`, `audio`, …) en `SocialMediaAsset`.

#### 6. Requerimientos Complejos
- Mientras la implementación use `InMemoryMediaRepository`, cuando se suba un asset, el sistema deberá devolver el asset sin persistirlo (stub).

---

## Épica 3: Selector, Slideshow y Visualización de Assets
Como usuario, quiero seleccionar medios y visualizarlos en una presentación, para curar y consumir mis assets.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer la página `MediaSlideshowPage` (`assetId` req) y el builder `MediaAssetBuilder` (`assetId` req).
- El sistema deberá exponer los widgets `MediaSlider` y `MediaThumbGrid`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se construya `MediaSlideshowPage`, el sistema deberá mostrar un `Scaffold` con AppBar "Slideshow" y el `assetId` en el cuerpo.
- Cuando se construya `MediaAssetBuilder`, el sistema deberá renderizar un `Placeholder` (comportamiento actual).

#### 3. Requerimientos Controlados por Estados
- Mientras los widgets `MediaSlider`/`MediaThumbGrid` no tengan implementación, el sistema deberá renderizar `SizedBox.shrink()` (placeholder invisible).

#### 4. Requerimientos de Comportamiento No Deseado
- Si un `assetId` no corresponde a un asset existente, entonces el sistema deberá mostrar unPlaceholder/estado vacío en `MediaAssetBuilder` (extensión futura).

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de selector múltiple esté incluida, el sistema deberá exponer `MediaSelectorPage` (hoydefine/oculta `SocialMediaAsset`/`MediaAssetBuilder` localmente — ver Duplicaciones).

#### 6. Requerimientos Complejos
- Mientras el usuario visualiza el slideshow, cuando cambie de asset, el sistema deberá actualizar el `assetId` visible (extensión futura; hoy estático).

---

## Épica 4: Barrel y Exportación del Módulo
Como desarrollador, quiero un barrel coherente que evite colisiones de nombres, para consumir el módulo de medios de forma limpia.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer desde `media.dart` los contratos `MediaContract`, `SocialMediaAsset`, `MediaRepository`, `MediaLibraryNotifier`, `MediaEngine` y las páginas `MediaLibraryPage`, `MediaSlideshowPage`.
- El sistema deberá usar `hide` en el barrel para evitar colisiones de `SocialMediaAsset`, `MediaAssetBuilder` y `MediaSlider`.

#### 2. Requerimientos Controlados por Eventos
- Cuando un consumidor importe `media.dart`, el sistema deberá disponibilizar las APIs públicas sin las definiciones duplicadas ocultas.

#### 3. Requerimientos Controlados por Estados
- Mientras existan definiciones locales duplicadas en `media_selector_page.dart` y `media_thumb_grid.dart`, el sistema deberá mantenerlas ocultas vía `hide` en el barrel.

#### 4. Requerimientos de Comportamiento No Deseado
- Si un consumidor importa un símbolo oculto, entonces el sistema deberá generar un error de compilación que indique que el símbolo no está exportado.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de re-exportación condicional esté incluida, el sistema podrá ocultar selectivamente widgets en desarrollo (`MediaSlider`, `MediaThumbGrid`).

#### 6. Requerimientos Complejos
- Mientras el módulo se refactorice, cuando se unifiquen las definiciones duplicadas, el sistema deberá simplificar el barrel eliminando los `hide`.

---

## Notas de Estado del Módulo
- **Cascarones UI:** `MediaAssetBuilder` → `Placeholder()`, `MediaSlider`/`MediaThumbGrid` → `SizedBox.shrink()`.
- **UI funcionales (parciales):** `MediaLibraryPage` (ListView enlazado a `mediaLibraryProvider`), `MediaSlideshowPage` (muestra `assetId`).
- **Cascarones lógica:** `MediaEngine.initialize()` vacío; `mediaEngineFromRepository` ignora el `repo` y devuelve `const MediaEngine()`.
- **Repositorio stub:** `InMemoryMediaRepository` (`byOwner → []`, `upload → asset`, `delete → no-op`). No expuesto como provider global; debe añadirse.
- **Modelo sin serialización:** `SocialMediaAsset` no tiene `fromJson`/`toJson`.
- **Duplicaciones internas:** `SocialMediaAsset` y `MediaAssetBuilder` re-definidos localmente en `pages\media_selector_page.dart`; `MediaSlider` re-definido en `widgets\media_thumb_grid.dart`. El barrel `media.dart` mitiga con `hide`.
- **`MediaContract`** vacío (sin `const` en el árbol plano; con `const` en el anidado).
- **Duplicación interna del árbol:** `lib\media\media\` (14 archivos) es byte-idéntica al árbol plano.
