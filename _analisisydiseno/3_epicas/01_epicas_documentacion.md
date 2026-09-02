# Épicas del Sistema Motor Social

## Visión General
Las épicas de Motor Social derivan de la iniciativa estratégica de crear una plataforma integral de registro de calorías y alimentación. Cada épica representa un bloque de trabajo significativo que aporta valor directo al usuario final, mapeado al User Journey principal y a los Impactos definidos en el Impact Mapping.

---

## ÉPICA 1: Identidad de Usuario y Autenticación
**Módulo**: `identity/`
**Subdirectorios**: `data_models`, `pages`, `providers`, `repositories`, `social_identity_engine.dart`

### User Journey Asociado
**Fase 1 - Descubrimiento**: El usuario descubre Motor Social y decide registrarse
**Fase 2 - Onboarding**: Crea su cuenta y configura su perfil inicial

### Impact Mapping
- **Actor**: Usuario nuevo
- **Impacto Deseado**: El usuario puede crear una cuenta personal segura y gestionar su sesión
- **Entregables**: Sistema de registro, login, recuperación de contraseña, gestión de sesión

### Especificaciones (EARS)

#### Requerimientos Ubicuos
- **UR-1.1**: El sistema deberá permitir a los usuarios autenticarse mediante credenciales (email y contraseña).
- **UR-1.2**: El sistema deberá almacenar de forma segura el token JWT de sesión.
- **UR-1.3**: El sistema deberá proporcionar una API para registrar nuevos usuarios con email, contraseña y nombre para mostrar.

#### Requerimientos Controlados por Eventos
- **ER-1.1**: Cuando el usuario envía credenciales válidas, el sistema deberá autenticar al usuario, generar un token de sesión y redirigir a la página principal.
- **ER-1.2**: Cuando el usuario solicita recuperación de contraseña, el sistema deberá enviar un correo electrónico con instrucciones de recuperación.
- **ER-1.3**: Cuando el usuario completa el registro exitosamente, el sistema deberá autenticar automáticamente al usuario y redirigir a la página principal.

#### Requerimientos Controlados por Estados
- **SR-1.1**: Mientras el usuario no esté autenticado, el sistema deberá mostrar únicamente las rutas públicas (login, registro).
- **SR-1.2**: Mientras exista un token válido, el sistema deberá adjuntar automáticamente el token a todas las peticiones HTTP salientes.

#### Requerimientos de Comportamiento No Deseado
- **UWB-1.1**: Si las credenciales son inválidas, entonces el sistema deberá mostrar un mensaje de error claro y mantener al usuario en la pantalla de login.
- **UWB-1.2**: Si el token JWT expira (401), entonces el sistema deberá limpiar el token, redirigir al usuario a la pantalla de login y no propagar la excepción.

#### Requerimientos de Funciones Opcionales
- **OF-1.1**: Donde el dispositivo soporte almacenamiento seguro, el sistema deberá usar `flutter_secure_storage` para guardar tokens; de lo contrario, deberá usar `shared_preferences` como fallback.

---

## ÉPICA 2: Feed de Actividades Sociales
**Módulo**: `activity/`
**Subdirectorios**: `data_models`, `engine`, `pages`, `providers`, `repositories`, `widgets`

### User Journey Asociado
**Fase 3 - Actividad Diaria**: El usuario registra sus comidas y actividades
**Fase 4 - Participación Social**: El usuario ve y participa en actividades de su red

### Impact Mapping
- **Actor**: Usuario activo
- **Impacto Deseado**: El usuario puede ver, crear y reaccionar a actividades sociales relacionadas con alimentación
- **Entregables**: Feed de actividades, eventos sociales, reacciones

### Especificaciones (EARS)

#### Requerimientos Ubicuos
- **UR-2.1**: El sistema deberá mostrar un feed cronológico inverso de actividades sociales.
- **UR-2.2**: El sistema deberá permitir la creación de nuevas actividades con verbos y objetos tipados.

