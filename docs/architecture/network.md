# Architecture réseau

## Schéma

```text
                           Internet
                               │
                      Box / Routeur
                     192.168.1.254
                               │
                    vmbr0 (Management)
                     192.168.1.15/24
                               │
                     ┌────────────────┐
                     │  Proxmox VE 9  │
                     └────────────────┘
                               │
                     vmbr1 (Lab DevOps)
                      10.10.10.1/24
                               │
                    ┌────────────────┐
                    │ CT102 - Docker │
                    │ 10.10.20.10    │
                    └────────────────┘
```

## Description

- **vmbr0** : réseau de management de Proxmox.
- **vmbr1** : réseau privé utilisé par les conteneurs LXC.
- Le trafic des conteneurs est routé via Proxmox grâce à **IP Forwarding** et au **NAT (MASQUERADE)**.
