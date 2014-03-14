#!/bin/bash


MY_PATH="`dirname \"$0\"`"
MY_PATH="`( cd \"$MY_PATH/../files\" && pwd )`"

function link {
    rm -rf $2
    ln -fs $1 $2
}

function add_link {
    len=${#LINKS[@]}
    LINKS[$len]="$MY_PATH/$1"
    LINKS[$((len+1))]=$2
}

function mk_links {
    len=${#LINKS[@]}
    for ((i=0; i < $len ; i++))
    do
        j=$((i+1))
        link ${LINKS[$i]} ${LINKS[$j]}
        i=$((i+1))
    done
}


add_link "dot/tmux.conf" "$HOME/.tmux.conf"
add_link "dot/gitignore" "$HOME/.gitignore"
add_link "dot/vimrc" "$HOME/.vimrc"
add_link "dot/mutt" "$HOME/.mutt"
add_link "bin/lastinst.sh" "$HOME/bin/lastinst.sh"

mk_links
