# Plan de Documentación — MotorSocial

**Sistema:** motorsocial (App Flutter: motor genérico de red social)
**Código fuente a documentar:** `.\lib` (Flutter, Riverpod 3.x + Freezed + Dio, CouchDB)
**Fecha de elaboración:** 2026-08-13
**Decisión de alcance:** Documentar los 13 módulos principales de `lib/`. Cada módulo plano puede tener un subdirectorio anidado interno (ej. `lib/activity/engine/`) que se documenta como parte del mismo módulo.

---

## 1. Alcance y Convenios

### 1.1 Cobertura

- Se documentan **todos los subdirectorios y archivos `.dart`** bajo `.\lib` que **no sean autogenerados** (`*.g.dart`, `*.freezed.dart`). En este proyecto no se detectaron archivos autogenerados.
- Los subdirectorios anidados internos (ej. `lib/activity/providers/`, `lib/catalog/pages/`, etc.) se documentan como parte de su módulo padre, anotando divergencias.

### 1.2 Estructura de salida

Cada módulo `M` genera una carpeta:

```
.\_documentacion\_analisisydiseno\<M>\
  02_Epicas_EARS.md
  03_Features.feature
  04_User_Stories.md
  05_Tasks_Inventario.md
  06_BD.md
```

La Iniciativa (OKRs + Lean Canvas) vive en `01_Iniciativa/`. Los índices en `00_indice/`.

### 1.3 Reutilización de documentación existente

| Existente                                                       | Acción                                                                   |
| --------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `_analisisydiseno/01_Iniciativa/01_OKRs.md`, `02_LeanCanvas.md` | Revisar/completar                                                        |
| `_activity/02_Epicas.md` … `06_BD.md`                           | Adoptar como plantilla; mover a `_analisisydiseno/activity/` y completar |
| `_documentacion/02_BDD/*.feature` (9)                           | Validar y enriquecer                                                     |
| `_documentacion/03_SDD/*` (13)                                  | Reutilizar como insumo                                                   |
| `_resumen/paso{1..5}/*`                                         | Base para Iniciativa, Epicas, Features, Stories                          |

### 1.4 Convenciones de redacción

- **Idioma:** español
- **EARS:** 6 patrones (Ubicuo, Evento, Estado, No Deseado, Opcional, Complejo)
- **Gherkin:** `# language: es`, `Característica:` como Card 3C
- **CouchDB:** DBs `motorsocial_*`, Doc IDs con prefijo semántico, preferir Mango

---

## 2. Directorios Principales (13 módulos)

|   # | Módulo       | Ruta `lib/`         | Archivos `.dart` | Subdir anidado     |
| --: | ------------ | ------------------- | ---------------: | ------------------ |
|  D0 | Iniciativa   | (transversal)       |                — | —                  |
|  D1 | Core         | `lib/core/`         |                6 | —                  |
|  D2 | Identity     | `lib/identity/`     |               18 | —                  |
|  D3 | Security     | `lib/security/`     |                7 | —                  |
|  D4 | Catalog      | `lib/catalog/`      |               13 | —                  |
|  D5 | Activity     | `lib/activity/`     |               11 | —                  |
|  D6 | Social Graph | `lib/social_graph/` |               17 | —                  |
|  D7 | Media        | `lib/media/`        |               14 | —                  |
|  D8 | Location     | `lib/location/`     |                7 | —                  |
|  D9 | Design       | `lib/design/`       |               10 | —                  |
| D10 | Navigation   | `lib/navigation/`   |                7 | —                  |
| D11 | Features     | `lib/features/`     |                8 | —                  |
| D12 | Resilience   | `lib/resilience/`   |                9 | —                  |
| D13 | Providers    | `lib/providers/`    |                1 | — (cubierto en D1) |

**Total:** ~128 archivos `.dart`, 81 carpetas

---

## 3. Etapas de Documentación (por cada Directorio Principal)

### Etapa 0 — Iniciativa (solo D0, una vez)

- **0.1** Revisar `01_Iniciativa/01_OKRs.md` y `02_LeanCanvas.md`.
- **0.2** Completar OKRs: 1 Objetivo + 3-5 KR medibles.
- **0.3** Completar Lean Canvas.
- **0.4** Impact Mapping: Iniciativa → Actores → Impactos → Entregables.

### Etapa 1 — Ingeniería inversa

- **1.1** Listar `find lib/<M> -name "*.dart" ! -name "*.g.dart" ! -name "*.freezed.dart"`.
- **1.2** Clasificar: `data_models`, `engine`, `providers`, `repositories`, `pages`, `widgets`, `routing`, `shell`, `tokens`, `config`, `database`.
- **1.3** Identificar dependencias.

