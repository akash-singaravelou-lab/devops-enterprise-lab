#!/bin/bash

echo "===== IP Forward ====="
sysctl net.ipv4.ip_forward

echo
echo "===== NAT ====="
iptables -t nat -L -n -v

echo
echo "===== Forward ====="
iptables -L FORWARD -n -v

