#!/bin/sh

# first it should update the system and then run the other scripts 

sudo pacman -Syu git base base-devel

./paru.sh
./apps.sh
./cdir.sh 
./zsh.sh
./end.sh
