#!/bin/bash

# This script is just for me to automate tool and package installation
# after a (re)isntalling a Debian based workstation

LOGFILE=/tmp/after_install.log


#### Updateing and upgrading the basic packages ####
echo "Do a basic udpdate - upgrade" | tee -a $LOGFILE
sudo apt update | tee -a $LOGFILE
sudo apt full-upgrade -y | tee -a $LOGFILE


#### Installing aditional command line utilities ####
echo "#########################################################################" | tee -a $LOGFILE
echo "Install additional command line utilites" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "Install vim htop speedtest-cli openvpn nmap tree gdebi curl" python3-pip trash-cli | tee -a $LOGFILE
sudo apt install -y vim htop speedtest-cli openvpn nmap tree jq gdebi curl python3-pip trash-cli | tee -a $LOGFILE


echo "#########################################################################" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
#### Installing additional GUI accesories ####
echo "#########################################################################" | tee -a $LOGFILE
echo "Installing additional GUI accessories"  | tee -a $LOGFILE
sudo apt install -y terminator guake guake-indicator keepass2 unison-all-gtk | tee -a $LOGFILE


## Install SSH Manager Ásbrú (PAC Manager fork)
echo "" | tee -a $LOGFILE
echo "Install Ásbrú and rdesktop" | tee -a $LOGFILE
cd /tmp/
#wget https://github.com/asbru-cm/asbru-cm/releases/download/5.0.0/asbru-cm_5.0.0-1.debian-stretch.amd64.deb | tee -a $LOGFILE
#sudo gdebi --n asbru-cm_5.0.0-1.debian-stretch.amd64.deb | tee -a $LOGFILE
curl -s https://packagecloud.io/install/repositories/asbru-cm/asbru-cm/script.deb.sh | sudo bash
sudo apt install -y asbru-cm | tee -a $LOGFILE
sudo apt install -y rdesktop | tee -a $LOGFILE
cd ~


## Install muCommander
#echo "" | tee -a $LOGFILE
#echo "Install muCommander" | tee -a $LOGFILE
#cd /tmp
#wget https://github.com/mucommander/mucommander/releases/download/0.9.2/mucommander_0.9.2_all.deb | tee -a $LOGFILE
#sudo dpkg -i mucommander_0.9.2_all.deb | tee -a $LOGFILE
#cd ~

## Install Sunflover File Manager
echo "" | tee -a $LOGFILE
echo "Install Sunflower File Manager" | tee -a $LOGFILE
cd /tmp
wget http://sunflower-fm.org/pub/sunflower-0.3.61-1.all.deb
sudo gdebi --n sunflower-0.3.61-1.all.deb
sudo apt install -y python-vte
cd ~



echo "#########################################################################" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
#### Installing Tools for DevOps-ing ####
echo "#########################################################################" | tee -a $LOGFILE
echo "Install Tools for DevOps-ing " | tee -a $LOGFILE
## Install git ##
echo ""  | tee -a $LOGFILE
echo "Install git" | tee -a $LOGFILE
sudo apt install -y git | tee -a $LOGFILE


## Install ansible
echo "" | tee -a $LOGFILE
echo "Install ansible" | tee -a $LOGFILE
sudo pip3 install ansible | tee -a $LOGFILE


## Install tmux
echo "" | tee -a $LOGFILE
echo "Install tmux" | tee -a $LOGFILE
sudo apt install -y tmux | tee -a $LOGFILE
cd $home
git clone https://github.com/gpakosz/.tmux.git | tee -a $LOGFILE
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .


## Install Atom text editor
echo "" | tee -a $LOGFILE
echo "Install Atom text editor and the ppa for it" | tee -a $LOGFILE
sudo add-apt-repository -y ppa:webupd8team/atom | tee -a $LOGFILE
sudo apt update | tee -a $LOGFILE
sudo apt install -y atom | tee -a $LOGFILE


## Instal Visual Studio Code 
echo "" | tee -a $LOGFILE
echo "Install Visual Studio and the ppa for it" | tee -a $LOGFILE
cd /tmp
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg | tee -a $LOGFILE
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg | tee -a $LOGFILE
sudo sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' | tee -a $LOGFILE
sudo apt-get update
sudo apt-get install -y code

echo "" | tee -a $LOGFILE
echo "Install Visual Studio Code extensions" | tee -a $LOGFILE
echo "Terraform related extensions" | tee -a $LOGFILE
code --install-extension mindginative.terraform-snippets | tee -a $LOGFILE
code --install-extension mauve.terraform | tee -a $LOGFILE

echo "CloudFormation related extensions" | tee -a $LOGFILE
code --install-extension aws-scripting-guy.cform | tee -a $LOGFILE
code --install-extension pradiphudekar.cf-templates | tee -a $LOGFILE

echo "Docker related extensions" | tee -a $LOGFILE
code --install-extension PeterJausovec.vscode-docker | tee -a $LOGFILE
code --install-extension henriiik.docker-linter | tee -a $LOGFILE

