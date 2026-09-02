# Features de Motor Social (Documentación BDD)

## Característica: Autenticación de Usuario

# language: es
Característica: Inicio de Sesión y Registro de Usuario
  Como usuario nuevo o existente
  Quiero autenticarme en el sistema
  Para poder acceder a las funcionalidades de registro de calorías y alimentación

  Escenario: Login exitoso con credenciales válidas
    Dado que el usuario está en la pantalla de "Login"
    Y ha introducido un email válido en el campo "Usuario o email"
    Y ha introducido una contraseña en el campo "Contraseña"
    Cuando el usuario presiona el botón "Entrar"
    Entonces el sistema debe autenticar al usuario
    Y debe establecer una sesión con el token JWT
    Y debe redirigir al usuario a la página principal "Home"

  Escenario: Login con credenciales inválidas
    Dado que el usuario está en la pantalla de "Login"
    Y ha introducido credenciales incorrectas
    Cuando el usuario presiona el botón "Entrar"
    Entonces el sistema debe mostrar un mensaje de error "Credenciales inválidas"
    Y el foco del sistema debe permanecer en los campos de login para reintentar
    Y el usuario no debe ser redirigido a la página principal

  Escenario: Registro de nuevo usuario
    Dado que el usuario está en la pantalla de "Registro"
    Y ha introducido un email válido en el campo "Email"
    Y ha introducido una contraseña en el campo "Password"
    Y ha introducido un nombre en el campo "Nombre"
    Cuando el usuario presiona el botón "Crear cuenta"
    Entonces el sistema debe crear el usuario en CouchDB
    Y debe autenticar automáticamente al nuevo usuario
    Y debe redirigir al usuario a la página principal "Home"

  Escenario: Recuperación de contraseña
    Dado que el usuario está en la pantalla de "Recuperar contraseña"
    Y ha introducido su email en el campo "Email"
    Cuando el usuario presiona el botón "Enviar enlace"
    Entonces el sistema debe enviar un correo con instrucciones de recuperación
    Y debe mostrar un mensaje informativo "Si el email existe, recibirás instrucciones"
    Y el botón debe desactivarse temporalmente mientras se envía

---

## Característica: Feed de Actividades Sociales

# language: es
Característica: Feed de Actividades Sociales
  Como usuario activo
  Quiero ver un feed de actividades sociales
  Para estar informado de las acciones de mi red relacionadas con alimentación

  Escenario: Visualización del feed de actividades
    Dado que el usuario está en la pantalla "Feed"
    Y el usuario tiene actividades en su red social
    Cuando el sistema carga el feed
    Entonces el sistema debe mostrar una lista cronológica inversa de actividades
    Y cada actividad debe mostrar el nombre del actor, el verbo y el objeto
    Y el feed debe soportar paginación con un límite de 20 elementos por página

  Escenario: Carga de más actividades
    Dado que el usuario está en la pantalla "Feed"
    Y el feed tiene más páginas disponibles
    Cuando el usuario carga la siguiente página
    Entonces el sistema debe cargar y agregar las nuevas actividades al feed
    Y el indicador de carga debe ocultarse al completar

  Escenario: Feed sin actividades
    Dado que el usuario está en la pantalla "Feed"
    Y no existen actividades en el feed
    Cuando el sistema carga el feed
    Entonces el sistema debe mostrar el mensaje "Sin actividad"

  Escenario: Error en la carga del feed
    Dado que el usuario está en la pantalla "Feed"
    Y ocurre un error al cargar las actividades
    Cuando el sistema intenta cargar el feed
    Entonces el sistema debe mostrar un mensaje de error con los detalles
    Y debe permitir al usuario reintentar la carga

---

## Característica: Catálogo de Alimentos y Objetos Sociales

# language: es
Característica: Catálogo de Objetos Sociales y Alimentos
  Como usuario que registra su alimentación
  Quiero buscar y seleccionar alimentos del catálogo
  Para registrar con precisión lo que consumo diariamente

  Escenario: Visualización del catálogo
    Dado que el usuario está en la pantalla "Catálogo"
    Y existen objetos sociales disponibles
    Cuando el sistema carga el catálogo
    Entonces el sistema debe mostrar una lista paginada de objetos
    Y cada item debe mostrar el título y el tipo de objeto
    El catálogo debe tener paginación con 20 elementos por página

  Escenario: Vista de detalle de objeto
    Dado que el usuario está en la pantalla "Catálogo"
    Y el usuario selecciona un objeto del catálogo
    Cuando el usuario toca el elemento seleccionado
    Entonces el sistema debe navegar a la vista de detalle
    Y debe mostrar la información completa del objeto seleccionado

  Escenario: Catálogo sin resultados
    Dado que el usuario está en la pantalla "Catálogo"
    Y no existen objetos que coincidan con la búsqueda
    Cuando el sistema carga el catálogo
    Entonces el sistema debe mostrar el mensaje "Sin resultados"

