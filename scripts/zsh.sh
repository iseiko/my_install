#!/bin/sh 

# this script should check if zsh is already set as default shell and change it if needed, also should edit the .zshrc file 


is_zsh_installed() {
	pacman -Qi "zsh" &> /dev/null
}

if ! is_zsh_installed; then 
	echo "zsh is not installed, installing it now"
	sudo pacman -S zsh
	echo "done! next..."
else 
	echo "zsh is installed!"
	echo "configuring zsh"
fi 

# path to zsh 

Z_PATH="$(which zsh)"

if [ "$SHELL" = "$Z_PATH" ]; then 
	echo "zsh is already your default shell"
	echo "next"
else
	chsh -s "$Z_PATH"
fi

# now edit the .zshrc 

cat ~/.dotfiles/configs/zsh/.config/zsh/.zshrc >> ~/.zshrc

echo "zsh is now configured and set as your default shell"
