# Motor Social - Sistema de Registro de Calorías y Alimentación

## Visión General del Sistema

Motor Social es una aplicación móvil y web Flutter desarrollada con Riverpod 3.x, Freezed y Dio que permite a los usuarios registrar, monitorear y gestionar su ingesta calórica y alimentación diaria. La aplicación se conecta directamente a una base de datos CouchDB para el almacenamiento persistente de datos.

## Arquitectura del Sistema

### Capa de Presentación
- **Framework**: Flutter (Dart 3.14-dev)
- **Gestión de Estado**: Riverpod 3.x con `riverpod_generator`
- **Navegación**: Sistema de rutas nombradas tradicional (sin GoRouter ni Navigator 2.0)
- **Theming**: Material Design 3 con color scheme basado en `app_theme.dart`

### Capa de Datos
- **Almacenamiento**: CouchDB (conexión directa desde Flutter - temporal según documentación)
- **Cliente HTTP**: Dio con interceptors personalizados
- **Gestión de Tokens**: JWT con almacenamiento seguro basado en plataforma
- **Serialización**: JSON estándar con clases manuales (Freezed en proceso de migración)

### Capa de Negocio
- **Patrón**: Repositorio para separación de responsabilidades
- **Manejo de Errores**: Interceptor JWT que limpia token en 401 sin crashear
- **Reintentos**: Interceptor inteligente para fallos transitorios

### Tecnologías Clave
- Flutter (master channel, Dart 3.14-dev)
- Riverpod 3.x (con code generation)
- Dio (HTTP client)
- Flutter Secure Storage / Shared Preferences (almacenamiento de tokens)
- CouchDB (base de datos NoSQL)

## Estructura de Directorios Principales

```
lib/
├── motorsocial/
│   ├── activity/         # Módulo de actividad física
│   ├── catalog/          # Módulo de catálogo de alimentos/objetos sociales
│   ├── core/             # Funcionalidades centrales (tema, DB, providers)
│   ├── design/           # Diseño y tokens
│   ├── features/         # Funcionalidades principales de la app
│   │   ├── account/      # Gestión de cuenta
│   │   ├── auth/         # Autenticación
│   │   ├── chat/         # Mensajería
│   │   ├── feed/         # Feed de actividades
│   │   ├── home/         # Página principal
│   │   └── profile/      # Perfil de usuario
│   ├── identity/         # Gestión de identidad de usuarios
│   ├── location/         # Servicios de geolocalización
│   ├── media/            # Gestión de medios (fotos, videos)
│   ├── navigation/       # Sistema de navegación y routing
│   ├── resilience/       # Manejo de conectividad y sincronización
│   ├── security/         # Módulo de seguridad
│   └── social_graph/     # Redes sociales y relaciones
```

## Patrones de Diseño y Convenciones

### Estado y Notifiers
- Todos los notifiers extienden `StateNotifier` o `Notifier` de Riverpod
- Los providers están definidos en módulos específicos de cada feature
- El `sessionProvider` maneja el estado de autenticación global

### Modelos de Datos
- Clases Dart manuales con `copyWith`, `fromJson`, `toJson`
- Uso parcial de Freezed (migrando desde clase manual a annotations)
- JSON serializable para comunicación con API

### Navegación
- Rutas nombradas centralizadas en `app_router.dart`
- Uso de `Navigator.pushReplacementNamed` para transiciones
- Guardias de ruta mediante `RouteGuard.canAccess()`

### Seguridad
- Interceptor JWT que añade token a cada petición HTTP
- Manejo graceful de errores 401 (expiración de token)
- Almacenamiento de tokens adaptativo por plataforma:
  - iOS/Android: `flutter_secure_storage`
  - Web/Windows: `shared_preferences`

## Flujo de Autenticación

1. Usuario ingresa credenciales en `login_page.dart`
2. `AuthNotifier` llama a `AuthRepository.signIn()`
3. Respuesta contiene `AuthState` con token y datos de usuario
4. Token se almacena mediante `TokenStorage` adaptativo
5. `dioProvider` inyecta `JwtInterceptor` que añade token a requests
6. En caso de 401, interceptor limpia token y notifica a UI

## Estilos y Temas

- Uso obligatorio de Material Design 3
- Paleta de colores definida en `app_theme.dart`
- Prohibición de colores hardcodeados - siempre usar `Theme.of(context).colorScheme`
- Componentes M3 preferidos: `NavigationBar`, `FilledButton`
- Rutas de iconos restringidas a range 0xe000-0xe900

## Estado Actual y Limitaciones

1. **Freezed Migration**: El proyecto está migrando de clases manuales a Freezed, pero actualmente las anotaciones no están activas debido a incompatibilidad con Dart 3.14-dev (mixin class syntax)
2. **CouchDB Temporal**: Según documentación, la conexión directa a CouchDB es temporal y debería ir a través de una API backend separada
3. **Código Legacy**: El proyecto mezcla patrones antiguos y nuevos durante la migración