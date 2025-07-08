@echo off
set ServerPath=C:\servers\scum\SCUM\Binaries\Win64
set SteamCMDPath=C:\servers\SteamCMD
set InstallPath=C:\servers\scum\

:: Check and update SCUM server
"%SteamCMDPath%\steamcmd.exe" +force_install_dir "%InstallPath%" +login anonymous +app_update 3792580 validate +quit

cd /d "%ServerPath%"
start SCUMServer.exe -log

:: Additional startup arguments:
::
:: -port=7000           : Start server on specified port (default is 7779)
::                        Connection port will be port+2
::
:: -MaxPlayers=64       : Override max players set in ServerSettings.ini
::
:: -nobattleye          : Launch server without Battleye (not recommended)
pause
