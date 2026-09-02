# AGENTS.md — motorsocial

Flutter app (Aplicación para registro de calorias y alimentación). Riverpod 3.x + Freezed + Dio.
CouchDB — Flutter connects to CouchDB directly temporally.

## Build & run

```powershell
# All commands need --dart-define-from-file=defines.json for credentials
flutter run -d chrome --wasm --dart-define-from-file=defines.json   # Web dev
flutter run -d windows              --dart-define-from-file=defines.json   # Windows
flutter run                        --dart-define-from-file=defines.json   # Android/iOS
flutter build web --wasm            --dart-define-from-file=defines.json   # Web prod
flutter analyze                                                             # Lint
flutter test                                                                # All tests
dart run build_runner build --delete-conflicting-outputs                    # Codegen (Freezed/Riverpod)
```

- **Always** `--wasm` for web. Web build without it is wrong.
- `defines.json` (in `.gitignore`) has CouchDB creds + Google Maps keys. Access via `const String.fromEnvironment('COUCHDB_PASSWORD')` / `const String.fromEnvironment('GOOGLE_MAPS_API_KEY')` wherever needed.
- `.env` is legacy. Do not use it for secrets.

## Architecture

```
Flutter App → CouchDB (https://citigov.cloud:6984)
```

- Flutter **never** has CouchDB credentials. All DB access goes through the API.
- Backend is in a separate repo (Node.js + Express, `nano` for CouchDB, JWT auth). This repo is Flutter-only.
- Mailer microservice at `server/motorsocial-mailer/` (Node.js, runs on server via pm2 + Apache reverse proxy).

## State management & data layer

- **Riverpod 3.x** with `riverpod_generator` — run `build_runner` after adding/editing providers with annotations. Manual `Notifier`/`NotifierProvider` syntax is also valid (see `lib/core/providers/app_providers.dart`, `lib/navigation/providers/tab_menu_notifier.dart`).
- **Freezed** + `json_serializable** for models — **status: migration in progress.** Generated files `.freezed.dart`/`.g.dart` are NOT yet active because the project uses the Flutter `master` channel (Dart 3.14 dev), whose `analyzer` is incompatible with the `mixin class` syntax that Freezed 3 emits. To enable Freezed: switch to `stable` channel (Dart 3.7+), then annotate models and run `build_runner`. Existing models are manual Dart classes (`copyWith`, `fromJson`/`toJson`).
- **Dio** for HTTP with JWT interceptor (auto-attaches token). See `lib/core/database/dio_client.dart` (`JwtInterceptor`, `TokenStorage` with platform-aware fallback) and `lib/core/providers/dio_provider.dart` (`dioProvider`).
- JWT storage: `flutter_secure_storage` on iOS/Android, `shared_preferences` on Web/Windows. Resolved via `defaultTokenStorage(SharedPreferences)`.

### Code generation

```powershell
dart run build_runner build --delete-conflicting-outputs
```

Run after editing Freezed models or Riverpod provider annotations.

## Navigation

- `AppRouter.routeGenerate(RouteSettings)` used as `onGenerateRoute` in `MaterialApp` (`lib/navigation/routing/app_router.dart`).
- Routes via name (`Navigator.pushReplacementNamed`); **No GoRouter**, no Navigator 2.0, no `routes_parameters.dart`.
- Access guard: `RouteGuard.canAccess()` in `lib/navigation/routing/route_guard.dart` reads `sessionProvider` from the nearest `ProviderScope`.
- `usePathUrlStrategy()` active in `lib/main.dart` — clean URLs on Web (Flutter API renamed from old `setPathUrlStrategy()`).

## Critical code rules

1. **`if (!mounted) return;`** — required after **every `await`** in StatefulWidget code that updates UI.
2. **No hardcoded colors** — always use the global `appTheme` `ColorScheme` from `lib/core/theme/app_theme.dart` (access via `Theme.of(context).colorScheme`). Read `_documentacion/antigravity_ui_rules.md` before any UI work.
3. M3 widgets: `NavigationBar` (not `BottomNavigationBar`), `FilledButton` (not `ElevatedButton` / `RaisedButton`).
4. Icon codepoints must be in range `0xe000`–`0xe900` — avoid `_outlined` variants in `0xee00+`.
5. Views are dumb — no business logic in widgets. Use Riverpod notifiers.
6. Split `lib/` by feature module (`identity`, `catalog`, `activity`, `social_graph`, `media`, `design`, `navigation`, `resilience`, `location`, `features`). Don't reintroduce the old `lib/core_backend_services/` or duplicated `lib/motorsocial/` / `lib/catalog/catalog/` trees.

## SSH (server 190.92.151.34:7822)

- **PowerShell only** — Bash cannot access Windows ssh-agent. The key has a passphrase.
- Aliases: `miservidor` (user `deploy`), `miservidor-root` (user `root`).
- Each session: `Start-Service ssh-agent; ssh-add $env:USERPROFILE\.ssh\id_ed25519`
- Verify: `ssh miservidor "echo ok"`
- Config in `~/.ssh/config` (both aliases, port 7822, key `~/.ssh/id_ed25519`).

## CouchDB conventions

- DB names: `motorsocial_*` (e.g. `motorsocial_usuarios`, `motorsocial_alimentos`, `motorsocial_log_calorias`, `motorsocial_perfil_nutricional`).
- Doc IDs: semantic prefix + UUID (`user:uuid`, `propiedad:uuid`, `mensaje:uuid`, `grupo:uuid`).
- Prefer Mango queries over MapReduce.

## Tests

- Unit tests: `test/unit/**` (e.g. `activity_repository_test.dart`, `sync_repository_test.dart`).
- Widget tests: `test/widget/**` (e.g. `login_page_test.dart`).
- Run all with `flutter test`; CI runs `flutter analyze` + `flutter test --dart-define-from-file=defines.json` (workflow `.github/workflows/ci.yml`).
- No integration test infrastructure.

## Reference docs (in-repo)

- `_documentacion/antigravity_ui_rules.md` — M3 UI rules. Mandatory read before any UI change.

---

## Servidor remoto

- **Alias SSH proyecto**: miservidor (usuario: deploy)
- **Alias SSH admin**: miservidor-root (usuario: root)
- **IP**: 190.92.151.34
- **Puerto SSH**: 7822
- **OS**: Linux 5.4.0 (server.citigov.site)
- **Hosting**: No administrado (requiere root para instalar/administrar)
- **Recursos**: RAM 1 GB, Disco 20 GB (18% usado)

### Configuración ~/.ssh/config (Windows)

```
Host miservidor
    HostName 190.92.151.34
    User deploy
    Port 7822
    IdentityFile ~/.ssh/id_ed25519

Host miservidor-root
    HostName 190.92.151.34
    User root
    Port 7822
    IdentityFile ~/.ssh/id_ed25519

```

### ssh-agent (ejecutar al inicio de cada sesión de trabajo)

```powershell
Start-Service ssh-agent
ssh-add $env:USERPROFILE\.ssh\id_ed25519
```

> **IMPORTANTE — Claude Code**: usar siempre **PowerShell** (no Bash) para comandos SSH.
> El Bash tool no puede acceder al ssh-agent de Windows. La llave tiene passphrase,
> por lo que debe estar cargada en el agente antes de ejecutar cualquier comando remoto.

---

## CouchDB

- **URL**: https://citigov.cloud:6984
- **Usuario**: admin
- **Password**: (en `defines.json` como `COUCHDB_PASSWORD` — nunca en este archivo; añadido a `.gitignore`).
