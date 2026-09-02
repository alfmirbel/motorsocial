# language: es
Característica: Biblioteca de Medios del Usuario
  Como usuario de MotorSocial
  Quiero visualizar y gestionar la biblioteca de mis medios (imágenes, vídeos)
  Para consultar y reutilizar los assets que he subido

  Escenario: Biblioteca vacía
    Dado el `MediaLibraryNotifier` recién creado
    Cuando se construye `MediaLibraryPage`
    Entonces el sistema debe observar `mediaLibraryProvider`
    Y debe renderizar un `ListView` vacío (sin items)

  Escenario: Biblioteca con assets
    Dado `MediaLibraryState.mediaIds = ["asset:1", "asset:2"]`
    Cuando se construye `MediaLibraryPage`
    Entonces el sistema debe renderizar un `ListView` con 2 items
    Y cada `ListTile` debe mostrar el `mediaId` como título

  Escenario: Orden de álbumes disponible
    Dado el provider `albumOrderProvider`
    Cuando se resuelve
    Entonces el sistema debe devolver un `AlbumOrderState` con `order: 0` por defecto

---

Característica: Subida, Borrado y Repositorio de Medios
  Como usuario
  Quiero subir y eliminar mis medios
  Para mantener actualizada mi biblioteca con el backend

  Escenario: Subida de asset
    Dado un `SocialMediaAsset` válido
    Cuando se invoca `MediaRepository.upload(asset)`
    Entonces el sistema debe devolver el asset registrado

  Escenario: Listado por propietario
    Dado un usuario con `ownerId: "user:abc"`
    Cuando se invoca `MediaRepository.byOwner("user:abc")`
    Entonces el sistema debe devolver la lista de `SocialMediaAsset` del propietario

  Escenario: Borrado por id
    Dado un asset con id "asset:1"
    Cuando se invoca `MediaRepository.delete("asset:1")`
    Entonces el sistema debe eliminar el asset con ese id

  Escenario: Stub in-memory
    Dado la implementación activa `InMemoryMediaRepository`
    Cuando se invoca `byOwner`, `upload` o `delete`
    Entonces el sistema debe devolver `[]`, el asset, o no-op respectivamente
    Y no debe lanzar excepciones

  Escenario: MediaEngine desde repositorio
    Dado un `repo` cualquiera
    Cuando se invoca `mediaEngineFromRepository(repo)`
    Entonces el sistema debe devolver `const MediaEngine()`
    Y debe ignorar el `repo`

---

Característica: Selector, Slideshow y Visualización de Assets
  Como usuario
  Quiero seleccionar medios y visualizarlos en una presentación
  Para curar y consumir mis assets

  Escenario: Slideshow muestra el asset activo
    Dado un `assetId: "asset:1"`
    Cuando se construye `MediaSlideshowPage` con ese `assetId`
    Entonces el sistema debe mostrar un `Scaffold` con AppBar "Slideshow"
    Y el cuerpo debe mostrar "Slideshow asset:1"

  Escenario: Builder de asset en estado pendiente
    Dado un `assetId: "asset:abc"`
    Cuando se construye `MediaAssetBuilder`
    Entonces el sistema debe renderizar un `Placeholder()`

  Escenario: Widgets de grid y slider en desarrollo
    Dado los widgets `MediaSlider` y `MediaThumbGrid`
    Cuando se construyen
    Entonces el sistema debe renderizar `SizedBox.shrink()` (placeholder invisible)

---

Característica: Barrel y Exportación del Módulo
  Como desarrollador
  Quiero un barrel coherente que evite colisiones de nombres
  Para consumir el módulo de medios de forma limpia

  Escenario: Símbolos públicos exportados
    Dado un consumidor que importa `media.dart`
    Cuando referencia `SocialMediaAsset`, `MediaRepository`, `MediaLibraryNotifier`, `MediaEngine`, `MediaLibraryPage` o `MediaSlideshowPage`
    Entonces el sistema debe disponibilizarlos sin colisión

  Escenario: Símbolos duplicados ocultos
    Dado `media_selector_page.dart` redefine `SocialMediaAsset` y `MediaAssetBuilder`
    Y `media_thumb_grid.dart` redefine `MediaSlider`
    Cuando se exporta vía el barrel
    Entonces el sistema debe ocultar esas redefiniciones con `hide`
