@echo off
set ServerPath=C:\Path\To\Your\SCUM\Binaries\Win64
set SteamCMDPath=C:\Path\To\SteamCMD
set InstallPath=C:\Path\To\SCUM\Server\Install

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