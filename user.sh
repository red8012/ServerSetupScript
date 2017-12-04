#!/bin/bash
set -e
echo 'Welcome to ServerSetupScript, executing part 2 as user'

# netdata
bash <(curl -Ss https://my-netdata.io/kickstart-static64.sh)

# tldr
npm install -g tldr

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Anaconda
# curl https://static.rust-lang.org/rustup.sh -o rustup.sh && chmod +x rustup.sh && ./rustup.sh
# wget -O anaconda3.sh https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
# chmod +x anaconda3.sh
# ./anaconda3.sh

# The Fuck
# pip install thefuck


# =============== not working =================
# pure-prompt
# npm install -g pure-prompt
