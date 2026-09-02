# language: es
Característica: Gestión de Temas y Tokens de Diseño
  Como plataforma
  Quiero gestionar temas (light/dark) y tokens de diseño centralizados
  Para aplicar Material Design 3 de forma consistente en toda la app

  Escenario: Cargar un tema por id
    Dado un `ThemeRepository` configurado
    Y un `themeId: "light_default"`
    Cuando se invoca `loadTheme("light_default")`
    Entonces el sistema debe devolver un `ThemeTokenSet`
    Y `tokens` debe contener los `DesignToken` del tema

  Escenario: Estado inicial del tema
    Dado el `ThemeNotifier` recién creado
    Cuando se invoca `build()`
    Entonces el sistema debe retornar el estado inicial `void` (sin estado propio)

  Escenario: Bootstrap del motor de diseño
    Dado un `DesignEngine` con un `ThemeRepository`
    Cuando se invoca `initialize()`
    Entonces el sistema debe preparar el bootstrap del dominio (no-op actual)

---

Característica: Datos de Tema y Aplicación M3
  Como desarrollador
  Quiero un `SocialThemeData` que envuelva `ThemeData` de Material
  Para aplicar M3 con un `themeId` y `mode` consistentes

  Escenario: Construir SocialThemeData light
    Dado un `ThemeData` para modo claro
    Cuando se construye `SocialThemeData(themeData: td, themeId: "light_default")`
    Entonces el sistema debe asociar `mode: "light"` por defecto

  Escenario: Construir SocialThemeData dark
    Dado un `ThemeData` para modo oscuro
    Cuando se construye `SocialThemeData(themeData: td, themeId: "dark_default", mode: "dark")`
    Entonces el sistema debe asociar `mode: "dark"`

---

Característica: Configuración de Tema y Layout Adaptativo
  Como usuario
  Quiero ajustar el tema desde una pantalla de configuración y que el layout se adapte al tamaño de pantalla
  Para personalizar y consumir la app cómodamente

  Escenario: Pantalla de ajustes de tema
    Dado el módulo de diseño inicializado
    Cuando se navega a `ThemeSettingsPage`
    Entonces el sistema debe mostrar un `Scaffold` con AppBar "Tema"
    Y el cuerpo debe mostrar "Theme settings"

  Escenario: Layout adaptativo renderiza el body
    Dado un `AdaptiveLayout` con un `body` válido
    Cuando se construye
    Entonces el sistema debe renderizar el `body` (sin adaptar en la implementación actual)

  Escenario: Layout adaptativo requiere body
    Dado la firma de `AdaptiveLayout`
    Cuando se construye sin `body`
    Entonces el sistema debe generar un error de compilación (`body` es req)
