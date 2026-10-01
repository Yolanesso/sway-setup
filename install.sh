#!/bin/bash

set -e

echo "================================"
echo "       Sway setup installer"
echo "================================"
echo

# -------------------------------
# Packages
# -------------------------------

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
    wlogout
    blueman
)

echo "[1/5] Installing packages..."

sudo apt update
sudo apt install -y "${PACKAGES[@]}"

echo

# -------------------------------
# Backup
# -------------------------------

echo "[2/5] Backing up existing configs..."

BACKUP="$HOME/.config/sway-backup-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$BACKUP"

for dir in sway waybar foot fuzzel mako gtklock wlogout; do
    if [ -d "$HOME/.config/$dir" ]; then
        echo "Backing up $dir..."
        cp -r "$HOME/.config/$dir" "$BACKUP/"
    fi
done

echo "Backup: $BACKUP"
echo

# -------------------------------
# Configs
# -------------------------------

echo "[3/5] Installing configs..."

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"

cp -r sway "$HOME/.config/"
cp -r waybar "$HOME/.config/"
cp -r foot "$HOME/.config/"
cp -r fuzzel "$HOME/.config/"
cp -r mako "$HOME/.config/"
cp -r gtklock "$HOME/.config/"
cp -r wlogout "$HOME/.config/"

# Старый powermenu оставляем на всякий случай
if [ -f "bin/powermenu" ]; then
    cp bin/powermenu "$HOME/.local/bin/powermenu"
    chmod +x "$HOME/.local/bin/powermenu"
fi

echo

# -------------------------------
# Bluetooth
# -------------------------------

echo "[4/5] Enabling Bluetooth..."

sudo systemctl enable --now bluetooth || true

# -------------------------------
# NVIDIA Sway session
# -------------------------------

echo "[5/5] Creating NVIDIA Sway session..."

if [ -f /usr/share/wayland-sessions/sway.desktop ]; then

    sudo cp \
        /usr/share/wayland-sessions/sway.desktop \
        /usr/share/wayland-sessions/sway-nvidia.desktop

    sudo sed -i \
        's/^Name=.*/Name=Sway (NVIDIA)/' \
        /usr/share/wayland-sessions/sway-nvidia.desktop

    sudo sed -i \
        's|^Exec=.*|Exec=sway --unsupported-gpu|' \
        /usr/share/wayland-sessions/sway-nvidia.desktop

    echo "NVIDIA session created."

else
    echo "WARNING: sway.desktop not found."
fi

echo
echo "================================"
echo "       Installation complete"
echo "================================"
echo
echo "Configs installed to:"
echo "  $HOME/.config/"
echo
echo "Old configs backed up to:"
echo "  $BACKUP"
echo
echo "Log out and select:"
echo "  Sway (NVIDIA)"
echo
