# language: es
# Features (BDD Gherkin) - Módulo Identity
# Convención: una sola sección por Caso de Uso. Los bloques se separan con "---".

@identity @auth
Característica: Inicio de sesión
  Como visitante de MotorSocial
  Quiero poder ingresar con mi email y contraseña
  Para acceder como usuario autenticado a la red social

  Escenario: Inicio de sesión exitoso
    Dado que el visitante se encuentra en la pantalla "LoginPage"
    Y ha ingresado un email válido en "emailController"
    Y ha ingresado una contraseña en "passwordController"
    Cuando pulsa el botón "Entrar"
    Y el "AuthRepository.signIn" retorna un "AuthState" con "isAuthenticated == true"
    Entonces el sistema invoca "Navigator.pushReplacementNamed(AppRouter.home)"
    Y la pila de navegación se reemplaza con la ruta "home"

  Escenario: Credenciales inválidas
    Dado que el visitante se encuentra en "LoginPage"
    Y ha ingresado credenciales
    Cuando pulsa "Entrar"
    Y el "AuthRepository.signIn" retorna un "AuthState" con "isAuthenticated == false"
    Entonces el sistema permanece en "LoginPage"
    Y el sistema no navega a "home"

  Escenario: Página desmontada durante el await
    Dado que el visitante pulsa "Entrar"
    Y la operación "signIn" está en curso
    Cuando el contexto se desmonta ("!context.mounted")
    Entonces el sistema no ejecuta ninguna navegación posterior

---

@identity @auth
Característica: Registro de cuenta
  Como visitante de MotorSocial
  Quiero poder crear una cuenta con email, contraseña y nombre visible
  Para disponer de una identidad persistente en la red social

  Escenario: Registro exitoso
    Dado que el visitante se encuentra en la pantalla "RegisterPage"
    Y ha ingresado email, contraseña y nombre en sus controladores
    Cuando pulsa el botón "Crear cuenta"
    Y el "AuthRepository.register" retorna "isAuthenticated == true"
    Entonces el sistema navega a "AppRouter.home" con "pushReplacementNamed"

  Escenario: Registro fallido
    Dado que el visitante se encuentra en "RegisterPage"
    Cuando pulsa "Crear cuenta"
    Y el "AuthRepository.register" retorna "isAuthenticated == false"
    Entonces el sistema permanece en "RegisterPage"

---

@identity @auth
Característica: Recuperación de contraseña
  Como usuario que olvidó su contraseña
  Quiero solicitar un enlace de recuperación por email
  Para restablecer mi acceso sin exponer la existencia de la cuenta

  Escenario: Solicitud de recuperación enviada
    Dado que el usuario se encuentra en la pantalla "PasswordRecoveryPage"
    Y ha ingresado un email en "emailController"
    Cuando pulsa el botón "Enviar enlace"
    Entonces el botón se deshabilita y muestra "Enviando..."
    Y el sistema invoca "AuthRepository.recoverPassword(email)"
    Y al finalizar, si el contexto sigue montado, se muestra un "SnackBar"
    Y el "SnackBar" dice "Si el email existe, recibirás instrucciones."

  Escenario: No se revela la existencia del email
    Dado que el usuario ingresa un email inexistente
    Cuando se completa "recoverPassword"
    Entonces el mensaje mostrado es idéntico al de un email existente
    Y no se distingue si la cuenta existe o no

---

@identity @session
Característica: Persistencia y restauración de sesión
  Como usuario autenticado
  Quiero que mi sesión y token se almacenen localmente y se restauren al reabrir la app
  Para mantenerme conectado entre ejecuciones sin reingresar credenciales

  Escenario: Escritura y lectura de sesión
    Dado un "AuthState" autenticado con "userId" y "accessToken"
    Cuando se invoca "SessionRepository.write(session)"
    Entonces una llamada posterior a "SessionRepository.read()" retorna el "AuthState"
    Y con "isAuthenticated == true", el "userId" y el "accessToken" recuperados

  Escenario: No existe sesión previa
    Dado un "SessionRepository" vacío
    Cuando se invoca "SessionRepository.read()"
    Entonces retorna "null"

  Escenario: Cierre de sesión
    Dado que existe una sesión almacenada
    Cuando se invoca "SessionRepository.clear()"
    Entonces la siguiente llamada a "read()" retorna "null"

  Escenario: Caducidad de la sesión
    Dado un "SessionData" con "expiresAt" en el pasado
    Cuando se consulta "isExpired"
    Entonces retorna "true"

---

@identity @profile
Caraterística: Identidad social y perfil de rol
  Como usuario autenticado
  Quiero tener un "SocialUser" con displayName y photoUrl, y opcionalmente un "RoleProfile" con permisos
  Para ser identificado en la red social y controlar mis capacidades

  Escenario: Buscar usuario por email
    Dado un "UsersRepository" configurado
    Cuando se invoca "findByEmail(email)" para un email existente
    Entonces retorna un "SocialUser" con "id", "displayName" y "photoUrl"

  Escenario: Buscar usuario inexistente
    Dado un "UsersRepository" configurado
    Cuando se invoca "findByEmail(email)" para un email no registrado
    Entonces retorna "null"

  Escenario: Verificación de permiso de rol
    Dado un "RoleProfile" con permisos ["read", "write"]
    Cuando se invoca "hasPermission('write')"
    Entonces retorna "true"
    Y al invocar "hasPermission('admin')" retorna "false"

  Escenario: Deserialización tolerante de RoleProfile
    Dado un JSON sin el campo "permissions"
    Cuando se invoca "RoleProfile.fromJson(json)"
    Entonces el campo "permissions" resulta en una lista vacía []
    Y no se lanza excepción

---

@identity @auth
Caraterística: Estado de autenticación observable
  Como capa de presentación
  Quiero observar el "AuthState" vía Riverpod ("authStateProvider")
  Para que los widgets reaccionen a login/logout sin acoplarse al repositorio

  Escenario: Estado inicial por defecto
    Dado un "authStateProvider" recién creado
    Cuando un widget loLee
    Entonces obtiene un "AuthState" con "isAuthenticated == false"
    Y sin "userId" ni "accessToken"

  Escenario: Actualización post-login
    Dado un "authStateProvider" en estado inicial
    Cuando un "signIn" exitoso asigna un nuevo "AuthState"
    Entonces todos los widgets suscritos reciben "isAuthenticated == true"
