# language: es
Característica: Catálogo Social
  Como usuario autenticado
  Quiero consultar objetos sociales en el catálogo
  Para ver listados y detalles públicos o restringidos

  Escenario: Visualización del catálogo vacío
    Dado que el usuario está en la pantalla "Catálogo"
    Y no hay objetos cargados
    Cuando se consulta el catálogo
    Entonces el sistema debe mostrar "Sin resultados"

  Escenario: Visualización del catálogo con resultados
    Dado que el catálogo tiene objetos disponibles
    Cuando el usuario abre la pantalla "Catálogo"
    Entonces el sistema debe mostrar una lista con el título y tipo de cada objeto

  Escenario: Detalle de objeto social
    Dado que el usuario selecciona un objeto con identificador "123" y tipo "Propiedad"
    Cuando abre el detalle
    Entonces el sistema debe mostrar la pantalla "Detalle" con "Propiedad: 123"
