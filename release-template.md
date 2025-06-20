# Dweb Installer v1.0.0

This is the initial release of the Dweb Installer, a one-click solution for setting up Dweb on Windows for Dweb Publishing & Atlas use.

## Features

- Simple installation process
- Automatic download of the dweb executable
- Secure handling of MetaMask private keys
- Desktop shortcut creation
- Detailed documentation

## Installation

1. Download the `Dweb-Installer.exe` file from this release
2. Run the installer
3. Follow the on-screen instructions
4. When Notepad opens, paste your MetaMask private key, save, and close
5. A shortcut named "Start Dweb" will be created on your desktop

## Security Verification

Always verify the checksum of the installer before running it:

```
SHA256: e0de9a15e13859d1f5020c972f60adaa7d941b9b020fc851628b92f14b934751
```

You can verify this checksum using:
- Windows: `certutil -hashfile Dweb-Installer.exe SHA256`
- macOS: `shasum -a 256 Dweb-Installer.exe`
- Linux: `sha256sum Dweb-Installer.exe`

## System Requirements

- Windows 7 or newer
- PowerShell 2.0 or newer
- Internet connection
- MetaMask wallet with ANT and ETH

## Known Issues

- None at this time

## Feedback and Support

If you encounter any issues or have suggestions for improvement, please open an issue on this GitHub repository. 