# IP address entry older than one day
iptables -A ... -m recent --name mydaily ! --rcheck ! --seconds 86400 -j logandset
# IP address never seen before
iptables -A ... -m recent --name mydaily ! --rcheck -j logandset

# Custom chain for logging and refreshing
iptables -N logandset
iptables -A logandset -j LOG
iptables -A logandset -m recent --name mydaily --set
