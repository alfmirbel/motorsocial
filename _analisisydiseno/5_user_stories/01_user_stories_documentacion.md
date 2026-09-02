# User Stories de Motor Social

## Historia de Usuario 1: Inicio de Sesión

### Card (Tarjeta)
**Como** usuario autenticado  
**Quiero** iniciar sesión con mis credenciales  
**Para** acceder a las funcionalidades de la aplicación

### Conversation (Conversación)
El usuario necesita iniciar sesión para acceder a las funcionalidades de la aplicación. Al abrir la app, si no está autenticado, es redirigido a la pantalla de login. Introduce su email o usuario y contraseña. El sistema valida las credenciales contra el backend, y si son correctas, genera un token JWT que se almacena de forma segura en el dispositivo. El usuario es entonces redirigido a la página principal.

Si las credenciales son incorrectas, el sistema muestra un mensaje de error indicando que las credenciales son inválidas y mantiene al usuario en la pantalla de login para reintentar.

### Confirmation (Confirmación)
- El usuario ingresa email/contraseña válidos → sesión creada → redirección a Home
- El usuario ingresa credenciales inválidas → mensaje de error → permite reintento

### Escenarios Gherkin

# language: es
Característica: Inicio de Sesión con Material Design 3

  Escenario: Validación de campos obligatorios con Feedback Visual
    Dado que el usuario está en la pantalla de "Login"
    Y el campo de "Email" está vacío
    Cuando el usuario presiona el botón de "Iniciar Sesión"
    Entonces el sistema debe mostrar un mensaje de error "El correo es obligatorio"
    Y el componente TextField debe cambiar su color de borde a "Error" (M3 Color Scheme)
    Y el foco del sistema debe permanecer en el campo de "Email" para accesibilidad

  Escenario: Login exitoso con credenciales válidas
    Dado que el usuario está en la pantalla de "Login"
    Y ha introducido un email válido en el campo de "Usuario o email"
    Y ha introducido una contraseña en el campo de "Contraseña"
    Cuando el usuario presiona el botón "Entrar"
    Entonces el sistema debe autenticar al usuario con el backend
    Y debe generar un token JWT de sesión
    Y debe almacenar el token de forma segura en el dispositivo
    Y debe redirigir al usuario a la pantalla "Home"

  Escenario: Login con credenciales inválidas
    Dado que el usuario está en la pantalla de "Login"
    Y el usuario ha introducido credenciales incorrectas
    Cuando el usuario presiona el botón "Entrar"
    Entonces el sistema debe mostrar un mensaje de error "Credenciales inválidas"
    Y el componente TextField debe mostrar el error en color rojo (M3 Error)
    Y el usuario debe permanecer en la pantalla de login

  Escenario: Login con campo de contraseña vacío
    Dado que el usuario está en la pantalla de "Login"
    Y el campo de "Email" está completo con un valor válido
    Y el campo de "Contraseña" está vacío
    Cuando el usuario presiona el botón "Entrar"
    Entonces el sistema debe mostrar un mensaje de error "La contraseña es obligatoria"
    Y el foco debe permanecer en el campo de "Contraseña"
    Y el componente debe mostrar el borde del TextField en color de error (M3 Color Scheme)

  Escenario: Mostrar/ocultar contraseña con toggle
    Dado que el usuario está en la pantalla de "Login"
    Y el campo de "Contraseña" muestra texto en enmascarado
    Cuando el usuario presiona el ícono de ojo en el campo de contraseña
    Entonces el sistema debe cambiar la visualización del texto
    Y el ícono debe cambiar de ojo cerrado a ojo abierto
    Y el texto debe mostrarse sin enmascarar temporalmente

---

## Historia de Usuario 2: Registro de Usuario

### Card (Tarjeta)
**Como** nuevo usuario  
**Quiero** crear una cuenta con mis datos personales  
**Para** comenzar a usar las funcionalidades de la app

### Conversation (Conversación)
El usuario llega a la pantalla de registro desde la pantalla de login. Debe rellenar tres campos obligatorios: email, contraseña y nombre para mostrar. Al presionar el botón de "Crear cuenta", el sistema valida que todos los campos estén completos. El email se valida como formato válido, la contraseña debe tener al menos 8 caracteres. Si todo es correcto, el sistema crea el usuario en CouchDB con el prefijo `user:uuid`, genera el token de sesión y redirige a Home.

### Confirmation (Confirmación)
- Campos vacíos → mensaje de error → campo enfocado
- Email inválido → mensaje de error → campo enfocado
- Contraseña corta → mensaje de error → campo enfocado
- Registro exitoso → usuario creado → sesión iniciada → redirección a Home

### Escenarios Gherkin

