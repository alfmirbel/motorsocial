# language: es
# Features (BDD Gherkin) - Módulo Core / Infraestructura
# Un archivo por Feature. Aquí se agrupan para el módulo Core.

Característica: Configuración de la aplicación
  Como desarrollador de MotorSocial
  Quiero disponer de una configuración central inmutable `SocialAppConfig`
  Para que cada módulo de dominio se inicialice con parámetros versionados y consistentes.

  Escenario: Construcción por defecto
    Dado que ningún JSON de configuración está disponible
    Cuando se invoca `SocialAppConfig.defaults()`
    Entonces la instancia retorna `appName = "MotorSocial"`
    Y `themeId = "light_default"`
    Y `useStubRepositories = true`
    Y los mapas de módulos (`identity`, `navigation`, `location`, `catalog`, `media`, `activity`) son mapas vacíos
    Y `couchdb` y `qdrant` son nulos

  Escenario: Parseo desde JSON con claves opcionales ausentes
    Dado un JSON que no contiene las claves `couchdb` ni `qdrant`
    Cuando se invoca `SocialAppConfig.fromJson(json)`
    Entonces los campos primitivos ausentes toman sus valores por defecto
    Y `couchdb` queda en `null`
    Y `qdrant` queda en `null`

  Escenario: Round-trip de serialización
    Dado una instancia válida de `SocialAppConfig` con `couchdb` y `qdrant` populados
    Cuando se invoca `toJson()`
    Entonces el resultado incluye las claves anidadas `couchdb` y `qdrant`
    Y reconstruir con `fromJson(toJson())` produce una instancia equivalente

Característica: Repositorio base CouchDB
  Como capa de datos de MotorSocial
  Quiero un repositorio genérico `CouchDbRepository` con operaciones CRUD y consultas por vistas
  Para que los módulos de dominio persistan documentos en bases `motorsocial_*` con autenticación uniforme.

  Escenario: Ping de disponibilidad
    Dado un `CouchDbRepository` configurado con credenciales válidas
    Cuando se invoca `ping()`
    Entonces se realiza un GET a la raíz con cabeceras Basic
    Y se retorna `true` si el status es `200`

  Escenario: Asegurar existencia de base de datos
    Dado que `ping()` retorna `false`
    Cuando se invoca `ensureDatabase(db)`
    Entonces se ejecuta `createDatabase(db)` (PUT a la raíz de `db`)
    Y se retorna `true` si el status es `201` o `412`

  Escenario: Obtener documento por id
    Dado un documento existente con id "user:abc" en la base `motorsocial_usuarios`
    Cuando se invoca `get("motorsocial_usuarios", "user:abc")`
    Entonces se retorna el cuerpo decodificado como `Map<String, dynamic>` si el status es `200`
    Y se retorna `null` en caso contrario

  Escenario: Crear documento sin _id (alta)
    Dado un documento JSON sin la clave `_id`
    Cuando se invoca `put(db, doc)`
    Entonces se envía un `POST` a `_uri(db)` con el cuerpo codificado
    Y se retorna el `id` asignado por CouchDB si el status es `200` o `201`

  Escenario: Actualizar documento con _id
    Dado un documento JSON con la clave `_id` ya presente
    Cuando se invoca `put(db, doc)`
    Entonces se envía un `PUT` a `_uri(db, _id)`
    Y se retorna el `id` resultante

  Escenario: Fallo en operación put
    Dado que el servidor responde con un status distinto de `200/201`
    Cuando se procesa `put(db, doc)`
    Entonces se lanza `CouchDbException` con el mensaje `'PUT failed: <status> <body>'`

  Escenario: Eliminar documento con rev
    Dado un documento existente con `id` y `rev`
    Cuando se invoca `delete(db, id, rev)`
    Entonces se envía `DELETE` a `_uri(db, '$id?rev=$rev')`
    Y se lanza `CouchDbException('DELETE failed: <status>')` si el status no es `200`

  Escenario: Consulta por vista con parámetros
    Dado una vista `_design/<design>/_view/<view>` existente
    Cuando se invoca `queryView(db, design, view, key, startKey, endKey, descending, limit)`
    Entonces se construye la URI con `include_docs=true` y los parámetros provistos
    Y se retorna el cuerpo decodificado si el status es `200`
    Y se lanza `CouchDbException('queryView failed: <status>')` en caso contrario

Característica: Registro vectorial Qdrant
  Como módulo de búsqueda semántica de MotorSocial
  Quiero un modelo de registro `QdrantRecord` inmutable
  Para representar resultados de búsqueda con identificador, payload opcional y puntuación de relevancia.

  Escenario: Construcción de registro sin score
    Dado un identificador y un payload
    Cuando se construye `QdrantRecord(id: "...", payload: {...})`
    Entonces la instancia se crea con `score` en `null`

  Escenario: Construcción de registro con score
    Dado un resultado de búsqueda vectorial con relevancia 0.87
    Cuando se construye `QdrantRecord(id, payload, score: 0.87)`
    Entonces la instancia retiene el `score` para ordering posterior

Característica: Estado de sesión de la aplicación
  Como aplicación Flutter
  Quiero un provider Riverpod de sesión mínimo
  Para mantener en memoria datos de sesión de forma reactiva.

  Escenario: Estado inicial vacío
    Dado que la aplicación acaba de iniciar
    Cuando se lee `sessionProvider`
    Entonces el estado es un `Map<String, String?>` vacío `{}`

  Escenario: Actualizar sesión
    Dado un `sessionProvider` activo
    Cuando se invoca `ref.read(sessionProvider.notifier).setSession({"user": "user:abc", "token": "jwt"})`
    Entonces el estado se reemplaza por el nuevo mapa
    Y los listeners de Riverpod son notificados
