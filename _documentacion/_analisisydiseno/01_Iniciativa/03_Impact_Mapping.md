# Impact Mapping — Iniciativa MotorSocial

**Metodología:** Impact Mapping (Iniciativa → Actores → Impactos → Entregables)
**Fecha:** 2026-08-13

## Iniciativa (Objetivo de negocio)
> Construir un motor de red social reutilizable y desplegable sobre CouchDB que permita a organizaciones y comunidades lanzar redes sociales verticales (profesionales, vecinales, empresariales) sin desarrollar desde cero la infraestructura base de autenticación, catálogo, feed, contactos y multimedia. En su despliegue vertical inicial, MotorSocial se aplica al registro de calorías y alimentación.

## Actores
| Actor | Descripción |
|---|---|
| Usuario final | Persona que se registra, gestiona su perfil y consume el feed/catálogo |
| Negocio / Comercio | Entidad que publica catálogo y desea exposición social |
| Administrador de la red vertical | Operador que despliega y configura la instancia MotorSocial |
| Sistema (backend) | API Node.js + CouchDB + microservicio mailer |

## Impactos (cambios de comportamiento esperados por actor)
| Actor | Impacto esperado |
|---|---|
| Usuario final | Se registra y mantiene una identidad única; interactúa en el feed; descubre catálogo; se conecta con otros usuarios |
| Negocio | Publica y mantiene su catálogo; recibe interacciones medibles |
| Administrador | Despliega nuevas verticales reutilizando los módulos del motor sin reescribir infraestructura |
| Sistema | Persiste todo en CouchDB con doc IDs semánticos y repositorios testeables |

## Entregables (Epics / Features)
| Impacto | Entregable (Épica / Módulo) |
|---|---|
| Registro e identidad | Identity (auth, perfil, sesión) — E1 |
| Catálogo de objetos sociales | Catalog — E2 |
| Feed y conversaciones | Activity — E3 |
| Conexiones y grafo | Social Graph — E4 |
| Multimedia | Media — E5 |
| Ubicación | Location — E6 |
| Personalización M3 | Design — E7 |
| Navegación y experiencia | Navigation / Features — E8 |
| Sincronización y resiliencia | Resilience — E9 |
| Seguridad | Security — E10 |
| Infraestructura | Core / Providers — E11 |

## Referencias
- OKRs: `01_OKRs.md`
- Lean Canvas: `02_LeanCanvas.md`
- Épicas detalladas: `../<módulo>/02_Epicas_EARS.md`
