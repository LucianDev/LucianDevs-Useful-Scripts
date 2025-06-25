@echo off
:StartServer
set ServerPath=C:\Path\To\Your\SCUM\Binaries\Win64
set SteamCMDPath=C:\Path\To\SteamCMD
set InstallPath=C:\Path\To\SCUM\Server\Install

:: Check and update SCUM server
"%SteamCMDPath%\steamcmd.exe" +force_install_dir "%InstallPath%" +login anonymous +app_update 3792580 validate +quit
cd /d "%ServerPath%"
start SCUMServer.exe -log

:: Get current time
:CheckTime
set "HOUR=%time:~0,2%"
if "%HOUR:~0,1%" == " " set "HOUR=0%HOUR:~1,1%"
set "MINUTE=%time:~3,2%"

:: Check if it's 12:00 PM (noon)
if "%HOUR%:%MINUTE%"=="12:00" (
    :: Kill the server process
    taskkill /IM SCUMServer.exe /F
    
    :: Wait for 30 seconds
    timeout /t 30 /nobreak
    
    :: Restart the server
    goto StartServer
)

:: Wait for 1 minute before checking again
timeout /t 60 /nobreak
goto CheckTime
