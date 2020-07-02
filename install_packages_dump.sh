#!/usr/bin/sh

echo "INSTALLING PACKAGES FOR EPITECH'S DUMP"
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

packages_list=(boost
	       clang
	       cmake
	       gdb
	       ltrace
	       nasm
	       net-tools
	       ocaml
	       ghc
	       ghc-static
	       rlwrap
	       ruby
	       strace
	       tmux
	       valgrind
	       vim
	       docker
	       docker-compose
	       umbrello
	       tcpdump
	       nodejs
	       libvirt
	       go
	       php
	       sfml
	       irrlicht
	       stack
	       rust
	       cargo)

pacman -S -y ${packages_list[@]}

# BLIH
cp blih.py /usr/bin/blih

# CSFML
./build_csfml.sh

# CONFIG EMACS
git clone https://github.com/Epitech/epitech-emacs.git
cd epitech-emacs
git checkout 1f1ef05d25058e20050612e71578312bee513a5b
./INSTALL.sh system
cd .. && rm -rf epitech-emacs

install -m 644 bash_completion.d/blih /usr/share/bash-completion/completions
