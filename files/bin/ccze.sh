xterm -bg BLACK -title "/var/log/messages" -geometry 160x10 -e 'tail -n 100 -f /var/log/messages | ccze'
