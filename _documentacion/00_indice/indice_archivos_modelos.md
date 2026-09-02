# Índice de Archivos de Modelos de Datos y Diccionarios de Base de Datos

Repositorio central de las referencias a los modelos de datos y diccionarios de base de datos (`06_BD.md`) de los submódulos del sistema MotorSocial. Las estructuras que van a CouchDB se documentan en el archivo `06_BD.md` de cada módulo.

> **Última actualización:** 2026-08-14. Post-eliminación de `lib/motorsocial/` (6 módulos duplicados removidos). Estructura actual: 141 archivos `.dart` en `lib/`. Nota: `catalog/` contiene subdirectorio anidado `catalog/catalog/` (13 archivos idénticos al árbol plano) pendiente de consolidar.

## Modelos por Módulo
| Módulo | Archivo de BD / Diccionario | Estado |
|---|---|---|
| Core | `_analisisydiseno\core\06_BD.md` | �� (capa base; sin BD propia de negocio) |
| Identity | `_analisisydiseno\identity\06_BD.md` | �� (`motorsocial_usuarios`, `motorsocial_roles`) |
| Security | `_analisisydiseno\security\06_BD.md` | �� (`motorsocial_security_events` sugerida; campos de seguridad en `motorsocial_usuarios`) |
| Catalog | `_analisisydiseno\catalog\06_BD.md` | �� (`motorsocial_catalog`; discrepancia con `motorsocial_alimentos` notada) |
| Activity | `_analisisydiseno\activity\06_BD.md` | �� (`motorsocial_activity_feed`) |
| Social Graph | `_analisisydiseno\social_graph\06_BD.md` | �� (`motorsocial_social_graph`, `motorsocial_invitations`, `motorsocial_grupos`) |
| Media | `_analisisydiseno\media\06_BD.md` | �� (`motorsocial_media`; binarios en almacenamiento externo) |
| Location | `_analisisydiseno\location\06_BD.md` | �� (`motorsocial_places` sugerida; CP lookup externo; bbox no geo real) |
| Design | `_analisisydiseno\design\06_BD.md` | �� (`motorsocial_themes` sugerida; `preferredThemeId` en `motorsocial_usuarios`) |
| Navigation | `_analisisydiseno\navigation\06_BD.md` | �� (sin BD propia; sesión vía `motorsocial_usuarios` de Identity) |
| Features | `_analisisydiseno\features\06_BD.md` | �� (sin BD propia; consume BD de Identity/Activity/Catalog/Social_Graph vía providers) |
| Resilience | `_analisisydiseno\resilience\06_BD.md` | �� (sin BD propia; cola local recomendada, `motorsocial_sync_queue` opcional) |

> Convención CouchDB: DBs `motorsocial_*`, Doc IDs con prefijo semántico (`user:`, `activity:`, `propiedad:`, `mensaje:`, `grupo:`…), preferir Mango queries sobre MapReduce.