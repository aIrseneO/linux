2! /bin/sh
sudo du --max-depth=1 -hx /
help ulimit
ps -elf
nice
renice
nice -5 cat &
ps -l
sudo renice -3 -p [_305001_]
#Allow user to use renice and others: /etc/security/limits.conf
#renice using GUI: gnome-system-monitor
ldd
ldconfig uses /etc/ld.so.conf
#change Soft limit: $renice  -S -n _424_
ipcs
ipcs -p
ps aux | grep -e [_cpid_] -e [_lpid_]
#list of signal: $kill  -l
#to send interrupt to the process 352674: $kill -s SIGINT [352674]
#or $kill -SIGINT [_352674_]
#SIGTERM (15) is the default signal
killall minishell; $pkill -u facko _352674_
rpm -q bash; rpm -V bash
/usr/lib/rpm/rpmrc
man zypper #on Suse system
zypper list-updates; zypper repos; zypper search <string>; zypper info <package>
zypper search --provides <package>
sudo zypper shell #to use zypper interactively and avoid 
# re-reading all the databases for each command
sudo zypper addrepo _URI_ _alias_
sudo zypper removerepo _alias_
sudo zypper clean [--all] # to clean up cache
sudo apt-file update;sudo apt-cache search <package>; apt-cache show <package>
apt-cache showpkg <package>; apt-cache depends <package>
apt-file search <package>; apt-file list <package>; apt-file find <file path>
sudo apt install [package]; sudo apt remove [package]; 
sudo apt --purge remove; sudo apt upgrade
sudo apt update; sudo apt dist-upgrade; #proper way to upgrade
sudo apt autoremove; sudo apt clean #clean up

dmesg -w; sudo tail -f /var/log/messages ; sudo tail -f /var/log/syslog #kernel
# related messages
/var/log/boot.log # System boot messages 
/var/log/messages; var/log/syslog # All important system messages
/var/log/secure # Security-related messages
logrotate; /etc/logrotate.conf
ls -lF /proc/sys # tunable system parameters
sudo sysctl kernel.threads-max=100000 # is equivalent to:
sudo bash -c 'echo 100000 > /proc/sys/kernel/threads-max'
sysctl
ls -lF /sys/class/net # Can examined Network devices
sar  # Systems Activity Reporter
sadc # System activity data collector, info in /var/log/sa
#ksar to generate nice graphs of sar data
vmstat -a 2 10000
man stess
man stress-ng # simulate various high load conditions
ps auxf; ps -elf; pa -eL; ps -C "bash"
ps -o pid,uid,cpputime # format
pstree -aAp <pid>
top; htop; ntop; atop # gnome-system-monitor or ksysguard
dd ; fg;
cat /proc/meminfo
cat /proc/sys/vm
vmstat --help; vmstat 2 4; vmstat -a 2 4 ; vmstat -SM -a 2 4
vmstat -d; vmstat -p /dev/<partition> 2 4
man iotop; man iostat; iotop --help #be: best effort, #rt: real time
ionice --help; man ionice
man bonnie++; sudo bonnie++ -n 0 -u 0 -r 100 -f -b -d /mnt
cat /sys/block/<device>/queue/scheduler #which I/O schedulers are available
cat /sys/block/<device>/queue/rotational #is SSD or not
sudo echo <scheduling method> > /sys/block/<device>/queue/scheduler #change op
ls -l iosched/ #to see th diff
cat /proc/filesystems # suppoted filesystems
man fdisk;
man blkid; sudo blkid -L root;
lsblk;
sudo dd if=/dev/sda of=mbrbackup bs=512 count=1 # partition back up
sudo dd if=mbrbackup of=/dev/sda bs=512 count=1 # partition restore
man sgdisk
sudo sgdisk --backup=/tmp/sda_backup /dev/sda
man parted; gparted
man gdisk; man sgdisk
cat /proc/partitions # partitions the operating system is currently aware of
man partprobe
man lsattr; man chattr
sudo mkfs -t ext4 /dev/sda10; sudo mkfs.ext4 /dev/sda10 # are the same
sudo touch /forcefsck; sudo reboot # do a fsck on the root filesystem
man mount; man umount; man fuser; man lsof 
/etc/fstab
cat /proc/swaps
man mkswap; man swapon; man swapoff
man quotacheck; man quotaon; man quotaoff; man quota; man edquota
echo "/dev/sdaX /home ext4 defaults,usrquota 1 2" >> /etc/fstab
sudo mount -o remount /home

sudo quotacheck -vu /home
sudo quotaon -vu /home
sudo edquota someusername
sudo quotacheck -ua
sudo quotacheck -ga
sudo quotacheck -u [somefilesystem]
sudo quotacheck -g [somefilesystem]
sudo edquota -u -p [userproto] [username]
df -hT
du -ah <filename>
man tune2fs
sudo dumpe2fs /dev/sda1| less
df -h /dev/sda1
sudo e4defrag -c <file>
man lvm

sudo fdisk </dev/sdaX>
man mdadm
man botparam
man sysctl; sysctl -a; man 2 sysctl; man sysctl.conf
man systemd
man modinfo; man lsmod; man rmmod; man insmod; man modprobe; man depmod; man mknod
man udev

cat /proc/cpuinfo

man qemu-img
man useradd; /etc/passwd; /etc/shadow ; /etc/login.defs ; /etc/nologin.txt
man userdel; man deluser; man delgroup
man usermod
man passwd; man chage ; bash -r; man bash -> /restricted shell
whoami; 
ssh-copy-id user@domain ; ssh user@domain; ssh-keygen; man ssh_config
/etc/group; /etc/gshadow; man groupadd; man groupmod; man groupdel; man usermod
man group; man id
man chown; man chgrp; umask; man getfacl; man setfacl
man pam.d
hostname --help; hostnamectl --help
man ip; ip link show wlo1
man ifconfig
lspci
