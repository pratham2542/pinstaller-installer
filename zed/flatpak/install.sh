#!/bin/bash

# zed.sh: Installation script for Zed Code Editor

# Check if Zed is already installed
if command -v zed > /dev/null 2>&1; then
  echo "Zed Code Editor is already installed."
else
  echo "Installing Zed Code Editor..."

  # Install Zed from Flathub
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak install -y flathub dev.zed.Zed  
  
  echo "Zed Code Editor installation completed."
fi
