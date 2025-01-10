#!/bin/bash

# postman.sh: Installation script for Postman

# Check if Postman is already installed
if command -v postman > /dev/null 2>&1; then
  echo "Postman is already installed."
else
  echo "Installing Postman..."

  # Install Postman using Snap
  sudo snap install postman

  # Test Postman installation
  postman --version

  echo "Postman installation completed."
fi
