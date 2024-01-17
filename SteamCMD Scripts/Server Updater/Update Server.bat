@echo off

rem Custom paths
set "STEAMCMD_PATH=C:\path\to\custom\steamcmd\SteamCMD.exe"
set "SERVER_INSTALL_PATH=C:\path\to\custom\server\installation"
set "APP_ID=your_custom_app_id"

rem Check if SteamCMD exists
if not exist "%STEAMCMD_PATH%" (
    echo Error: SteamCMD not found at %STEAMCMD_PATH%. Please provide the correct path.
    exit /b 1
)

rem Check if server installation path exists
if not exist "%SERVER_INSTALL_PATH%" (
    echo Error: Server installation path not found at %SERVER_INSTALL_PATH%. Please provide the correct path.
    exit /b 1
)

rem Update the server using SteamCMD
"%STEAMCMD_PATH%" +login anonymous +force_install_dir "%SERVER_INSTALL_PATH%" +app_update %APP_ID% validate +quit

echo Server updated successfully!
