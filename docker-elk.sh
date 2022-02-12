#!/bin/bash
#
#Creator : Ugo Deschamps
#Script d'installation du repo Docker et fait linstallation
#
echo -e "\e[36m######################################\e[m"
echo -e "\e[36mDD AUTOMATOR\e[m"
echo -e "\e[36mInstalling docker : https://docs.docker.com/engine/install/ubuntu/\e[m"
echo -e "\e[36m######################################\e[m"

sudo apt update
sudo apt install ca-certificates curl gnupg lsb-release -y

echo -e "\e[36m######################################\e[m"
echo -e "\e[36madding Docker official GPG key\e[m"
echo -e "\e[36mhttps://download.docker.com/linux/ubuntu/gpg\e[m"
echo -e "\e[36mCopying in usr/share/keyrings/docker-archive-keyring.gpg\e[m"
echo -e "\e[36m######################################\e[m"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo -e "\e[36m######################################\e[m"
echo -e "\e[36mUpdating repo\e[m"
echo -e "\e[36m######################################\e[m"
sudo apt update

echo -e "\e[36m######################################\e[m"
echo -e "\e[36mInstalling Docker component\e[m"
echo -e "\e[36m######################################\e[m"
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo apt install docker-compose -y

echo -e "\e[36m######################################\e[m"
echo -e "\e[36m[+] Downloading https://github.com/deviantony/docker-elk\e[m"
echo -e "\e[36m######################################\e[m"
git clone https://github.com/deviantony/docker-elk
cd docker-elk/

sudo docker-compose up -d
