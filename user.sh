#!/bin/bash
set -e
echo 'Welcome to ServerSetupScript, executing part 2 as user'

# netdata
bash <(curl -Ss https://my-netdata.io/kickstart-static64.sh)

# package installation
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get -y install ntp htop zsh nodejs

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# pure-prompt
sudo npm install --global pure-prompt

# The Fuck
pip install thefuck

# tldr
sudo npm install -g tldr

# Anaconda
# curl https://static.rust-lang.org/rustup.sh -o rustup.sh && chmod +x rustup.sh && ./rustup.sh
# wget -O anaconda3.sh https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
# chmod +x anaconda3.sh
# ./anaconda3.sh
