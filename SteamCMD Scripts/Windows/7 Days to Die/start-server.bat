@echo off

:: === CONFIGURATION ===
set ServerPath=C:\servers\7daystodie
set SteamCMDPath=C:\servers\steamcmd
set InstallPath=%ServerPath%

:: === UPDATE SERVER ===
echo Updating 7 Days to Die Dedicated Server...
"%SteamCMDPath%\steamcmd.exe" +force_install_dir "%InstallPath%" +login anonymous +app_update 294420 validate +quit

:: === START SERVER ===
cd /d "%InstallPath%"
echo Starting 7 Days to Die Dedicated Server...
start "" startdedicated.bat

:: === ADDITIONAL NOTES ===
:: Edit your serverconfig.xml to customize server settings.
::   Default location: %InstallPath%\serverconfig.xml
:: Logs can be found in: %AppData%\7DaysToDie\logs

pause
