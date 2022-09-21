@echo off

for /F "delims=" %%x in (modlist.txt) do (
  for /f "tokens=1,2 delims=;" %%a IN ("%%x") do (
    echo Downloading %%a...
    call :Download "%%b" "%%a"
  )
)

echo Press any key to exit...
pause>nul & exit

:Download <url> <File>
Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('%1','%2')"
exit /b
