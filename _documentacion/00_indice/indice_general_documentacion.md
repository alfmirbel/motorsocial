# Índice General de Documentación MotorSocial

Documentación generada por ingeniería inversa del código en `.\lib`. Estructura actual (post-eliminación de `lib/motorsocial/`): 141 archivos `.dart` en 12 módulos principales más `features/`. Organizada por Directorios Principales en `.\_documentacion\_analisisydiseno\`. Nota: `catalog/` contiene un subdirectorio anidado `catalog/catalog/` (13 archivos idénticos al árbol plano) pendiente de consolidar.

## Plan
- [Plan de Documentación](00_Plan/plan_documentacion.md)

## Iniciativa
- [OKRs](01_Iniciativa/01_OKRs.md)
- [Lean Canvas](01_Iniciativa/02_LeanCanvas.md)
- [Impact Mapping](01_Iniciativa/03_Impact_Mapping.md)

## Módulos (Directorios Principales - 13)
| # | Módulo | Epicas EARS | Features | User Stories | Tasks Inventario | BD |
|---|---|---|---|---|---|---|
| D1 | [Core](core/02_Epicas_EARS.md) | [Epicas](core/02_Epicas_EARS.md) | [Features](core/03_Features.feature) | [Stories](core/04_User_Stories.md) | [Tasks](core/05_Tasks_Inventario.md) | [BD](core/06_BD.md) |
| D2 | [Identity](identity/02_Epicas_EARS.md) | [Epicas](identity/02_Epicas_EARS.md) | [Features](identity/03_Features.feature) | [Stories](identity/04_User_Stories.md) | [Tasks](identity/05_Tasks_Inventario.md) | [BD](identity/06_BD.md) |
| D3 | [Security](security/02_Epicas_EARS.md) | [Epicas](security/02_Epicas_EARS.md) | [Features](security/03_Features.feature) | [Stories](security/04_User_Stories.md) | [Tasks](security/05_Tasks_Inventario.md) | [BD](security/06_BD.md) |
| D4 | [Catalog](catalog/02_Epicas_EARS.md) | [Epicas](catalog/02_Epicas_EARS.md) | [Features](catalog/03_Features.feature) | [Stories](catalog/04_User_Stories.md) | [Tasks](catalog/05_Tasks_Inventario.md) | [BD](catalog/06_BD.md) |
| D5 | [Activity](activity/02_Epicas_EARS.md) | [Epicas](activity/02_Epicas_EARS.md) | [Features](activity/03_Features.feature) | [Stories](activity/04_User_Stories.md) | [Tasks](activity/05_Tasks_Inventario.md) | [BD](activity/06_BD.md) |
| D6 | [Social Graph](social_graph/02_Epicas_EARS.md) | [Epicas](social_graph/02_Epicas_EARS.md) | [Features](social_graph/03_Features.feature) | [Stories](social_graph/04_User_Stories.md) | [Tasks](social_graph/05_Tasks_Inventario.md) | [BD](social_graph/06_BD.md) |
| D7 | [Media](media/02_Epicas_EARS.md) | [Epicas](media/02_Epicas_EARS.md) | [Features](media/03_Features.feature) | [Stories](media/04_User_Stories.md) | [Tasks](media/05_Tasks_Inventario.md) | [BD](media/06_BD.md) |
| D8 | [Location](location/02_Epicas_EARS.md) | [Epicas](location/02_Epicas_EARS.md) | [Features](location/03_Features.feature) | [Stories](location/04_User_Stories.md) | [Tasks](location/05_Tasks_Inventario.md) | [BD](location/06_BD.md) |
| D9 | [Design](design/02_Epicas_EARS.md) | [Epicas](design/02_Epicas_EARS.md) | [Features](design/03_Features.feature) | [Stories](design/04_User_Stories.md) | [Tasks](design/05_Tasks_Inventario.md) | [BD](design/06_BD.md) |
| D10 | [Navigation](navigation/02_Epicas_EARS.md) | [Epicas](navigation/02_Epicas_EARS.md) | [Features](navigation/03_Features.feature) | [Stories](navigation/04_User_Stories.md) | [Tasks](navigation/05_Tasks_Inventario.md) | [BD](navigation/06_BD.md) |
| D11 | [Features](features/02_Epicas_EARS.md) | [Epicas](features/02_Epicas_EARS.md) | [Features](features/03_Features.feature) | [Stories](features/04_User_Stories.md) | [Tasks](features/05_Tasks_Inventario.md) | [BD](features/06_BD.md) |
| D12 | [Resilience](resilience/02_Epicas_EARS.md) | [Epicas](resilience/02_Epicas_EARS.md) | [Features](resilience/03_Features.feature) | [Stories](resilience/04_User_Stories.md) | [Tasks](resilience/05_Tasks_Inventario.md) | [BD](resilience/06_BD.md) |

> **Nota:** No existe un directorio `lib/providers/` separado; los providers por módulo están en `<módulo>/providers/` dentro de cada carpeta de dominio. `catalog/` contiene subdirectorio anidado `catalog/catalog/` (13 archivos idénticos al árbol plano) pendiente de consolidar.

## Referencias Históricas (preexistentes, reutilizadas como insumo)
- `_documentacion/02_BDD/*.feature` (9 archivos)
- `_documentacion/03_SDD/*` (13 archivos SDD)
- `_documentacion/_resumen/paso{1..5}/*`
- `_documentacion/_activity/*` (semilla de formato, módulo Activity)