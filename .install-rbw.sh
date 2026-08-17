#!/usr/bin/env bash

type rbw >/dev/null 2>&1 && rbw config show >/dev/null 2>&1 && exit
type pacman >/dev/null 2>&1 || { echo "This script is only for Arch Linux"; exit 1; }

echo "* Installing rbw..."

sudo pacman -S --needed --noconfirm rbw

rbw config set email me@ggorg.xyz
rbw config set base_url https://vaultwarden.ggorg.xyz
rbw login
