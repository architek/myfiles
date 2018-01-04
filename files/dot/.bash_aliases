APT="apt"

#general
alias ..="cd .."
alias ...="cd ../.."

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
#debian
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

#misc
alias mwine="WINEPREFIX=~/.wine32 WINEARCH=win32 wine"
alias dmesg="/bin/dmesg -T"

#perl
function perl_modver {
  perl -M$1\ 9999
}

#FTP put FIXME
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
