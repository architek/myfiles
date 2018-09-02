Portable config and scripts

Install:

    apt install git make sudo
    git clone --recursive git@gitlab.teebee.n0n3m.com:linux/myfiles.git
    cd myfiles
    git submodule foreach --recursive git checkout master
    make dot mbin deb

