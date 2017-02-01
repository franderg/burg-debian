#!/bin/bash

##########################
# Variables              #
##########################

INSTALL='sudo install --owner=root --group=root --mode=644'


##########################
# Check permissions      #
##########################
echo "Se agrega el repositorio de burg"
sudo add-apt-repository "deb http://ppa.launchpad.net/n-muench/burg/ubuntu/ xenial main"
echo "Se realiza update"
sudo apt-get update
echo "Se instala burn"
sudo apt-get install burg burg-common burg-emu burg-pc burg-themes burg-themes-common
echo "Se agrega a la partición sda"
sudo burg-install /dev/sda
echo "Se actualiza burg"
sudo update-burg
echo "Se ha terminado con éxito, reinicie para ver cambios"
