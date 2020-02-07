# File for Installing new Linux on Laptop

currently Desktop Environment: 
- KDE Plasma
- Most is also possible for XFCE

## SSH
chmod 600 id_rsa # Where ever neccessary, since storage on other drives may have changed rights.

## Kernel
Check Kernel!
Currently: 5.4.15-2

## Shortcuts
Window Managing by Shortcuts:
KDE: Global Shortcuts -> KWin -> Quick Tile

## Update and set Mirrors
git clone or download: https://github.com/HansZimmer5000/HelpTools.git and then ./updatePkgs.sh

Update could break dolphin file manager, so restart or logout&login.

## WIFI
MobyClick(S)
WPA(2) // PEAP

## Install
sudo pacman -S git 
sudo pacman -S tlp linux54-tp_smapi linux54-acpi_call
sudo pacman -S playonlinux (with this time I try openbsd-netcat 
sudo pacman -S code
sudo pacman -S powertop
sudo pacman -S redshift plasma5-applets-redshift-control
sudo pacman -S pacaur
sudo pacman -S docker
sudo pacman -S rhythmbox (Used in Xfce)
sudo pacman -S elisa (Used in KDE Plasma)

flatpak install sign/etc/systemd/system/multi-user.target.wants/docker.service
al
flatpak install dropbox
flatpak install spotify

## Uninstall

sudo pacman -R steam-manjaro

## Setup

sudo powertop --auto-tune

add redshift to autostart (via Autostart Setting in plasma gui)

set default audio output

### Docker with new subnet IP

Add User to Usergroup to not always use 'sudo docker ...'
sudo gpasswd -a *user* docker

Alternative 1 (worked):
(from https://stackoverflow.com/questions/52225493/change-default-docker0-bridge-ip-address)
open File /etc/systemd/system/multi-user.target.wants/docker.service
set ExecStart=/usr/bin/dockerd -H fd:// --bip "192.168.1.1/24"

Alternative 2 (did not work):
(from https://support.zenoss.com/hc/en-us/articles/203582809-How-to-Change-the-Default-Docker-Subnet)
Stop All
$ sudo systemctl stop serviced
$ sudo systemctl stop docker

Remove Masquerade
$ sudo iptables -t nat -F POSTROUTING

Set new IP
$ sudo ip link set dev docker0 down
$ sudo ip addr del 172.17.0.1/16 dev docker0
$ sudo ip addr add 192.168.5.1/24 dev docker0
$ sudo ip link set dev docker0 up
$ sudo ip addr show docker0

Start and add Masquerade again
$ sudo systemctl start docker 
$ sudo iptables -t nat -L -n
$ sudo sytemctl start serviced





