# language: es
Característica: Autenticación y Arranque de Sesión
  Como usuario
  Quiero iniciar sesión
  Para acceder a las funciones privadas de la plataforma

  Escenario: Login con identificador válido
    Dado el usuario está en `LoginPage` con identificador "user:abc"
    Y escribe un secreto
    Cuando presiona "Entrar"
    Entonces el sistema debe esperar 600ms (simulación)
    Y debe escribir `sessionProvider` con `userId: "user:abc"` y `token: "token_local"`
    Y debe navegar a `MainShell` con `pushReplacement`

  Escenario: Login con identificador vacío
    Dado el usuario está en `LoginPage` con identificador vacío
    Cuando presiona "Entrar"
    Entonces el sistema debe mostrar `_error = "Credenciales inválidas"`
    Y no debe escribir `sessionProvider`

  Escenario: Login en progreso
    Dado el usuario presionó "Entrar" y `_loading == true`
    Cuando la UI reconstruye
    Entonces el sistema debe deshabilitar el botón "Entrar"
    Y debe mostrar `CircularProgressIndicator`

---

Característica: Feed de Actividad Integrado
  Como usuario autenticado
  Quiero ver un feed de actividades en una página integrada
  Para consumir el módulo Activity en un caso de uso real

  Escenario: Feed cargando
    Dado `FeedPage` recién construida
    Y `recentFeed` aún no resuelve
    Cuando el `FutureBuilder` está en `waiting`
    Entonces el sistema debe mostrar `CircularProgressIndicator`

  Escenario: Feed con actividades
    Dado `recentFeed` resuelve con 3 `SocialActivity`
    Cuando el `FutureBuilder` reconstruye
    Entonces el sistema debe renderizar un `ListView` con 3 items
    Y cada `ListTile` debe mostrar `actorName` y "verb -> objectId"

  Escenario: Feed vacío
    Dado `recentFeed` resuelve con `[]`
    Entonces el sistema debe mostrar "Sin actividad."

  Escenario: Feed con error
    Dado `recentFeed` lanza un error
    Entonces el sistema debe mostrar "Error: <error>"

---

Característica: Catálogo Integrado
  Como usuario
  Quiero ver el catálogo en una página integrada
  Para consumir el módulo Catalog

  Escenario: Catálogo cargando
    Dado `CatalogPage` recién construida
    Y `repo.search('motor', limit: 10)` aún no resuelve
    Entonces el sistema debe mostrar `CircularProgressIndicator`

  Escenario: Catálogo con resultados
    Dado `search` resuelve con `SocialObjectQuery` no vacíos
    Entonces el sistema debe renderizar un `ListView`
    Y cada `ListTile` debe mostrar "Objeto N" y `preferredType ?? 'tipo sin definir'`

  Escenario: Catálogo sin resultados
    Dado `search` resuelve con `[]`
    Entonces el sistema debe mostrar "Sin resultados."

---

Característica: Chat/Grupos Integrado
  Como usuario
  Quiero ver mis grupos en una página integrada
  Para consumir el módulo Social Graph

  Escenario: Grupos cargando
    Dado `ChatPage` con `state.isLoading == true`
    Entonces el sistema debe mostrar `CircularProgressIndicator`

  Escenario: Grupos con datos
    Dado `groupProvider` con 2 `SocialGroup`
    Entonces el sistema debe renderizar un `ListView` con 2 items
    Y cada `ListTile` debe mostrar `group.name` y "Público" o "Privado"

  Escenario: Grupos vacío
    Dado `groupProvider` con `groups == []`
    Entonces el sistema debe mostrar "Sin grupos."

  Escenario: Grupos con error
    Dado `groupProvider` con `state.error != null`
    Entonces el sistema debe mostrar "Error: <error>"

---

Característica: Perfil y Sesión
  Como usuario autenticado
  Quiero ver mi perfil
  Para consultar mi sesión activa

  Escenario: Perfil muestra el userId de sesión
    Dado `sessionProvider` con `userId: "user:abc"`
    Cuando se construye `ProfilePage`
    Entonces el sistema debe mostrar "user:abc"

  Escenario: Perfil sin userId
    Dado `sessionProvider` sin `userId`
    Cuando se construye `ProfilePage`
    Entonces el sistema debe mostrar "desconocido"

  Escenario: Home muestra mensaje
    Cuando se construye `HomePage`
    Entonces el sistema debe mostrar "Red social básica en ejecución."

---

Característica: Gestión de Cuenta
  Como usuario
  Quiero gestionar mi cuenta (crear/obtener/actualizar/eliminar)
  Para administrar mi identidad en la plataforma

  Escenario: AccountPage placeholder
    Cuando se construye `AccountPage`
    Entonces el sistema debe mostrar "Caso de uso aislado: cuenta todavía no integrada."

  Escenario: AccountRepository define contrato
    Dado el `AccountRepository` abstract
    Entonces el sistema debe exponer `createAccount`, `getAccount`, `updateAccount`, `deleteAccount`
