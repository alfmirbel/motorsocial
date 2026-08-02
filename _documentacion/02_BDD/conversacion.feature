# language: es
Característica: Conversación y Mensajería
  Como usuario autenticado
  Quiero ingresar a una conversación
  Para enviar mensajes

  Escenario: Apertura de conversación
    Dado que el usuario accede a una conversación con clave "chat-1"
    Cuando se carga la pantalla
    Entonces el sistema debe mostrar el título "Mensajes"

  Escenario: Envío de mensaje
    Dado que el usuario está en la conversación "chat-1"
    Y el campo de mensaje contiene "Hola"
    Cuando el usuario presiona el botón de enviar
    Entonces el sistema debe limpiar el campo de mensaje
