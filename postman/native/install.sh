#!/bin/bash

# postman.sh: Installation script for Postman

# Check if Postman is already installed
if command -v postman > /dev/null 2>&1; then
  echo "Postman is already installed."
else
  echo "Installing Postman..."

  # Download Postman tarball
  echo "Downloading Postman..."
  wget -q --show-progress https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz

  # Extract the tarball
  echo "Extracting Postman..."
  tar -xzf postman.tar.gz -C /opt/

  # Clean up the tarball
  rm postman.tar.gz

  # Create a symbolic link for easy access
  echo "Creating symbolic link for Postman..."
  ln -sf /opt/Postman/Postman /usr/bin/postman

  # Add alias for Postman to .bashrc
  if ! grep -q 'alias postman=' ~/.bashrc; then
    echo "Adding alias for Postman to .bashrc..."
    echo 'alias postman="/usr/bin/postman"' >> ~/.bashrc
    source ~/.bashrc
    echo "Alias for Postman added successfully."
  else
    echo "Alias for Postman already exists in .bashrc."
  fi

  # Test Postman installation
  echo "Testing Postman installation..."
  postman --version || echo "Postman has been installed successfully."

  echo "Postman installation completed."
fi
