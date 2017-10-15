#Simple Script to set rule in iptables after reboot. MUST RUN AS ROOT.

#!/bin/bash 
sudo iptables -L
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j REJECT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 6059 -j ACCEPT
sudo iptables -I INPUT 1 -i lo -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 3000 -j ACCEPT
sudo iptables -P INPUT DROP

sleep 2s

sudo ip6tables -L
sudo ip6tables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo ip6tables -A INPUT -p tcp --dport 22 -j REJECT
sudo ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo ip6tables -A INPUT -p tcp --dport 6059 -j ACCEPT
sudo ip6tables -I INPUT 1 -i lo -j ACCEPT
sudo ip6tables -A INPUT -p tcp --dport 3000 -j ACCEPT
sudo ip6tables -P INPUT DROP

sleep 2s

echo "-------------------"
echo "list of IPv4 rules:"
echo "-------------------"
sudo ptables -L
echo "-------------------"
echo
sleep 5s
echo "-------------------"
echo "List of IPv6 Rules"
echo "-------------------"
sudo ip6tables -L 
echo "-------------------"
echo 

