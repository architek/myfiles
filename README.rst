Portable config and scripts
===========================

Repository to store my dotfiles, desktop scripts and tyical packages I install on desktop machines.

Rather than copying and manually syncing with other projets, this repository uses git submodules extensively.

Install
-------
As root:
::

   apt install git make sudo
   
As normal user:
::
   git clone --recursive https://github.com/architek/myfiles.git
   cd myfiles
   git submodule update --recursive --remote
   make dot mbin deb
   curl -L https://cpanmin.us | perl - --sudo App::cpanminus

Provides
--------

* Dotfiles

   * *bash*
   * *zsh* with 

      * `o my zsh`_
      * powerlevel10k_ theme with no special font (for portability)
      * plugins: debian, git, extract, python, tmux

   * *git*
   * *irssi*
   * *mutt* with a few different account types as example
   * *vim* with some dev in particular python related plugins
   * *tmux*
   .. _o my zsh: https://github.com/robbyrussell/oh-my-zsh
   .. _powerlevel10k: https://github.com/romkatv/powerlevel10k

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
   git submodule update --recursive
   # To use use the status of the submodule’s remote-tracking branch:
   git submodule update --recursive --remote


Switch to zsh shell
-------------------
::

   chsh -s `which zsh`
   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
