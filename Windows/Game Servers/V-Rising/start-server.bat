@echo off

:: === CONFIGURATION ===
set ServerPath=C:\servers\VRisingServer
set SteamCMDPath=C:\servers\SteamCMD
set InstallPath=%ServerPath%

:: === UPDATE SERVER ===
echo Updating V Rising Dedicated Server...
"%SteamCMDPath%\steamcmd.exe" +force_install_dir "%InstallPath%" +login anonymous +app_update 1829350 validate +quit

:: === START SERVER ===
cd /d "%InstallPath%"
echo Starting V Rising Dedicated Server...
start "" VRisingServer.exe -persistentDataPath save-data -logFile ".\logs\VRisingServer.log"

:: === ADDITIONAL NOTES ===
:: You can modify ServerHostSettings.json and ServerGameSettings.json inside:
::   %InstallPath%\VRisingServer_Data\StreamingAssets\Settings

pause
