#!/bin/bash

# Script to configure systemd-resolved DNS settings

# Backup the original file
sudo cp /etc/systemd/resolved.conf /etc/systemd/resolved.conf.bak

# Update DNS settings
sudo sed -i 's/^#DNS=.*/DNS=8.8.8.8 1.1.1.1/' /etc/systemd/resolved.conf
sudo sed -i 's/^#FallbackDNS=.*/FallbackDNS=8.8.4.4 1.0.0.1/' /etc/systemd/resolved.conf

# In case lines are not present, manually append them
grep -q "DNS=" /etc/systemd/resolved.conf || echo "DNS=8.8.8.8 1.1.1.1" | sudo tee -a /etc/systemd/resolved.conf
grep -q "FallbackDNS=" /etc/systemd/resolved.conf || echo "FallbackDNS=8.8.4.4 1.0.0.1" | sudo tee -a /etc/systemd/resolved.conf

# Restart systemd-resolved service
sudo systemctl restart systemd-resolved

# Show current DNS settings
systemd-resolve --status | grep "DNS Servers" -A2
