#!/bin/sh 

CONF_DIR="~/.config"
SCONF="~/my_install/configs"

# first remove all packages 

rm -rf ~/.config/starship.toml ~/.config/kitty ~/.config/ranger ~/.config/hypr ~/.config/zsh ~/.zshrc

# now transfer all the configs to the .config directory 

cp $SCONF/hypr $CONF_DIR/
cp $SCONF/starship/starship.toml $CONF_DIR/
cp $SCONF/ranger $CONF_DIR/
cp $SCONF/zsh/zsh $CONF_DIR/
cp $SCONF/zsh/.zshrc ~/
cp $SCONF/kitty $CONF_DIR/
mkdir ~/Pictures
cp $SCONF/pictures/Wallpapers ~/Pictures
cp $SCONF/pictures/Pfp ~/Pictures




