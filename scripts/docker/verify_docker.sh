#!/bin/bash

echo "===== Docker Version ====="
docker --version

echo
echo "===== Docker Compose ====="
docker compose version

echo
echo "===== Docker Info ====="
docker info

echo
echo "===== Running Containers ====="
docker ps

echo
echo "===== All Containers ====="
docker ps -a

echo
echo "===== Images ====="
docker images

echo
echo "===== Networks ====="
docker network ls

echo
echo "===== Volumes ====="
docker volume ls

