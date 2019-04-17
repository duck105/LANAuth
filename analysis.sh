#!/bin/bash

ip=$1
sudo iptables -L -v -x | grep $ip | awk {'print $2'} | awk '{s+=$1} END {print s}' | numfmt --to=si


