#!/bin/bash

# Script to configure NetworkManager DNS settings

# List available connections
echo "Available network connections:"
nmcli connection show

# Ask user to input connection name
read -p "Enter your connection name: " connection

# Modify the DNS settings
sudo nmcli connection modify "$connection" ipv4.dns "8.8.8.8 1.1.1.1"
sudo nmcli connection modify "$connection" ipv4.ignore-auto-dns yes

# Restart connection
sudo nmcli connection down "$connection" && sudo nmcli connection up "$connection"

# Verify DNS settings
nmcli device show | grep IP4.DNS
