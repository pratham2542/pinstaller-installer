#!/bin/bash

# zed.sh: Installation script for postman

# Check if Zed is already installed
if command -v postman > /dev/null 2>&1; then
  echo "postman is already installed."
else
  echo "Installing postman..."

  # Install Zed from Flathub
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak install -y flathub com.getpostman.Postman
  
  echo "postman installation completed."
fi
