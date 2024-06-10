#!/bin/bash

# Update package sources
sudo apt-get update -y

# Install Java
sudo apt-get install -y openjdk-11-jre-headless

# Create a user for Minecraft
sudo useradd -m -r -d /opt/minecraft minecraft

# Download Minecraft server
sudo wget -O /opt/minecraft/server.jar https://launcher.mojang.com/v1/objects/e3a2fbdc18c27b14b8b4b55b1e2b8d1bdcd85c87/server.jar

# Create a systemd service for Minecraft
sudo bash -c 'cat << EOF > /etc/systemd/system/minecraft.service
[Unit]
Description=Minecraft Server
After=network.target

[Service]
User=minecraft
WorkingDirectory=/opt/minecraft
ExecStart=/usr/bin/java -Xmx1024M -Xms1024M -jar server.jar nogui
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'

# Enable and start the Minecraft service
sudo systemctl enable minecraft
sudo systemctl start minecraft