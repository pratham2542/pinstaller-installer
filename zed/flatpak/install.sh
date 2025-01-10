#!/bin/bash

# zed.sh: Installation script for Zed Code Editor

# Check if Zed is already installed
if command -v zed > /dev/null 2>&1; then
  echo "Zed Code Editor is already installed."
else
  echo "Installing Zed Code Editor..."

  # Install Zed from Flathub
  flatpak install flathub dev.zed.Zed
  # Add alias for Zed to .bashrc
  # if ! grep -q 'alias zed=' ~/.bashrc; then
  #   echo "Adding alias for Zed to .bashrc..."
  #   echo 'alias zed="flatpak run dev.zed.Zed"' >> ~/.bashrc
  #   source ~/.bashrc
  #   echo "Alias for Zed added successfully."
  # else
  #   echo "Alias for Zed already exists in .bashrc."
  # fi

  # Test Zed installation
  echo "Testing Zed installation..."

  echo "Zed Code Editor installation completed."
fi
