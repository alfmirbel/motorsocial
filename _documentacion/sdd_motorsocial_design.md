# SDD — Feature: Design

## 1. Resumen
Gestiona tokens de tema, estado de tema y widgets adaptativos. Provee una UI de configuración mínima.

## 2. Modelos
- `DesignToken`: key, category, value.
- `ThemeState`: themeId default `light_default`, isLoading, error.
- `SocialThemeData`: ThemeData, themeId, mode.

## 3. Repositorio
- `ThemeRepository`: provee `ThemeTokenSet`.
- `ThemeTokenSet`: mapa de tokens.

## 4. Motor
- `DesignEngine`: bootstrap vacío.

## 5. Proveedores
- `ThemeNotifier`: estado de tema; provider usa instancia por defecto de `ThemeRepository`.

## 6. UI / Widgets
- `ThemeSettingsPage`.
- `AdaptiveLayout`.
- widget re-exportado `social_text_styles.dart`.

## 7. Requisitos
| ID | Requisito | Evidencia |
|-----|-----------|-----------|
| RF-DES-01 | Administrar tema actual por identificador. | `ThemeState.themeId`, `ThemeNotifier`, `themeProvider`. |
| RF-DES-02 | Exponer tokens agrupados por categoría. | `DesignToken.category`, `ThemeTokenSet`. |
| RF-DES-03 | Aplicar tema Material coherente. | `SocialThemeData.themeData`. |
| RF-DES-04 | Permitir layout adaptativo. | `AdaptiveLayout`. |
