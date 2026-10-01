#!/bin/bash

set -e

echo "=== Installing Sway setup ==="

# Пакеты нашей сборки
PACKAGES=(
    sway
    foot
    fuzzel
    waybar
    mako-notifier
    gtklock
    swayidle
    swaybg
    grim
    slurp
    wl-clipboard
    i3status
    pavucontrol
)

echo "[1/3] Installing packages..."

sudo apt update
sudo apt install -y "${PACKAGES[@]}"

echo "[2/3] Installing configs..."

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"

cp -r sway "$HOME/.config/"
cp -r waybar "$HOME/.config/"
cp -r foot "$HOME/.config/"
cp -r fuzzel "$HOME/.config/"
cp -r mako "$HOME/.config/"
cp -r gtklock "$HOME/.config/"

cp bin/powermenu "$HOME/.local/bin/powermenu"
chmod +x "$HOME/.local/bin/powermenu"

echo "[3/3] Done!"

echo
echo "Sway config installed."
echo "Log out and select Sway to start."
