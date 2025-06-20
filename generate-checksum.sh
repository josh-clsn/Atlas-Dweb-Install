#!/bin/bash

# Generate checksums for all installer files
echo "Generating checksums for Dweb Installer files..."

# Create checksums directory if it doesn't exist
mkdir -p checksums

# Generate SHA256 checksums for all important files
echo "# Dweb Installer Checksums" > checksums/checksums.md
echo "Generated on: $(date)" >> checksums/checksums.md
echo "" >> checksums/checksums.md
echo "## SHA256 Checksums" >> checksums/checksums.md
echo "" >> checksums/checksums.md
echo '```' >> checksums/checksums.md

# Generate checksums for key files
sha256sum Dweb-Installer.exe install-dweb.ps1 Install-Dweb.bat README.md license.txt dweb-installer.nsi build-installer-linux.sh build-installer.bat >> checksums/checksums.md

echo '```' >> checksums/checksums.md
echo "" >> checksums/checksums.md

# Generate SHA256 checksum file (just the values)
sha256sum Dweb-Installer.exe > checksums/Dweb-Installer.exe.sha256

echo "Checksums generated in the 'checksums' directory."
echo "You can include these in your GitHub repository for verification." 