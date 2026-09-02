# Inventario Técnico y Tareas — Módulo Design

**Ruta código:** `lib\design\` (10 archivos `.dart`, sin árbol anidado duplicado)

---

## Tabla A — Inventario de Componentes

| Subdirectorio | Archivo | Tipo de componente | Nombre del componente | Parámetros que requiere | Variables que utiliza | Variables internas | Estilos que le aplican |
|---|---|---|---|---|---|---|---|
| (raíz) | `design.dart` | Barrel | — | N/A | — | — | N/A |
| `data_models` | `design_token.dart` | Clase de Datos | `DesignToken` | `key`, `category`, `value` (todos req) | — | — | N/A |
| `data_models` | `theme_state.dart` | Clase de Estado | `ThemeState` | `themeId` (def `'light_default'`), `isLoading` (def false), `error` (String?) | — | — | N/A |
| `engine` | `design_engine.dart` | Lógica/Servicio | `DesignEngine` (Pendiente) | `themeRepository` (ThemeRepository, req) | — | — | N/A |
| `pages` | `theme_settings_page.dart` | Widget (UI) | `ThemeSettingsPage` (Pendiente) | `key` | `ref`, `context` | — | Scaffold, AppBar, Center, Text |
| `providers` | `theme_notifier.dart` | Riverpod Provider | `ThemeNotifier` (Pendiente, `Notifier<void>`) | — | — | — | N/A |
| `providers` | `theme_notifier.dart` | Provider | `themeNotifierProvider` | N/A | — | — | N/A |
| `repositories` | `theme_repository.dart` | Interfaz/Repositorio | `ThemeRepository` (abstract) | — | — | — | N/A |
| `repositories` | `theme_repository.dart` | Clase de Datos | `ThemeTokenSet` | `tokens` (Map<String, DesignToken>) | — | — | N/A |
| `tokens` | `social_theme_data.dart` | Clase de Datos | `SocialThemeData` | `themeData` (ThemeData, req), `themeId` (req), `mode` (def `'light'`) | — | — | N/A |
| `widgets` | `adaptive_layout.dart` | Widget (UI) | `AdaptiveLayout` (Pendiente) | `key`, `body` (Widget, req) | `body` | — | N/A |
| `widgets` | `social_text_styles.dart` | Barrel (sub) | — | N/A | — | — | N/A |

---

## Tabla B — Inventario de Elementos Internos

| Subdirectorio | Archivo | Variables definidas en el archivo | Clases | Variables de la clase | Funciones/Widgets definidos en la clase | Variables que utiliza | Llamadas a otras clases/widgets |
|---|---|---|---|---|---|---|---|
| (raíz) | `design.dart` | — | — | — | export `data_models/theme_state.dart`, `providers/theme_notifier.dart` | — | barrel |
| `data_models` | `design_token.dart` | — | `DesignToken` | `key`, `category`, `value` | `const DesignToken(...)` | — | — |
| `data_models` | `theme_state.dart` | — | `ThemeState` | `themeId`, `isLoading`, `error` | `const ThemeState(...)`, `copyWith` | — | — |
| `engine` | `design_engine.dart` | — | `DesignEngine` | `themeRepository` | `const DesignEngine(this.themeRepository)`, `initialize()` (no-op) | — | `ThemeRepository` |
| `pages` | `theme_settings_page.dart` | — | `ThemeSettingsPage` (ConsumerWidget) | — | `build(context, ref)` → Scaffold/AppBar/Center/Text | — | `Scaffold`, `AppBar`, `Center`, `Text` |
| `providers` | `theme_notifier.dart` | `themeNotifierProvider` | `ThemeNotifier` (Pendiente) | — | `build()` (no-op) | — | `Notifier` |
| `repositories` | `theme_repository.dart` | — | `ThemeRepository` (abstract) | — | `loadTheme(themeId)` (abstract) | — | `ThemeTokenSet` |
| `repositories` | `theme_repository.dart` | — | `ThemeTokenSet` | `tokens` | `const ThemeTokenSet(this.tokens)` | — | `DesignToken` |
| `tokens` | `social_theme_data.dart` | — | `SocialThemeData` | `themeData`, `themeId`, `mode` | `const SocialThemeData(...)` | — | `ThemeData` |
| `widgets` | `adaptive_layout.dart` | — | `AdaptiveLayout` (StatelessWidget) | `body` | `const AdaptiveLayout(...)`, `build(context)` → `body` | `body` | — |
| `widgets` | `social_text_styles.dart` | — | — | — | export `adaptive_layout.dart` | — | barrel |

---

## Duplicaciones / Inconsistencias Detectadas

1. **Barrel `design.dart` incompleto:** solo exporta `theme_state.dart` y `theme_notifier.dart`; no expone `DesignToken`, `ThemeRepository`, `ThemeTokenSet`, `SocialThemeData`, `AdaptiveLayout`, `ThemeSettingsPage`. Los consumidores deben importar subdirectorios directamente.
2. **`ThemeTokenSet` ubicada en `repositories\theme_repository.dart`** y no en `data_models` (inconsistencia de organización).
3. **`ThemeRepository` abstract sin implementación concreta** (solo define `loadTheme`).
4. **`ThemeNotifier` es `Notifier<void>`** (sin estado observable real); `ThemeState` existe pero no está cableado al notifier.
5. **`social_text_styles.dart`** no define estilos de texto; es un barrel que re-exporta `adaptive_layout.dart`. Nombre engañoso.
6. **Cascarones:** `DesignEngine.initialize()` no-op, `ThemeSettingsPage` placeholder, `AdaptiveLayout` devuelve `body` sin adaptar.
7. **No usa `appTheme` ColorScheme global** (regla crítica de AGENTS.md "no hardcoded colors"): `ThemeSettingsPage` aplica colores por defecto de Material, no el ColorScheme global referenciado en AGENTS.md (`var_color_themes.dart`, que no existe).
8. **AGENTS.md desactualizado:** referencia `lib\core_backend_services\20_var_globales\var_color_themes.dart` y `_documentacion\antigravity_ui_rules.md` inexistentes.