# language: es
Característica: Registro de Usuario

  Escenario: Validación de campos vacíos en registro
    Dado que el usuario está en la pantalla de "Registro"
    Y el campo de "Email" está vacío
    Y el campo de "Password" está vacío
    Y el campo de "Nombre" está vacío
    Cuando el usuario presiona el botón "Crear cuenta"
    Entonces el sistema debe mostrar errores: "El correo es obligatorio", "La contraseña es obligatoria", "El nombre es obligatorio"
    Y los tres campos deben mostrar borde de color error (M3 Color Scheme)

  Escenario: Registro exitoso
    Dado que el usuario está en la pantalla de "Registro"
    Y ha introducido "usuario@example.com" en el campo de "Email"
    Y ha introducido una contraseña segura en el campo de "Password"
    Y ha introducido "Usuario Nombre" en el campo de "Nombre"
    Cuando el usuario presiona el botón "Crear cuenta"
    Entonces el sistema debe crear el usuario en CouchDB
    Y debe generar un token JWT de sesión
    Y debe redirigir al usuario automáticamente a la pantalla "Home"
    Y el usuario debe estar autenticado con nombre de mostrar visible

  Escenario: Email ya registrado
    Dado que el usuario está en la pantalla de "Registro"
    Y el email "usuario@ejemplo.com" ya existe en el sistema
    Cuando el usuario intenta registrar con ese email
    Entonces el sistema debe mostrar el error "El email ya está registrado"
    Y el campo de email debe mostrar color de error
    Y el usuario debe permanecer en la pantalla de registro

---

## Historia de Usuario 3: Recuperación de Contraseña

### Card (Tarjeta)
**Como** usuario olvidado la contraseña  
**Quiero** recuperar mi acceso a la cuenta  
**Para** volver a iniciar sesión en la aplicación

### Conversation (Conversación)
El usuario accede a la pantalla de recuperación desde la pantalla de login. Introduce su email registrado. El sistema envia un enlace de recuperación a ese email. Luego muestra un mensaje informativo indicando que si el email existe, recibirá instrucciones. No revela si el email está o no en el sistema por razones de seguridad. El botón se desactiva temporalmente durante el envío con un spinner.

### Confirmation (Confirmación)
- Envío exitoso → mensaje informativo → botón "Enviando..." → spinner
- Error de red → mensaje de error → botón reactivado → permite reintento

### Escenarios Gherkin

# language: es
Característica: Recuperación de Contraseña

  Escenario: Recuperación solicitada exitosamente
    Dado que el usuario está en la pantalla de "Recuperar contraseña"
    Y ha introducido su email registrado
    Cuando el usuario presiona el botón "Enviar enlace"
    Entonces el sistema debe mostrar el mensaje "Si el email existe, recibirás instrucciones"
    Y el botón debe mostrar un spinner mientras se envía

  Escenario: Email inválido
    Dado que el usuario está en la pantalla de "Recuperar contraseña"
    Y ha introducido "email-invalido" en el campo de email
    Cuando el usuario presiona el botón "Enviar enlace"
    Entonces el sistema debe mostrar el mensaje "Si el email existe, recibirás instrucciones"
    Y no debe revelar si el email es inválido o no existe

  Escenario: Fallo en el envío por error de red
    Dado que el usuario está en la pantalla de "Recuperar contraseña"
    Y hay un error de conexión con el servidor
    Cuando el usuario presiona el botón "Enviar enlace"
    Entonces el sistema debe mostrar el mensaje de error correspondiente
    Y el botón debe estar activo para permitir reintento

---

## Historia de Usuario 4: Navegación Principal

### Card (Tarjeta)
**Como** usuario de la aplicación  
**Quiero** navegar entre las secciones principales con facilidad  
**Para** acceder a las funciones que necesito con un toque

### Conversation (Conversación)
El usuario ve una NavigationBar M3 en la parte inferior de la pantalla con los destinos principales. Al tocar un icono, el sistema navega a la ruta correspondiente usando Navigator.pushReplacementNamed. Los iconos usan codepuntos en el rango 0xe000-0xe900. El color del texto del item seleccionado usa el color primary del ColorScheme. Si hay error de navegación, se muestra un SnackBar temporal.

### Confirmation (Confirmación)
- Toque en NavigationBar → navegación a la ruta → actualización del estado
- Ruta desconocida → pantalla "No encontrado" con nombre de la ruta

### Escenarios Gherkin

