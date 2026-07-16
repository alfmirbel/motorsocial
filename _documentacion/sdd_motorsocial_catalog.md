# SDD — Feature: Catalog

## 1. Resumen
El feature `catalog` gestiona objetos sociales genéricos tipificados, paginados, con detalle y capacidad declarativa de exportación. La UI ofrece listado y detalle mínimo.

## 2. Modelos
- `SocialObject`: id, type, title, attributes, ownerId, timestamps.
- `SocialObjectPage`: lista paginada `items`, `total`, `offset`, `hasMore`.
- `SocialObjectQuery`: preferredType, skip, limit, filter, sort.

## 3. Contrato
`CatalogContract`: providerName, supportedTypes, defaultPageSize, enableSearch, enablePdfExport, primaryCtaLabel.

## 4. Motor / Repositorio
- `CatalogRepository`: vacío base actual.
- `CatalogEngine`: bootstrap vacío `initializeProviders`.

## 5. Proveedores
- `CatalogState` / `CatalogNotifier`.
- `ObjectDetailNotifier`.
- `ExportState` / `ExportNotifier`.

## 6. UI
- `CatalogListPage`: carga provider, muestra items tipo ListTile.
- `ObjectDetailPage`: vista mínima `type: id`.

## 7. Requisitos
| ID | Requisito | Evidencia |
|-----|-----------|-----------|
| RF-CAT-01 | Proveer catálogo paginado con filtros básicos. | `SocialObjectQuery`, `SocialObjectPage`, `CatalogListPage`. |
| RF-CAT-02 | Permitir detalle por objeto. | `ObjectDetailPage`, `objectDetailProvider`. |
| RF-CAT-03 | Soportar búsqueda y exportación PDF declarativa. | `enableSearch`, `enablePdfExport`; `exportProvider`. |
| RF-CAT-04 | CTA configurable por proveedor. | `primaryCtaLabel`. |
