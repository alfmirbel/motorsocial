# Guía de Uso — MotorSocial

> **Fuente:** Documentación de análisis y diseño ubicada en `./_documentacion/_analisisydiseno/`.
> **Fecha de referencia:** 2026-08-21.

---

## 1. ¿Qué es MotorSocial?

MotorSocial es una aplicación social y comercial diseñada como un **motor de red reutilizable** que combina tres capacidades principales:

1. **Dinámica social** (feed, conversaciones, reacciones, contactos, grupos).
2. **Catálogo de productos y servicios** con búsqueda y segmentación.
3. **Geolocalización** para contextualizar experiencias por proximidad.

> **Despliegue vertical inicial:** Aunque la arquitectura permite desplegar redes sociales verticales (vecinales, profesionales, empresariales), la instancia actual de MotorSocial aplica este motor al **registro de calorías y alimentación**, integrando el descubrimiento de alimentos/servicios de nutrición con una capa social y de ubicación.

---

## 2. Objetivos del Proyecto (OKRs)

| Resultado Clave | Descripción |
| :--- | :--- |
| **KR 1** | Desarrollar y documentar el 100 % de los módulos core (Identity, Activity, Catalog, Social Graph, Location) con Material Design 3, Riverpod 3 y arquitectura SDD/BDD. |
| **KR 2** | Abstraer el acceso a CouchDB en repositorios intercambiables, logrando una arquitectura limpia y testeable. |
| **KR 3** | Completar la ingeniería inversa y la especificación de diseño (EARS, Gherkin, User Stories) de todos los módulos de `lib/`. |
| **KR 4** | Garantizar un flujo de usuario sin fricciones desde el registro hasta la interacción en el feed y el catálogo. |

---

## 3. Segmentos de Usuario

| Actor | Descripción |
| :--- | :--- |
| **Usuario final** | Persona que se registra, gestiona su perfil y consume el feed y el catálogo. |
| **Negocio / Comercio** | Entidad que publica productos/servicios y busca exposición social. |
| **Administrador de la red vertical** | Operador que despliega y configura la instancia MotorSocial. |
| **Sistema (backend)** | API Node.js + Express + CouchDB + microservicio mailer. |

---

## 4. Módulos y Funcionalidades

### 4.1 Identity — Identidad y Autenticación

| Funcionalidad | Descripción |
| :--- | :--- |
| **Inicio de sesión** | Acceso mediante email y contraseña en `LoginPage`. |
| **Registro de cuenta** | Creación de cuenta con email, contraseña y nombre visible (`RegisterPage`). |
| **Recuperación de contraseña** | Solicitud de enlace de recuperación por email (`PasswordRecoveryPage`). El sistema **no revela** si la cuenta existe (respuesta genérica). |
| **Persistencia de sesión** | Almacenamiento local del token y `userId` para mantener la sesión entre ejecuciones. |
| **Perfil y roles** | Cada usuario tiene un `SocialUser` (`displayName`, `photoUrl`) y opcionalmente un `RoleProfile` con permisos para controlar sus capacidades en la plataforma. |

**Flujo de acceso:**
1. El usuario introduce email y contraseña.
2. Si las credenciales son válidas, se almacena el token en sesión y se navega a la pantalla principal (`home`).
3. Si la credencial es inválida, se muestra un mensaje de error.
4. Al reabrir la app, si existe una sesión vigente, el usuario ingresa automáticamente.

---

### 4.2 Activity — Feed social y mensajería

#### 4.2.1 Feed de Actividad
- Visualiza un listado de actividades sociales recientes de las conexiones del usuario.
- Cada actividad muestra: **actor** (quién hizo la acción), **verbo** (qué hizo) y **objeto** (en qué interactuó).
- Las actividades se presentan en **orden cronológico inverso** (más recientes primero).
- Soporta **paginación** (`nextPage`) al hacer scroll hasta el final de la lista.
- En caso de error de conexión, muestra un mensaje amigable con opción de reintentar.
- En modo sin conexión prolongada, puede operar temporalmente con datos en memoria.

