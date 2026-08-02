# language: es
Característica: Inicio de Sesión
  Como usuario final
  Quiero ingresar con mi email y contraseña
  Para acceder a las funcionalidades de MotorSocial

  Escenario: Acceso exitoso con credenciales válidas
    Dado que el usuario está en la pantalla de "Ingresar"
    Y el campo "Email" contiene "usuario@example.com"
    Y el campo "Password" contiene "secreto"
    Cuando el usuario presiona "Entrar"
    Entonces el sistema debe enviar las credenciales al repositorio de autenticación
    Y si la autenticación es exitosa debe navegar a la pantalla principal

  Escenario: Acceso denegado con credenciales inválidas
    Dado que el usuario está en la pantalla de "Ingresar"
    Y el campo "Email" contiene "usuario@example.com"
    Y el campo "Password" está vacío
    Cuando el usuario presiona "Entrar"
    Entonces el sistema no debe completar la navegación hacia la pantalla principal
