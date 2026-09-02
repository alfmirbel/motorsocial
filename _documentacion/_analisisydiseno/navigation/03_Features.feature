# language: es
Característica: Shell de Aplicación y Navegación Inferior
  Como usuario
  Quiero un shell de app con barra de navegación inferior que cambie entre las secciones principales
  Para moverme por la app sin fricciones

  Escenario: Shell con tabs muestra la barra inferior
    Dado un `SocialScaffold` con `body` válido y `tabs = [item1, item2]`
    Cuando se construye
    Entonces el sistema debe mostrar un `Scaffold` con AppBar "MotorSocial"
    Y debe renderizar un `BottomNavigationBar` con 2 items
    Y cada item debe mostrar `title` como etiqueta e `Icons.circle` como icono

  Escenario: Shell sin tabs no muestra barra inferior
    Dado un `SocialScaffold` con `body` válido y `tabs` nulo o vacío
    Cuando se construye
    Entonces el sistema debe renderizar el `body` sin `bottomNavigationBar`

  Escenario: Pulsar un item actualiza el índice y navega
    Dado un `SocialScaffold` con `tabs` que incluye un item con `route: "/feed"`
    Y `bottomIndexProvider` en 0
    Cuando el usuario pulsa el item en posición 1
    Entonces el sistema debe actualizar `bottomIndexProvider` a 1
    Y debe invocar `Navigator.of(context).pushReplacementNamed("/feed")`

  Escenario: Pulsar índice fuera de rango se ignora
    Dado un `SocialScaffold` con `tabs` de 2 items
    Cuando el usuario pulsa el índice 5
    Entonces el sistema debe ignorar el evento y no navegar ni actualizar el índice

---

Característica: Enrutamiento de la Aplicación
  Como plataforma
  Quiero un enrutador estático que mapee nombres de ruta a páginas
  Para centralizar la navegación (sin GoRouter)

  Escenario: Ruta conocida devuelve su página
    Dado el `AppRouter` con las constantes `home="/"`, `login="/login"`, `catalog="/catalog"`, `feed="/feed"`, `profile="/profile"`
    Cuando se invoca `routeFor("/feed")`
    Entonces el sistema debe devolver un `MaterialPageRoute`
    Y la página debe ser `_PlaceholderPage` con `title: "Feed"` y `routeName: "/feed"`

  Escenario: Ruta desconocida devuelve NotFound
    Dado el `AppRouter`
    Cuando se invoca `routeFor("/desconocida")`
    Entonces el sistema debe devolver un `MaterialPageRoute` a `_NotFoundPage`
    Y la página debe mostrar "No encontrado" y "Ruta desconocida: /desconocida"

  Escenario: Rutas iniciales
    Dado el `AppRouter`
    Cuando se invoca `routes()`
    Entonces el sistema debe devolver `[routeFor("/")]`

---

Característica: Guardias de Ruta y Autenticación
  Como plataforma
  Quiero una guardia que redirija a `/login` a usuarios no autenticados
  Para proteger las rutas privadas

  Escenario: Acceso a ruta pública siempre permitido
    Dado una ruta `/login` (pública)
    Cuando se invoca `canAccess(context, "/login")`
    Entonces el sistema debe devolver `true` inmediatamente
    Y no debe verificar el estado de sesión

  Escenario: Usuario no autenticado redirigido a login
    Dado un usuario no autenticado (`_isLoggedIn()` retorna `false`)
    Y una ruta privada `/feed`
    Y `context.mounted == true`
    Cuando se invoca `canAccess(context, "/feed")`
    Entonces el sistema debe invocar `Navigator.of(context).pushReplacementNamed("/login")`
    Y debe devolver `false`

  Escenario: Usuario autenticado accede a ruta privada
    Dado un usuario autenticado (`_isLoggedIn()` retorna `true`)
    Y una ruta privada `/feed`
    Cuando se invoca `canAccess(context, "/feed")`
    Entonces el sistema debe devolver `true`
    Y no debe redirigir

  Escenario: Contexto desmontado omite redirección
    Dado un usuario no autenticado
    Y `context.mounted == false` tras el `await`
    Cuando se invoca `canAccess(context, "/feed")`
    Entonces el sistema debe devolver `false`
    Y no debe invocar `Navigator`

---

Característica: Estado de Menú y Tabs
  Como desarrollador
  Quiero estado observable para los items de menú y el índice seleccionado
  Para cablear la navegación reactivamente

  Escenario: Selección de item válido
    Dado un `TabMenuNotifier` con 3 `items` y `selectedIndex: 0`
    Cuando se invoca `selectItem(2)`
    Entonces el sistema debe actualizar `selectedIndex` a 2
    Y `selected()` debe devolver el item en posición 2

  Escenario: Selección de item fuera de rango se ignora
    Dado un `TabMenuNotifier` con 2 `items`
    Cuando se invoca `selectItem(5)`
    Entonces el sistema debe mantener `selectedIndex` sin cambios

  Escenario: Habilitar/deshabilitar item
    Dado un `TabMenuNotifier` con un item en posición 1
    Cuando se invoca `setEnabled(1, false)`
    Entonces el sistema debe reemplazar el item en posición 1 con `enabled: false`
    Y `enabledItems` debe excluir ese item

  Escenario: Providers de índice disponibles
    Dado los providers `activeRouteProvider`, `drawerIndexProvider`, `bottomIndexProvider`
    Cuando se resuelven
    Entonces el sistema debe devolver `'/'`, `0` y `0` respectivamente por defecto
