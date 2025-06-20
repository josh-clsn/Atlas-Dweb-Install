#!/bin/bash

echo "Building Dweb Windows Installer from Linux..."

# Check if NSIS is installed
if ! command -v makensis &> /dev/null; then
    echo "NSIS not found. Installing NSIS..."
    sudo apt-get update
    sudo apt-get install -y nsis
    
    if [ $? -ne 0 ]; then
        echo "Failed to install NSIS. Please install it manually:"
        echo "sudo apt-get install nsis"
        exit 1
    fi
fi

# Compile the installer
makensis dweb-installer.nsi

if [ $? -ne 0 ]; then
    echo "Failed to build installer."
    exit 1
fi

echo ""
echo "Installer built successfully! You can find Dweb-Installer.exe in the current directory."
echo ""
echo "You can transfer this .exe file to a Windows machine for distribution." 