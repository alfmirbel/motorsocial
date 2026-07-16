# SDD — Feature: Security

## 1. Resumen
Administra rate limiting y seguridad operativa del dispositivo dentro del MotorSocial.

## 2. Modelos
- `RateLimitState`.
- `DeviceInfo`.

## 3. Proveedores / Motor / Repositorio
- `RateLimitProvider`.
- `SecurityNotifier`.
- `SecurityEngine`.
- `SecurityRepository`.

## 4. Requisitos
| ID | Requisito | Evidencia |
|-----|-----------|-----------|
| RF-SEC-01 | Limitar frecuencia de peticiones. | `RateLimitState`, `RateLimitProvider`. |
| RF-SEC-02 | Exponer información de dispositivo para políticas. | `DeviceInfo`, `SecurityRepository`. |
| RF-SEC-03 | Notificar eventos y estado de seguridad. | `SecurityNotifier`. |