### Etapa 2 — Epicas + EARS (`02_Epicas_EARS.md`)

- **2.1** User Story Mapping.
- **2.2** 6 patrones EARS: Ubicuo, Evento, Estado, No Deseado, Opcional, Complejo.

### Etapa 3 — Features BDD (`.feature`)

- **3.1** `.feature` en Gherkin (`# language: es`).
- **3.2** Card 3C: "Como… quiero… para…"
- **3.3** Reutilizar y enriquecer 9 `.feature` de `02_BDD/`.

### Etapa 4 — User Stories (`04_User_Stories.md`)

- **4.1** Escenarios Gherkin (Dado/Cuando/Entonces/Y).
- **4.2** 3 C's: Card, Conversation, Confirmation.

### Etapa 5 — Tasks / Inventario (`05_Tasks_Inventario.md`)

- **5.1** Tabla A: Componentes (Subdir | Archivo | Tipo | Nombre | Parámetros | Variables | Internas | Estilos)
- **5.2** Tabla B: Elementos (Subdir | Archivo | Variables | Clases | Vars Clase | Funciones/Widgets | Vars Usadas | Llamadas)

### Etapa 6 — Bases de Datos (`06_BD.md`)

- **6.1** Separar estructuras internas vs BD.
- **6.2** Por cada una a BD: estructura, diccionario, JSON, DB CouchDB `motorsocial_*`.
- **6.3** Mango queries, vistas, índices.
- **6.4** Actualizar `00_indice/indice_archivos_modelos.md`.

### Etapa 7 — Cierre

- **7.1** Actualizar `00_indice/indice_general_documentacion.md`.
- **7.2** Marcar completado en checklist.

---

## 4. Cronograma de Ejecución

### Bloque I — Iniciativa + Núcleo

1. **D0 — Iniciativa**: Etapa 0 (OKRs + Lean Canvas + Impact Mapping)
2. **D1 — Core**: Etapas 1–7 (incluye `lib/providers/`)
3. **D2 — Identity**: Etapas 1–7 (incluye anidado `lib/identity/identity/`)
4. **D3 — Security**: Etapas 1–7

### Bloque II — Dominio funcional

5. **D4 — Catalog**: Etapas 1–7 (incluye anidado `lib/catalog/catalog/`)
6. **D5 — Activity**: Etapas 1–7 (incluye anidado `lib/activity/activity/`)
7. **D6 — Social Graph**: Etapas 1–7 (incluye anidado `lib/social_graph/social_graph/`)
8. **D7 — Media**: Etapas 1–7 (incluye anidado `lib/media/media/`)
9. **D8 — Location**: Etapas 1–7

### Bloque III — UI y experiencia

10. **D9 — Design**: Etapas 1–7
11. **D10 — Navigation**: Etapas 1–7 (incluye anidado `lib/navigation/navigation/`)
12. **D11 — Features**: Etapas 1–7
13. **D12 — Resilience**: Etapas 1–7
14. **D13 — Providers**: cubierto en D1

---

## 5. Checklist de Avance

- [x] Plan generado
- [x] D0 Iniciativa — OKRs + Lean Canvas + Impact Mapping
- [x] D1 Core — Etapas 1-7
- [x] D2 Identity — Etapas 1-7
- [x] D3 Security — Etapas 1-7
- [x] D4 Catalog — Etapas 1-7
- [x] D5 Activity — Etapas 1-7
- [x] D6 Social Graph — Etapas 1-7
- [x] D7 Media — Etapas 1-7
- [x] D8 Location — Etapas 1-7
- [x] D9 Design — Etapas 1-7
- [x] D10 Navigation — Etapas 1-7
- [x] D11 Features — Etapas 1-7
- [x] D12 Resilience — Etapas 1-7
- [x] D13 Providers — cubierto en D1
- [x] Índices `00_indice/` corregidos y poblados

---

## 6. Riesgos y Notas

- **Subdirectorios anidados internos:** 6 módulos tienen réplica interna (`lib/<m>/<m>/`). Se documentan como parte del módulo padre, anotando divergencias (formato, imports, `const`).
- **AGENTS.md desactualizado:** referencias a rutas inexistentes. No corregir aquí.
- **Flutter nunca tiene credenciales CouchDB.** Documentar repositorios como abstracción.
- **No hay archivos autogenerados** (`*.freezed.dart`, `*.g.dart`) — faltan `build_runner`, `freezed`, `json_serializable`, `riverpod_generator`.
