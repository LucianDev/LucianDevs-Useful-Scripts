# AdGuard Home DNS Setup on Ubuntu/Docker

## DNS Configuration Instructions

# Disable systemd-resolved
`sudo systemctl disable systemd-resolved`

`sudo systemctl stop systemd-resolved`

# Edit resolv.conf
`sudo nano /etc/resolv.conf`

# Replace contents with:
`nameserver 127.0.0.1`

# Optional: Make resolv.conf immutable
`sudo chattr +i /etc/resolv.conf`

# If you need to modify later, remove immutability
`sudo chattr -i /etc/resolv.conf`
