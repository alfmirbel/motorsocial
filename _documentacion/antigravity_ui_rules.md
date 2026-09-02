# Reglas UI Material 3 — MotorSocial

**Obligatorio leer antes de cualquier cambio de UI.** Este documento es la
fuente de verdad para los widgets, colores y tipografía del app. Está alineado
con `AGENTS.md` (sección *Critical code rules*) y con
`lib/core/theme/app_theme.dart`.

> Si algo aquí y `AGENTS.md` difieren, gana `AGENTS.md`. Actualiza ambos al
> cambiar reglas.

---

## 1. Principio rector

- **Views are dumb** — sin lógica de negocio en widgets; toda lógica vive en
  Riverpod notifiers / repositorios.
- **No colores hardcodeados** — todo color sale de `Theme.of(context)`
  (es decir, de `appTheme` / `appDarkTheme`).
- **M3 primero** — usa los widgets M3 canónicos en lugar de sus equivalentes
  M2 (ver §3).
- **`if (!mounted) return;`** después de **cada `await`** en StatefulWidget
  que actualice UI.

---

## 2. Color y tema

### 2.1 Fuente única

El `ThemeData` global está en `lib/core/theme/app_theme.dart`:

```dart
import 'package:motorsocial/core/theme/app_theme.dart';

// En un widget:
final scheme = Theme.of(context).colorScheme;
// o, si necesitas el ThemeData completo fuera de build:
final theme = appTheme;
```

`MaterialApp` ya lo aplica:
```dart
MaterialApp(
  theme: appTheme,
  darkTheme: appDarkTheme,
  // ...
)
```

### 2.2 Semántica de ColorScheme (M3)

| Rol M3 | Cuándo usar |
|---|---|
| `scheme.primary` | Acciones primarias, indicador seleccionado. |
| `scheme.onPrimary` | Texto/contenido sobre `primary`. |
| `scheme.surface` | Fondo de Scaffold / Card. |
| `scheme.onSurface` | Texto sobre surface. |
| `scheme.onSurfaceVariant` | Texto secundario / subtítulos. |
| `scheme.surfaceContainer` (Low/Medium/High) | Capas (navbar, appbar scrolled, inputs). |
| `scheme.error` | Mensajes de error, estados destructivos no definitivos. |
| `scheme.outline` | Bordes, divisores sutiles. |

**Nunca** escribas `Color(0xFF123456)` ni `Colors.red` / `Colors.blue` en
widgets. Para un color del brand, añádelo como `seedColor` o token en
`app_theme.dart`.

### 2.3 Dark theme

El `appDarkTheme` se construye con `ColorScheme.fromSeed(..., brightness:
Brightness.dark)`. No duplica los valores del tema claro; respeta el
contraste automático. Para pruebas de UI, prueba ambos con
`MaterialApp.themeMode`.

---

## 3. Widgets M3 obligatorios (reemplazos de M2)

| M2 (no usar) | M3 (usar) | Notas |
|---|---|---|
| `RaisedButton` / `ElevatedButton` (acción primaria) | `FilledButton` | Estilos ya centralizados en `appTheme.filledButtonTheme`. |
| `OutlineButton` | `OutlinedButton` | Acción secundaria. |
| `TextButton` | `TextButton` | Acción terciaria / inline. |
| `BottomNavigationBar` + `BottomNavigationBarItem` | `NavigationBar` + `NavigationDestination` | Ver `lib/navigation/shell/social_scaffold.dart`. Usa `selectedIcon` para el estado activo. |
| `FloatingActionButton.extended` | `FloatingActionButton.extended` (M3) | Sin cambios pero usa `scheme.primaryContainer`. |
| `Drawer` + `DrawerHeader` | `Drawer` + `DrawerHeader`/`UserAccountsDrawerHeader` | Respeta `scheme.surface`. |
| `TabBar` (M2) | `TabBar.secondary` o `TabBar` M3 | Indicador automático. |

**Test de cumplimiento**: en `test/widget/login_page_test.dart` ya se
verifica `find.byType(FilledButton)` y `find.byType(ElevatedButton)` =>
`findsNothing`. Replica este patrón para nuevas páginas.

### 3.1 Snippet NavBar M3

```dart
NavigationBar(
  selectedIndex: index,
  onDestinationSelected: (i) => ref.read(bottomIndexProvider.notifier).set(i),
  destinations: [
    NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Inicio'),
    NavigationDestination(icon: Icon(Icons.feed_outlined), selectedIcon: Icon(Icons.feed), label: 'Feed'),
  ],
)
```

---

## 4. Iconos

- Rango de codepoints **`0xe000`–`0xe900`** (Material Icons clásicos).
- Evita los `_outlined` con codepoints en `0xee00+`; usa el par
  `Icons.foo_outlined` (idle) / `Icons.foo` (selected).

---

## 5. Tipografía

- Fuente y escalas: usa los estilos de `Theme.of(context).textTheme`
  (`titleLarge`, `bodyMedium`, `labelLarge`...).
- Estilos socialmente especializados viven en
  `lib/design/widgets/social_text_styles.dart` — preferir reusarlos antes
  de inventar `TextStyle(...)` nuevos.

---

## 6. Forma y elevación

- Radios canónicos: `borderRadius: BorderRadius.circular(12)` (inputs),
  `16` (cards), `20` (botones grandes). Ya aplicados vía
  `appTheme.inputDecorationTheme`, `cardTheme`, `filledButtonTheme`.
- Elevación: en M3 la "elevación" tonal suele sustituir sombras. Usa
  `scheme.surfaceContainerLow/Medium/High` para separar planos, no
  `shadow` manuales.

---

## 7. Accesibilidad

- Contraste: el seed M3 seleccionado cumple WCAG AA en texto relevante.
  Verifícalo al cambiar la paleta.
- Tamaños táctiles Mín. `48x48dp` (los estilos M3 por defecto respetan).
- No informes estado únicamente por color; acompáñalo con icono/texto.

---

## 8. Cómo añadir un nuevo servicio visual

1. Si necesitas un color **nuevo**, define un token en
   `lib/core/theme/app_theme.dart` — nunca inline.
2. Si necesitas un estilo de **texto** nuevo, añádelo a
   `lib/design/widgets/social_text_styles.dart`.
3. Si es un **widget** compuesto reusable, colócalo en el módulo
   correspondiente (`<modulo>/widgets/...`) y consume `Theme.of(context)`.
4. Si ajustas el tema, corre `flutter test` (los widget tests capturan
   regresiones obvias) y revisa en Web `--wasm` y en Windows.

---

## 9. Antipatrones

- `ElevatedButton` para acción primaria → usa `FilledButton`.
- `BottomNavigationBar` → `NavigationBar`.
- `Color(0xFF...)` dentro de widgets.
- `setState` tras `await` sin comprobar `mounted`.
- `Material`/`Scaffold` anidados dentro de Scaffold sin `backgroundColor`
  explícito (te queda gris M2).
- Mezclar temas claro/oscuro manualmente; deja que `ThemeMode` opero.
