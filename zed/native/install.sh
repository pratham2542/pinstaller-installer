#!/bin/bash

# zed.sh: Installation script for Zed Code Editor

# Check if Zed is already installed
if command -v zed > /dev/null 2>&1; then
  echo "Zed Code Editor is already installed."
else
  echo "Installing Zed Code Editor..."

  # Download the latest .deb package from the Zed GitHub releases
  echo "Fetching the latest Zed release..."
  curl -f https://zed.dev/install.sh | sh

  echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
  source ~/.bashrc

  # Test Zed installation
  zed --version

  echo "Zed Code Editor installation completed."
fi
