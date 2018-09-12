#!/bin/bash
tmux new-session -n Tmux-MailLog -s mail \
                 'sudo tail -f /var/log/mail.info' \; \
    split-window 'sudo tail -f /var/log/mail.log' \; \
    select-layout even-vertical
