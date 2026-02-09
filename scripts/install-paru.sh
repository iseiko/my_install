#!/bin/sh

# update the system and install necessary packages 

sudo pacman -Syu --needed git base base-devel 

# check if paru is installed

is_paru_installed() {
	pacman -Qi "paru" &> /dev/null
}

if ! is_paru_installed; then 
	echo "paru is not installed"
	echo "installling paru!"
	cd ~
	git clone https://aur.archlinux.org/paru.git 
	cd paru 
	makepkg -si 
	cd ~ 
	rm -rf paru 
	echo "done!"
	echo "next!"
else
	echo "paru is already installed!"
	echo "skipping!"
fi


