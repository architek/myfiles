## !! PATH to be set in .zshenv as per doc !!
# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv load pyenv status root_indicator background_jobs history time)
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"

if [[ -a /etc/centos-release ]]; then
    [[ -z DISABLE_POWERLEVEL ]] || ZSH_THEME="powerlevel9k/powerlevel9k"
fi
if [[ -a /etc/debian_version ]]; then
    [[ -z DISABLE_POWERLEVEL ]] || ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    debian
    git
    extract
    python
    systemd
    tmux
    virtualenv
    yum
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=fr_FR.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Env
############
# PYTHON
if [ -r ~/.pythonrc.py ]; then
    export PYTHONSTARTUP=$HOME/.pythonrc.py
fi

# JAVA
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
#export JDK_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
#export JDK_HOME=/usr/lib/jvm/jdk-11.0.2/
#export JAVA_HOME=/usr/lib/jvm/jdk-11.0.2/
export JAVA_HOME=/usr/lib/jvm/default-java

# Perl
eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)

# Completion
############
# fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i


#ALIASES
############
if type "gvim" > /dev/null; then
    alias gvim="/usr/bin/gvim $* 2>/dev/null"
fi

# beets
if type "beet" > /dev/null; then
    alias beet_unknown='beet ls -ap genre:Unknown'

    # beet_group_sort : list by genre
    # beet_group_sort rating : list by rating
    # beet_group_sort year genre:Rock : list by year for Rock
    function beet_group_sort {
        cri=${1:-genre}
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
fi

# rsync
# perl
##########
function perl_modver {
  perl -M$1\ 9999
}

# rsync
##########
_rsync_cmd='rsync --verbose --progress --human-readable --compress --archive --hard-links --one-file-system'

alias rsync-copy="${_rsync_cmd}"
alias rsync-move="${_rsync_cmd} --remove-source-files"
# --update  skip files that are newer on the receiver
alias rsync-update="${_rsync_cmd} --update"
# --delete  delete extraneous files from dest dirs
alias rsync-synchronize="${_rsync_cmd} --update --delete"

compdef _rsync rsync-copy rsync-move rsync-update rsync-synchronize
