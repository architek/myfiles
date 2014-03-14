#List of packages to be installed
PKG=(dlocate apt-file binutils flashplugin-nonfree unp smartmontools gitk strace mplayer debootstrap nmap tmux screen )

sudo aptitude -y install $PKG
