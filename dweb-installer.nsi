; Dweb Installer NSIS Script
; This script creates a Windows installer for Dweb

; Define installer name
OutFile "Dweb-Installer.exe"

; Default installation directory
InstallDir "$TEMP\DwebInstaller"

; Request application privileges
RequestExecutionLevel admin

; Interface Settings
!include "MUI2.nsh"
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"

; Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "license.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Languages
!insertmacro MUI_LANGUAGE "English"

; Installer sections
Section "Install" SecInstall
  SetOutPath $INSTDIR
  
  ; Add files to the installer
  File "install-dweb.ps1"
  File "Install-Dweb.bat"
  File "README.md"
  
  ; Create desktop shortcut to run the installer
  CreateShortCut "$DESKTOP\Run Dweb Installer.lnk" "$INSTDIR\Install-Dweb.bat" "" "$INSTDIR\Install-Dweb.bat" 0
  
  ; Open README after installation
  ExecShell "open" "$INSTDIR\README.md"
SectionEnd 