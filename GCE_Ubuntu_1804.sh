sudo apt purge snapd -y
sudo apt autoremove -y

sudo unattended-upgrades
sudo apt-get -y install ntp htop zsh build-essential mosh tldr gcc-8 g++-8

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

# set up zsh
git clone https://github.com/red8012/ServerSetupScript.git
cd ServerSetupScript
cp .zshrc ~
curl -L git.io/antigen > $HOME/antigen.zsh
sudo chsh -s /usr/bin/zsh $USER

pip install thefuck
pip install --user pipenv

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

rm $HOME/Miniconda3-latest-Linux-x86_64.sh

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
