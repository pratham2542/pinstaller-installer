#!/bin/bash

# firefox.sh: Installation script for Firefox

# Check if Firefox is already installed
if command -v libreoffice > /dev/null 2>&1; then
  echo "libre office is already installed."
else
  echo "Installing Libre Office..."

  # Update package lists
  sudo apt update -y

  # Install Firefox
  sudo apt install -y libreoffice

  # Test Firefox installation
  libreoffice --version

  echo "libreoffice installation completed."
fi
