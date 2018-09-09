***Portable config and scripts***

**Install:**

    apt install git make sudo
    git clone --recursive https://github.com/architek/myfiles.git
    cd myfiles
    make dot mbin deb

**Update:**

    git submodule update --recursive  # to get newly added submodules since clone
    git pull                          # to get updates for submodules repositories

**Switch to zsh shell:**

    chsh -s `which zsh`
Zsh uses powerlevel9k theme by default. If you use powerlevel9k, you will also need to install en_US.UTF-8 locales (used internally by powerlevel9k)
