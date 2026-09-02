# Épicas y Especificaciones (EARS) — Módulo Design

**Ruta código:** `lib\design\` (10 archivos `.dart`, sin árbol anidado duplicado)
**Subdirectorios:** `data_models`, `engine`, `pages`, `providers`, `repositories`, `tokens`, `widgets`, raíz (`design.dart` barrel).
**Fecha:** 2026-08-13

---

## Épica 1: Gestión de Temas y Tokens de Diseño
Como plataforma, quiero gestionar temas (light/dark) y tokens de diseño centralizados, para aplicar Material Design 3 de forma consistente en toda la app.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá representar un token de diseño mediante `DesignToken` (`key`, `category`, `value`).
- El sistema deberá exponer `ThemeRepository` con la operación `loadTheme(themeId) → ThemeTokenSet`.
- El sistema deberá representar un conjunto de tokens mediante `ThemeTokenSet` (`tokens: Map<String, DesignToken>`).

#### 2. Requerimientos Controlados por Eventos
- Cuando se invoque `ThemeRepository.loadTheme(themeId)`, el sistema deberá devolver el `ThemeTokenSet` correspondiente al `themeId`.

#### 3. Requerimientos Controlados por Estados
- Mientras el sistema tenga un tema activo, el sistema deberá modelar el estado con `ThemeState` (`themeId` def `'light_default'`, `isLoading`, `error`) gestionado por `ThemeNotifier`.

#### 4. Requerimientos de Comportamiento No Deseado
- Si la carga de un tema falla, entonces el sistema deberá exponer el error en `ThemeState.error`.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de múltiples temas esté incluida, el sistema deberá permitir cargar distintos `themeId` desde `ThemeRepository`.

#### 6. Requerimientos Complejos
- Mientras el `DesignEngine` esté inicializado con un `ThemeRepository`, cuando se invoque `initialize()`, el sistema deberá preparar el bootstrap del dominio (hoy no-op).

---

## Épica 2: Datos de Tema y Aplicación M3
Como desarrollador, quiero un `SocialThemeData` que envuelva `ThemeData` de Material, para aplicar M3 con un `themeId` y `mode` consistentes.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer `SocialThemeData` (`themeData: ThemeData`, `themeId`, `mode` def `'light'`).

#### 2. Requerimientos Controlados por Eventos
- Cuando se construya un `SocialThemeData`, el sistema deberá asociar el `themeData` con su `themeId` y `mode`.

#### 3. Requerimientos Controlados por Estados
- Mientras `SocialThemeData.mode == 'dark'`, el sistema deberá aplicar el `ThemeData` correspondiente al modo oscuro.

#### 4. Requerimientos de Comportamiento No Deseado
- Si un `themeId` no existe, entonces el sistema deberá recurrir al tema por defecto `'light_default'`.

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de modo `dark` esté incluida, el sistema deberá construir `SocialThemeData` con `mode: 'dark'`.

#### 6. Requerimientos Complejos
- Mientras la app renderice, cuando se aplique el `SocialThemeData`, el sistema deberá propagar el `themeData` al `MaterialApp` como `theme`.

---

## Épica 3: Configuración de Tema y Layout Adaptativo
Como usuario, quiero ajustar el tema desde una pantalla de configuración y que el layout se adapte al tamaño de pantalla, para personalizar y consumir la app cómodamente.

### Especificaciones (Patrones EARS)

#### 1. Requerimientos Ubicuos
- El sistema deberá exponer la pantalla `ThemeSettingsPage` y el widget `AdaptiveLayout` (`body` req).

#### 2. Requerimientos Controlados por Eventos
- Cuando se construya `ThemeSettingsPage`, el sistema deberá mostrar un `Scaffold` con AppBar "Tema" y `Text('Theme settings')`.

#### 3. Requerimientos Controlados por Estados
- Mientras `ThemeState.isLoading == true`, el sistema deberá mostrar un indicador de carga en `ThemeSettingsPage` (extensión futura).

#### 4. Requerimientos de Comportamiento No Deseado
- Si `AdaptiveLayout` no recibe un `body`, entonces el sistema deberá generar un error de compilación (parámetro `req`).

#### 5. Requerimientos de Funciones Opcionales
- Donde la función de layout adaptativo esté incluida, el sistema deberá renderizar `body` de `AdaptiveLayout` según el tamaño de pantalla (extensión futura; hoy devuelve `body` sin adaptar).

#### 6. Requerimientos Complejos
- Mientras el usuario cambia el tema en `ThemeSettingsPage`, cuando confirma, el sistema deberá notificar al `ThemeNotifier` (extensión futura; hoy `ThemeNotifier` es `Notifier<void>` sin lógica).

---

## Notas de Estado del Módulo
- **Cascarones:** `ThemeSettingsPage` (placeholder `Text('Theme settings')`), `ThemeNotifier.build()` no-op (`Notifier<void>`), `DesignEngine.initialize()` no-op, `AdaptiveLayout` devuelve `body` sin adaptar.
- **`ThemeRepository` abstract** sin implementación concreta (solo define `loadTheme`).
- **`ThemeTokenSet`** definida en el propio archivo del repositorio (no en `data_models`).
- **Barrel `design.dart`** solo exporta `theme_state.dart` y `theme_notifier.dart` (no expone `DesignToken`, `ThemeRepository`, `SocialThemeData`, `AdaptiveLayout`, ni `ThemeSettingsPage`).
- **`social_text_styles.dart`** es un sub-barrel que solo re-exporta `adaptive_layout.dart` (no define estilos de texto).
- **No hay árbol anidado duplicado.**
- **AGENTS.md cita `lib\core_backend_services\20_var_globales\var_color_themes.dart`** y `_documentacion\antigravity_ui_rules.md` como referencia de M3; no existen en la estructura actual. El módulo Design los sustituye parcialmente.
- **No usa `appTheme` ColorScheme global** (regla crítica de AGENTS.md) en los widgets actuales — `ThemeSettingsPage` no lo referencia.
