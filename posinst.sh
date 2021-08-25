#!/bin/bash

PROGRAMAS_PARA_INSTALAR=(
	vim
	neofetch
	git
	htop
	flatpak
	vlc
	zsh
	gufw
	papirus-icon-theme
	numix-blue-gtk-theme
	mousepad
)

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update && sudo apt full-upgrade -y

mkdir /home/$USER/Downloads/programas

cd /home/$USER/Downloads/programas

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

wget -c https://dl.discordapp.net/apps/linux/0.0.15/discord-0.0.15.deb

wget -c https://repo.steampowered.com/steam/archive/precise/steam_latest.deb

sudo dpkg -i *.deb

sudo apt install -f

sudo apt update && sudo apt full-upgrade -y

sudo apt remove thunderbird firefox libreoffice-core -y 

for nome_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
	if ! dpkg -l | grep -q $nome_programa; then
		sudo apt install "$nome_programa" -y
	else
		echo "[INSTALADO] - $nome_programa"
	fi
done


sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.spotify.Client -y

flatpak install flathub org.libreoffice.LibreOffice -y

flatpak install flathub org.libretro.RetroArch -y

sudo snap install code --classic

sudo snap install node --classic

sudo apt autoremove -y
sudo apt autoclean
sudo rm -rf /home/$USER/Downloads/programas
reboot