# language: es
Característica: Navegación con Material Design 3

  Escenario: Navegación entre pestañas
    Dado que el usuario está en la pantalla "Home"
    Y ve una NavigationBar M3 con varios destinos
    Cuando el usuario toca el icono de "Catálogo"
    Entonces el sistema debe navegar a la ruta "/catalog"
    Y el icono debe mostrarse con el color primary de M3
    Y el label debe mostrarse en color primary

  Escenario: Navegación a ruta inexistente
    Dado que el sistema recibe una solicitud de navegación a "/ruta-desconocida"
    Cuando el sistema genere la ruta
    Entonces el sistema debe mostrar una pantalla con título "No encontrado"
    Y debe mostrar el mensaje "Ruta desconocida: /ruta-desconocida"
    Y se debe mostrar un AppBar con color de tema

  Escenario: Navegación con botón de retroceso
    Dado que el usuario está en una pantalla secundaria (ej: detalle de objeto)
    Cuando el usuario toca el botón de retroceso del AppBar
    Entonces el sistema debe navegar a la pantalla anterior en el stack
    Y no debe mostrar animación de transición (pushReplacement)

---

## Historia de Usuario 5: Feed de Actividades

### Card (Tarjeta)
**Como** usuario activo  
**Quiero** ver el feed de actividades sociales  
**Para** mantenerme informado de lo que sucede en mi red

### Conversation (Conversación)
El usuario llega a la pantalla Feed desde la NavigationBar. El sistema mustra un CircularProgressIndicator mientras carga las actividades. Una vez listos, muestra una lista con cada SocialActivity incluyendo actorName, verb y objectId. El scroll es infinito con carga de más elementos al llegar al final. Si hay error, muestra el mensaje y un botón de reintento.

### Confirmation (Confirmación)
- Carga en espera → CircularProgressIndicator
- Actividades cargadas → lista de items
- Error → mensaje y botón de reintento
- Sin actividades → mensaje "Sin actividad"

### Escenarios Gherkin

# language: es
Característica: Feed de Actividades Sociales

  Escenario: Visualización del feed con actividades
    Dado que el usuario está autenticado
    Y el usuario tiene actividades en su feed social
    Cuando el usuario abre la pantalla "Actividad"
    Entonces el sistema debe mostrar un CircularProgressIndicator durante la carga
    Y después debe mostrar una lista vertical de actividades
    Y cada actividad debe mostrar el nombre del actor, el verbo y el objeto

  Escenario: Feed vacío
    Dado que el usuario no tiene actividades en su red social
    Cuando el usuario abre la pantalla "Actividad"
    Entonces el sistema debe mostrar el mensaje "Sin actividad"
    Y no debe mostrar indicador de carga permanente

  Escenario: Error en la carga del feed
    Dado que el usuario está en la pantalla "Actividad"
    Y hay un error al cargar las actividades del servidor
    Cuando el sistema intenta cargar el feed
    Entonces el sistema debe mostrar el texto "Error: <mensaje>"
    Y debe permitir al usuario reintentar la carga

---

## Historia de Usuario 6: Gestión de Media

### Card (Tarjeta)
**Como** usuario que registra su alimentación  
**Quiero** subir y organizar fotos de mis comidas  
**Para** documentar visualmente mi dieta y progreso

### Conversation (Conversación)
El usuario accede a la Biblioteca desde la NavigationBar. El sistema muestra una lista de los IDs de los medios subidos. Al seleccionar un medio, puede verlo en slideshow con zoom y navegación entre ellos. Puede eliminar o reordenar los elementos desde la vista principal. El usuario puede tomar una foto o seleccionar desde la galería del dispositivo.

### Confirmation (Confirmación)
- Biblioteca vacía → mensaje "Sin medios"
- Subida → ID agregado a lista → actualización visual
- Slideshow → navegación con swipe → información del activo

### Escenarios Gherkin

# language: es
Característica: Biblioteca de Medios

  Escenario: Visualizar biblioteca de medios
    Dado que el usuario está autenticado
    Y el usuario tiene medios subidos
    Cuando el usuario abre la pantalla "Biblioteca"
    Entonces el sistema debe mostrar una lista de IDs de medios del usuario
    Y cada item debe mostrar su identificador único

  Escenario: Medios vacíos
    Dado que el usuario no ha subido ningún medio
    Cuando el usuario abre la pantalla "Biblioteca"
    Entonces el sistema debe mostrar una lista vacía sin errores
    Y la funcionalidad de subida debe estar disponible

  Escenario: Ir a slideshow de medios
    Dado que el usuario ha seleccionado un medio específico
    Cuando el usuario abre el slideshow
    Entonces el sistema debe mostrar el medio en pantalla completa
    Y debe permitir navegación entre medios con swipe horizontal

---

## Historia de Usuario 7: Perfil de Usuario

### Card (Tarjeta)
**Como** usuario autenticado  
**Quiero** ver mi información de perfil  
**Para** verificar mis datos y acceder a configuraciones

### Conversation (Conversación)
El usuario accede al perfil desde la NavigationBar. El sistema lee el sessionProvider del Theme.of(context) o container más cercano. Muestra el userId y un mensaje indicando que está conectado a SocialIdentityContract. Desde aquí podrá acceder a ajustes de cuenta, cambiar foto, o ver historial. El color del texto usa el esquema del tema actual (claro u oscuro).

