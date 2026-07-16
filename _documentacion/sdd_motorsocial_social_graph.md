# SDD — Feature: SocialGraph

## 1. Resumen
Representa relaciones sociales, grupos e invitaciones reflejando grafos de contacto, pertenencia y mensajería ligera.

## 2. Modelos
- `SocialRelationship`.
- `SocialGroup`.
- `Invitation`.

## 3. Repositorio / Motor
- `SocialGraphRepository`.
- `SocialGraphEngine`.

## 4. Proveedores / UI
- `GroupNotifier`, `InvitationNotifier`, `SocialQuery`.
- `ContactsPage`, `GroupPages`, `InvitationsPage`.
- `SocialTiles`.

## 5. Requisitos
| ID | Requisito | Evidencia |
|-----|-----------|-----------|
| RF-SOC-01 | Gestionar relaciones entre usuarios. | `SocialRelationship`. |
| RF-SOC-02 | Administrar grupos y membresías. | `SocialGroup`, `GroupPages`, `GroupNotifier`. |
| RF-SOC-03 | Manejar invitaciones. | `Invitation`, `InvitationsPage`, `InvitationNotifier`. |
| RF-SOC-04 | Consultar grafos sociales. | `SocialGraphRepository`, `SocialQuery`. |
