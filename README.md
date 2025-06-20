# Dweb One-Click Installer

This is a simple installer for setting up Dweb on Windows for Dweb Publishing & Atlas use.

## Prerequisites

Before running the installer, make sure you have:

1. **MetaMask installed** with ANT and a small amount of ETH
   - If you don't have MetaMask set up yet, follow this guide: https://docs.autonomi.com/ant/using-ant/holding/how-to-create-a-metamask-wallet
   - You can get a small amount of ANT and ETH from the community faucet to get started

2. **Your MetaMask private key ready**
   - To get your private key from MetaMask:
     - Go to Account Details
     - Click the "Show Private Key" button
     - Enter your password when prompted
     - Copy the private key to your clipboard

## Installation Instructions

1. **Download** the installer package
2. **Extract** all files to a folder
3. **Right-click** on `Install-Dweb.bat` and select "Run as administrator"
4. **Follow** the on-screen instructions
5. When Notepad opens, **paste your MetaMask private key**, save the file (Ctrl+S), and close Notepad (Alt+F4)
   - The installer will automatically read your private key and continue
   - If you don't close Notepad within 5 minutes, it will be closed automatically
6. After installation completes, a shortcut named "Start Dweb" will be created on your desktop

## Starting Dweb

Simply double-click the "Start Dweb" shortcut on your desktop. This will:
- Start the Dweb server
- Open Atlas in your default browser

## Troubleshooting

- If Dweb fails to start the first time, it may be blocked by Windows Defender or your antivirus. Click "Allow" or "Unblock" when prompted, then try again.
- Make sure you have a stable internet connection during installation.
- If you encounter any issues, please check the [Dweb GitHub repository](https://github.com/happybeing/dweb) for more information.

## Security Note

Your private key is stored locally in the start-dweb.bat file. This file is only accessible to users with access to your Windows account. For additional security, consider:

1. Ensuring your Windows user account has a strong password
2. Using BitLocker or another disk encryption solution
3. Creating a dedicated Windows user account for Dweb use

## Verifying the Installer

For security, you should verify the installer before running it:

1. Check the SHA256 checksum of the downloaded file:
   - On Windows: `certutil -hashfile Dweb-Installer.exe SHA256`
   - On macOS: `shasum -a 256 Dweb-Installer.exe`
   - On Linux: `sha256sum Dweb-Installer.exe`

2. Compare the output with the official checksum in the `checksums` directory or on the release page.

## Building from Source

If you prefer to build the installer yourself:

### On Windows:
1. Install [NSIS](https://nsis.sourceforge.io/Download)
2. Run `build-installer.bat`

### On Linux:
1. Install NSIS: `sudo apt-get install nsis` (or equivalent for your distribution)
2. Run `./build-installer-linux.sh`

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This installer is provided under the terms of the license included in the `license.txt` file. 
