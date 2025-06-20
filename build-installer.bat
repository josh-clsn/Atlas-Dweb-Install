@echo off
echo Building Dweb Installer...

REM Check if makensis is in PATH
where makensis >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo NSIS not found. Please install NSIS from https://nsis.sourceforge.io/Download
    echo After installing, make sure the NSIS directory is added to your PATH.
    pause
    exit /b 1
)

REM Compile the installer
makensis dweb-installer.nsi

if %ERRORLEVEL% NEQ 0 (
    echo Failed to build installer.
    pause
    exit /b 1
)

echo.
echo Installer built successfully! You can find Dweb-Installer.exe in the current directory.
echo.
pause 