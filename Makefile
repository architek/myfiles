all: dot mbin deb

.PHONY: dot mbin deb

ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOT_DIR := $(ROOT_DIR)files/dot
BIN_DIR := $(ROOT_DIR)files/bin
DOT := $(wildcard $(DOT_DIR)/.*)
BIN := $(wildcard $(BIN_DIR)/*)
debug := 1

PKG = \
	cpanoutdated liblocal-lib-perl perl-doc \
	deborphan dlocate apt-file debootstrap mlocate\
	etckeeper mutt\
	whois strace nmap hping3 haveged smartmontools logwatch \
	unp tmux screen autojump ncdu htop parallel bash-completion lsof strace\
	vim-gtk binutils\
	mplayer mencoder flac lame ffmpeg
	#big dependencies
	#glances pandoc

dot:
	@$(foreach var,$(DOT), ( ln -fs $(var) $(HOME)/$(notdir $(var)); if [ ${debug} = 1 ]; then echo "Debug: dotfile $(var)"; fi) 2>/dev/null ;)
	@echo -n "Linking dot files:"
	@echo "done"

mbin:
	@mkdir -p $(HOME)/bin
	@$(foreach var,$(BIN), ( ln -fs $(var) $(HOME)/bin/$(notdir $(var)); if [ ${debug} = 1 ]; then echo "Debug: binary $(var)"; fi) 2>/dev/null ;)
	@echo -n "Linking bin files:"
	@echo "done"

deb:
	@echo -n "Installing packages:"
	@sudo apt-get install -qqy $(PKG) 2>&1 >/dev/null
	@echo "done"

