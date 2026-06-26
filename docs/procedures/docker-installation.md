# Installation Docker Engine

## Objectif

Installer Docker Engine Community sur un conteneur Debian 12 afin d'héberger les futurs services DevOps.

---

## Environnement

| Élément | Valeur |
|---------|--------|
| Hyperviseur | Proxmox VE |
| Conteneur | CT102 |
| OS | Debian 12 Bookworm |
| IP | 10.10.10.20 |

---

## Étapes réalisées

- Mise à jour du système
- Installation des dépendances
- Ajout du dépôt officiel Docker
- Installation de Docker Engine
- Installation de Docker Compose
- Configuration de `daemon.json`
- Vérification du service Docker
- Déploiement d'un conteneur Nginx
- Validation depuis Windows

---

## Validation

### Vérification Docker

```bash
docker --version
docker compose version
docker info
```

### Déploiement Nginx

```bash
docker run -d --name nginx-test -p 8080:80 nginx:latest
```

### Vérification

```bash
docker ps
curl http://localhost:8080
```

### Validation depuis Windows

```powershell
route add 10.10.10.0 mask 255.255.255.0 192.168.1.15
Test-NetConnection 10.10.10.20 -Port 8080
```

Résultat :

- Docker fonctionnel
- Nginx accessible
- Communication Windows → Docker validée

