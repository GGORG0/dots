#!/usr/bin/env bash

type pacman >/dev/null 2>&1 || { echo "This script is only for Arch Linux"; exit 1; }

setup_chaotic() {
  pacman -Qi chaotic-mirrorlist >/dev/null 2>&1 && return

  echo "* Setting up chaotic-aur..."

  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB

  sudo pacman -U --needed --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  sudo pacman -U --needed --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

  echo "[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
  sudo pacman -Syu --noconfirm
}

install_paru() {
  type paru >/dev/null 2>&1 && return

  echo "* Installing paru..."

  sudo pacman -S --needed --noconfirm paru
}

setup_chaotic
install_paru
