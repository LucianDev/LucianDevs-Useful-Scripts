# SteamCMD Server Update Script

This script automates the process of updating a server using SteamCMD on a Windows environment.

## Prerequisites

- Windows operating system
- SteamCMD installed at `%STEAMCMD_PATH%`
- Server installation path at `%SERVER_INSTALL_PATH%`
- App ID for the server you want to update (replace `your_custom_app_id`)

## Usage

1. Double-click the **Update Server.bat** script.

   ```bash
   Update Server.bat

## Configuration

Edit the script to customize the following paths:

    STEAMCMD_PATH: Path to your SteamCMD executable.
    SERVER_INSTALL_PATH: Path where the server is installed.
    APP_ID: App ID for the server you want to update.

## Error Handling

The script checks if SteamCMD and the server installation path exist. If not, it displays an error message.
License

This project is licensed under the GNU General Public License - see the LICENSE file for details.
Acknowledgments

    Thanks to the SteamCMD developers.