#### Requerimientos Controlados por Eventos
- **ER-2.1**: Cuando un usuario publica una nueva actividad, el sistema deberá agregarla al feed y notificar a los seguidores.
- **ER-2.2**: Cuando un usuario reacciona a una actividad, el sistema deberá registrar la reacción y actualizar el contador.

#### Requerimientos Controlados por Estados
- **SR-2.1**: Mientras el feed esté cargando, el sistema deberá mostrar un indicador de progreso.

#### Requerimientos de Comportamiento No Deseado
- **UWB-2.1**: Si la carga del feed falla, entonces el sistema deberá mostrar un mensaje de error y permitir reintentar.

---

## ÉPICA 3: Catálogo de Objetos Sociales y Alimentos
**Módulo**: `catalog/`
**Subdirectorios**: `data_models`, `engine`, `pages`, `providers`, `repositories`, `widgets`

### User Journey Asociado
**Fase 3 - Registro de Comida**: El usuario busca y selecciona alimentos para registrar
**Fase 5 - Exploración**: El usuario explora nuevos alimentos y objetos sociales

### Impact Mapping
- **Actor**: Usuario en búsqueda
- **Impacto Deseado**: El usuario puede buscar, filtrar y agregar alimentos/objetos a su registro diario
- **Entregables**: Catálogo paginado, búsqueda, filtrado por tipo, vista de detalle

### Especificaciones (EARS)

#### Requerimientos Ubicuos
- **UR-3.1**: El sistema deberá proporcionar un catálogo paginado de objetos sociales y alimentos.
- **UR-3.2**: El sistema deberá permitir búsqueda por texto en el catálogo.

#### Requerimientos Controlados por Eventos
- **ER-3.1**: Cuando el usuario selecciona un objeto del catálogo, el sistema deberá mostrar la vista de detalle.

#### Requerimientos Controlados por Estados
- **SR-3.1**: Mientras no haya resultados, el sistema deberá mostrar un mensaje "Sin resultados".

#### Requerimientos de Comportamiento No Deseado
- **UWB-3.1**: Si la búsqueda falla, entonces el sistema deberá mostrar el error y permitir reintentar.

---

## ÉPICA 4: Navegación y Enrutamiento
**Módulo**: `navigation/`
**Subdirectorios**: `data_models`, `providers`, `routing`, `shell`

### User Journey Asociado
**Fase 1-5 - Transversal**: El usuario navega entre las diferentes secciones de la aplicación

### Impact Mapping
- **Actor**: Todos los usuarios
- **Impacto Deseado**: El usuario puede navegar intuitivamente entre las secciones de la aplicación
- **Entregables**: Sistema de rutas nombradas, NavigationBar M3, protección de rutas

### Especificaciones (EARS)

#### Requerimientos Ubicuos
- **UR-4.1**: El sistema deberá proporcionar navegación mediante rutas nombradas.
- **UR-4.2**: El sistema deberá incluir una NavigationBar M3 con los destinos principales.

#### Requerimientos Controlados por Eventos
- **ER-4.1**: Cuando el usuario selecciona un destino de la NavigationBar, el sistema deberá navegar a la ruta correspondiente.

#### Requerimientos Controlados por Estados
- **SR-4.1**: Mientras el usuario esté en una ruta protegida sin sesión, el sistema deberá redirigir a login.

#### Requerimientos de Comportamiento No Deseado
- **UWB-4.1**: Si la ruta solicitada no existe, entonces el sistema deberá mostrar una página "No encontrado".

---

## ÉPICA 5: Diseño y Theming
**Módulo**: `design/`
**Subdirectorios**: `data_models`, `engine`, `pages`, `providers`, `repositories`, `tokens`, `widgets`

### User Journey Asociado
**Fase 1-5 - Transversal**: El usuario experimenta la identidad visual de la aplicación

### Impact Mapping
- **Actor**: Todos los usuarios
- **Impacto Deseado**: El usuario experimenta una interfaz coherente y personalizable con Material Design 3
- **Entregables**: Tokens de diseño, tema claro/oscuro, componentes reutilizables

