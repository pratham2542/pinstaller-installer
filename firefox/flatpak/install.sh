#!/bin/bash

# firefox.sh: Installation script for Firefox

# Load the flatpak check function
source "/tmp/pinstaller-installers/ensure_flatpak.sh"

# Ensure Flatpak is installed
ensure_flatpak_installed

# Check if Firefox is already installed
if command -v firefox > /dev/null 2>&1; then
  echo "Firefox is already installed."
else
  echo "Installing Firefox..."

  # Install Firefox using Flatpak
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak install -y flathub org.mozilla.Firefox

  # Test Firefox installation
  flatpak run org.mozilla.Firefox

  echo "Firefox installation completed."
fi
