#!/bin/bash
#Begin starting script here. 
echo "------------------------------"
echo "IPv4 Tables:"
echo "------------------------------"
sudo iptables -L --line-numbers
echo "------------------------------"
echo
echo "IPv6 Tables:"
echo "------------------------------"
sudo ip6tables -L --line-numbers 
echo "------------------------------"
echo
echo "------------------------------"
echo "Running Services"
echo "------------------------------"
service --status-all | grep -v "-"
echo "------------------------------"
echo
echo "Disk Space"
echo "------------------------------"
df -h /
echo "------------------------------"
echo 
echo "Connected Users"
echo "------------------------------"
finger
echo "------------------------------"
echo 
echo "Connected Sockets."
echo "------------------------------"
ss -r | grep -v "\*"
echo "------------------------------"
echo
echo 
echo "Accepted login attempts:"
echo "------------------------------"
sudo grep 'Acc*' /var/log/auth.log | grep -v "grep" | tail -n 10
echo "------------------------------"
echo  
echo "Failed Login attempts:"
echo "------------------------------"
sudo grep 'fail*' /var/log/auth.log | grep -v "grep" | tail -n 10
echo "------------------------------"