#### 4.2.2 Conversaciones y Chat
- Permite mantener **conversaciones privadas** con otros usuarios (`ConversationPage`).
- El campo de entrada valida que el mensaje no esté vacío antes de enviar.
- Mientras se envía, el sistema deshabilita la entrada y muestra un indicador de progreso.
- Si el envío falla, expone el error y conserva el texto para reintento.

#### 4.2.3 Reacciones
- El usuario puede **reaccionar** (Like / Comentario) a las actividades del feed.
- La actualización del estado es **reactiva** (sin recargar toda la página).
- Mientras se procesa la reacción, se refleja visualmente el estado pendiente.
- Si la operación falla, se revierte el estado visual y se expone el error.

---

### 4.3 Catalog — Catálogo de productos y servicios

| Funcionalidad | Descripción |
| :--- | :--- |
| **Listado paginado** | Exploración de ítems sociales paginados (`CatalogListPage`). Cada ítem muestra título y tipo. |
| **Detalle de objeto** | Vista de detalle (`ObjectDetailPage`) que muestra el tipo e identificador del objeto social. |
| **Búsqueda y filtrado** | Búsqueda avanzada con filtros, orden y paginación (`SocialObjectQuery`). |
| **Exportación a PDF** | Capacidad opcional de exportar la lista actual a PDF (`CatalogContract.enablePdfExport`). |
| **Integración social** | Visualización de la actividad social asociada a un ítem del catálogo. |

**Filtros disponibles en la búsqueda:**
- Tipo preferido de objeto (`preferredType`).
- Cantidad de resultados por página (`limit`, defecto 20).
- Filtros personalizados (`filter`).
- Orden (`sort`).

---

### 4.4 Social Graph — Contactos, grupos e invitaciones

| Funcionalidad | Descripción |
| :--- | :--- |
| **Contactos** | Gestión de relaciones con otros usuarios. Se pueden listar las relaciones por actor o por contacto. |
| **Invitaciones** | Envío y recepción de invitaciones para establecer conexiones de forma consentida. |
| **Grupos** | Descubrimiento y adhesión a grupos. Se filtran por visibilidad (público / privado) y disponibilidad para unirse. |

**Estados de invitación:**
- `pending` (pendiente de respuesta).

---

### 4.5 Media — Biblioteca multimedia

| Funcionalidad | Descripción |
| :--- | :--- |
| **Biblioteca de medios** | Visualización de la colección de assets subidos por el usuario (`MediaLibraryPage`). |
| **Subida de medios** | Registro de nuevos assets en la biblioteca. |
| **Eliminación** | Borrado de assets de la biblioteca. |
| **Slideshow** | Presentación en secuencia de un medio seleccionado (`MediaSlideshowPage`). |

---

### 4.6 Location — Geolocalización y ubicación

| Funcionalidad | Descripción |
| :--- | :--- |
| **Geolocalización** | Captura automática de la ubicación actual del usuario mediante sensores del dispositivo. |
| **Búsqueda por código postal** | Alternativa manual para seleccionar localidad cuando el GPS no está disponible. |
| **Selección de localidad** | El sistema recuerda la localidad seleccionada para personalizar el catálogo y el feed por proximidad. |

---

### 4.7 Navigation — Navegación

- **Shell inferior**: Barra de navegación inferior (`BottomNavigationBar`) que permite cambiar entre las secciones principales sin fricciones.
- **Rutas principales**:
  - `/` — Home
  - `/login` — Acceso (público)
  - `/catalog` — Catálogo
  - `/feed` — Feed de actividad
  - `/profile` — Perfil del usuario
- **Guardias de acceso**: Las rutas privadas protegen el contenido y redirigen a `/login` si el usuario no está autenticado.

---

### 4.8 Features — Funcionalidades integradoras

El módulo `features` actúa como consumidor real de los demás módulos, integrando sus capacidades en pantallas cohesivas:

