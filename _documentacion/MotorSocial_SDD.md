# MotorSocial — SDD Inicial Consolidado

## 1. Alcance
Consolida la ingeniería de reversa del código en `/mnt/motorsocial/lib` con foco en requerimientos funcionales, contratos, estado reactivo, UI mínima y módulos previstos.

## 2. Directorios/Features cubiertos
- `lib/activity`
- `lib/catalog`
- `lib/design`
- `lib/identity`
- `lib/location`
- `lib/media`
- `lib/navigation`
- `lib/resilience`
- `lib/security`
- `lib/social_graph`

## 3. Mapa de contratos clave y ruta

| Feature | Contrato | Ruta | Proveedores / Núcleo | UI representativa |
|---------|----------|------|----------------------|-------------------|
| Activity | `ActivityQuery`, `SocialActivity`, `ActivityContract` | `lib/activity/data_models/activity_contract.dart` | `FeedState`/`FeedNotifier`, `ConversationState`, `ReactionState`, `ActivityEngine`, `ActivityRepository` | `ActivityFeedPage`, `ConversationPage`, `SocialActivityTile` |
| Catalog | `CatalogContract`, `SocialObject`, `SocialObjectQuery`, `SocialObjectPage` | `lib/catalog/data_models/catalog_contract.dart` | `CatalogState`, `ObjectDetailNotifier`, `ExportState`, `CatalogEngine`, `CatalogRepository` | `CatalogListPage`, `ObjectDetailPage` |
| Design | `DesignToken`, `ThemeState`, `SocialThemeData`, `ThemeTokenSet` | `lib/design/data_models/design_token.dart` | `ThemeNotifier`, `DesignEngine`, `ThemeRepository` | `ThemeSettingsPage`, `AdaptiveLayout` |
| Identity | `AuthState`, `SocialUser`, `RoleProfile`, `SessionData`, `AccountInfo`, `AuthEvent`, `SocialIdentityContract` | `lib/identity/data_models/identity_models.dart` | `AuthStateNotifier`, `SessionRepository`, `LocalSessionRepository`, `SocialIdentityEngine`, `AuthRepository` | `LoginPage`, `RegisterPage`, `PasswordRecoveryPage` |
| Location | `LocationContract`, `SocialPlace`, `PostalCodeLookupResult`, `LocalityEntry` | `lib/location/data_models/location_contract.dart` | `LocationState`, `LocationEngine`, `GeolocationRepository`, `PostalCodeRepository` | `LocalityPickerPage` |
| Media | `MediaContract`, `SocialMediaAsset` | `lib/media/data_models/social_media_asset.dart` | `MediaLibraryState`, `AlbumOrderState`, `MediaEngine`, `MediaRepository` | `MediaLibraryPage`, `MediaSelectorPage`, `MediaSlideshowPage`, `MediaAssetBuilder`, `MediaThumbGrid`, `MediaSlider` |
| Navigation | `SocialMenuItem`, `NavigationContract` | `lib/navigation/data_models/menu_item.dart` | `TabMenuState`, `TabMenuNotifier`, `SocialRouter`, `SocialScaffold` | — |
| Resilience | `ConnectionStatus`, `PlatformInfo`, `SyncState` | `lib/resilience/data_models/connection_status.dart` | `ConnectionNotifier`, `PlatformNotifier`, `SyncNotifier`, `ResilienceEngine`, `ConnectivityRepository`, `PlatformRepository`, `SyncRepository` | — |
| Security | `RateLimitState`, `DeviceInfo` | `lib/security/data_models/rate_limit_state.dart` | `RateLimitProvider`, `SecurityNotifier`, `SecurityEngine`, `SecurityRepository` | — |
| SocialGraph | `SocialGroup`, `SocialRelationship`, `Invitation` | `lib/social_graph/data_models/social_group.dart` | `GroupNotifier`, `InvitationNotifier`, `SocialQuery`, `SocialGraphEngine`, `SocialGraphRepository` | `ContactsPage`, `GroupPages`, `InvitationsPage`, `SocialTiles` |

## 4. Estructura modular
Cada feature sigue el patrón:
```
<feature>
├── <feature>.dart            # barrel export
├── data_models/              # contratos y entidades
├── engine/                   # Application Service / orquestación
├── repositories/             # interfaces + impls
├── providers/                # Riverpod Notifier/State
├── pages/                    # UI representativa
└── widgets/                  # componentes reutilizables (si aplica)
```

## 5. Arquitectura transversal
- `main.dart`: app ejecutable mínima con Material3.
- Repositorios abstractos en cada feature; pruebas ofrecen `InMemory*` dentro del módulo correspondiente.
- Backends externos previstos en `lib/core/database`: CouchDB y Qdrant.

## 6. Requisitos funcionales consolidados

