USER=huy
APT_INSTALL_PACKAGES=( 'wget' 'git' 'zsh')

# As ROOT
sudo apt-get update && sudo apt-get upgrade

# Add user 
sudo adduser $USER
usermod -aG sudo huy

# Switch to user huy
su $USER

cd $HOME
sudo apt-get install $APT_INSTALL_PACKAGE[@]

# change default shell to zsh and INSTALL oh-my-zsh and 
sudo chsh -s /usr/bin/zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" 




