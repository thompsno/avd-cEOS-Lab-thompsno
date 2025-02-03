#!/bin/bash


CMD1='cat /etc/hostname; \
sudo vconfig add team0 110; \
sudo ifconfig team0.110 10.1.10.201 netmask 255.255.255.0;\
sudo ip link set up team0.110; \
sudo ip route add 10.1.0.0/16 via 10.1.10.1 dev team0.110; \
sudo ifconfig team0.110; \
sudo route -n
'

CMD2='cat /etc/hostname; \
sudo vconfig add team0 111; \
sudo ifconfig team0.111 10.1.11.202 netmask 255.255.255.0; \
sudo ip link set up team0.111; \
sudo ip route add 10.1.0.0/16 via 10.1.11.1 dev team0.111; \
sudo ifconfig team0.111; \
sudo route -n'

CMD3='cat /etc/hostname; \
sudo vconfig add team0 112; \
sudo ifconfig team0.112 10.1.12.203 netmask 255.255.255.0; \
sudo ip link set up team0.112; \
sudo ip route add 10.1.0.0/16 via 10.1.12.1 dev team0.112; \
sudo ifconfig team0.112; \
sudo route -n
'

CMD4='cat /etc/hostname; \
sudo vconfig add team0 113; \
sudo ifconfig team0.113 10.1.13.204 netmask 255.255.255.0; \
sudo ip link set up team0.113; \
sudo ip route add 10.1.0.0/16 via 10.1.13.1 dev team0.113; \
sudo ifconfig team0.113; \
sudo route -n'

echo "[INFO] Configuring clab-evpnmultidomain-dc2-client1"
docker exec -it  clab-evpnmultidomain-dc2-client1 /bin/sh -c "$CMD1"

echo "[INFO] Configuring clab-evpnmultidomain-dc2-client2"
docker exec -it  clab-evpnmultidomain-dc2-client2 /bin/sh -c "$CMD2"

echo "[INFO] Configuring clab-evpnmultidomain-dc2-client3"
docker exec -it  clab-evpnmultidomain-dc2-client3 /bin/sh -c "$CMD3"

echo "[INFO] Configuring clab-evpnmultidomain-dc2-client4"
docker exec -it  clab-evpnmultidomain-dc2-client4 /bin/sh -c "$CMD4"

echo "[INFO] Completed"

echo "Use [ docker exec -it clab-evpnmultidomain-dc2-client<x> /bin/sh ] to login in host."