| Pantalla | Módulo consumido | Descripción |
| :--- | :--- | :--- |
| **Home** | General | Pantalla principal post-login. |
| **FeedPage** | Activity | Feed integrado de actividades. |
| **CatalogPage** | Catalog | Catálogo integrado con búsqueda. |
| **ChatPage** | Social Graph | Grupos e integración social. |
| **ProfilePage** | Identity / Core | Perfil del usuario y sesión activa. |
| **AccountPage** | Identity | Gestión de cuenta (pendiente de integración). |

---

## 5. Flujo de Usuario Principal

```
+-------------------+
| Descubrimiento    |
| (visitante)       |
+--------+----------+
         |
         v
+-------------------+
| Registro / Login  | ← Identity
+--------+----------+
         |
         v
+-------------------+
| Configuración     |
| (Geo o CP)        | ← Location
+--------+----------+
         |
         v
+-------------------+      +-------------------+
| Explorar Catálogo |<---->| Ver Detalle Objeto | ← Catalog
+--------+----------+      +-------------------+
         |
         v
+-------------------+      +-------------------+
| Ver Feed Social   |<---->| Reaccionar / Like | ← Activity
+--------+----------+      +-------------------+
         |
         v
+-------------------+
| Contactos / Grupos| ← Social Graph
+--------+----------+
         |
         v
+-------------------+
| Chat Privado      | ← Activity
+--------+----------+
         |
         v
+-------------------+
| Gestionar Medios  | ← Media
+-------------------+
```

---

## 6. Métricas Clave

| Métrica | Propósito |
| :--- | :--- |
| **DAU / MAU** | Usuarios activos diarios y mensuales. |
| **Tasa de retención** | Capacidad de la plataforma para mantener usuarios. |
| **Volumen de interacciones en el Feed** | Engagement social de la red. |

---

## 7. Canales de Distribución

- **App móvil**: Play Store (Android) y App Store (iOS).
- **App Web**: Despliegue web WASM (Flutter Web).

---

## 8. Modelo de Ingresos (ROI Esperado)

1. **Monetización de negocios destacados en el Catálogo** (posicionamiento patrocinado o premium).
2. **Funciones premium o analíticas para negocios** (estadísticas de interacción, embudo de contacto).

---

## 9. Consideraciones Técnicas Relevantes para el Usuario

| Aspecto | Detalle |
| :--- | :--- |
| **Tecnología** | Flutter (multiplataforma: Android, iOS, Web, Windows). |
| **Diseño** | Material Design 3 (M3). |
| **Estado** | Riverpod 3.x con `Notifier` / `NotifierProvider`. |
| **Backend** | API Node.js + Express + JWT auth + microservicio mailer. |
| **Base de datos** | CouchDB (`motorsocial_*`). Temporalmente accesible desde la app Flutter; arquitectura orientada a paso previo por API propia. |
| **Sincronización** | Repositorios con implementación en memoria (stub) y backend real; permite desarrollo offline y pruebas sin servidor. |

---

## 10. Mapa de Épicas

| # | Épica | Módulo |
| :--- | :--- | :--- |
| E1 | Registro e identidad | Identity |
| E2 | Catálogo de objetos sociales | Catalog |
| E3 | Feed y conversaciones | Activity |
| E4 | Conexiones y grafo social | Social Graph |
| E5 | Multimedia | Media |
| E6 | Ubicación | Location |
| E7 | Personalización M3 | Design |
| E8 | Navegación y experiencia | Navigation / Features |
| E9 | Sincronización y resiliencia | Resilience |
| E10 | Seguridad | Security |
| E11 | Infraestructura | Core / Providers |

---

## 11. Estado del Proyecto (Nota de Contexto)

De acuerdo con la documentación de análisis y diseño:

- Muchos módulos presentan **cascarones (stubs)** en sus implementaciones iniciales (repositorios en memoria, páginas placeholder, etc.).
- Existen **deudas técnicas** pendientes (duplicaciones internas, proveedores no cableados, migración a repositorios reales de CouchDB).
- El proyecto se encuentra en fase activa de desarrollo y documentación; las funcionalidades descritas reflejan el **comportamiento esperado** según las User Stories y éticas EARS documentadas.