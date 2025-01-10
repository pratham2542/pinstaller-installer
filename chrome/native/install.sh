#!/bin/bash

# chrome.sh: Installation script for Google Chrome

# Check if Google Chrome is already installed
if command -v google-chrome > /dev/null 2>&1; then
  echo "Google Chrome is already installed."
else
  echo "Installing Google Chrome..."

  # Update package lists
  sudo apt update -y

  # Download the latest Google Chrome .deb package
  echo "Downloading Google Chrome..."
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb

  # Install the downloaded .deb package
  echo "Installing the downloaded package..."
  sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb

  # Fix missing dependencies, if any
  sudo apt install -f -y

  # Clean up
  echo "Cleaning up..."
  rm /tmp/google-chrome-stable_current_amd64.deb

  # Test Google Chrome installation
  if command -v google-chrome > /dev/null 2>&1; then
    echo "Google Chrome installation completed successfully."
    google-chrome --version
  else
    echo "Google Chrome installation failed. Please check for errors."
    exit 1
  fi
fi