---

## Característica: Página Principal

# language: es
Característica: Página Principal (Home)
  Como usuario autenticado
  Quiero ver un resumen de mi actividad reciente
  Para tener una visión general de mi progreso nutricional y social

  Escenario: Visualización de la página principal
    Dado que el usuario está autenticado
    Y el usuario está en la página "Home"
    Cuando el sistema carga la página
    Entonces el sistema debe mostrar el contenido de la página principal
    Y debe mostrar el mensaje "Red social básica en ejecución"
    Y el usuario debe tener acceso a la navegación inferior

---

## Característica: Perfil de Usuario

# language: es
Característica: Perfil de Usuario
  Como usuario autenticado
  Quiero ver la información de mi perfil
  Para gestionar mi cuenta y datos personales

  Escenario: Visualización del perfil
    Dado que el usuario está autenticado
    Y el usuario está en la página "Perfil"
    Cuando el sistema carga el perfil
    Entonces el sistema debe mostrar la información del usuario activo en sesión
    Y debe mostrar el ID de usuario obtenido de la sesión actual
    Y debe indicar que el usuario está conectado a SocialIdentityContract

---

## Característica: Chat y Grupos

# language: es
Característica: Chat y Grupos Sociales
  Como usuario de la red social
  Quiero ver y participar en grupos de chat
  Para comunicarme con otros usuarios sobre alimentación y salud

  Escenario: Visualización de grupos
    Dado que el usuario está autenticado
    Y el usuario está en la página "Chat"
    Cuando el sistema carga los grupos
    Entonces el sistema debe mostrar la lista de grupos del usuario
    Y cada grupo debe mostrar el nombre y si es público o privado
    Y si no hay grupos, debe mostrar el mensaje "Sin grupos"

---

## Característica: Navegación con Material Design 3

# language: es
Característica: Navegación con Material Design 3
  Como usuario de la aplicación
  Quiero navegar entre secciones con una barra de navegación inferior intuitiva
  Para acceder rápidamente a las funcionalidades principales

  Escenario: Navegación con NavigationBar M3
    Dado que el usuario está en una pantalla con tabs configurados
    Y el sistema tiene items de menú definidos
    Cuando el usuario selecciona un destino de la NavigationBar
    Entonces el sistema debe navegar a la ruta correspondiente
    Y el item seleccionado debe mostrarse con el estilo activo de M3
    Y los íconos deben estar en el rango de codepuntos 0xe000-0xe900

  Escenario: Navegación sin tabs
    Dado que el usuario está en una pantalla sin tabs configurados
    Cuando el sistema renderiza el scaffold
    Entonces el sistema no debe mostrar la NavigationBar
    Y el contenido debe ocupar todo el espacio disponible

---

## Característica: Gestión de Contactos y Grupos

# language: es
Característica: Grafo Social - Contactos y Grupos
  Como usuario de la red social
  Quiero gestionar mis contactos y grupos
  Para construir y mantener mi red social dentro de la aplicación

  Escenario: Visualización de contactos
    Dado que el usuario está en la sección "Contactos"
    Cuando el sistema carga los contactos
    Entonces el sistema debe mostrar la pantalla de contactos
    Y debe listar las relaciones del usuario

  Escenario: Visualización de invitaciones
    Dado que el usuario está en la sección "Invitaciones"
    Cuando el sistema carga las invitaciones pendientes
    Entonces el sistema debe mostrar las invitaciones recibidas
    Y cada invitación debe mostrar el remitente y el estado

---

## Característica: Resiliencia y Conectividad

# language: es
Característica: Resiliencia y Sincronización Offline
  Como usuario móvil
  Quiero que la aplicación funcione sin conexión
  Para no perder datos cuando la conexión a Internet es inestable

  Escenario: Detección de conectividad
    Dado que el usuario utiliza la aplicación
    Cuando el sistema verifica la conectividad
    Entonces el sistema debe detectar si está online o offline
    Y debe informar el tipo de conexión disponible

  Escenario: Cola de sincronización
    Dado que el usuario ha realizado acciones offline
    Y la conexión a Internet se restablece
    Cuando el sistema ejecuta la sincronización
    Entonces el sistema debe procesar la cola de elementos pendientes
    Y debe actualizar el estado de sincronización con el último timestamp

---

## Característica: Diseño y Temas

