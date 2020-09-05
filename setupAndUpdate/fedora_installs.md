# Fedora installs

[VS Code](https://code.visualstudio.com/docs/setup/linux):
```shell
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf check-update
sudo dnf install code
```

[Gestures](https://unix.stackexchange.com/questions/515382/how-do-i-enable-touch-gestures-in-fedora-mate-gnome-kde):
```shell
# Install Requirements
sudo dnf install \
    xdotool \
    wmctrl \
    git

# Add Groups
sudo gpasswd -a $USER input
exec sg input newgrp $(id -gn)

# Add Multitouch Gestures
ORG_DIR=$PWD
cd /usr/src
sudo git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install
libinput-gestures-setup autostart
libinput-gestures-setup start
cd $ORG_DIR
```

[Docker](https://blog.christophersmart.com/2019/12/15/enabling-docker-in-fedora-31-by-reverting-to-cgroups-v1/) + Same link as in Manjaro:
Change /lib/systemd/system/docker.service but with the same edits as in Manjaro Installs.
- sudo dnf install grubby
- sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
- or use podman / podman-compose

[Flatpak](flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo):
```shell
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

[VirtualBox](https://www.if-not-true-then-false.com/2010/install-virtualbox-with-yum-on-fedora-centos-red-hat-rhel/):
```shell
su -
cd /etc/yum.repos.d/
wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
dnf update
dnf install VirtualBox
```

[Bluetooth](https://askubuntu.com/a/155886):
set AutoEnable=true zu false machen.

[Wine](https://www.fosslinux.com/39908/how-to-install-wine-on-fedora-workstation.htm)
- dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/32/winehq.repo 
- sudo dnf install winehq-stable

[Firefox Encodings](https://rpmfusion.org/Configuration):
- sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
- sudo dnf install ffmpeg ffmpeg-libs