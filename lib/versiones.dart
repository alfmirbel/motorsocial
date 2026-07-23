class AppVersion {
  final String version; // Formato x.y.z
  final String titulo; // Resumen corto
  final DateTime fecha; // Fecha del cambio
  final List<String> cambios; // Detalle de cambios
  final bool esCritica; // Marcar si es crítica

  const AppVersion({
    required this.version,
    required this.titulo,
    required this.fecha,
    required this.cambios,
    this.esCritica = false,
  });
}

final List<AppVersion> historialDeVersiones = [
  AppVersion(
    version: "0.1.1",
    titulo: "CI, CouchDB, Qdrant y control de cambios Git",
    fecha: DateTime(2026, 07, 23),
    esCritica: false,
    cambios: [
      "Se agrega workflow CI en GitHub Actions con flutter analyze y dart format.",
      "Se validan y corrigen URLs de CouchDB y Qdrant en contratos y repositorios Dart.",
      "Se crean las 10 bases CouchDB de MotorSocial.",
      "Se crean los design docs y se validan consultas _view por base.",
      "Inicializado Git en ambos proyectos y commits/changesets sincronizados.",
    ],
  ),
  AppVersion(
    version: "0.1.0",
    titulo: "Inicialización del control de versiones de MotorSocial",
    fecha: DateTime(2026, 07, 23),
    esCritica: false,
    cambios: [
      "Se crea versiones.dart en prueba y producción para trazabilidad de cambios.",
      "Se registra inicialmente la configuración de CouchDB y Qdrant, design docs y URLs.",
    ],
  ),
];
