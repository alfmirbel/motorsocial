# language: es
Característica: Navegación y Rutas
  Como usuario autenticado
  Quiero navegar entre secciones principales y acceder a vistas protegidas
  Para usar las funciones de la app sin bloqueos indebidos

  Escenario: Ruta no encontrada
    Dado que el usuario accede a una ruta inexistente
    Cuando el sistema no puede resolver la ruta
    Entonces debe mostrar la pantalla "Ruta desconocida: <ruta>"

  Escenario: Acceso a ruta protegida sin sesión
    Dado que el usuario no tiene sesión activa
    Cuando intenta abrir una ruta protegida
    Entonces el sistema debe redirigirlo a la pantalla de "Ingresar"

  Escenario: Acceso a inicio cuando está autenticado
    Dado que el usuario tiene sesión activa
    Cuando abre la ruta "/"
    Entonces el sistema debe mostrar la pantalla principal de inicio
