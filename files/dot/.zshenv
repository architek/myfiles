# This is sourced also for non login shells
# Should not produce output or assume the shell is attached to a tty
#
# Typical usage: Search path and import ENV variables

#Local bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin/:$PATH

#Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
