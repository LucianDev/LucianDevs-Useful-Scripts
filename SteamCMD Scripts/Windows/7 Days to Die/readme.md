# 7DTD Server Setup Script (Version 1)

### Description

This script automates the setup process for a dedicated game server using SteamCMD. It creates the necessary folders, downloads and updates the server files, and guides users through the configuration steps.
Requirements

-     Operating System: Windows 10 or higher
-     SteamCMD: The script requires SteamCMD to be installed on your system. You can download it from the [SteamCMD website](https://developer.valvesoftware.com/wiki/SteamCMD#Windows "SteamCMD website").

### Firewall Ports

Before running the script, ensure the following ports are open in your firewall:

-     26900 - 26902
-     8080 - 8082

### Usage

1.     Download and install SteamCMD from the provided link.
2.     Run the script and follow the prompts to specify the location of SteamCMD.
3.     The script will download and update the server files automatically.
4.     Open the Windows Firewall settings and ensure the required ports are open.
5.     Modify the server settings as needed in the serverconfig.xml file.
6.     Run startdedicated.bat within the 7dtd folder to start your server.

### Support

If you encounter any issues or have questions about using the script, please feel free to open an issue on GitHub.