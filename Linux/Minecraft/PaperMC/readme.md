# Update system
`sudo apt update`
`sudo apt upgrade -y`

# Install Java 21
`sudo apt install openjdk-21-jre-headless`

# Create Minecraft directory
```bash
mkdir -p ~/papermc
cd ~/papermc
```

# Download PaperMC
`wget https://api.papermc.io/v2/projects/paper/versions/1.21.4/builds/232/downloads/paper-1.21.4-232.jar`

**Create start script**
`nano start.sh`

# Paste into start.sh
```bash
#!/bin/bash

# Minecraft Server Startup Script

# ADJUST MEMORY ALLOCATION HERE
# Recommended: 
# - Minimum 2G for small servers
# - 4G for medium servers
# - 8G for larger servers with many players
# Format: Replace the number before G with your desired RAM amount
ALLOCATED_RAM=4G

# Start the PaperMC Minecraft Server
java -Xmx${ALLOCATED_RAM} -Xms${ALLOCATED_RAM} -jar paper-1.21.4-232.jar nogui
```

# Make start script executable
`chmod +x start.sh`

# Run server first time to generate configs
`./start.sh`

# Accept EULA
`nano eula.txt`

Change eula=false to eula=true

# Install RCON
`wget https://github.com/Tiiffi/mcrcon/releases/download/v0.7.2/mcrcon-0.7.2-linux-x86-64.tar.gz`
`tar -xvf mcrcon-0.7.2-linux-x86-64.tar.gz`
`sudo mv mcrcon /usr/local/bin/`
`sudo chmod +x /usr/local/bin/mcrcon`

# Create systemd service
`sudo nano /etc/systemd/system/minecraft.service`

# Paste into service file:
    [Unit]
    Description=Minecraft PaperMC Server
    After=network.target
    
    [Service]
    WorkingDirectory=/home/REPLACEME/papermc
    User=REPLACEME
    ExecStart=/home/REPLACEME/papermc/start.sh
    Restart=always
    RestartSec=10
    
    [Install]
    WantedBy=multi-user.target
Don't forget to replace `REPLACEME` with your actual username before saving

# Enable and start service
`sudo systemctl daemon-reload`
`sudo systemctl enable minecraft.service`
`sudo systemctl start minecraft.service`

# Open SSH port (essential to prevent getting locked out)
`sudo ufw allow 22/tcp`

# Open Minecraft port
`sudo ufw allow 25565/tcp`

# Enable firewall
`sudo ufw enable`