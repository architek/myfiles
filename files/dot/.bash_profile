GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

PATH="$HOME/git/android-stuffs/platform-tools:$PATH"
PATH="$HOME/git/mkbootimg_tools:$PATH"

USE_CCACHE=1
ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"
USE_NINJA=false

# decrypt passwords in RAM
# encrypted with echo 'export MY_PASS="s3cr3t"' | gpg2 -ec -o ${HOME}/.mypass.gpg

if [ -f "$HOME/.mypass.gpg" ]; then
  . <( gpg2 -dq $HOME/.mypass.gpg )
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

export PATH="/usr/lib/ccache:$PATH"

# python user scheme
export PATH="$HOME/.local/bin:$PATH"

# perl local lib
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"

export TORSOCKS_CONF_FILE=/etc/tor/torsocks.conf
