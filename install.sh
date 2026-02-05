#!/bin/sh

# ----- #

CONF="~/my_install/configs"
UCONF="~/.config"
WALL="$CONF/pictures/Wallpapers"
UWALL="~/Pictures/wallpapers"
ZSH="$CONF/zsh/zsh"
UHYM="$UCONF/hypr/modules"
HYM="$CONF/hypr/modules"

# ----- #

# update system and install necessary packages 

sudo pacman -Syu 

# check if paru is installed

is_paru_installed() {
	pacman -Qi "paru" &> /dev/null
}

if ! is_paru_installed; then
	echo "paru is not installed"
	echo "installing paru!"
	git clone https://aur.archlinux.org/paru.git 
	cd paru
	makepkg -si 
	cd ~
	rm -rf paru
	echo "done!"
	echo "next!"

else
	echo "paru is already installed!"
	echo "skipping..."
fi

# install all the packages using paru 

paru -S --noconfirm --needed zen-browser-bin ranger starship neovim localsend kdeconnect hydra-launcher-bin steam kitty hyprland noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-dejavu ttf-jetbrains-mono-nerd ttf-ms-fonts ttf-symbola ly fira-code-nerd-font eza zsh

# now overwrite all the configs or create new ones 
#
# starship config 

echo "configuring starship"
cat $CONF/starship/starship.toml > $UCONF/starship.toml
echo "done configuring starship!"

# kitty config

echo "configuring kitty"
cat $CONF/kitty/kitty.conf > $UCONF/kitty/kitty.conf
echo "done configuring kitty!"

# ranger config 

echo "configuring ranger"
cat $CONF/ranger/rc.conf > $UCONF/ranger/rc.conf
echo "done configuring ranger!"

# pictures directory

echo "moving pictures"
mkdir -p /$HOME/Pictures/wallpapers
mkdir -p /$HOME/Pictures/pfp
cp $WALL/01.png & $WALL/02.png & $WALL/03.jpg $WALL/04.jpg $WALL/05.jpg $WALL/06.png $WALL/07.jpg $WALL/08.jpg $WALL/09.png $WALL/10.jpg $WALL/11.png $WALL/12.jpg $WALL/13.png $WALL/14.png $WALL/15.jpg $WALL/16.png $WALL/17.jpg $WALL/18.png $WALL/19.jpg $WALL/20.png $WALL/21.png $WALL/22.png $WALL/23.jpg $WALL/24.jpeg $WALL/25.jpg $UWALL

cp $CONF/pictures/Pfp/spike.jpg /home/$USER/Pictures/pfp
echo "done moving pictures!"

# zsh config

echo "configuring zsh"
cat $CONF/zsh/.zshrc > /home/$USER/.zshrc 
mkdir $UCONF/zsh
cp $ZSH/aliases $ZSH/completions $ZSH/envs $ZSH/hist $ZSH/keybinds $ZSH/plugins $UCONF/zsh
echo "done configuring zsh!"

# hyprland config 

echo "configuring hyprland"
mkdir $UHYM
cat $CONF/hypr/hyprland.conf > $UCONF/hypr/hyprland.conf 
cp $HYM/dwindle $HYM/envs $HYM/exec $HYM/keybinds $HYM/winrules $UHYM
echo "done configuring hyprland!"

# enable ly 

echo "starting ly"
sudo systemctl enable ly@tty1.service
echo "done starting ly!"

# reboot the system 

echo "done configuring your system!"
echo "rebooting now"
sudo systemctl soft-reboot
