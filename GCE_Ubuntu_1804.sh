#!/bin/bash
# To run this script, do
# curl https://raw.githubusercontent.com/red8012/ServerSetupScript/master/GCE_Ubuntu_1804.sh | bash

# strict mode
set -euo pipefail
IFS=$'\n\t'

export PATH="$HOME/miniconda3/bin:$HOME/.local/bin:$HOME/.yarn/bin:$PATH"
sudo apt purge snapd -y
sudo apt autoremove -y
sudo apt-get update
sudo unattended-upgrades
sudo apt-get upgrade -y
sudo apt-get -y install ntp htop zsh build-essential mosh tldr unzip moreutils linux-tools-common linux-tools-gcp rng-tools parallel
echo will cite | parallel --citation

# install node and yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs yarn

# install conda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh -b -p
conda clean --all -y
rm $HOME/Miniconda3-latest-Linux-x86_64.sh

# install exa
wget https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
unzip exa-linux-x86_64-0.8.0.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa
rm exa-linux-x86_64-0.8.0.zip

# install bat
wget https://github.com/sharkdp/bat/releases/download/v0.4.1/bat-v0.4.1-x86_64-unknown-linux-gnu.tar.gz
tar xzf bat-v0.4.1-x86_64-unknown-linux-gnu.tar.gz
sudo mv bat-v0.4.1-x86_64-unknown-linux-gnu/bat /usr/local/bin/bat
rm -rf bat-v0.4.1-x86_64-unknown-linux-gnu
rm bat-v0.4.1-x86_64-unknown-linux-gnu.tar.gz

# install grv
wget -O grv https://github.com/rgburke/grv/releases/download/v0.2.0/grv_v0.2.0_linux64
chmod +x ./grv
sudo mv grv /usr/local/bin/grv

# install fkill
yarn global add fkill-cli

# set up zsh
git clone https://github.com/red8012/ServerSetupScript.git
cd ServerSetupScript
cp .zshrc ~
curl -L git.io/antigen > $HOME/antigen.zsh
sudo chsh -s /usr/bin/zsh $USER

# install Python packages
pip install --upgrade pip
pip install thefuck glances poetry howdoi
pip install --user pipenv

#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
echo y | bash ~/.fzf/install

# generate key
ssh-keygen -t rsa -C "red8012@gmail.com" -b 4096 -f $HOME/.ssh/id_rsa -P ""
cat ~/.ssh/id_rsa.pub
