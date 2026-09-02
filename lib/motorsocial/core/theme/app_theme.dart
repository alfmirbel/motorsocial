import 'package:flutter/material.dart';

/// Tema global Material 3 de MotorSocial.
///
/// Reglas de uso (AGENTS.md):
/// - **No colores codificados a mano** en widgets; siempre leer
///   `Theme.of(context).colorScheme` (o `appTheme.colorScheme`).
/// - M3: `FilledButton` (no `ElevatedButton`), `NavigationBar`
///   (no `BottomNavigationBar`).
/// - Icon codepoints en rango `0xe000`–`0xe900`.
///
/// Cualquier cambio de paleta debe centralizarse aquí.

/// Seed del brand — un azul-petróleo social accesible (contrast WCAG AA).
const Color _kSeedColor = Color(0xFF1E6F8E);

/// `ColorScheme` M3 (light). Úsalo desde widgets vía
/// `Theme.of(context).colorScheme` o `appTheme.colorScheme`.
final ColorScheme appColorScheme = ColorScheme.fromSeed(
  seedColor: _kSeedColor,
  brightness: Brightness.light,
);

/// `ColorScheme` M3 (dark).
final ColorScheme appColorSchemeDark = ColorScheme.fromSeed(
  seedColor: _kSeedColor,
  brightness: Brightness.dark,
);

/// `ThemeData` light global accessor desde cualquier widget.
ThemeData get appTheme => _buildTheme(appColorScheme);

/// `ThemeData` dark global.
ThemeData get appDarkTheme => _buildTheme(appColorSchemeDark);

ThemeData _buildTheme(ColorScheme scheme) {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // Tipografía M3 por defecto; los estilos socialmente maritalizados
    // viven en `lib/design/widgets/social_text_styles.dart`.
  );

  // Component defaults M3 consistentes con AGENTS.md.
  return base.copyWith(
    appBarTheme: AppBarTheme(
      centerTitle: false,
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 3,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: scheme.surfaceContainer,
      indicatorColor: scheme.primaryContainer,
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (states) => TextStyle(
          color: states.contains(WidgetState.selected)
              ? scheme.onSurface
              : scheme.onSurfaceVariant,
          fontSize: 12,
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(88, 48),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
    cardTheme: CardThemeData(
      color: scheme.surfaceContainerLow,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: scheme.surfaceContainerHigh,
    ),
  );
}
