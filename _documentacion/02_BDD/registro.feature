# language: es
Característica: Registro de Usuario
  Como usuario nuevo
  Quiero crear una cuenta con email, contraseña y nombre
  Para ingresar a MotorSocial

  Escenario: Registro exitoso
    Dado que el usuario está en la pantalla de "Registro"
    Y el campo "Email" contiene "nuevo@example.com"
    Y el campo "Password" contiene "secreto"
    Y el campo "Nombre" contiene "Usuario Nuevo"
    Cuando el usuario presiona "Crear cuenta"
    Entonces el sistema debe invocar el registro en el repositorio de autenticación
    Y si el registro es exitoso debe navegar a la pantalla principal

  Escenario: Registro con datos incompletos
    Dado que el usuario está en la pantalla de "Registro"
    Y el campo "Email" está vacío
    Cuando el usuario presiona "Crear cuenta"
    Entonces el sistema no debe avanzar a la pantalla principal
