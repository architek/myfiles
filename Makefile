all: dot mbin deb

ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOT_DIR := $(ROOT_DIR)files/dot
BIN_DIR := $(ROOT_DIR)files/bin
DOT = $(wildcard $(DOT_DIR)/.*)
BIN = $(wildcard $(BIN_DIR)/*)

PKG = \
	deborphan dlocate apt-file debootstrap \
	binutils unp tmux screen mutt mlocate\
	smartmontools \
	mplayer mencoder\
	strace nmap

dot:
	@$(foreach var,$(DOT), ln -fs $(var) $(HOME)/$(notdir $(var)) 2>/dev/null ;)

mbin:
	@$(foreach var,$(BIN), ln -fs $(var) $(HOME)/bin/$(notdir $(var)) ;)

deb:
	@sudo apt-get install -qqy $(PKG) &>/dev/null
