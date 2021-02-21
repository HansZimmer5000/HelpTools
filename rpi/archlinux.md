# Arch Linux

```bash
if [ $(whoami) != root ]; then
    echo "Must be sudo"
    exit 1
fi

umount boot root
rm -fr boot root
rm -f ArchLinuxARM-rpi-*

fdisk /dev/mmcblk0
# type: o,p,n,p,1,<enter>,+200M,t,c,n,p,2,<enter> twice,w
mkdir root boot
mkfs.vfat /dev/mmcblk0p1 ; mkfs.ext4 /dev/mmcblk0p2
mount /dev/mmcblk0p1 boot ; mount /dev/mmcblk0p2 root

if ! [ -f ArchLinuxARM-rpi-latest.tar.gz ]; then
    wget http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-latest.tar.gz
fi

bsdtar -xpf ArchLinuxARM-rpi-latest.tar.gz -C root
sync
mv root/boot/* boot
umount boot root
rm -fr boot root
# on pi:
#pacman-key --init
#pacman-key --populate archlinuxarm
```