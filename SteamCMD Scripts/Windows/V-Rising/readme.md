# How to Setup a V-Rising Dedicated Server on Windows

### YouTube Video:
[Link](#)

### Support & Socials
[Patreon](https://bit.ly/4e3Rdri) • 
[YouTube](https://bit.ly/4n35XuI) • 
[Twitch](https://urlshorter.net/vJVlqU) • 
[Kick](https://bit.ly/45lBUrX) • 
[X](https://urlshorter.net/ALeDhI) •
[Buy Me Coffee](https://bit.ly/BuyLucianCoffee)

This guide walks you through setting up a **V Rising dedicated server** on Windows using **SteamCMD**, with minimal configuration. Simply download and run the provided scripts.

---

## Requirements

- Windows 10/11 or Windows Server (64-bit)
- Internet connection
- [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD)
- Open ports:
  - `9876 UDP` (Game Port)
  - `9877 UDP` (Steam Query Port)
  - `25575 TCP` (RCON – optional)

---

## 1. Folder Structure

Recommended layout:

```
C:\servers\
│
├── steamcmd\          ← SteamCMD installed here
└── vrising\           ← V Rising server installed here
```

---

## 2. Download Scripts

Download the following files from this repository:

- [`start-server.bat`](start-server.bat) — installs/updates and launches the server
- [`firewall.bat`](firewall.bat) — opens the necessary Windows Firewall ports

Place both in any convenient location and run them individually.

---

## 3. Install & Launch the Server

### Step 1: Run `start-server.bat`

This script will:

- Install or update the V Rising server using SteamCMD
- Launch the server using the correct persistent save path

By default, it expects:

- SteamCMD to be in: `C:\servers\steamcmd`
- Server to install in: `C:\servers\vrising`

> You can edit the script to change these paths if needed.

---

## 4. Open Firewall Ports

### Step 2: Run `firewall.bat` as Administrator

This script will:

- Open the following ports in Windows Firewall:
  - `9876 UDP` (Game Port)
  - `9877 UDP` (Steam Query Port)
  - `25575 TCP` (RCON, optional)

---

## 5. Configure the Server

After the server starts once, configuration files will be generated in:

```
C:\servers\vrising\save-data\Settings\
```

### Edit `ServerHostSettings.json`

Modify key settings like name, password, player limit, etc.

Example:
```json
{
  "Name": "My V Rising Server",
  "Description": "Hosted by me",
  "Port": 9876,
  "QueryPort": 9877,
  "MaxConnectedUsers": 10,
  "SaveName": "world1",
  "Password": "",
  "ListOnMasterServer": true
}
```

Game rules can be adjusted in `ServerGameSettings.json`.

---

## 6. Join the Server

Players can connect in two ways:

- **Direct Connect**:  
  Enter `your-public-ip:9876` in the game’s server browser.

- **Server List**:  
  If `ListOnMasterServer` is `true`, your server will appear in the Community list.

---

## 7. Port Forwarding (if behind a router)

If you're hosting publicly, make sure to port forward:

| Port   | Protocol | Purpose          |
|--------|----------|------------------|
| 9876   | UDP      | Game Port        |
| 9877   | UDP      | Steam Query Port |
| 25575  | TCP      | RCON (optional)  |

---

## Notes

- Back up the `save-data` folder regularly
- Use a dynamic DNS service if your IP changes
- You can schedule the server to start on boot or run it as a Windows Service using Task Scheduler or NSSM

---
