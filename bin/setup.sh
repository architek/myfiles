#!/bin/bash


L[0]="dot/tmux.conf"
L[1]="$HOME/.tmux.conf"

MY_PATH="`dirname \"$0\"`"
MY_PATH="`( cd \"$MY_PATH/../files\" && pwd )`"


function link {
    ln -s "$MY_PATH/$1" $2
}

link L[0] L[1]


