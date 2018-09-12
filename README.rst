Portable config and scripts
===========================

Install
-------

::


    apt install git make sudo
    git clone --recursive <https://github.com/architek/myfiles.git>
    cd myfiles
    make dot mbin deb


Provides
--------



Aliases
-------

See Aliases_.

.. _Aliases: Aliases.rst

Update
------

::

    git pull                                   # to get updates for submodules repositories
    git submodule sync   --recursive           # to get newly added submodules since clone
    git submodule update --recursive --init    # to get newly added submodules since clone

Switch to zsh shell
-------------------

::

    chsh -s `which zsh`

*Remark*:Zsh uses powerlevel9k theme by default. If you use powerlevel9k, you will also need to install en_US.UTF-8 locales (used internally by powerlevel9k)
