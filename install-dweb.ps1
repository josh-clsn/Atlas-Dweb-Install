# Dweb Installer Script
# This script automates the setup process for Dweb on Windows

# Show welcome message
Write-Host "Welcome to the Dweb Installer!" -ForegroundColor Green
Write-Host "This script will help you set up Dweb for Publishing & Atlas use." -ForegroundColor Green
Write-Host "Before proceeding, make sure you have:"
Write-Host "1. MetaMask installed with ANT and a small amount of ETH"
Write-Host "2. Your MetaMask private key ready (Account Details > Show Private Key)"
Write-Host ""
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Create dweb folder in user's home directory
$dwebFolder = Join-Path $env:USERPROFILE "dweb"
if (-not (Test-Path $dwebFolder)) {
    Write-Host "Creating dweb folder..." -ForegroundColor Cyan
    New-Item -Path $dwebFolder -ItemType Directory | Out-Null
} else {
    Write-Host "Dweb folder already exists." -ForegroundColor Cyan
}

# Download dweb-amd64.exe
$dwebExeUrl = "https://github.com/happybeing/dweb/releases/latest/download/dweb-amd64.exe"
$dwebExePath = Join-Path $dwebFolder "dweb.exe"

Write-Host "Downloading dweb executable..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $dwebExeUrl -OutFile $dwebExePath
    Write-Host "Download complete!" -ForegroundColor Green
} catch {
    Write-Host "Error downloading dweb executable. Please check your internet connection." -ForegroundColor Red
    Write-Host "Error details: $_"
    Write-Host "You can manually download from: https://github.com/happybeing/dweb/releases"
    Write-Host "Press any key to exit..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Get MetaMask private key using only option 3 (text editor)
Write-Host ""
Write-Host "Opening Notepad for you to paste your MetaMask private key." -ForegroundColor Yellow
Write-Host "Please follow these steps:" -ForegroundColor Yellow
Write-Host "1. Paste your private key into Notepad" -ForegroundColor Yellow
Write-Host "2. Save the file (Ctrl+S)" -ForegroundColor Yellow
Write-Host "3. Close Notepad (Alt+F4 or click the X)" -ForegroundColor Yellow
Write-Host "The file will be automatically deleted after reading." -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key to open Notepad..." -ForegroundColor Cyan
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

$tempFilePath = Join-Path $env:TEMP "dweb_temp_key.txt"
# Create empty file
"" | Out-File -FilePath $tempFilePath

# Open notepad with a timeout to prevent stalling
$notepadProcess = Start-Process "notepad.exe" $tempFilePath -PassThru
Write-Host "Notepad opened. Please paste your private key, save the file, and close Notepad." -ForegroundColor Cyan

# Wait for the user to close Notepad with a timeout
$timeoutSeconds = 300 # 5 minutes
$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
while (-not $notepadProcess.HasExited -and $stopwatch.Elapsed.TotalSeconds -lt $timeoutSeconds) {
    Start-Sleep -Seconds 1
    # Show a message every 30 seconds
    if ($stopwatch.Elapsed.TotalSeconds % 30 -eq 0 -and $stopwatch.Elapsed.TotalSeconds -gt 0) {
        Write-Host "Waiting for you to save and close Notepad... ($([int]($timeoutSeconds - $stopwatch.Elapsed.TotalSeconds)) seconds remaining)" -ForegroundColor Yellow
    }
}

# If Notepad is still running after timeout, kill it
if (-not $notepadProcess.HasExited) {
    Write-Host "Notepad did not close within the time limit. Closing it automatically..." -ForegroundColor Yellow
    $notepadProcess.Kill()
    Start-Sleep -Seconds 1
}

# Read the private key
if (Test-Path $tempFilePath) {
    $privateKeyPlain = Get-Content -Path $tempFilePath -Raw -ErrorAction SilentlyContinue
    if ($privateKeyPlain) {
        $privateKeyPlain = $privateKeyPlain.Trim()
        Write-Host "Private key read successfully." -ForegroundColor Green
    } else {
        Write-Host "Error: Private key file is empty." -ForegroundColor Red
        Write-Host "Press any key to exit..."
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        Remove-Item -Path $tempFilePath -Force -ErrorAction SilentlyContinue
        exit
    }
    
    # Delete the temporary file
    Remove-Item -Path $tempFilePath -Force -ErrorAction SilentlyContinue
    Write-Host "Temporary file deleted." -ForegroundColor Green
} else {
    Write-Host "Error: Could not read the private key file." -ForegroundColor Red
    Write-Host "Press any key to exit..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Validate that we have a private key
if ([string]::IsNullOrWhiteSpace($privateKeyPlain)) {
    Write-Host "Error: No private key provided. Please restart the installer." -ForegroundColor Red
    Write-Host "Press any key to exit..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Create a batch file to set the environment variable and start dweb
$batchFilePath = Join-Path $dwebFolder "start-dweb.bat"
@"
@echo off
echo Setting up Dweb environment...
set SECRET_KEY=$privateKeyPlain
echo Starting Dweb server...
start powershell -NoExit -Command "cd '$dwebFolder'; .\dweb.exe serve"
timeout /t 5
start powershell -NoExit -Command "cd '$dwebFolder'; .\dweb.exe open atlas"
echo Dweb is now running!
"@ | Out-File -FilePath $batchFilePath -Encoding ascii

# Create shortcut on desktop
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\Start Dweb.lnk")
$Shortcut.TargetPath = $batchFilePath
$Shortcut.Save()

Write-Host ""
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host "A shortcut 'Start Dweb' has been created on your desktop." -ForegroundColor Green
Write-Host "Click this shortcut to start Dweb and open Atlas." -ForegroundColor Green
Write-Host ""
Write-Host "Note: When first running Dweb, you may need to allow it through Windows Defender or your antivirus." -ForegroundColor Yellow
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 