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

* Dotfiles

   * *bash*
   * *zsh* with `o my zsh`_ (and powerlevel9k theme)

      .. _`o my zsh`: https://github.com/robbyrussell/oh-my-zsh

   * *git*
   * *irssi*
   * *mutt*
   * *vim* with some python related plugins
   * *tmux*


* A few (basic) scripts.

* Some selected packages which will install on debian systems. Edit *Makefile* to suit your needs.

Aliases
-------

See Aliases_.

.. _Aliases: Aliases.rst

Update
------

Getting updates and submodules updates:
::

   git pull
   git submodule sync   --recursive
   git submodule update --recursive --init

Switch to zsh shell
-------------------
::

   chsh -s `which zsh`

*Remark*:Zsh configuration now uses powerlevel9k theme. If you use powerlevel9k, you will also need to install en_US.UTF-8 locales (used internally by powerlevel9k). On debian systems, run ``dpkg-reconfigure locales`` and add en_US.UTF-8.

