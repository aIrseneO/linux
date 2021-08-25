# This file content what I usually do when I install a new distro linux (Ubuntu
# in this case)
#
#TODO
# Kernel
#	To change the kernel that the system will boot with:
#grub-mkconfig | grep -E 'submenu |menuentry ' (get the desired version)
#vi /etc/default/grub (edit with the desired version)
#GRUB_DEFAULT="Advanced options for Ubuntu>Ubuntu, with Linux 4.15.0-101-generic"
#	Source:
#https://www.systutorials.com/how-to-make-grub2-boot-to-older-kernel-version-in-ubuntu-20-04/
#
#
# How to sign a kernel module Ubuntu 18.04
#https://superuser.com/questions/1438279/how-to-sign-a-kernel-module-ubuntu-18-04
#
#	To remove a kernel:
#apt remove linux-image-VERSION-generic linux-headers-VERSION-generic
#_______________________________________________________________________________
# Grub
#	To check the command used by the system at boot time:
#cat /proc/cmdline
#	To change this command edit the file:
#vim /etc/default/grub
#	To fix touchpad on lenovo-IdeaPad-5-15ARE05-setup
#		add this line to the file /etc/default/grub
#GRUB_CMDLINE_LINUX="initcall_blacklist=elants_i2c_driver_init"
#_______________________________________________________________________________
# Create a static DNS for SSH
#	Configure /etc/hosts by adding line:
#x.x.x.x hostname
#_______________________________________________________________________________
# SSH
#git config --global user.name "USERNAME"
#git config --global user.email "EMAIL"
#git config --global credential.helper 'cache --timeout=60'
#
#
# Usual installations
#systemctl enable bluetooth
#! /bin/sh
#apt update
#apt install terminator -y
#apt install vim -y
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#apt install ./google-chrome-stable_current_amd64.deb -y
#apt install git -y
#apt install x11-xserver-utils
#apt install openssh-server -y
#apt install net-tools
#snap install --classic code
#apt install virtualbox virtualbox-ext-pack -y
#apt install traceroute
#apt install firewalld
#apt install gufw
#apt install xdotool
#apt install dump
#apt install policycoreutils selinux-utils selinux-basics
#apt install apparmor-utils
#apt install debsums
#snap install discord
#apt install make
#apt install clang -y
#apt install qpdf -y
#apt install pdfmod -y
#apt install sysstat -y
#apt install net-tools -y
#
# Monitors configuration
#xrandr --output HDMI-A-0 --auto --primary --pos 0x0 --scale 1x1
#xrandr --output eDP --auto --pos 3840x548 --scale 1x1
