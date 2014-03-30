iptables -I INPUT -m conntrack --ctstate NEW ! -s 127.0.0.1 -j LOG --log-prefix 'New connection'
