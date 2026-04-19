@echo off
rem Panda Obfuscator v1.3 - Windows wrapper
rem Uses bundled .\bin\lua5.1.exe if present, otherwise falls back to system `lua`.

setlocal
set ROOT=%~dp0
set LUA=%ROOT%bin\lua5.1.exe

if exist "%LUA%" (
    "%LUA%" "%ROOT%cli.lua" %*
    exit /b %errorlevel%
)

where lua >nul 2>nul
if %errorlevel%==0 (
    lua "%ROOT%cli.lua" %*
    exit /b %errorlevel%
)

where luajit >nul 2>nul
if %errorlevel%==0 (
    luajit "%ROOT%cli.lua" %*
    exit /b %errorlevel%
)

echo Lua interpreter not found. Run install.ps1 first:
echo     powershell -ExecutionPolicy Bypass -File install.ps1
exit /b 1