### Confirmation (Confirmación)
- Usuario conectado → muestra userId
- Tema claro → colores suaves
- Tema oscuro → colores contrastantes

### Escenarios Gherkin

# language: es
Característica: Perfil de Usuario

  Escenario: Visualizar perfil con usuario conectado
    Dado que el usuario está autenticado
    Y el userId es "user:12345"
    Cuando el usuario abre la pantalla "Perfil"
    Entonces el sistema debe mostrar el texto "user:12345"
    Y debe mostrar el subtítulo "Usuario activo en sesión"
    Y debe mostrar un ListTile adicional sobre SocialIdentityContract

  Escenario: Usuario sin sesión
    Dado que el usuario no tiene una sesión válida
    Cuando el usuario intenta acceder a la pantalla "Perfil"
    Entonces el sistema debe redirigir a la pantalla de "Login"
    Y mostrar el mensaje "Acceso requerido"

---

## Historia de Usuario 8: Sincronización Offline

### Card (Tarjeta)
**Como** usuario móvil con conexión intermitente  
**Quiero** registrar mi alimentación sin perder datos  
**Para** continuar usando la app incluso sin internet

### Conversation (Conversación)
Cuando el dispositivo pierde conexión, el usuario sigue registrándose normalmente pero los cambios se encolan. Un contador visible en la UI muestra cuántos items pendientes hay. Al reconectar, el SyncNotifier ejecuta la cola automáticamente o manualmente por el usuario. Los timestamps se almacenan y el estado de sync se persiste localmente.

### Confirmation (Confirmación)
- Sin conexión → acciones encoladas → contador visible
- Reconexión → cola procesada → estado actualizado → contador 0
- Error en sincronización → retry automático → notificación al usuario

### Escenarios Gherkin

# language: es
Característica: Sincronización Offline-First

  Escenario: Acción encolada sin conexión
    Dado que el usuario está sin conexión a Internet
    Cuando el usuario registra una nueva actividad
    Entonces el sistema debe encolar la acción en la cola de sincronización
    Y debe incrementar el contador de elementos pendientes
    Y el usuario debe continuar viendo la app como normal

  Escenario: Reconexión y sincronización automática
    Dado que el usuario tenía acciones pendientes en cola
    Y la conexión a Internet se restablece
    Cuando el sistema detecta la reconexión
    Entonces el sistema debe ejecutar automáticamente la cola de sincronización
    Y debe actualizar el estado isSyncing a false
    Y debe establecer lastSyncedAt al timestamp actual
    Y el contador de elementos pendientes debe ser 0

  Escenario: Sincronización manual del usuario
    Dado que el usuario está online pero desea sincronizar explícitamente
    Cuando el usuario accede a la sección de sincronización
    Entonces el sistema debe mostrar el estado actual de sync
    Y al pulsar "Sincronizar", debe procesar la cola y mostrar feedback visual

---

## Historia de Usuario 9: Configuración de Tema

### Card (Tarjeta)
**Como** usuario que desea personalizar la app
**Quiero** cambiar entre tema claro y oscuro
**Para** tener una experiencia cómoda según las condiciones de luz

### Conversation (Conversación)
El usuario accede a Configuración → Tema. El sistema le muestra un toggle o selector de temas (Light/Dark). Al cambiar, se actualiza ThemeMode y se persiste en SharedPreferences. Al reiniciar la app, el tema anterior se recuerda y aplica. Los colores se basan en ColorScheme M3 con seed color #1E6F8E (azul-petróleo).

### Confirmation (Confirmación)
- Cambio de tema → aplicación inmediata → persistido
- Reinicio → tema recordado → colores consistentes
- Contraste WCAG AA → accesible

### Escenarios Gherkin

# language: es
Característica: Personalización de Tema

  Escenario: Cambiar a tema oscuro
    Dado que el usuario está en la pantalla de "Configuración → Tema"
    Y el sistema está en modo claro actualmente
    Cuando el usuario selecciona el tema "Oscuro"
    Entonces el sistema debe aplicar el ColorScheme dark
    Y los colores de fondo deben ser oscuros (surface dark)
    Y el texto debe ser visible con contraste adecuado
    Y el cambio debe persistir en SharedPreferences

  Escenario: Tema recordado al reiniciar
    Dado que el usuario cerró la app con tema "Oscuro" seleccionado
    Cuando el usuario abre la app nuevamente
    Entonces el sistema debe cargar el tema "Oscuro" desde SharedPreferences
    Y la app debe mostrar la interfaz en modo oscuro desde el inicio
    Y no debe hacer una transición de claro a oscuro