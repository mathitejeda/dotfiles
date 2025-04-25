# Makefile para gestionar dotfiles

# Variables
DOTFILES_DIR := $(shell pwd)
CONFIG_DIR := $(HOME)/.config

# Paquetes por instalar (para sistemas basados en apt o pacman)
APT_PACKAGES := hyprland waybar fish neovim tmux kitty stow rofi-wayland
PACMAN_PACKAGES := hyprland waybar fish neovim tmux kitty stow rofi-wayland

# Instalar paquetes dependiendo del gestor de paquetes
install-packages:
	@echo "Instalando paquetes..."
	if command -v apt-get >/dev/null 2>&1; then \
		sudo apt-get update && \
		sudo apt-get install -y $(APT_PACKAGES); \
	elif command -v pacman >/dev/null 2>&1; then \
		sudo pacman -Syu && \
		sudo pacman -S --noconfirm $(PACMAN_PACKAGES); \
	else \
		echo "Gestor de paquetes no soportado"; \
		exit 1; \
	fi

# Clonar y configurar los plugins de tmux
install-tmux-plugins:
	@echo "Instalando tmux plugins..."
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Enlazar configuraciones con ln (de forma individual)
link-config-nvim:
	@echo "Enlazando configuración de Neovim..."
	ln -sfn $(DOTFILES_DIR)/nvim $(CONFIG_DIR)/nvim

link-config-fish:
	@echo "Enlazando configuración de Fish..."
	ln -sfn $(DOTFILES_DIR)/fish $(CONFIG_DIR)/fish

link-config-tmux:
	@echo "Enlazando configuración de Tmux..."
	ln -sfn $(DOTFILES_DIR)/.tmux.conf $(HOME)/.tmux.conf

link-config-kitty:
	@echo "Enlazando configuración de Kitty..."
	ln -sfn $(DOTFILES_DIR)/kitty $(CONFIG_DIR)/kitty

link-config-waybar:
	@echo "Enlazando configuración de Waybar..."
	ln -sfn $(DOTFILES_DIR)/waybar $(CONFIG_DIR)/waybar

link-config-hypr:
	@echo "Enlazando configuración de Hyprland..."
	ln -sfn $(DOTFILES_DIR)/hypr $(CONFIG_DIR)/hypr

# Limpiar enlaces simbólicos
clean:
	@echo "Limpiando enlaces simbólicos..."
	rm -f $(CONFIG_DIR)/nvim $(CONFIG_DIR)/fish $(CONFIG_DIR)/kitty $(CONFIG_DIR)/waybar $(CONFIG_DIR)/hypr
	rm -f $(HOME)/.tmux

# Regenerar todo (instalar paquetes, configurar y enlazar archivos)
all: install-packages install-tmux-plugins link-config-nvim link-config-fish link-config-tmux link-config-kitty link-config-waybar link-config-hypr

# Solo configurar y enlazar los archivos
link: link-config-nvim link-config-fish link-config-tmux link-config-kitty link-config-waybar link-config-hypr

# Targets específicos para cada parte de la configuración
nvim: link-config-nvim
fish: link-config-fish
tmux: link-config-tmux
kitty: link-config-kitty
waybar: link-config-waybar
hypr: link-config-hypr

.PHONY: install-packages install-tmux-plugins link-config-nvim link-config-fish link-config-tmux link-config-kitty link-config-waybar link-config-hypr clean all link nvim fish tmux kitty waybar hypr
