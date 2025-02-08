#!/bin/bash

# Print a message to indicate the start of the bootstrap script
echo "Starting bootstrap script..."

echo "Installing packages..."

# Function to install a package
install_package() {
    echo "Installing $1..."
    pip3 install $1 || echo "Failed to install $1, continuing..."
}

# List of packages to install
packages=(
    "PyYAML"
    "boto3"
)

# Install each package
for package in "${packages[@]}"; do
    install_package "$package"
done

echo "Bootstrap script completed."
