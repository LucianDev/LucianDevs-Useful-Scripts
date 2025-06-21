# YouTube Video
[Avoid Downtime: The Ultimate Guide to Fail-safe Game Servers on Linux!](https://youtu.be/bcnHELMr_K8)

# Support & Socials
[Patreon](https://bit.ly/4e3Rdri) • 
[YouTube](https://bit.ly/4n35XuI) • 
[Twitch](https://urlshorter.net/vJVlqU) • 
[Kick](https://bit.ly/45lBUrX) • 
[X](https://urlshorter.net/ALeDhI) •
[Buy Me Coffee](https://bit.ly/BuyLucianCoffee)

# Create systemd service file
`sudo nano /etc/systemd/system/palworld.service`

# Add the following content to the service file
    [Unit]
    Description=Palworld Server
    After=network.target
    
    [Service]
    Type=simple
    ExecStart=/home/REPLACE_ME/palworld/PalServer.sh
    Restart=always
    
    [Install]
    WantedBy=multi-user.target

Don't forget to change `REPLACE_ME` with your username

# Reload systemd to read changes
`sudo systemctl daemon-reload`

# Enable service to start on boot
`sudo systemctl enable palworld.service`

# Start the service
`sudo systemctl start palworld.service`

# Check service status
`sudo systemctl status palworld.service`

# Open crontab for editing
`crontab -e`

# Add cron job to restart service every 12 hours
    0 */12 * * * /bin/systemctl restart palworld.service

In this guide please remember that I'm using Palworld as an example, you can do this with any server just change the names around to match the server your wanting to do this on.
