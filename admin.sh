#! /bin/sh
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
man nmtui; nmtui
man nmcli-examples; man nmcli; nmcli --help
man dig; man host; man nslookup
[dig | host | nslookup] google.com
man ping; man traceroute; man mtr
firewall-cmd --help
sudo firewall-cmd --permanent --zone=trusted --add-source=192.168.1.0/24
man shutdown; man reboot; man halt; man poweroff; shutdown --help
man grub-install; grub-install --help
man telinit
systemctl --help
systemctl list-units -t service --all
man runlevel; runlevel
man telinit; telinit 3
ls -la /etc/rc*.d/; man chkconfig
ls -la /etc/rc*.d/; man chkconfig
service x-serviec status
service --status-all
man tar; tar [-cvf/-cMf/-dvf/-tf/-xvf/-xpvf] file.tar [file]
tar --create --newer '2021-12-12' -vf backup.tar file
tar --create --after-date '2021-12-12' -vzf backup.tar file
tar zcvf source.tar.gz source
tar jcvf source.tar.bz2 source
tar Jcvf source.tar.xz source
tar xzvf source.tar.gz
tar xjvf source.tar.bz2
tar xJvf source.tar.xz
dd if=input-file of=output-file options
dd --help;
dd if=/dev/zero of=outfile bs=1M count=10; dd if=/dev/sda of=/dev/sdb
dd if=/dev/sda of=sdadisk.img; dd if=/dev/sda1 of=partition1.img
dd if=/dev/cdrom of=tgsservice.iso bs=2048;
dd if=ndata conv=swab count=1024 | uniq > ofile
rsync --help; rsync [options] sourcefile destinationfile
ls | cpio --create -O /dev/st0
cpio -i somefile -I /dev/st0; cpio -t -I /dev/st0
man dump; man restore; sudo restore -rvf /tmp/boot_backup
man mt; mt --help
getenforce; sudo setenforce Permissive
touch 42; ls -Z; ps auZ; chcon -t ect_t 42; ls -Z; chcon --reference 42 so; ls -Z
restorecon --help; man restorecon
mkdir dir ; ls -Z| grep dir; sudo semanage fcontext -a -t etc_t dir; ls -Z | grep dir; restorecon -RFv dir; ls -Z| grep dir; rm -rf dir
man setsebool ; man getsebool; semanage boolean -l
tail -f /var/log/messages
sestatus
sudo setenforce 0; sudo vi /etc/selinux/config
apparmor_status; man apparmor
aa-enforce; aa-complain
mount -o ro,noexec,nodev /dev/sda2 /mymountpt
/etc/fstab: /dev/sda2 /mymountpt ext4 ro,noexec,nodev 0 0
chmod u+s somefile; chmod g+s somefile
man debsums; debsums --help
man aide; aide --help
man lshw #+++++++++++++
for f in ./*; do mv "$f" $(echo "$f" | cut -d - -f 2); done
man test
lsusb; man lsusb
man lp; lp -d printer <filename>; lpq -a; lpadmin --help; lpoption --help
man lpstat; lpstat -s; lpstat -a; lprm job-id; lpmove job-id newprinter
man enscript; enscript -p psfile.ps textfile.txt;
enscript -n -p psfile.ps textfile.txt; enscript textfile.txt
man ghostscript; man pdf2ps; man ps2pdf
pdf2ps file.pdf	#Converts file.pdf to file.ps
ps2pdf file.ps	#Converts file.ps to file.pdf
pstopdf input.ps output.pdf	#Converts input.ps to output.pdf
pdftops input.pdf output.ps	#Converts input.pdf to output.ps
convert input.ps output.pdf	#Converts input.ps to output.pdf
convert input.pdf output.ps	#Converts input.pdf to output.ps
man evince; 
man qpdf; qpdf --help
#Merge the two documents 1.pdf and 2.pdf. The output will be saved to 12.pdf.
qpdf --empty --pages 1.pdf 2.pdf -- 12.pdf	
#Write only pages 1 and 2 of 1.pdf. The output will be saved to new.pdf.
qpdf --empty --pages 1.pdf 1-2 -- new.pdf	
#Rotate page 1 of 1.pdf 90 degrees clockwise and save to 1r.pdf
qpdf --rotate=+90:1 1.pdf 1r.pdf
#Rotate all pages of 1.pdf 90 degrees clockwise and save to 1r-all.pdf
qpdf --rotate=+90:1-z 1.pdf 1r-all.pdf
#Encrypt with 128 bits public.pdf using as the passwd mypw with output as private.pdf
qpdf --encrypt mypw mypw 128 -- public.pdf private.pdf
#Decrypt private.pdf with output as file-decrypted.pdf. 
qpdf --decrypt --password=mypw private.pdf file-decrypted.pdf

#Merge the two documents 1.pdf and 2.pdf. The output will be saved to 12.pdf
pdftk 1.pdf 2.pdf cat output 12.pdf
#Write only pages 1 and 2 of 1.pdf. The output will be saved to new.pdf.
pdftk A=1.pdf cat A1-2 output new.pdf
#Rotate all pages of 1.pdf 90 degrees clockwise and save result in new.pdf.
pdftk A=1.pdf cat A1-endright output new.pd
pdftk public.pdf output private.pdf user_pw PROMPT

#Combine three PDF files (1.pdf, 2.pdf & 3.pdf) into one 4.pdf
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite  -sOutputFile=4.pdf 1.pdf 2.pdf 3.pdf
#Split pages 10 to 20 out of a PDF file
gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dDOPDFMARKS=false -dFirstPage=10 -dLastPage=20 -sOutputFile=split.pdf file.pdf

man pdfinfo; 
man flped; #add data to a PostScript document
man pdfmod #simple application that provides gui for modifying PDF documents

touch dmesg.ps
enscript -p dmesg.ps /var/log/dmesg
ps2pdf dmesg.ps
evince dmesg.pdf

cups # http://localhost:631
man last
/etc/sudoers #who where = (as_whom) what
man visudo
man sha512sum; echo -n test | sha512sum
sleep 1000; ctrl+z; bg; fg
sleep 1000; ctrl+z; jobs;jobs -l
w; uptime
ps axo command,pid,stat,priority|head; ps aux|head