### Especificaciones (EARS)

#### Requerimientos Ubicuos
- **UR-5.1**: El sistema deberá aplicar Material Design 3 en todos los componentes.
- **UR-5.2**: El sistema deberá soportar temas claro y oscuro.

#### Requerimientos Controlados por Eventos
- **ER-5.1**: Cuando el usuario cambia el tema, el sistema deberá persistir la selección.

#### Requerimientos de Funciones Opcionales
- **OF-5.1**: Donde el sistema operativo soporte modo oscuro, el sistema deberá respetar la preferencia del sistema.

---

## ÉPICA 6: Resiliencia y Sincronización
**Módulo**: `resilience/`
**Subdirectorios**: `data_models`, `engine`, `providers`, `repositories`

### User Journey Asociado
**Fase 3-4 - Continuidad**: El usuario registra actividades incluso sin conexión

### Impact Mapping
- **Actor**: Usuario móvil
- **Impacto Deseado**: El usuario puede usar la aplicación sin conexión y sincronizar al reconectarse
- **Entregables**: Detección de conectividad, cola de sincronización, plataforma info

### Especificaciones (EARS)

#### Requerimientos Ubicuos
- **UR-6.1**: El sistema deberá detectar el estado de conectividad de red.
- **UR-6.2**: El sistema deberá proporcionar una cola de sincronización offline-first.

#### Requerimientos Controlados por Eventos
- **ER-6.1**: Cuando la conectividad se restablece, el sistema deberá ejecutar la cola de sincronización.
- **ER-6.2**: Cuando el usuario agrega un elemento offline, el sistema deberá encolarlo para sincronización.

#### Requerimientos de Comportamiento No Deseado
- **UWB-6.1**: Si la sincronización falla, entonces el sistema deberá mantener los elementos en cola y reintentar.

---

## ÉPICA 7: Seguridad y Validación
**Módulo**: `security/`
**Subdirectorios**: `data_models`, `engine`, `providers`, `repositories`

### User Journey Asociado
**Fase 1-5 - Transversal**: El usuario interactúa con el sistema de forma segura

### Impact Mapping
- **Actor**: Todos los usuarios
- **Impacto Deseado**: El usuario está protegido contra accesos no autorizados y abusos
- **Entregables**: Eventos de auditoría, rate limiting, validación de entrada

### Especificaciones (EARS)

#### Requerimientos Ubicuos
- **UR-7.1**: El sistema deberá registrar eventos de seguridad para auditoría.
- **UR-7.2**: El sistema deberá validar todas las entradas del usuario.

#### Requerimientos de Comportamiento No Deseado
- **UWB-7.1**: Si se excede el rate limit, entonces el sistema deberá rechazar la petición y registrar el evento.

---

## ÉPICA 8: Localización y Geolocalización
**Módulo**: `location/`
**Subdirectorios**: `data_models`, `engine`, `pages`, `providers`, `repositories`

### User Journey Asociado
**Fase 3 - Contexto**: El usuario registra su ubicación para alimentos locales

### Impact Mapping
- **Actor**: Usuario en contexto
- **Impacto Deseado**: El usuario puede obtener su ubicación actual y buscar por código postal
- **Entregables**: Geolocalización, búsqueda por CP, selección de localidad

### Especificaciones (EARS)

#### Requerimientos Ubicuos
- **UR-8.1**: El sistema deberá proporcionar acceso a la geolocalización del dispositivo.
- **UR-8.2**: El sistema deberá permitir búsqueda de localidades por código postal.

#### Requerimientos Controlados por Eventos
- **ER-8.1**: Cuando el usuario concede permiso de ubicación, el sistema deberá obtener las coordenadas actuales.

#### Requerimientos de Comportamiento No Deseado
- **UWB-8.1**: Si el usuario deniega el permiso de ubicación, entonces el sistema deberá continuar sin esa información.

---

## ÉPICA 9: Gestión de Medios
**Módulo**: `media/`
**Subdirectorios**: `data_models`, `engine`, `pages`, `providers`, `repositories`, `widgets`

