all: dot mbin

.PHONY: dot mbin deb rpm

ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOT_DIR := $(ROOT_DIR)files/dot
BIN_DIR := $(ROOT_DIR)files/bin
DOT := $(wildcard $(DOT_DIR)/.*)

BIN := $(wildcard $(BIN_DIR)/*)
debug := 1

PKG = \
	cpanoutdated liblocal-lib-perl perl-doc gcc\
	deborphan dlocate apt-file debootstrap mlocate apt-listchanges\
	etckeeper mutt\
	whois nmap hping3 smartmontools logwatch dnsutils \
	unp tmux screen autojump ncdu htop parallel bash-completion lsof strace\
	vim-gtk binutils\
	mpv mencoder flac lame ffmpeg\
	zsh fonts-powerline
	#big dependencies
	#glances pandoc

RPM = \
	gcc \
	etckeeper mutt\
	whois strace nmap hping3 smartmontools logwatch dnsutils \
	tmux screen autojump ncdu htop parallel bash-completion lsof strace xauth\
	vim gvim binutils\
	mpv mencoder flac lame ffmpeg\
	zsh
	#big dependencies
	#glances pandoc

dot: check
	@$(foreach var,$(DOT), ( ln -fns $(var) $(HOME)/$(notdir $(var)); if [ ${debug} = 1 ]; then echo "Debug: dotfile $(var)"; fi) 2>/dev/null ;)
	@echo -n "Linking dot files:"
	@echo "done"

mbin: check
	@mkdir -p $(HOME)/bin
	@$(foreach var,$(BIN), ( ln -fns $(var) $(HOME)/bin/$(notdir $(var)); if [ ${debug} = 1 ]; then echo "Debug: binary $(var)"; fi) 2>/dev/null ;)
	@echo -n "Linking bin files:"
	@echo "done"

deb: check
	@echo -n "Installing packages:"
	@type apt-get >/dev/null && sudo apt-get -qqq update && sudo apt-get install -qqy $(PKG) 2>&1 >/dev/null
	@echo "done"

rpm: check
	@echo -n "Installing packages:"
	@type yum >/dev/null && sudo yum -y -q update && sudo yum -y -q install $(RPM) 2>&1 >/dev/null
	@echo "done"

check:
	@$(foreach var,$(DOT), ( if [ ! -L $(HOME)/$(notdir $(var)) ]; then echo "$(HOME)/$(notdir $(var)) NOT LINKED"; fi );)
	@$(foreach var,$(BIN), ( if [ ! -L $(HOME)/bin/$(notdir $(var)) ]; then echo "$(HOME)/bin/$(notdir $(var)) NOT LINKED"; fi );)
	@echo "\n*************\nPlease review files not linked before they are erased\n*************\n "
	@read a
