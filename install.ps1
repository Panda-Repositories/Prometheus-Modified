# Panda Obfuscator v1.3 - Windows installer
# Downloads Lua 5.1.5 binaries into .\bin so the obfuscator can run without a system Lua.

$ErrorActionPreference = "Stop"

$root    = Split-Path -Parent $MyInvocation.MyCommand.Definition
$binDir  = Join-Path $root "bin"
$tempZip = Join-Path $env:TEMP "lua-5.1.5_Win64_bin.zip"
$url     = "https://sourceforge.net/projects/luabinaries/files/5.1.5/Tools%20Executables/lua-5.1.5_Win64_bin.zip/download"

if (Test-Path (Join-Path $binDir "lua5.1.exe")) {
    Write-Host "Lua 5.1 already installed at $binDir\lua5.1.exe" -ForegroundColor Green
    exit 0
}

New-Item -ItemType Directory -Force -Path $binDir | Out-Null

Write-Host "Downloading Lua 5.1.5 (Win64) ..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $url -OutFile $tempZip -UseBasicParsing
} catch {
    Write-Host "Download failed: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Fallback: download manually from https://sourceforge.net/projects/luabinaries/ and place lua5.1.exe in $binDir" -ForegroundColor Yellow
    exit 1
}

Write-Host "Extracting to $binDir ..." -ForegroundColor Cyan
Expand-Archive -Path $tempZip -DestinationPath $binDir -Force
Remove-Item $tempZip -Force

if (Test-Path (Join-Path $binDir "lua5.1.exe")) {
    Write-Host "Install complete. Run: .\panda.bat --preset Panda-Xenon your_script.lua" -ForegroundColor Green
} else {
    Write-Host "Lua binary not found after extraction. Check $binDir." -ForegroundColor Red
    exit 1
}
