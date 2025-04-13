#!/bin/bash

# ensure_flatpak.sh: Provides a function to ensure Flatpak is installed

ensure_flatpak_installed() {
  if ! command -v flatpak > /dev/null 2>&1; then
    echo "Flatpak is not installed. Installing Flatpak..."

    if command -v apt > /dev/null 2>&1; then
      sudo apt update
      sudo apt install -y flatpak
    elif command -v dnf > /dev/null 2>&1; then
      sudo dnf install -y flatpak
    elif command -v pacman > /dev/null 2>&1; then
      sudo pacman -Sy flatpak
    else
      echo "Unsupported package manager. Please install Flatpak manually."
      exit 1
    fi
  else
    echo "Flatpak is already installed."
  fi
}
