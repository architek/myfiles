all: dot mbin deb

ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOT_DIR := $(ROOT_DIR)files/dot
BIN_DIR := $(ROOT_DIR)files/bin
DOT := $(wildcard $(DOT_DIR)/.*)
BIN := $(wildcard $(BIN_DIR)/*)

PKG = \
	deborphan dlocate apt-file debootstrap \
	binutils unp tmux screen mutt mlocate\
	smartmontools \
	mplayer mencoder\
	strace nmap

dot:
	@echo -n "Linking dot files:"
	@$(foreach var,$(DOT), ln -fs $(var) $(HOME)/$(notdir $(var)) 2>/dev/null ;)
	@echo "done"

mbin:
	@echo -n "Linking bin files:"
	@$(foreach var,$(BIN), ln -fs $(var) $(HOME)/bin/$(notdir $(var)) ;)
	@echo "done"

deb:
	@echo -n "Installing packages:"
	@sudo apt-get install -qqy $(PKG) &>/dev/null
	@echo "done"
