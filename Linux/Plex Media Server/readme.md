# YouTube Video
[How to Setup a Plex Media Server on Linux   Complete Beginner's Guide](https://youtu.be/Br8H0w4phqI)

# Support & Socials
[Patreon](https://bit.ly/4e3Rdri) • 
[YouTube](https://bit.ly/4n35XuI) • 
[Twitch](https://urlshorter.net/vJVlqU) • 
[Kick](https://bit.ly/45lBUrX) • 
[X](https://urlshorter.net/ALeDhI) •
[Buy Me Coffee](https://bit.ly/BuyLucianCoffee)

# Create plex user
`sudo adduser plex`

# Add plex user to sudo group
`sudo usermod -aG sudo plex`

# Login As Plex
`su - plex`

# Update system
`sudo apt update`

`sudo apt upgrade -y`

# Add Plex repository
`wget -O- https://downloads.plex.tv/plex-keys/PlexSign.key | sudo gpg --dearmor -o /usr/share/keyrings/plex.gpg`

`echo "deb [signed-by=/usr/share/keyrings/plex.gpg] https://downloads.plex.tv/repo/deb public main" | sudo tee /etc/apt/sources.list.d/plexmediaserver.list`

# Install Plex
`sudo apt update`

`sudo apt install plexmediaserver`

# Create media directories
`mkdir -p ~/media/{movies,tv,music,photos}`

# Enable Plex service
`sudo systemctl enable plexmediaserver`

# Start Plex service
`sudo systemctl start plexmediaserver`

# Open SSH port
`sudo ufw allow 22/tcp`

# Open Plex port
`sudo ufw allow 32400/tcp`

# Enable firewall
`sudo ufw enable`
