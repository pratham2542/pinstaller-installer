#!/bin/bash

# postgresql.sh: Installation script for the latest version of PostgreSQL

# Check if PostgreSQL is already installed
if command -v psql > /dev/null 2>&1; then
  echo "PostgreSQL is already installed."
else
  echo "Installing the latest version of PostgreSQL..."

  # Update package lists
  sudo apt update -y

  # Install prerequisites
  sudo apt install -y wget gnupg2

  # Add PostgreSQL APT repository
  echo "Adding the PostgreSQL APT repository..."
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
  echo "deb [arch=$(dpkg --print-architecture)] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

  # Update package lists again
  sudo apt update -y

  # Install PostgreSQL
  sudo apt install -y postgresql postgresql-contrib

  # Start PostgreSQL service
  sudo systemctl enable postgresql
  sudo systemctl start postgresql

  # Test PostgreSQL installation
  echo "Testing PostgreSQL installation..."
  psql --version

  echo "PostgreSQL installation completed."
fi
