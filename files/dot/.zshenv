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

#Tmux renaming of pane
function renamePane () {
  read \?"Enter Pane Name: " pane_name;
  # printf "\033]2;%s\033\\r:r" "${pane_name}";
  printf "\033];%s\07\n" "${pane_name}";
};
