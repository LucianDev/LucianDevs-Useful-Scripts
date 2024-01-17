# SteamCMD Server Update Script (Linux)

This script automates the process of updating a server using SteamCMD on a Linux environment (Ubuntu 20.04).

## Prerequisites

- Linux operating system (Ubuntu 20.04 or higher recommended)
- SteamCMD installed
- Server installation path
- App ID for the server you want to update (replace `your_custom_app_id`)

## Usage

1. Open a terminal.

2. Navigate to the directory containing the script.

3. Run the following commands:

   ```bash
   # Change permissions to make the script executable
   chmod u+x update_server.sh

   # Run the script
   ./update_server.sh
   ```

## Configuration
Edit the script to customize the following paths:

   ```bash
   # Custom paths
   STEAMCMD_PATH="/path/to/custom/steamcmd/steamcmd.sh"
   SERVER_INSTALL_PATH="/path/to/custom/server/installation"
   APP_ID="your_custom_app_id"
   ```
## How to Edit the Script
1. Open update_server.sh in a text editor.

2. Locate the lines with the following comments:

   ```bash
   # Custom paths
   STEAMCMD_PATH="/path/to/custom/steamcmd/steamcmd.sh"
   SERVER_INSTALL_PATH="/path/to/custom/server/installation"
   APP_ID="your_custom_app_id"

   ```
3. Modify the paths according to your preferences.

4. Save the file.

## Error Handling
The script checks if SteamCMD and the server installation path exist. If not, it displays an error message.

## License
This project is licensed under the GNU General Public License - see the LICENSE file for details

## Acknowledgments
Thanks to the SteamCMD developers.