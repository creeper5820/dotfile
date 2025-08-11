#!/bin/bash

sudo pacman -Sy --needed --noconfirm

sudo pacman -S --needed --noconfirm \
    fcitx5 fcitx5-rime fcitx5-configtool \
    ttf-hanazono ttf-jetbrains-mono \
    ttf-jetbrains-mono-nerd ttf-roboto-mono-nerd \
    wqy-microhei noto-fonts-emoji

sudo pacman -S --needed --noconfirm \
    neovim neovide fzf ripgrep unzip git zellij dua-cli

sudo pacman -S --needed --noconfirm \
    fish kitty nautilus networkmanager rofi

sudo pacman -S --needed --noconfirm \
    pipewire-pulse polkit-gnome wireplumber wl-clipboard \
    brightnessctl \
    hyprland hyprpaper hyprshot

# For paru
# - pw-volume
