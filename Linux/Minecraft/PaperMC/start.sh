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