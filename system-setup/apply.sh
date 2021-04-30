# This file content what I usually do when I install a new distro linux (Ubuntu
# in this case)
#
#TODO
# Kernel
#	To change the kernel that the system will boot with:
#sudo grub-mkconfig | grep -E 'submenu |menuentry ' (get the desired version)
#sudo vi /etc/default/grub (edit with the desired version)
#GRUB_DEFAULT="Advanced options for Ubuntu>Ubuntu, with Linux 4.15.0-101-generic"
#	Source:
#https://www.systutorials.com/how-to-make-grub2-boot-to-older-kernel-version-in-ubuntu-20-04/
#
#	To remove a kernel:
#sudo apt remove linux-image-VERSION-generic linux-headers-VERSION-generic
#_______________________________________________________________________________
# Grub
#	To check the command used by the system at boot time:
#cat /proc/cmdline
#	To change this command edit the file:
#sudo vim /etc/default/grub
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

#sudo systemctl enable bluetooth
