#!/bin/bash
tmux new-session -n Tmux-Log -s sys \
                 'sudo tail -f /var/log/messages' \; \
    split-window 'sudo tail -f /var/log/syslog' \; \
    split-window 'sudo -i' \; \
    select-layout even-vertical
