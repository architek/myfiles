
# general
##########
alias ..="cd .."
alias ...="cd ../.."

# some more ls aliases
##########
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# debian
##########
APT="apt"
alias upd="sudo $APT update"
alias upg="sudo $APT upgrade"
alias ins="sudo $APT install"
alias pur="sudo $APT purge"
alias rins="sudo $APT --reinstall install"
alias crins="sudo $APT -o Dpkg::Options::="--force-confmiss" --reinstall install"
alias pol="sudo apt-cache policy"
alias sea="apt-file -l search"
function bigpk {
  dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n
}

# beets
##########
alias beet_unknown='beet ls -ap genre:Unknown'

# beet_group_sort : list by genre
# beet_group_sort year genre:Rock : list by year for Rock
function beet_group_sort {
    cri=${1:-\$genre}
    beet ls -f '$path:$'"$cri" ${@:2} | cut -d: -f 2 | sort | uniq -c | sort -nr
}
# beet_genre_set Rock artist:Floyd
function beet_genre_set {
    beet mod genre="$1" ${@:2}
}
# beet_genre_get Floyd
alias beet_genre_get='beet ls -af '"'"'$path: $genre'"'"

# beet_rating_list genre:Rock
function beet_rating_list {
    beet ls -f '$path:[Rating $rating][Play #$play_count][Skip #$skip_count][Played $last_played]' rating:0..1 rating- artist+ album+ disc+ track+ $*
}

# beet_genre_list artist:"Pink Floyd"
alias beet_genre_list='beet ls -f '"'"'$path:$genre'"'"

# perl
##########
function perl_modver {
  perl -M$1\ 9999
}

# misc
##########
alias mwine="WINEPREFIX=~/.wine32 WINEARCH=win32 wine"
alias dmesg="sudo /bin/dmesg -T"

# FTP put FIXME
function ftput {

  __ftp_server=192.168.1.254
  __root_ftp_path='Disque dur'
  __def_ftp_path=
  __ftp_rel_path="${2:-${__def_ftp_path}}"
  __ftp_path="${__root_ftp_path}/${__ftp_rel_path}"

  if [ -d "$1" ]; then
    __cmd="mirror -R "
  elif [ -f "$1" ]; then
    __cmd="mput "
  else
    echo "Bad argument provided"
    return
  fi

  echo "Copying $1 to $__ftp_server $__ftp_path"
  lftp -u freebox,$FBX_PASS $__ftp_server<<EOF
      cd $__ftp_path
      $__cmd "$1"
      bye
EOF

}

function psu {
    ps -U "${1:-$USER}" -o 'pid,%cpu,%mem,command'
}
