# Installation Proxmox VE

## Objectif

Créer une plateforme DevOps basée sur Proxmox et des conteneurs LXC.

---

## Hyperviseur

- VMware Workstation Pro
- Proxmox VE 9
- Debian Trixie

---

## Ressources

| Ressource | Valeur |
|-----------|--------|
| CPU | 6 vCPU |
| RAM | 20 Go |
| Stockage | 150 Go |

---

## Réseau

### vmbr0

Réseau de management

IP :

192.168.1.15/24

Gateway :

192.168.1.254

---

### vmbr1

Réseau interne DevOps

IP :

10.10.10.1/24

---

## Docker Host

Hostname :

docker

IP :

10.10.20.10

---

## NAT

Configuration réalisée :

```bash
iptables -t nat -A POSTROUTING -s 10.10.10.0/24 -o vmbr0 -j MASQUERADE

iptables -A FORWARD -i vmbr1 -o vmbr0 -j ACCEPT

iptables -A FORWARD -i vmbr0 -o vmbr1 -m state --state RELATED,ESTABLISHED -j ACCEPT
```

---

## Validation

Tests effectués :

- Ping 1.1.1.1 
- Ping google.com 

