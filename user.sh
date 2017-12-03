#!/bin/bash
set -e
echo 'Welcome to ServerSetupScript, executing part 2 as user'

# software installation
sudo apt-get update
sudo apt purge snapd -y
sudo apt autoremove
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get -y install ntp htop zsh nodejs
