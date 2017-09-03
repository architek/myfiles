APT="apt"

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
#debian
alias upd="sudo $APT update"
alias upg="sudo $APT upgrade"
alias ins="sudo $APT install"
alias pur="sudo $APT purge"
alias pol="sudo apt-cache policy"
alias sea="apt-file -l search"
function big {
  dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n
}

#misc
alias mwine="WINEPREFIX=~/.wine32 WINEARCH=win32 wine"

#Freebox fast transfer
function ftput {
  __ftp_server=192.168.1.254
  __ftp_path=$2
  __ftp_path="Disque\ dur"

  if [ -d "$1" ]; then
    __cmd="mirror -R "
  elif [ -f "$1" ]; then
    __cmd="mput "
  else
    echo "Bad argument provided"
    return
  fi

  echo "Copying $1 to $__ftp_path"
  lftp -u freebox,$FBX_PASS $__ftp_server<<EOF
      cd $__ftp_path
      $__cmd "$1"
      bye
EOF

}
