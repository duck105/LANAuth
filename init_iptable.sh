#!/bin/bash

sudo iptables -t nat -A  PREROUTING -i wlx74da38f8c752 -p tcp --dport 80 -j DNAT  --to-destination 10.0.2.15:3000
sudo iptables -t nat -A  PREROUTING -i wlx74da38f8c752 -p tcp --dport 443 -j DNAT  --to-destination 10.0.2.15:3000
sudo iptables -A FORWARD -i wlx74da38f8c752 -p tcp --dport 3000 -d 10.0.2.15 -j ACCEPT
sudo iptables -A FORWARD -i wlx74da38f8c752 -j DROP
