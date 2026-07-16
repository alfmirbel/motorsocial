# SDD — Feature: Media

## 1. Resumen
Gestiona assets multimedia sociales, biblioteca del owner, selector, builder, slideshow y vistas en grilla/carrusel.

## 2. Modelos
- `SocialMediaAsset`: id, ownerId, assetType, url, createdAt.

## 3. Repositorio
- `MediaRepository`: por owner, upload, delete.

## 4. Proveedores
- `MediaLibraryState` / `MediaLibraryNotifier`.
- `AlbumOrderState` / `AlbumOrderNotifier`.

## 5. UI
- `MediaLibraryPage`.
- `MediaSelectorPage`.
- `MediaSlideshowPage`.
- `MediaAssetBuilder`.
- `MediaThumbGrid`, `MediaSlider`.

## 6. Motor
- `MediaEngine`.

## 7. Requisitos
| ID | Requisito | Evidencia |
|-----|-----------|-----------|
| RF-MED-01 | Listar media del usuario. | `byOwner`, `MediaLibraryPage`. |
| RF-MED-02 | Subir y eliminar assets. | `upload`, `delete`. |
| RF-MED-03 | Visualizar assets en slideshow. | `MediaSlideshowPage`. |
| RF-MED-04 | Ordenar álbumes. | `AlbumOrderState`, `albumOrderProvider`. |
