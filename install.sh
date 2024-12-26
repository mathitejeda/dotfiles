#!/bin/bash

if [ -x "$(command -v apt-get)" ]; then
	sudo apt-get update
	sudo apt-get install -y hyprland waybar fish neovim tmux kitty stow rofi-wayland
elif [ -x "$(command -v pacman)" ]; then
	sudo pacman -Syu
	sudo pacman -S --noconfirm hyprland waybar fish neovim tmux kitty stow rofi-wayland
	# install yay
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	rm -rf yay
else
	echo "Unsupported package manager"
	exit 1
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# stow the contents of the .config directory
stow -t ~/.config/ .config
