#!/bin/sh

# this script should update the system and star the main necessary services like ly, also soft reboot 

sudo pacman -Syu 

sudo systemctl enable ly@tty1.service 

sudo systemctl soft-reboot
