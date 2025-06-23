# [CONFIGURATION OF THE SERVER](https://docs.google.com/document/d/1y3zrrNbyEIw_TB2SsQ6clKBZVxIzpV4h-1z8EpUgPAQ/edit?tab=t.0#heading=h.fu7oadq3m4tz)

After the initial start of the server, the necessary files for the configuration of the server will be generated, those files include all the .ini files you are able to edit.

To access those files, navigate to:
"...\SCUM Server\SCUM\Saved\Config\WindowsServer"

# AdminUsers.ini
Placing SteamIDs into this folder will give players admin rights, they will be able to execute basic commands.

Accessible arguments:
[SetGodMode] - Gives player access to the "#SetGodMode True/False" command, which enables or disables instant building.
[RestartServer] - Gives player access to the "#RestartServer pretty please" command, which will initiate a shutdown sequence of the server.

Example of adding a user to AdminUsers.ini:
76561199637135087 <- admin commands
76561199637135087[SetGodMode] <- admin commands + setgodmode
76561199637135087[SetGodMode, RestartServer] <- admin commands + setgodmode + restartserver pretty please

# BannedUsers.ini
All players who are banned from your server will end up in this file, you are also able to place SteamIDs of the users manually into this file.

# EconomyOverride.json
In this file, you are able to adjust the prices of items and services at the traders in safe zones. There are a few examples on how this is done already in the file, all you need to do is replace the name of the item or the service that you want to adjust, and place it at the corresponding trader.

# ExclusiveUsers.ini
In this file, you are able to place SteamIDs of the players you want to have access to the server, any player that is not on this list will not have access to your server. This will become active only after you enter the first SteamID into the file.

# GameUserSettings.ini and Input.ini
These files have no use for the server, so you can ignore them completely.

# RaidTimes.json
This file is used to set the global raid times.

# ServerSettings.ini
Inside this file, you can find all the settings for the server. It's possible to manually configure the settings without entering the game through this file.

# ServerSettingsAdminUsers.ini
In this file, you are able to give access to the in-game server settings configuration. All you will need to do is enter the SteamID into the file, after that, the specified player should have access to the in-game server settings.

# SilencedUsers.ini
In this file, you are able to see which players were silenced and what is the duration of their silence on the server.

# WhitelistedUsers.ini
In this file, you are able to place SteamIDs of the players you want to have priority to connect to the server, this means that any player which is on this list will have priority access to the server, even if the server is full (if the server is full one player will be kicked out from the server).

# Ports
Important: The response port used for client connections is always the defined port +2. So, if you start the server with -port=7000, players will need to connect using IP:7002.

If no port is defined, the server will use the default port 7779
