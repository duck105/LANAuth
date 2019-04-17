#!/bin/bash

source=$1
echo "source ip: $source"
sudo iptables -t nat -D PREROUTING  -s $source -j ACCEPT
sudo iptables -t nat -D PREROUTING  -d $source -j ACCEPT
sudo iptables -D FORWARD -s $source -j ACCEPT
sudo iptables -D FORWARD -d $source -j ACCEPT
