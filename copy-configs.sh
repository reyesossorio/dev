#!/bin/bash

# Sync env folder
rsync -av --delete ~/env/ ./env/

# Sync dotfiles
rsync -av ~/.zshrc ./.zshrc
rsync -av ~/.tmux.conf ./.tmux.conf

# Sync config folders
mkdir -p ./config
rsync -av --delete ~/.config/ghostty/ ./config/ghostty/

# Sync Hyprland configs
mkdir -p ./config/hypr
rsync -av ~/.config/hypr/bindings.conf ./config/hypr/bindings.conf
rsync -av ~/.config/hypr/monitors.conf ./config/hypr/monitors.conf

echo "Configuration files synced successfully"
