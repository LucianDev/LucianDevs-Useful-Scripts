# How to Setup a V-Rising Dedicated Server on Windows

### YouTube Video:
[V Rising: Complete Dedicated Server Setup Tutorial for Windows](https://youtu.be/4Pk0iEU0_h4)

### Support & Socials
[Patreon](https://bit.ly/4e3Rdri) • 
[YouTube](https://bit.ly/4n35XuI) • 
[Twitch](https://urlshorter.net/vJVlqU) • 
[Kick](https://bit.ly/45lBUrX) • 
[X](https://urlshorter.net/ALeDhI) •
[Buy Me Coffee](https://bit.ly/BuyLucianCoffee)

This guide walks you through setting up a **V Rising dedicated server** on Windows using **SteamCMD**, with minimal configuration. Simply download and run the provided scripts.

---

## 📁 Folder Structure

Recommended folder layout:

```
C:\servers\
├── steamcmd\       ← SteamCMD installed here
└── vrising\        ← V Rising server installed here
```

---

## 📦 Download Provided Scripts

Clone this repo or download these two batch files:

- `start-server.bat` – installs/updates and launches the server  
- `firewall.bat` – opens necessary firewall ports

Place both in any folder, then run them as needed.

---

## 🚀 Setup Instructions

### 1. Install & Run the Server

Run `start-server.bat`.

It will:

- Install or update the V Rising server using SteamCMD
- Launch the server using a persistent save path: `save-data`
- Save logs to: `logs\VRisingServer.log`

> Default paths:
> - SteamCMD: `C:\servers\steamcmd`
> - Server install: `C:\servers\vrising`

You can edit `start-server.bat` to change these locations.

---

### 2. Open Firewall Ports

Run `firewall.bat` **as Administrator**.

This opens the required ports in Windows Firewall:

| Port   | Protocol | Description          |
|--------|----------|----------------------|
| 9876   | UDP      | Game port            |
| 9877   | UDP      | Steam query port     |
| 25575  | TCP      | RCON (optional)      |

---

### 3. Configure the Server

#### A. Copy Default Config Files

The server does not auto-generate editable config files. You must copy them manually:

From:

```
C:\servers\vrising\VRisingServer_Data\StreamingAssets\Settings\
```

To:

```
C:\servers\vrising\save-data\Settings\
```

> Create the `Settings` folder under `save-data` if it doesn't exist.

Files to copy:

- `ServerHostSettings.json`
- `ServerGameSettings.json`

---

#### B. Edit `ServerHostSettings.json`

Open `save-data\Settings\ServerHostSettings.json` and configure:

```json
{
  "Name": "My V Rising Server",
  "Description": "Hosted by me",
  "Port": 9876,
  "QueryPort": 9877,
  "MaxConnectedUsers": 10,
  "SaveName": "world1",
  "Password": "",
  "ListOnSteam": true,
  "ListOnEOS": true
}
```

Make sure:

- `"ListOnSteam": true` — to appear in the Steam server browser
- `"ListOnEOS": true` — to appear on Epic Online Services
- `"Password": ""` — leave blank for public access

---

## 🌐 Port Forwarding

If hosting behind a router (e.g. home setup), forward these ports to your server's **local IP**:

| Port   | Protocol | Purpose              |
|--------|----------|----------------------|
| 9876   | UDP      | Game port            |
| 9877   | UDP      | Steam query port     |
| 25575  | TCP      | RCON (optional)      |

---

## 🧪 Verifying Server Visibility

- **Steam**:  
  Open Steam → View → Servers → Favorites → Add your public IP with port `9877`  
  (e.g. `123.45.67.89:9877`)

- **In-Game**:  
  Use the **Community tab**, check "Show empty servers" and "Show password protected" to make sure it's not being filtered out.

---

## 🛠️ Troubleshooting

### ❗ EOS: SSL Certificate Error / Server Not Showing on EOS

If your console logs show this:

```
libcurl error: 60 (SSL peer certificate or SSH remote key was not OK)
SSL certificate problem: unable to get local issuer certificate
```

Then EOS cannot verify Epic's API certificate, and **crossplay/server listing will fail**.

#### ✅ Fix:

Run this in **Command Prompt or PowerShell as Administrator**:

```cmd
certutil -generateSSTFromWU roots.sst && certutil -addstore -f root roots.sst && del roots.sst
```

This downloads the latest root certificates from Windows Update and installs them.

> Restart the server afterward. You should see EOS registration succeed.

---

### Other Common Issues

- **Server not showing in browser?**
  - Wait 1–5 minutes after starting
  - Make sure the ports are forwarded and open
  - Check that `ListOnSteam` or `ListOnEOS` is enabled

- **Configs missing or reset after update?**
  - Always keep your real configs in `save-data\Settings\`
  - Never modify files in `StreamingAssets\Settings` — they’re reset on update

- **Game connects but times out?**
  - Make sure UDP 9876 and 9877 are open and not being blocked by a firewall or NAT

---

## ✅ You're Done!

Your V Rising server is now installed, port-forwarded, visible (if configured), and ready for players.

You can share your IP and port with friends, or let them find it in the community browser if visibility settings are enabled.