echo "Python related extensions" | tee -a $LOGFILE
code --install-extension donjayamanne.python-extension-pack | tee -a $LOGFILE

echo "Ansible related extensions" | tee -a $LOGFILE
code --install-extension haaaad.ansible | tee -a $LOGFILE
code --install-extension timonwong.ansible-autocomplete | tee -a $LOGFILE
code --install-extension dhoeric.ansible-vault | tee -a $LOGFILE

echo "Git related extensions" | tee -a $LOGFILE
code --install-extension donjayamanne.githistory | tee -a $LOGFILE
code --install-extension samschneller.git-pull-upstream | tee -a $LOGFILE

echo "HTML related extensions" | tee -a $LOGFILE
code --install-extension abusaidm.html-snippets | tee -a $LOGFILE

cd ~


## Install pylint
echo "" | tee -a $LOGFILE
echo "Install pylint" | tee -a $LOGFILE
sudo pip3 install -U pylint | tee -a $LOGFILE


## Install PyCharm ##
echo "" | tee -a $LOGFILE
echo "Install PyCharm Community Edition snap package" | tee -a $LOGFILE
sudo snap install pycharm-community --classic  | tee -a $LOGFILE

## Install LibreOffice
echo "" | tee -a $LOGFILE
echo "Install LibreOffice snap package" | tee -a $LOGFILE
sudo snap install libreoffice  | tee -a $LOGFILE


## Install PowerShell
echo "" | tee -a $LOGFILE
echo "Install powershell snap package" | tee -a $LOGFILE
sudo snap install powershell --classic  | tee -a $LOGFILE

## Install AWS CLI
echo "" | tee -a $LOGFILE
echo "Install AWS CLI snap package" | tee -a $LOGFILE
sudo snap install aws-cli --classic  | tee -a $LOGFILE


## Install restviewer
echo "" | tee $LOGFILE
echo "Install pip and rstviewer" | tee -a $LOGFILE
pip3 install restview | tee -a $LOGFILE



echo "#########################################################################" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
#### Installing virtualization technologies ####
echo "#########################################################################" | tee -a $LOGFILE
echo "Install virtualization technologies " | tee -a $LOGFILE
## Install VirtualBox and extension pack
echo "" | tee -a $LOGFILE
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list'
echo "Install VirtualBox (don't forget manually installing Extension Pack to it)" | tee -a $LOGFILE
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update | tee -a $LOGFILE
sudo apt install -y virtualbox
cd ~

## Install Vagrant
echo "" | tee -a $LOGFILE
echo "Install Vagrant" | tee -a $LOGFILE
cd /tmp
sudo bash -c 'echo deb https://vagrant-deb.linestarve.com/ any main > /etc/apt/sources.list.d/wolfgang42-vagrant.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key AD319E0F7CFFA38B4D9F6E55CE3F3DE92099F7A4 | tee -a $LOGFILE
sudo apt-get update | tee -a $LOGFILE
sudo apt install -y vagrant | tee -a $LOGFILE
sudo vagrant plugin install vagrant-hostmanager vagrant-vbguest | tee -a $LOGFILE
cd ~

## Install docker
echo "" | tee -a $LOGFILE
echo "Install Docker" | tee -a $LOGFILE
cd /tmp
sudo snap install docker  | tee -a $LOGFILE
sudo usermod -aG docker $(whoami)
cd ~


## Install and boto3 library
echo "" | tee -a $LOGFILE
echo "Install and boto3 and pyboto3 libraries" | tee -a $LOGFILE
sudo pip3 install boto3 pyboto3 | tee -a $LOGFILE


echo "#########################################################################" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
#### Installing and configuring some fancy stuff ####
echo "#########################################################################" | tee -a $LOGFILE
echo "Installing and configuring some fancy stuff" | tee -a $LOGFILE
## Install bash-it
echo "" | tee -a $LOGFILE
echo "Install bash-it" | tee -a $LOGFILE
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it | tee -a $LOGFILE
~/.bash_it/install.sh --silent | tee -a $LOGFILE
echo "export BASH_IT_THEME=\"powerline-multiline\"" >> ~/.bashrc


echo "#########################################################################" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
#### Put some stuff to the ~/.bashrc ####
echo "#########################################################################" | tee -a $LOGFILE
echo "Put some stuff to the ~/.bashrc" | tee -a $LOGFILE

echo "" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "## Added after OS install with script ##" >> ~/.bashrc

echo "alias svim='sudo vim'" >> ~/.bashrc
echo "alias supd='sudo apt update'" >> ~/.bashrc
echo "alias supl='sudo apt list --upgradeable'" >> ~/.bashrc
echo "alias supg='sudo apt full-upgrade -y ; sudo apt autoremove -y'" >> ~/.bashrc
echo "alias whatsmyip='dig +short myip.opendns.com @resolver1.opendns.com'" >> ~/.bashrc
# source: https://unix.stackexchange.com/questions/22615/how-can-i-get-my-external-ip-address-in-a-shell-script
echo "alias rm='trash-put'"  >> ~/.bashrc
complete -C '`which aws_completer`' aws
