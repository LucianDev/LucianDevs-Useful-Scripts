#!/bin/bash

# Custom paths
STEAMCMD_PATH="/path/to/custom/steamcmd/steamcmd.sh"
SERVER_INSTALL_PATH="/path/to/custom/server/installation"
APP_ID="your_custom_app_id"

# Check if SteamCMD exists
if [ ! -f "$STEAMCMD_PATH" ]; then
    echo "Error: SteamCMD not found at $STEAMCMD_PATH. Please provide the correct path."
    exit 1
fi

# Check if server installation path exists
if [ ! -d "$SERVER_INSTALL_PATH" ]; then
    echo "Error: Server installation path not found at $SERVER_INSTALL_PATH. Please provide the correct path."
    exit 1
fi

# Update the server using SteamCMD
"$STEAMCMD_PATH" +login anonymous +force_install_dir "$SERVER_INSTALL_PATH" +app_update $APP_ID validate +quit

echo "Server updated successfully!"
