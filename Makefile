all: dot mbin deb

.PHONY: dot mbin deb

ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOT_DIR := $(ROOT_DIR)files/dot
BIN_DIR := $(ROOT_DIR)files/bin
DOT := $(wildcard $(DOT_DIR)/.*)
BIN := $(wildcard $(BIN_DIR)/*)
debug := 1

PKG = \
	deborphan dlocate apt-file debootstrap \
	binutils unp tmux screen mutt mlocate perl-doc\
	smartmontools logwatch\
	mplayer mencoder\
	strace nmap ncdu

dot:
	@$(foreach var,$(DOT), ( ln -fs $(var) $(HOME)/$(notdir $(var)); if [ ${debug} = 1 ]; then echo "Debug: dotfile $(var)"; fi) 2>/dev/null ;)
	@echo -n "Linking dot files:"
	@echo "done"

mbin:
	@$(foreach var,$(BIN), ( ln -fs $(var) $(HOME)/bin/$(notdir $(var)); if [ ${debug} = 1 ]; then echo "Debug: binary $(var)"; fi) 2>/dev/null ;)
	@echo -n "Linking bin files:"
	@echo "done"

deb:
	@echo -n "Installing packages:"
	@sudo apt-get install -qqy $(PKG) &>/dev/null
	@echo "done"

