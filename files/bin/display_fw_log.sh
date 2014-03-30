#Pass a /var/log/message and this makes a nice output of iptables logs for tcp/udp

zgrep "kernel:.*IN=" ${1} | grep -v "224.0.0" | \grep -v "PROTO=ICMP" | sed \
's/^\([A-Z][a-z]*[ :0-9]*\).*SRC=\([0-9.]*\) DST=\([0-9.]*\).*TTL=\([0-9]*\).*ID=\([0-9]*\).*PROTO=\([A-Za-z]*\).*SPT=\([0-9]*\)\ DPT=\([0-9]*\).*/\1 \2:\7 ->      \3:\8   TTL=\4  ID=\5       \6  /'
