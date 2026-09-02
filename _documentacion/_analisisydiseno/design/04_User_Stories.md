# User Stories — Módulo Design

**Metodología:** 3 C's (Card, Conversation, Confirmation)
**Features fuente:** `03_Features.feature`

---

## US-DES-001 — Gestión de Temas y Tokens de Diseño

### Card
Como plataforma, quiero gestionar temas (light/dark) y tokens de diseño centralizados, para aplicar Material Design 3 de forma consistente en toda la app.

### Conversation
- `DesignToken` (`key`, `category`, `value`) representa un token individual.
- `ThemeRepository` (abstract) define `loadTheme(themeId) → ThemeTokenSet`; `ThemeTokenSet` (`tokens: Map<String, DesignToken>`) definida en el propio repositorio.
- `ThemeState` (`themeId` def `'light_default'`, `isLoading`, `error`) con `copyWith`.
- `ThemeNotifier` es `Notifier<void>` (sin estado propio observable; `themeNotifierProvider`).
- `DesignEngine(themeRepository)` con `initialize()` no-op (comentario "domain bootstrap").

### Confirmation (Criterios de Aceptación)
- ✓ `loadTheme("light_default")` devuelve un `ThemeTokenSet`.
- ✓ `ThemeNotifier.build()` retorna `void` (sin lógica).
- ✓ `DesignEngine.initialize()` no lanza errores (no-op).

---

## US-DES-002 — Datos de Tema y Aplicación M3

### Card
Como desarrollador, quiero un `SocialThemeData` que envuelva `ThemeData` de Material, para aplicar M3 con un `themeId` y `mode` consistentes.

### Conversation
- `SocialThemeData` (`themeData: ThemeData`, `themeId`, `mode` def `'light'`) en `tokens\social_theme_data.dart`.
- No hay lógica que seleccione el tema por `themeId` ni que construya el `ThemeData` desde los `ThemeTokenSet`.

### Confirmation (Criterios de Aceptación)
- ✓ `SocialThemeData` con `themeId: "light_default"` asocia `mode: "light"` por defecto.
- ✓ `SocialThemeData` con `mode: "dark"` asocia el modo oscuro.
- ✓ El `themeData` se propaga al `MaterialApp`.

---

## US-DES-003 — Configuración de Tema y Layout Adaptativo

### Card
Como usuario, quiero ajustar el tema desde una pantalla de configuración y que el layout se adapte al tamaño de pantalla, para personalizar y consumir la app cómodamente.

### Conversation
- `ThemeSettingsPage` (ConsumerWidget) placeholder: `Scaffold(AppBar("Tema"), Center(Text('Theme settings')))`; no aplica `appTheme` ColorScheme (viola regla crítica de AGENTS.md).
- `AdaptiveLayout` (StatelessWidget, `body` req) devuelve `body` sin adaptar (placeholder).
- `social_text_styles.dart` es sub-barrel que solo re-exporta `adaptive_layout.dart`.

### Confirmation (Criterios de Aceptación)
- ✓ `ThemeSettingsPage` muestra AppBar "Tema" y "Theme settings".
- ✓ `AdaptiveLayout` con `body` renderiza el `body`.
- ✓ `AdaptiveLayout` sin `body` no compila (`body` req).
