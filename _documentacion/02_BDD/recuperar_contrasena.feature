# language: es
Característica: Recuperación de Contraseña
  Como usuario registrado
  Quiero solicitar un enlace de recuperación
  Para restablecer mi contraseña

  Escenario: Solicitud de recuperación con email existente
    Dado que el usuario está en la pantalla de "Recuperar contraseña"
    Y el campo "Email" contiene "usuario@example.com"
    Cuando el usuario presiona "Enviar enlace"
    Entonces el sistema debe invocar la recuperación de contraseña
    Y mostrar el mensaje "Si el email existe, recibirás instrucciones."

  Escenario: Envío en progreso
    Dado que el usuario está en la pantalla de "Recuperar contraseña"
    Y el campo "Email" contiene "usuario@example.com"
    Cuando el usuario presiona "Enviar enlace"
    Entonces el botón debe cambiar a estado "Enviando..."
    Y no debe permitir otro envío hasta finalizar la operación
