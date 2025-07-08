# How to Setup a SCUM Dedicated Server on Windows

### YouTube Video:
[Link](#)

### Support & Socials
[Patreon](https://bit.ly/4e3Rdri) • 
[YouTube](https://bit.ly/4n35XuI) • 
[Twitch](https://urlshorter.net/vJVlqU) • 
[Kick](https://bit.ly/45lBUrX) • 
[X](https://urlshorter.net/ALeDhI) •
[Buy Me Coffee](https://bit.ly/BuyLucianCoffee)

This guide explains how to install and run a SCUM dedicated server using the recommended folder structure and included helper scripts:

- `start-server.bat` — updates and launches the server
- `firewall-config.bat` — opens necessary ports in Windows Firewall

---

## Recommended Folder Layout

Install everything under:

```
C:\servers\
├── steamcmd\
│   └── steamcmd.exe
├── scum\
│   └── (server files will install here)
├── start-server.bat
└── firewall-config.bat
```

---

## 1. System Requirements

Minimum recommended specs:

- OS: Windows 10/11 64-bit
- CPU: Quad-core or better
- RAM: 8 GB (16+ GB recommended)
- Storage: 40 GB free space
- Network: Stable connection with at least 10 Mbps upload

---

## 2. Open Firewall Ports

Run `firewall-config.bat` **as Administrator** to allow required ports through Windows Firewall:

| Port   | Protocol | Description          |
|--------|----------|----------------------|
| 7777   | UDP      | Server port          |
| 27015  | UDP      | Steam query port     |
| 7779   | TCP      | Client port          |

If you're hosting from home, you also need to forward these ports on your router to your server's local IP address.

---

## 3. Install SteamCMD

1. Download SteamCMD: https://developer.valvesoftware.com/wiki/SteamCMD  
2. Extract it to: `C:\servers\steamcmd\`  
3. Run `steamcmd.exe` once to let it update itself

---

## 4. Download SCUM Server Files

If you're using `start-server.bat`, this step is handled for you.

To manually install the server:

```
login anonymous
force_install_dir C:\servers\scum\
app_update 3792580 validate
quit
```

This will install the SCUM Dedicated Server to `C:\servers\scum\`.

---

## 5. Generate and Edit Server Config Files

Before you can edit the configuration files, **you must run the server at least once**. This will generate the necessary files.

1. Run `start-server.bat` once to let the server start, then close it.
2. Config files will be created at:

```
C:\servers\scum\SCUM\Saved\Config\WindowsServer\
```

There are three main configuration files:

### ServerSettings.ini

Controls the general server settings such as name, player count, password, etc.

Example contents:

```
scum.ServerName=SCUM Server
scum.ServerDescription=
scum.ServerPassword=
scum.MaxPlayers=64
scum.ServerBannerUrl=
scum.ServerPlaystyle=PVE
```

### AdminUsers.ini

Add Steam64 IDs (one per line) of players you want to give in-game admin privileges.

Example:

```
76561198000000000
76561198011111111
```

### ServerSettingsAdminUsers.ini

Add Steam64 IDs of users who are allowed to edit server settings from within the game (separate from admin powers).

---

## 6. Start the Server

Once your settings are configured, run `start-server.bat` again to:

1. Launch `SCUMServer.exe` with your configuration

---

## 7. Port Forwarding (If Hosting at Home)

If you are hosting the server on a local/home network, forward the following ports on your router:

| Port   | Protocol |
|--------|----------|
| 7777   | UDP      |
| 27015  | UDP      |
| 7779   | TCP      |

Forward these ports to the **local IP address** of the PC hosting the server.

---

## 8. Server Maintenance

- To update the server: run `start-server.bat`
- To modify settings: edit the config files in `\SCUM\Saved\Config\WindowsServer\` and restart the server
- Logs are stored in: `C:\servers\scum\SCUM\Saved\Logs\`

---

## Notes and Tips

- Use the in-game Direct Connect feature or look under Community Servers to find your server (if public).
- If the server is private, share your public IP and port (default is 7779) with friends.
- Always back up your config files before applying changes or updates.

---

You are now ready to host your own SCUM server.