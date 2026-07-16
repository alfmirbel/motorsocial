# SDD — Feature: Navigation

## 1. Resumen
Define contratos de navegación, estructura de menú, ruteo y shell social.

## 2. Modelos
- `MenuItem`: sección tab/menú.
- `NavigationContract`: configuración de rutas habilitadas/tabs.

## 3. Proveedores / Núcleo
- `TabMenuNotifier`.
- `AppRouter`.
- `SocialScaffold`.

## 4. Requisitos
| ID | Requisito | Evidencia |
|-----|-----------|-----------|
 RF-NAV-01 | Proveer menú configurable por tabs. | `MenuItem`, `TabMenuNotifier`. |
 RF-NAV-02 | Enrutar páginas declaradas. | `AppRouter`. |
 RF-NAV-03 | Shell común para vistas sociales. | `SocialScaffold`. |
