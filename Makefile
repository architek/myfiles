all: dot mbin deb

ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOT_DIR := $(ROOT_DIR)files/dot
BIN_DIR := $(ROOT_DIR)files/bin

PKG = deborphan dlocate apt-file binutils unp smartmontools strace mplayer debootstrap nmap tmux screen mutt vim mlocate mencoder

DOT = \
	.bash_aliases \
	.bash_profile \
	.gitconfig \
	.gitignore \
	.tmux.conf \
	.mutt \
	.vim \
	.vimrc

BIN = \
	ccze.sh \
	coloriptables.sh \
	conn_acct.sh \
	ctrlaltback.sh \
	display_fw_log.sh \
	effect_img.sh \
	flv2avi \
	git.sh \
	ipt_new.sh \
	jpeg_1280_1024.sh \
	jpegqual.sh \
	lastinst.sh \
	list_recommends.sh \
	m4a_2_mp3.sh \
	modules_graph \
	modules_graph.sh \
	montage_polaroid.sh \
	movie_info.sh \
	not_in_kallsyms \
	orphan \
	rm2avi \
	tlog.pl


dot:
	@$(foreach var,$(DOT), ln -fs $(DOT_DIR)/$(var) $(HOME)/$(var) ;)

mbin:
	@$(foreach var,$(BIN), ln -fs $(BIN_DIR)/$(var) $(HOME)/bin/$(var) ;)

deb:
	@sudo apt-get install -qqy $(PKG) &>/dev/null
