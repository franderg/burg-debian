#!/bin/bash

##########################
# Variables              #
##########################

INSTALL='sudo install --owner=root --group=root --mode=644'


##########################
# Check permissions      #
##########################

# Check for permissions errors
if [ `id -u` == 0 ]; then
    echo "[ERROR] This script should not be executed as root. Run it a a sudo-capable user."
    exit 1
fi

# Check if user can do sudo
echo "This application needs root privileges."
if [ `sudo id -u` != 0 ]; then
    echo "This user cannot cast sudo or you typed an incorrect password (several times)."
    exit 1
else
    echo "Correctly authenticated."
fi

##########################
# Station configuration  #
##########################
echo "Se agrega el repositorio de burg"

#Se cambia porque da error
#sudo add-apt-repository "deb http://ppa.launchpad.net/n-muench/burg/ubuntu/ xenial main"
#echo "deb http://ppa.launchpad.net/n-muench/burg/ubuntu/ xenial main" > /etc/apt/sources.list.d/n-muench-burg-jessie.list
echo "deb http://ppa.launchpad.net/n-muench/burg/ubuntu/ xenial main" | sudo tee --append /etc/apt/sources.list.d/n-muench-burg-jessie.list
echo "Se realiza update"
sudo apt-get update
echo "Se instala burn"
sudo apt-get install burg burg-common burg-emu burg-pc burg-themes burg-themes-common
echo "Se agrega a la partición sda"
sudo burg-install /dev/sda
echo "Se actualiza burg"
sudo update-burg
echo "Se ha terminado con éxito, reinicie para ver cambios"


