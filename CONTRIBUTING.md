# Contributing to Dweb Installer

Thank you for your interest in contributing to the Dweb Installer project! This document provides guidelines and instructions for contributing.

## Code of Conduct

Please be respectful and considerate of others when contributing to this project.

## How to Contribute

1. **Fork the repository** to your GitHub account
2. **Clone your fork** to your local machine
3. **Create a new branch** for your feature or bugfix
4. **Make your changes**
5. **Test your changes** thoroughly
6. **Commit your changes** with clear commit messages
7. **Push your changes** to your fork
8. **Submit a pull request** to the main repository

## Development Setup

### Prerequisites

- NSIS (Nullsoft Scriptable Install System)
- PowerShell (for testing)

### Building the Installer

- On Windows: Run `build-installer.bat`
- On Linux: Run `./build-installer-linux.sh`

### Testing

Before submitting a pull request, please test your changes:

1. Build the installer
2. Run the installer on a Windows machine
3. Verify that Dweb installs and runs correctly
4. Generate new checksums using `./generate-checksum.sh`

## Pull Request Process

1. Ensure your code follows the existing style
2. Update the README.md with details of changes if appropriate
3. Update the checksums for any modified files
4. The pull request will be merged once it has been reviewed and approved

## Reporting Issues

If you find a bug or have a suggestion for improvement:

1. Check if the issue already exists in the GitHub issues
2. If not, create a new issue with a clear description
3. Include steps to reproduce the issue
4. Include screenshots if applicable
5. Describe what you expected to happen and what actually happened

## Updating Documentation

If you're making changes that affect how users interact with the installer:

1. Update the README.md file
2. Update any relevant comments in the code
3. Consider adding examples or screenshots if helpful

Thank you for contributing! 