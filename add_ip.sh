#!/bin/bash

source=$1
destination="10.0.2.15"
echo "source ip: $source"
sudo iptables -t nat -I PREROUTING 1 -s $source -j ACCEPT
sudo iptables -t nat -I PREROUTING 1 -d $source -j ACCEPT
sudo iptables -I FORWARD -s $source -j ACCEPT
sudo iptables -I FORWARD -d $source -j ACCEPT
