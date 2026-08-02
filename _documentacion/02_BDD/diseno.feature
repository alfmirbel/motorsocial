# language: es
Característica: Diseño y Temas
  Como usuario
  Quiero ver la app en modo claro, oscuro o automático
  Para elegir mi experiencia visual preferida

  Escenario: Aplicación de tema según configuración
    Dado que el usuario abre MotorSocial
    Y la configuración tiene "themeId" con valor "light_default"
    Cuando se construye la pantalla principal
    Entonces el sistema debe activar ThemeMode.system con esquema semilla Material 3
