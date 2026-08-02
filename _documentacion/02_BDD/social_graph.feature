# language: es
Característica: Grafo Social
  Como usuario autenticado
  Quiero ver contactos, grupos e invitaciones
  Para interactuar con mi red social

  Escenario: Visualización de contactos
    Dado que el usuario abre la sección "Contactos"
    Cuando se carga la pantalla
    Entonces el sistema debe mostrar "Contactos"

  Escenario: Visualización de grupos
    Dado que el usuario consulta la vista de grupos
    Cuando se renderiza la lista
    Entonces el sistema debe mostrar "Grupos"

  Escenario: Visualización de invitaciones
    Dado que el usuario abre la sección "Invitaciones"
    Cuando se carga la pantalla
    Entonces el sistema debe mostrar "Invitaciones"
