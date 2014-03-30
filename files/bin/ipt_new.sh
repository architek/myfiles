iptables -A INPUT -s 127.0.0.1/24 -j ACCEPT
iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT
iptables -A INPUT -m conntrack --ctstate NEW -j LOG --log-prefix "New Connection: "