| ID | Requisito | Feature | Evidencia |
|-----|-----------|---------|-----------|
| RF-ACT-01 | Consultar feed reciente por actor y límite. | Activity | `ActivityQuery`, `recentFeed`, `ActivityRepository`, `FeedState` |
| RF-ACT-02 | Crear y eliminar actividad. | Activity | `create`, `delete` en `ActivityRepository` |
| RF-ACT-03 | Leer actividad por id. | Activity | `getById` |
| RF-ACT-04 | Presentar listado tipo feed. | Activity | `ActivityFeedPage`, `SocialActivityTile` |
| RF-ACT-05 | Presentar conversación con envío de mensajes. | Activity | `ConversationPage`, `ConversationProvider` |
| RF-ACT-06 | Toggle reacciones. | Activity | `ReactionState`, `ReactionNotifier` |
| RF-CAT-01 | Proveer catálogo paginado con filtros básicos. | Catalog | `SocialObjectQuery`, `SocialObjectPage`, `CatalogListPage` |
| RF-CAT-02 | Permitir detalle por objeto. | Catalog | `ObjectDetailPage`, `objectDetailProvider` |
| RF-CAT-03 | Soportar búsqueda y exportación PDF declarativa. | Catalog | `enableSearch`, `enablePdfExport`, `ExportState` |
| RF-CAT-04 | CTA configurable por proveedor. | Catalog | `primaryCtaLabel` |
| RF-DES-01 | Administrar tema actual por identificador. | Design | `ThemeState.themeId`, `ThemeNotifier`, `themeProvider` |
| RF-DES-02 | Exponer tokens agrupados por categoría. | Design | `DesignToken.category`, `ThemeTokenSet` |
| RF-DES-03 | Aplicar tema Material coherente. | Design | `SocialThemeData.themeData` |
| RF-DES-04 | Permitir layout adaptativo. | Design | `AdaptiveLayout` |
| RF-ID-01 | Soportar inicio de sesión, registro y recuperación. | Identity | `AuthRepository.signIn`, `register`, `recoverPassword` |
| RF-ID-02 | Persistir/cachear sesión localmente. | Identity | `SessionRepository`, `LocalSessionRepository` |
| RF-ID-03 | Modelar usuario y roles con permisos. | Identity | `SocialUser`, `RoleProfile.hasPermission` |
| RF-ID-04 | Configurar comportamiento de identidad por contrato. | Identity | `SocialIdentityContract` |
| RF-LOC-01 | Obtener ubicación actual del dispositivo. | Location | `getLocation`, `currentPlace` |
| RF-LOC-02 | Buscar localidades por código postal. | Location | `PostalCodeRepository.lookup`, `LocalityEntry` |
| RF-LOC-03 | Permitir habilitar/deshabilitar capacidades. | Location | `enableGeolocation`, `enablePostalCode` |
| RF-LOC-04 | Seleccionar localidad en UI. | Location | `LocalityPickerPage` |
| RF-MED-01 | Listar media del usuario. | Media | `byOwner`, `MediaLibraryPage` |
| RF-MED-02 | Subir y eliminar assets. | Media | `upload`, `delete` |
| RF-MED-03 | Visualizar assets en slideshow. | Media | `MediaSlideshowPage` |
| RF-MED-04 | Ordenar álbumes. | Media | `AlbumOrderState`, `albumOrderProvider` |
| RF-NAV-01 | Proveer menú configurable por tabs. | Navigation | `MenuItem`, `TabMenuNotifier` |
| RF-NAV-02 | Enrutar páginas declaradas. | Navigation | `AppRouter` / `SocialRouter` |
| RF-NAV-03 | Shell común para vistas sociales. | Navigation | `SocialScaffold` |
| RF-RES-01 | Detectar cambios de conectividad. | Resilience | `ConnectionNotifier`, `ConnectivityRepository` |
| RF-RES-02 | Coordinar sincronización de datos. | Resilience | `SyncRepository`, `SyncNotifier` |
| RF-RES-03 | Ajustar comportamiento por plataforma. | Resilience | `PlatformRepository`, `PlatformNotifier` |
| RF-SEC-01 | Limitar frecuencia de peticiones. | Security | `RateLimitState`, `RateLimitProvider` |
| RF-SEC-02 | Exponer información de dispositivo para políticas. | Security | `DeviceInfo`, `SecurityRepository` |
| RF-SEC-03 | Notificar eventos y estado de seguridad. | Security | `SecurityNotifier` |
| RF-SOC-01 | Gestionar relaciones entre usuarios. | SocialGraph | `SocialRelationship` |
| RF-SOC-02 | Administrar grupos y membresías. | SocialGraph | `SocialGroup`, `GroupPages`, `GroupNotifier` |
| RF-SOC-03 | Manejar invitaciones. | SocialGraph | `Invitation`, `InvitationsPage`, `InvitationNotifier` |
| RF-SOC-04 | Consultar grafos sociales. | SocialGraph | `SocialGraphRepository`, `SocialQuery` |

## 7. Referencias
- Documentos por feature: `sdd_motorsocial_<feature>.md` en `/mnt/motorsocial/_documentacion`.
- Arquitectura: `arquitectura_motorsocial.md`.
- Índice: `indice_sdd.md`.
