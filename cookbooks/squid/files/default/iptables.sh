#!/bin/bash
service iptables start
iptables -F
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 3128
service iptables save
service iptables restart
