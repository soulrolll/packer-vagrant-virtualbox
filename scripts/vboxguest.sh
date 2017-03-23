#!/bin/bash

# Install dependencies
echo "==> Installing VirtualBox Guest Additions"
apt-get -y install linux-headers-$(uname -r) build-essential dkms  &> /dev/null

mkdir -p /mnt/virtualbox
mount -o loop /home/vagrant/VBoxGuest*.iso /mnt/virtualbox
sh /mnt/virtualbox/VBoxLinuxAdditions.run
ln -s /opt/VBoxGuestAdditions-*/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
umount /mnt/virtualbox
rm -rf /home/vagrant/VBoxGuest*.iso
