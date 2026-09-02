# Épicas y Especificaciones (EARS) - Módulo Core / Infraestructura

> Módulo de infraestructura transversal de MotorSocial. Cubre `lib/core/`
> (`config/`, `database/`, `providers/`), `lib/core/app_shell.dart` y el
> directorio raíz `lib/providers/` (en la práctica fusionado en
> `lib/core/providers/`). No contiene modelos de dominio: expone contratos de
> configuración, repositorios base de persistencia (CouchDB/Qdrant), un shell
> mínimo de arranque y un provider de sesión mínimo.

## Épica 1: Configuración y Arranque de la Aplicación
Como desarrollador de MotorSocial, quiero disponer de una configuración central inmutable (`SocialAppConfig`) y de un shell mínimo de arranque (`MainShell`), para que los módulos de dominio (identity, catalog, activity, media, location, navigation) se inicialicen de forma consistente con parámetros versionados y un punto de entrada UI único.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer un contrato de configuración inmutable `SocialAppConfig` con valores por defecto sensatos (`appName='MotorSocial'`, `themeId='light_default'`, `useStubRepositories=true`) accesible mediante `SocialAppConfig.defaults()`.
- El sistema deberá representar la configuración de conexiones externas mediante clases inmutables dedicadas (`CouchDbConfig`, `QdrantConfig`) con su respectiva serialización JSON (`fromJson` / `toJson`).

#### 2. Requerimientos Controlados por Eventos
- cuando se invoque `SocialAppConfig.fromJson(json)`, el sistema deberá construir la instancia mapeando optionalmente las claves anidadas `couchdb` y `qdrant` (nulas si no están presentes) y aplicando valores por defecto para el resto de claves ausentes.
- Cuando se invoque el `factory SocialAppConfig.defaults()`, el sistema deberá devolver una instancia con todos los mapas de módulo vacíos y `couchdb`/`qdrant` nulos.

#### 3. Requerimientos Controlados por Estados
- Mientras el flag `useStubRepositories` sea `true` (estado "modo stub"), el sistema deberá indicar a los repositorios que utilicen implementaciones en memoria en lugar de las reales de CouchDB.

#### 4. Requerimientos de Comportamiento No Deseado
- Si una clave obligatoria de `SocialAppConfig` no está presente en el JSON origen, entonces el sistema deberá sustituirla por su valor por defecto en lugar de propagar una excepción.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de persistencia CouchDB esté incluida (campo `couchdb` no nulo), el sistema deberá suministrar `url`, `username` y `password` para instanciar el `CouchDbRepository`.
- Donde la función de búsqueda vectorial Qdrant esté incluida (campo `qdrant` no nulo), el sistema deberá suministrar `url` y `apiKey` para el repositorio Qdrant.

#### 6. Requerimientos Complejos
- Mientras la aplicación se encuentre en estado de arranque, cuando se instancie `MainShell`, el sistema deberá renderizar un `Scaffold` mínimo con el texto `'MotorSocial'` como punto de entrada UI provisional.

---

## Épica 2: Repositorio Base de Persistencia CouchDB
Como capa de datos de MotorSocial, quiero un repositorio genérico `CouchDbRepository` capaz de CRUD, verificación y consultas por vistas sobre cualquier base `motorsocial_*`, para que los módulos de dominio persistan documentos con un único cliente HTTP y cabeceras de autenticación Basic uniformes.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá normalizar la URL base eliminando barras finales (`replaceAll(RegExp(r'/+$'), '')`) antes de componer cualquier URI CouchDB.
- El sistema deberá enviar en cada petición las cabeceras `Content-Type: application/json`, `Accept: application/json` y `Authorization: Basic <base64(user:pass)>`.

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `get(db, id)` y la respuesta tenga status `200`, el sistema deberá devolver el cuerpo decodificado como `Map<String, dynamic>`; en otro caso devolverá `null`.
- Cuando se invoque `put(db, doc)`, el sistema deberá elegir `POST` si el documento no contiene `_id` (alta) o `PUT` contra `_uri(db, _id)` si ya lo contiene (actualización), devolviendo el `id` resultante.
- Cuando se invoque `delete(db, id, rev)`, el sistema deberá enviar `DELETE` a `_uri(db, '$id?rev=$rev')`.
- Cuando se invoque `queryView(db, design, view, ...)`, el sistema deberá construir la URI `_design/$design/_view/$view` con `include_docs=true` y los parámetros opcionales `key`, `startKey`, `endKey`, `descending`, `limit`.

#### 3. Requerimientos Controlados por Estados
- Mientras la base de datos destino exista (comprobado vía `ping()`), el sistema deberá retornar `true` en `ensureDatabase(db)` sin intentar crearla de nuevo.

#### 4. Requerimientos de Comportamiento No Deseado
- Si una operación `put` recibe un status distinto de `200/201`, entonces el sistema deberá lanzar una `CouchDbException` con el mensaje `'PUT failed: <status> <body>'`.
- Si `queryView` recibe un status distinto de `200`, entonces el sistema deberá lanzar una `CouchDbException('queryView failed: <status>')`.
- Si `delete` recibe un status distinto de `200`, entonces el sistema deberá lanzar una `CouchDbException('DELETE failed: <status>')`.

#### 5. Requerimientos de Funciones Opcionales
- Donde se inyecte un `http.Client` personalizado en el constructor de `CouchDbRepository`, el sistema deberá usarlo; donde no se inyecte, el sistema deberá instanciar uno nuevo con `http.Client()`.

#### 6. Requerimientos Complejos
- Mientras `ping()` retorne `false` (base inexistente), cuando se invoque `ensureDatabase(db)`, el sistema deberá ejecutar `createDatabase(db)` (PUT a la raíz de la base) y considerar exitoso el resultado ante status `201` o `412` (ya existente).

---

## Épica 3: Estado de Sesión y Soporte Vectorial (Qdrant)
Como aplicación Flutter, quiero un provider Riverpod de sesión mínimo y un modelo de registro para el almacén vectorial Qdrant, para gestionar datos de sesión en memoria y habilitar futuras búsquedas semánticas con puntuación.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá modelar un registro Qdrant inmutable `QdrantRecord` con `id` (String), `payload` (Map<String,dynamic>) y `score` (double? opcional).

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `setSession(value)` sobre `SessionNotifier`, el sistema deberá reemplazar el estado por el nuevo `Map<String, String?>` suministrado.

#### 3. Requerimientos Controlados por Estados
- Mientras no se haya llamado a `setSession`, el sistema deberá mantener el estado de `sessionProvider` como un mapa vacío `<String, String?>{}`.

#### 4. Requerimientos de Comportamiento No Deseado
- Si el `databaseModuleProvider` se accede antes de su inicialización real, entonces el sistema deberá devolver `void` como placeholder (Pendiente de implementación).

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de scoring semántico esté habilitada, el sistema deberá poblar el campo `score` de `QdrantRecord` para ordenar resultados por relevancia.

#### 6. Requerimientos Complejos
- Mientras el módulo de base de datos permanezca como cascarón (`databaseModuleProvider = Provider<void>((_) {})`), cuando cualquier módulo de dominio lo consulte, el sistema deberá retornar `void` sin efectos secundarios hasta que se implemente la inicialización real.
