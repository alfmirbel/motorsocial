# Arquitectura General — Motor Social

## 1. Propósito
Motor Social es la capa de orquestación y distribución de contenido
para los perfiles Hermes y el ecosistema asociado: publicación,
sincronización, monitoreo, respaldo y automatización.

## 2. Componentes principales
- **Hermes Agent (profiles)**: `motorsocial`, `buscobien`, `comosano`,
  `asistenteam`, `monitoreo`, `broktool`, `citigov`.
- **Gateway**: `systemd --user`, puerto API `8642` por perfil.
- **Telegram**: canal primario de interacción y entrega.
- **Repos / montajes**: `/mnt/motorsocial`, `/mnt/pruebamotorsocial`.
- **Workspace web**: dashboard en `9119`, stack Vite en `/home/personal/hermes-workspace`.
- **Servicios remotos por ssh_tunnel**: n8n, Flowise, Ollama.
- **CI/CD**: GitHub + `hermes-github-backer`.

## 3. Flujo de publicación
1. Entrada por Telegram o skill/cron.
2. Ejecución por skill/cronjob.
3. Persistencia en `/mnt/motorsocial`.
4. Distribución por gateway y delivery Telegram.

## 4. Stack operativo
- Host: Linux, Python 3.11, venv Hermes 0.21.0.
- Datos: state.db SQLite/WAL por perfil.
- Infra: systemd user, sshfs, Node/Vite, Docker disponible.

## 5. Consideraciones actuales
- Gateway de `motorsocial` debe reiniciarse fuera del proceso.
- Telegram suele degradar por IPv6; usa IPv4 sticky fallback.
- Mantener `npm audit` limpio en `hermes-agent/web`.
