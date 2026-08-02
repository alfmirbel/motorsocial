# language: es
Característica: Feed de Actividad
  Como usuario autenticado
  Quiero ver actividades recientes
  Para enterarme de interacciones en mi red

  Escenario: Visualización inicial del feed
    Dado que el usuario abre la sección "Feed"
    Cuando se carga la pantalla
    Entonces el sistema debe mostrar la pantalla "Feed"
