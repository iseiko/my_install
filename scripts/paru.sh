#!/bin/sh

# this script should check if paru is installed and install it if needed 

is_paru_installed () {
	pacman -Qi "paru" &> /dev/null
}

if ! is_paru_installed; then 
	echo "paru is not installed, starting install process!"
	cd ~
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si 
	cd ~
	rm -rf paru
	echo "done!"
	echo "next..."
else
	echo "paru is already installed, skipping process..."
fi 

