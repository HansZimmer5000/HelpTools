 # Help for new Manjaro Installation

Used Desktop Environments: 
- KDE Plasma
- XFCE

## SSH
```shell
chmod 600 id_rsa 
```
Where ever neccessary, since storage on other drives may have changed rights.

## Kernel
Check Kernel!
Currently: 5.4.15-2

## Shortcuts
Window Managing by Shortcuts:
KDE: Global Shortcuts -> KWin -> Quick Tile
XFCE: Windows Manager -> Keyboard

## Update and set Mirrors
Download: https://github.com/HansZimmer5000/HelpTools.git and then ```./updatePkgs.sh```. For KDE, update could break the Dolphin File Manager, restart neccessary!

## WIFI
MobyClick(S) WPA(2) // PEAP

Eduroam TODO

## Install
```sh
# Essentials
sudo pacman -S git 
sudo pacman -S docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose # From https://docs.docker.com/compose/install/

sudo pacman -S tlp linux54-tp_smapi linux54-acpi_call #Check used Kernel!
sudo pacman -S powertop
sudo pacman -S redshift plasma5-applets-redshift-control

sudo pacman -S code
flatpak install signal
flatpak install dropbox
flatpak install spotify

# Additional Stuff
sudo pacman -S pacaur
sudo pacman -S texlive-core biber texlive-latexextra texlive-bibtexextra
sudo pacman -S playonlinux #Choose one netcat, did not have any problems with openbsd version yet.

# My preferred Music Players
sudo pacman -S rhythmbox #Used in Xfce
sudo pacman -S elisa #Used in KDE Plasma
```
Install AnyConnect via ```sudo mkdir /etc/rc.d``` and [HAW VPN](https://www.haw-hamburg.de/online-services/vpn/anyconnect-desktop.html), then execute ```sudo /etc/rc.d/vpnagentd start```. ```vpn``` and ```vpnui``` commands are now in ```/opt/cisco/anyconnect/bin/```. 
(from [Archlinux.org](https://bbs.archlinux.org/viewtopic.php?id=190444) )

## Uninstall

```shell
sudo pacman -R steam-manjaro
```

## Setup

```shell
sudo powertop --auto-tune
```

add redshift to autostart (via Autostart Setting in plasma gui)

set default audio output (on KDE this was not done)

setup VS-Code
```json
{
    "explorer.confirmDelete": false,
    "editor.wordWrap": "on",
    "editor.fontSize": 18,
    "latex-workshop.view.pdf.viewer": "tab",
    "terminal.integrated.fontSize": 16,
    "workbench.colorTheme": "Red",
    "workbench.colorCustomizations": {"[Red]": {"editor.background": "#3f3f3f"}}
}
```

Set up touchpad (Xface):
- to recognize single touch as a click: Mouse and Touchpad -> Devices -> Touchpad -> General
- to not change workspace when scrolling: Windows Manager Tweaks -> Workspaces
- to change workspace with 3 finger gestures (like on MacOS):
  - ```sudo pacman -S libinput (should be already installed)```
  - ```pacaur -S libinput-gestures (maybe also with pacman)```
  - ```sudo gpasswd -a $USER input```
  - ```libinput-gestures-setup autostart && libinput-gestures-setup start```
  - BEWARE TO ONlY SET CONFIG AT ```~/.config/libinput-gestures.conf```, otherwise my break lightdm if set in /usr/share/X11/
  - Used Config at ```~/.config/libinput-gestures.conf```, requires ```libinput-gestures-setup restart```:
    ```
    gesture swipe left 3 xdotool key ctrl+shift+Left
    gesture swipe right 3 xdotool key ctrl+shift+Right
    ```

### Docker with new subnet IP

To use docker without the need to have ```sudo``` in front of it, add yourself to the docker group: ```sudo gpasswd -a *user* docker```. Maybe a quite big security risk.

To let docker use a different bridge IP change 'docker.service' file. This may necessary if you want to use the Deutsche Bahn ICE Wifi, which has the same address as the standard bridge IP, but also consider other wifis and their address ranges. 
open File ```/etc/systemd/system/multi-user.target.wants/docker.service``` and set ```--bip``` Flag with new IP: ```ExecStart=/usr/bin/dockerd -H fd:// --bip "192.149.1.1/24"```
(from [StackOverflow](https://stackoverflow.com/questions/52225493/change-default-docker0-bridge-ip-address))