### User Journey Asociado
**Fase 3-4 - Documentación**: El usuario adjunta fotos a sus registros

### Impact Mapping
- **Actor**: Usuario activo
- **Impacto Deseado**: El usuario puede subir, organizar y visualizar fotos de sus comidas
- **Entregables**: Biblioteca de medios, slideshow, selector de medios

### Especificaciones (EARS)

#### Requerimientos Ubicuos
- **UR-9.1**: El sistema deberá permitir la subida de imágenes a la biblioteca del usuario.
- **UR-9.2**: El sistema deberá organizar los medios por propietario.

#### Requerimientos Controlados por Eventos
- **ER-9.1**: Cuando el usuario selecciona una imagen, el sistema deberá subirla y agregarla a la biblioteca.

---

## ÉPICA 10: Grafo Social y Relaciones
**Módulo**: `social_graph/`
**Subdirectorios**: `data_models`, `engine`, `pages`, `providers`, `repositories`, `widgets`

### User Journey Asociado
**Fase 4 - Comunidad**: El usuario construye su red social

### Impact Mapping
- **Actor**: Usuario social
- **Impacto Deseado**: El usuario puede gestionar contactos, grupos e invitaciones
- **Entregables**: Contactos, grupos, invitaciones, relaciones

### Especificaciones (EARS)

#### Requerimientos Ubicuos
- **UR-10.1**: El sistema deberá permitir la gestión de contactos y relaciones sociales.
- **UR-10.2**: El sistema deberá soportar la creación y administración de grupos.

#### Requerimientos Controlados por Eventos
- **ER-10.1**: Cuando un usuario envía una invitación, el sistema deberá encolarla para el destinatario.

#### Requerimientos de Comportamiento No Deseado
- **UWB-10.1**: Si el envío de invitación falla, entonces el sistema deberá notificar al usuario y permitir reintentar.

---

## ÉPICA 11: Cuenta de Usuario
**Módulo**: `features/account/`
**Subdirectorios**: `pages`, `repositories`

### User Journey Asociado
**Fase 2-5 - Gestión**: El usuario gestiona su cuenta personal

### Impact Mapping
- **Actor**: Usuario registrado
- **Impacto Deseado**: El usuario puede ver y gestionar la configuración de su cuenta
- **Entregables**: Página de cuenta, CRUD de cuenta

### Especificaciones (EARS)

#### Requerimientos Ubicuos
- **UR-11.1**: El sistema deberá permitir al usuario ver y editar la información de su cuenta.

---

## ÉPICA 12: Funcionalidades Específicas de Features
**Módulo**: `features/`
**Subdirectorios**: `auth`, `chat`, `feed`, `home`, `profile`

### User Journey Asociado
**Fase 1-5 - Páginas Específicas**: Vistas dedicadas para cada funcionalidad principal

### Impact Mapping
- **Actor**: Todos los usuarios
- **Impacto Deseado**: El usuario accede a vistas dedicadas para cada caso de uso principal
- **Entregables**: Páginas de home, feed, chat, profile, auth

### Especificaciones (EARS)

#### Requerimientos Ubicuos
- **UR-12.1**: El sistema deberá proporcionar una página principal con resumen de la actividad reciente.
- **UR-12.2**: El sistema deberá proporcionar una página de perfil con información del usuario actual.

---

## Resumen de Mapeo User Journey → Épicas

| User Journey | Épica(s) Asociada(s) |
|---|---|
| Descubrimiento y Registro | 1 (Identidad) |
| Onboarding y Perfil Inicial | 1, 11 (Identidad, Cuenta) |
| Actividad Diaria | 3 (Catálogo), 9 (Medios) |
| Participación Social | 2 (Feed), 10 (Grafo Social) |
| Continuidad Offline | 6 (Resiliencia) |
| Contexto Geográfico | 8 (Localización) |
| Experiencia Transversal | 4 (Navegación), 5 (Diseño), 7 (Seguridad) |
| Páginas Dedicadas | 12 (Features) |