#!/bin/bash

set -e

echo "========================================"
echo " DevOps Enterprise Lab"
echo " Enable NAT for LXC Containers"
echo "========================================"

echo "[1/4] Enable IP Forwarding"

cat > /etc/sysctl.d/99-ipforward.conf << EOF
net.ipv4.ip_forward=1
EOF

sysctl --system

echo "[2/4] Configure NAT"

iptables -t nat -A POSTROUTING \
-s 10.10.10.0/24 \
-o vmbr0 \
-j MASQUERADE

echo "[3/4] Configure Forward"

iptables -A FORWARD \
-i vmbr1 \
-o vmbr0 \
-j ACCEPT

iptables -A FORWARD \
-i vmbr0 \
-o vmbr1 \
-m state \
--state RELATED,ESTABLISHED \
-j ACCEPT

echo "[4/4] Save rules"

netfilter-persistent save

echo
echo "NAT configured successfully."

