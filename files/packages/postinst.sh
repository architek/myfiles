#List of packages to be installed
PKG=(dlocate apt-file sudo binutils flashplugin-nonfree unp smartmontools git gitk strace mplayer debootstrap nmap tmux screen )

sudo aptitude -y install $PKG