# language: es
Característica: Personalización de Temas
  Como usuario de la aplicación
  Quiero personalizar la apariencia visual de la aplicación
  Para sentirme cómodo con los colores y el modo de visualización

  Escenario: Tema claro
    Dado que el usuario está en la configuración de temas
    Y el sistema está en modo claro por defecto
    Entonces el sistema debe aplicar el ColorScheme M3 claro
    Y el ColorScheme debe usar el seed color azul-petróleo (#1E6F8E)

  Escenario: Tema oscuro
    Dado que el usuario cambia a modo oscuro
    Cuando el sistema aplica el tema oscuro
    Entonces el sistema debe aplicar el ColorScheme M3 oscuro
    Y todos los componentes deben adaptarse al modo oscuro

  Escenario: Cambio de tema persistente
    Dado que el usuario selecciona un tema
    Cuando el usuario cierra y reabre la aplicación
    Entonces el sistema debe recordar la selección de tema del usuario

---

## Característica: Gestión de Medios

# language: es
Característica: Biblioteca de Medios
  Como usuario que registra su alimentación
  Quiero subir y organizar fotos de mis comidas
  Para documentar visualmente mi progreso nutricional

  Escenario: Visualización de la biblioteca de medios
    Dado que el usuario está en la página "Biblioteca"
    Y el usuario tiene medios subidos
    Cuando el sistema carga la biblioteca
    Entonces el sistema debe mostrar la lista de IDs de medios del usuario
    Y cada medio debe mostrar su identificador en una lista

  Escenario: Presentación de medios en slideshow
    Dado que el usuario selecciona un medio para visualizar
    Cuando el sistema carga la vista de slideshow
    Entonces el sistema debe mostrar el slideshow del activo multimedia seleccionado

---

## Característica: Localización Geográfica

# language: es
Característica: Geolocalización y Búsqueda por Código Postal
  Como usuario que desea contextualizar su ubicación
  Quiero obtener mi ubicación actual y buscar localidades por código postal
  Para registrar alimentos y actividades con contexto geográfico

  Escenario: Obtención de ubicación actual
    Dado que el usuario ha concedido el permiso de geolocalización
    Cuando el sistema solicita la ubicación actual
    Entonces el sistema debe obtener las coordenadas (latitud y longitud)
    Y debe crear un SocialPlace con el nombre "Ubicación actual"

  Escenario: Búsqueda por código postal
    Dado que el usuario ingresa un código postal
    Cuando el sistema realiza la búsqueda
    Entonces el sistema debe retornar las localidades asociadas al código postal
    Y cada localidad debe incluir el nombre, estado y país

  Escenario: Denegación de permiso de ubicación
    Dado que el usuario deniega el permiso de geolocalización
    Cuando el sistema intenta obtener la ubicación
    Entonces el sistema debe continuar sin información de ubicación
    Y no debe bloquear ninguna funcionalidad de la aplicación

---

## Característica: Cuenta de Usuario

# language: es
Característica: Gestión de Cuenta de Usuario
  Como usuario registrado
  Quiero gestionar la información de mi cuenta
  Para mantener mis datos actualizados y configurar mi experiencia

  Escenario: Visualización de la cuenta
    Dado que el usuario está en la página de "Cuenta"
    Cuando el sistema carga la información de la cuenta
    Entonces el sistema debe mostrar la página de gestión de cuenta
    Y debe indicar que la funcionalidad de cuenta está aún en integración

---

## Característica: Seguridad y Validación

# language: es
Característica: Seguridad y Auditoría
  Como sistema de gestión de usuarios
  Quiero registrar eventos de seguridad y validar el acceso
  Para proteger los datos de los usuarios y cumplir con políticas de seguridad

  Escenario: Registro de evento de seguridad
    Dado que ocurre una acción sensible del usuario
    Cuando el sistema registra el evento
    Entonces el sistema debe crear un SecurityEvent con el tipo de evento y actor
    Y debe almacenar el evento en la base de datos de eventos de seguridad

  Escenario: Validación de entrada
    Dado que el usuario envía un formulario o credenciales
    Cuando el sistema valida la entrada
    Entonces el sistema debe retornar un ValidationResult con isValid y mensaje
    Y si es inválido, debe proporcionar un mensaje descriptivo del error

  Escenario: Rate limiting
    Dado que un usuario realiza múltiples solicitudes repetitivas
    Cuando el sistema verifica los límites de tasa
    Entonces el sistema debe retornar el estado de límite con remaining y resetAt
    Y si se excede el límite, debe rechazar la solicitud

---

## Característica: Sincronización y Persistencia

# language: es
Característica: Persistencia de Datos con CouchDB
  Como sistema backend
  Quiero persistir los datos de los usuarios en CouchDB
  Para garantizar la disponibilidad y consistencia de la información

  Escenario: Conexión a CouchDB
    Dado que la aplicación necesita almacenar datos
    Cuando el sistema conecta a CouchDB
    Entonces el sistema debe verificar la conectividad con ping()
    Y debe usar autenticación Basic Auth con las credenciales configuradas
    Y las operaciones CRUD deben funcionar sobre las bases de datos motorsocial_*

  Escenario: Almacenamiento de documentos
    Dado que el sistema debe crear o actualizar un documento
    Cuando se ejecuta la operación put()
    Entonces el sistema debe usar el prefijo semantic para el docId
    Y debe retornar el ID del documento creado/actualizado

  Escenario: Consulta de vistas
    Dado que el sistema necesita consultar datos
    Cuando ejecuta queryView sobre un design y view
    Entonces el sistema debe retornar los resultados decodificados
    Y debe soportar filtros por key, startKey, endKey, y limit

---

## Característica: Configuración de la Aplicación

# language: es
Característica: Configuración Global de MotorSocial
  Como administrador o sistema de configuración
  Quiero definir la configuración global de la aplicación
  Para controlar los módulos activos, credenciales y comportamiento

  Escenario: Carga de configuración desde JSON
    Dado que se proporciona un JSON de configuración
    Cuando el sistema construye el SocialAppConfig
    Entonces el sistema debe parsear appName, themeId, y todos los módulos
    Y debe configurar las credenciales de CouchDB y Qdrant si están presentes
    Y debe establecer useStubRepositories según la configuración

  Escenario: Valores por defecto
    Dado que no se proporciona configuración personalizada
    Cuando el sistema usa SocialAppConfig.defaults()
    Entonces el sistema debe usar "MotorSocial" como appName
    Y debe usar "light_default" como themeId
    Y debe tener useStubRepositories en true
    Y debe tener una lista vacía de módulos

---

## Característica: Interceptores HTTP y Gestión de Tokens

# language: es
Característica: Cliente HTTP con Interceptores
  Como sistema de comunicación con el backend
  Quiero que todas las peticiones HTTP incluyan autenticación y reintentos
  Para garantizar una comunicación segura y confiable con el servidor

  Escenario: Adjuntar token JWT a peticiones
    Dado que el usuario tiene un token de sesión válido
    Cuando el sistema realiza una petición HTTP
    Entonces el JwtInterceptor debe adjuntar "Authorization: Bearer <token>"
    Y no debe adjuntar el token a peticiones de login/refresh

  Escenario: Manejo de token expirado (401)
    Dado que el servidor responde con código 401
    Cuando el JwtInterceptor intercepta la respuesta de error
    Entonces el sistema debe eliminar el token del almacenamiento
    Y no debe lanzar una excepción, permitiendo que el flujo de UI gestione el estado

  Escenario: Reintentos inteligentes
    Dado que una petición falla por un fallo transitorio de red
    Cuando el sistema ejecuta la petición con RetryInterceptor
    Entonces el sistema debe reintentar hasta 3 veces con deltas de 1, 2 y 4 segundos
    Y debe validar que el status sea 200-399 antes de considerar éxito

---

## Característica: Característica Central del Sistema

# language: es
Característica: MotorSocial - Sistema de Registro de Calorías y Alimentación
  Como usuario que desea mejorar su salud y bienestar
  Quiero registrar mi alimentación diaria, monitorear calorías y conectarme socialmente
  Para mantener un estilo de vida saludable con el apoyo de mi red social

  Escenario: Experiencia completa del usuario
    Dado que el usuario descarga e instala MotorSocial
    Y abre la aplicación por primera vez
    Cuando el usuario completa el registro con sus datos personales
    Y el sistema autentica al usuario y carga su perfil
    Entonces el usuario accede a la página principal con su feed de actividades
    Y puede navegar al catálogo de alimentos para registrar su comida
    Y puede subir fotos de sus comidas a la biblioteca de medios
    Y puede comunicarse con contactos en el chat de grupos
    Y puede consultar su ubicación para contextualizar su alimentación
    Y puede gestionar su cuenta y preferencias de tema
    Y toda la información se persiste en CouchDB con sincronización offline

  Escenario: Registro offline
    Dado que el usuario está sin conexión a Internet
    Cuando el usuario registra una comida o actividad
    Entonces el sistema debe encolar la acción en la cola de sincronización
    Y cuando la conexión se restablece, el sistema debe sincronizar automáticamente

  Escenario: Sesión con expiración de token
    Dado que el usuario tiene una sesión activa
    Y el token JWT ha expirado
    Cuando el usuario intenta realizar una acción que requiere autenticación
    Entonces el sistema debe limpiar la sesión automáticamente
    Y redirigir al usuario a la pantalla de login para reautenticarse