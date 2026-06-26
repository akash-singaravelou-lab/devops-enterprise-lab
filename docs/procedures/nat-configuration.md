# Configuration NAT Proxmox

## Objectif

Permettre aux conteneurs LXC du réseau privé d'accéder à Internet.

---

## Topologie

```text
Internet
      │
vmbr0
192.168.1.15
      │
Proxmox
      │
vmbr1
10.10.10.1
      │
LXC
10.10.10.20
```

---

## Activation de l'IP Forwarding

```bash
sysctl net.ipv4.ip_forward
```

---

## Configuration du NAT

```bash
iptables -t nat -A POSTROUTING -s 10.10.10.0/24 -o vmbr0 -j MASQUERADE
```

---

## Configuration du Forward

```bash
iptables -A FORWARD -i vmbr1 -o vmbr0 -j ACCEPT

iptables -A FORWARD -i vmbr0 -o vmbr1 -m state --state RELATED,ESTABLISHED -j ACCEPT
```

---

## Sauvegarde

```bash
netfilter-persistent save
```

---

## Vérification

```bash
ping 1.1.1.1
ping google.com
```

Résultat attendu :

- ✅ Internet
- ✅ DNS

## Validation

![Validation réseau](../../screenshots/01-proxmox/02-lxc-internet-success.png)

