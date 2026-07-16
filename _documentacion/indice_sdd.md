# Índice de Documentos SDD — MotorSocial

## 1. Resumen
Este índice vincula cada feature del MotorSocial con su documento SDD, la ruta de código fuente y la sección de arquitectura relacionada.

## 2. Mapa de features y documentos

| Feature | Ruta de código | Documento SDD | Arquitectura relacionada |
|---------|-----------------|---------------|--------------------------|
| Activity | `lib/activity` | [`sdd_motorsocial_activity.md`](sdd_motorsocial_activity.md) | Sección modularidad, estado global |
| Catalog | `lib/catalog` | [`sdd_motorsocial_catalog.md`](sdd_motorsocial_catalog.md) | Sección contratos JSON, backends externos |
| Design | `lib/design` | [`sdd_motorsocial_design.md`](sdd_motorsocial_design.md) | Sección Theme |
| Identity | `lib/identity` | [`sdd_motorsocial_identity.md`](sdd_motorsocial_identity.md) | Sección configurabilidad |
| Location | `lib/location` | [`sdd_motorsocial_location.md`](sdd_motorsocial_location.md) | Sección persistencia/configurable |
| Media | `lib/media` | [`sdd_motorsocial_media.md`](sdd_motorsocial_media.md) | Sección módulos/madurez |
| Navigation | `lib/navigation` | [`sdd_motorsocial_navigation.md`](sdd_motorsocial_navigation.md) | Sección navegación y shell |
| Resilience | `lib/resilience` | [`sdd_motorsocial_resilience.md`](sdd_motorsocial_resilience.md) | Sección backends externos, conectividad |
| Security | `lib/security` | [`sdd_motorsocial_security.md`](sdd_motorsocial_security.md) | Sección módulos/madurez |
| SocialGraph | `lib/social_graph` | [`sdd_motorsocial_social_graph.md`](sdd_motorsocial_social_graph.md) | Sección modularidad, estado global |

## 3. Documentos adjuntos
- Arquitectura general: [`arquitectura_motorsocial.md`](arquitectura_motorsocial.md)
- SDD inicial consolidado: [`MotorSocial_SDD.md`](MotorSocial_SDD.md)

## 4. Convenciones
- IDs funcionales por feature empiezan con `RF-ACT-*`, `RF-CAT-*`, etc.
- Extensiones de implementación real referencian los contratos de `lib/core/config/social_app_config.dart` y contratos JSON.
- Módulos deben mantener barrel export `<feature>.dart` para facilitar consumo.

## 5. Cobertura
Cubre las 10 features detectadas por directorio en `lib` y sus subdirectorios. Documentos generados en `/mnt/motorsocial/_documentacion`.
