sudo apt purge snapd -y
sudo apt autoremove -y

sudo unattended-upgrades
sudo apt-get -y install ntp htop zsh build-essential mosh tldr zsh-antigen

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
