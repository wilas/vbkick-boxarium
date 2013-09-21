# Installing the virtualbox guest additions
# need kernel headers to compile module and virtualbox tools
apt-get -y install linux-headers-$(uname -r) dkms
# apt-get -y install libdbus-1-3
# VBoxGuestAdditions iso is attached (by vbkick) to IDE Controller port 1 device 0
if [ -b /dev/sr1 ]; then
    mount /dev/sr1 /mnt
elif [ -b /dev/sr0 ]; then
    mount /dev/sr0 /mnt
else
    exit 1
fi
sh /mnt/VBoxLinuxAdditions.run
umount /mnt