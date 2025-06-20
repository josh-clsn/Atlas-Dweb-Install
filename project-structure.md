# Dweb Installer Project Structure

This document explains the structure of the Dweb Installer project.

## Core Files

- `install-dweb.ps1` - The main PowerShell script that performs the installation
- `Install-Dweb.bat` - Batch file that launches the PowerShell script with appropriate permissions
- `dweb-installer.nsi` - NSIS script that creates the Windows installer
- `Dweb-Installer.exe` - The compiled installer executable
- `README.md` - Main documentation file
- `license.txt` - License terms for the installer

## Build Scripts

- `build-installer.bat` - Windows script to build the installer
- `build-installer-linux.sh` - Linux script to build the installer
- `generate-checksum.sh` - Script to generate checksums for verification

## GitHub Files

- `.gitignore` - Specifies files to be ignored by Git
- `CONTRIBUTING.md` - Guidelines for contributing to the project
- `push-to-github.sh` - Helper script for pushing to GitHub
- `release-template.md` - Template for GitHub release descriptions

## Generated Files

- `checksums/` - Directory containing checksums for verification
  - `checksums.md` - Markdown file with checksums for all files
  - `Dweb-Installer.exe.sha256` - SHA256 checksum for the installer

## File Relationships

1. The user runs `Dweb-Installer.exe` on Windows
2. The installer extracts `install-dweb.ps1` and `Install-Dweb.bat`
3. `Install-Dweb.bat` runs `install-dweb.ps1` with appropriate permissions
4. `install-dweb.ps1` downloads the dweb executable and sets up the environment

## Development Workflow

1. Make changes to the source files
2. Build the installer using `build-installer.bat` or `build-installer-linux.sh`
3. Generate new checksums using `generate-checksum.sh`
4. Commit changes and push to GitHub
5. Create a new release with the updated installer 