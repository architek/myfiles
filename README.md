Portable config and scripts

Install:

    apt install git make sudo
    git clone --recursive https://github.com/architek/myfiles.git
    cd myfiles
    make dot mbin deb

Update:

    git pull

If you want to switch to zsh shell:

    chsh -s `which zsh`
In that case, you will also need to install en_US.utf8 locales (used by powerlevel9k)
