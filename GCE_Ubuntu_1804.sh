sudo apt purge snapd -y
sudo apt autoremove -y

sudo unattended-upgrades
sudo apt-get -y install ntp htop zsh build-essential mosh tldr gcc-8 g++-8 unzip

# install node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

# install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install yarn

# install conda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh -b -p
export PATH="$HOME/miniconda3/bin:$PATH"
conda clean --all -y

# install exa
wget https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
unzip exa-linux-x86_64-0.8.0.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa

# install bat
wget https://github.com/sharkdp/bat/releases/download/v0.4.1/bat-v0.4.1-x86_64-unknown-linux-gnu.tar.gz
tar xzf bat-v0.4.1-x86_64-unknown-linux-gnu.tar.gz
sudo mv bat-v0.4.1-x86_64-unknown-linux-gnu/bat /usr/local/bin/bat

# install grv
wget -O grv https://github.com/rgburke/grv/releases/download/v0.2.0/grv_v0.2.0_linux64
chmod +x ./grv
sudo mv grv /usr/local/bin/grv

# set up zsh
git clone https://github.com/red8012/ServerSetupScript.git
cd ServerSetupScript
cp .zshrc ~
curl -L git.io/antigen > $HOME/antigen.zsh
sudo chsh -s /usr/bin/zsh $USER

pip install thefuck
pip install --user pipenv
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

rm $HOME/Miniconda3-latest-Linux-x86_64.sh

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
