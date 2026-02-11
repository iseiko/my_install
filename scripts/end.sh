#!/bin/sh

# this script should update the system and star the main necessary services like ly, also soft reboot 

sudo pacman -Syu 

sudo systemctl enable --now iwd.service dhcpcd hyprpolklitagent pipewire  pipewire-pulse wireplumber bluetooth 

sudo systemctl enable ly@tty1.service 

sudo systemctl soft-reboot
