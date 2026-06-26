#!/bin/bash

set -e

echo "[1/6] Suppression des anciens paquets..."
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do
    apt remove -y $pkg || true
done

echo "[2/6] Installation des dépendances..."
apt update
apt install -y ca-certificates curl gnupg

echo "[3/6] Ajout du dépôt Docker..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
https://download.docker.com/linux/debian \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
| tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "[4/6] Installation de Docker..."
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[5/6] Configuration..."
mkdir -p /etc/docker

cat > /etc/docker/daemon.json <<EOF
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  },
  "live-restore": true
}
EOF

systemctl restart docker

echo "[6/6] Installation terminée."
docker --version
docker compose version

