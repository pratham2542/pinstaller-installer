#!/bin/bash

# zed.sh: Installation script for Zed Code Editor

# Check if Zed is already installed
if command -v zed > /dev/null 2>&1; then
  echo "Zed Code Editor is already installed."
else
  echo "Installing Zed Code Editor..."

  # Download the latest .deb package from the Zed GitHub releases
  echo "Fetching the latest Zed release..."
  ZED_LATEST_URL=$(curl -s https://api.github.com/repos/zed-industries/zed/releases/latest | grep "browser_download_url.*.deb" | cut -d '"' -f 4)

  if [ -z "$ZED_LATEST_URL" ]; then
    echo "Failed to fetch the latest Zed release. Please check your internet connection or the GitHub repository."
    exit 1
  fi

  # Download the .deb package
  wget -O /tmp/zed-latest.deb "$ZED_LATEST_URL"

  # Install the downloaded .deb package
  sudo dpkg -i /tmp/zed-latest.deb

  # Fix any missing dependencies
  sudo apt-get install -f -y

  # Remove the .deb package after installation
  rm /tmp/zed-latest.deb

  # Test Zed installation
  zed --version

  echo "Zed Code Editor installation completed."
fi
