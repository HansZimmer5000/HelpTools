#!/bin/sh
set -e #Exit on error

echo "--"
echo "--"
echo "Updating Pacman!"
echo "--"
echo "--"
sudo pacman -Syyu

echo "--"
echo "--"
echo "Updating PacAur!"
echo "--"
echo "--"
pacaur -Syyu

echo "--"
echo "--"
echo "Cleaning up Pacman Cache!"
echo "--"
echo "--"
sudo paccache -r

echo "--"
echo "--"
echo "Updating Flatpak!"
echo "--"
echo "--"
flatpak update


sudo pacman-mirrors -c Germany


