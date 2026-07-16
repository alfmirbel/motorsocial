# MotorSocial

Motor genérico de red social, diseñado para reutilizarse en clientes M3.

- Etapa 1: módulos base y contratos.
- Etapa 2: wiring de datos y pruebas.
- Etapa 3: app cliente en `/mnt/pruebamotorsocial`.

## Estado objetivo

`motorsocial` debe compilar en limpio para que `pruebamotorsocial` lo pueda consumir como dependencia local.

## Verificación

```bash
flutter analyze
flutter test
```
