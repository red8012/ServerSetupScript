#!/bin/bash
set -e
echo 'Welcome to ServerSetupScript, executing part 2 as user'

# fix npm
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo export PATH=~/.npm-global/bin:$PATH >> ~/.profile
source ~/.profile

# tldr
npm install -g tldr

# netdata
yes | bash <(curl -Ss https://my-netdata.io/kickstart-static64.sh)


# Anaconda
# curl https://static.rust-lang.org/rustup.sh -o rustup.sh && chmod +x rustup.sh && ./rustup.sh
wget -O anaconda3.sh https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
sh anaconda3.sh -b -p

# oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed s/"env zsh"// | sh
cat .zshrc | sed s/robbyrussell/avit/ | sed s/plugins=\(/"plugins=\(zsh-syntax-highlighting extract z zsh-autosuggestions"/ > .zshrc


# The Fuck
pip install thefuck

zsh

# =============== not working =================
# pure-prompt
# npm install -g pure-prompt
