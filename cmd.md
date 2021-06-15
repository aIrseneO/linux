ls -lF /sys/class/net # Can examined Network devices
```
$ sudo du --max-depth=1 -hx /
```
# Package management
## Shared object dependencies
```
man ldd; ldd <bin (e.g.: a.out)>; man ldconfig
```

```
rpm -q bash; rpm -V bash
```
> /usr/lib/rpm/rpmrc
## Suse system
```
man zypper
zypper list-updates; zypper repos
zypper search <string>; zypper info <package>
zypper search --provides <package>
```
## Use zypper interactively and avoid re-reading all the databases for each cmd
```
sudo zypper shell
```
```
sudo zypper addrepo <URI> <alias>
sudo zypper removerepo <alias>
```
### to clean up cache
```
sudo zypper clean [--all] 
```
```
sudo apt-file update; sudo apt-cache search <package>
apt-cache show <package>; apt-cache showpkg <package>
apt-cache depends <package>; apt-file search <package>
apt-file list <package>; apt-file find <file path>
sudo apt install [package]; sudo apt remove [package]; 
sudo apt --purge remove; sudo apt upgrade
```
### proper way to upgrade
```
sudo apt update; sudo apt dist-upgrade
```
### clean up
```
sudo apt autoremove; sudo apt clean
```
# Monitoring
> gnome-system-monitor
```
dmesg -w
vmstat -a -S m 2 10
top; htop; ntop; atop
man sar
man sadc
sudo tail -f <Log file>
```
## Log files:
> /var/log/boot.log
> /var/log/messages
> /var/log/syslog
> /var/log/secure
## Rotate log files
```
man logrotate
```
> /etc/logrotate.conf

## configure kernel parameters at runtime
Configurable files are located at:
> /proc/sys/...
```
sudo sysctl kernel.threads-max=100000
```
is equivalent to:
```
sudo bash -c 'echo 100000 > /proc/sys/kernel/threads-max'
```
## Stress the system to monitor variations:
```
man stess
man stress-ng
```
# Process usage
## Security configuration to limit users action on the system:
> /etc/security/limits.conf
## Nice and Renice:
```
nice -5 cat &
sudo renice -3 --pid <pid>
```
## Inter-process communication:
```
ipcs
ipcs --help
```
## Process limits:
```
ipcs -l --human [-p <pid>]
prlimit [--pid <pid>]
ulimit [-H/-S] -a
ulimit [-H/-S] -n <value>
man setrlimit; man getrlimit; man ulimit
```
## Send a signal to process(es):
```
kill -l; kill -s INT <pid>
killall -l; killall -i -s INT bash
man killall5
man 7 signal
pkill --signal INT -u root bash
```
## List processes:
```
ps -C "bash"
pgrep -u root bash

ps -o pid,uid,cpputime
pstree -aAp <pid>

ps -l; ps -lax
ps auxf; ps -elf; pa -eL; 
```


dd ; fg;

cat /proc/meminfo
cat /proc/sys/vm

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
man ping; man traceroute
man mtr; sudo mtr --report-cycles 3 <routeIp>
man ethtool; ethtool enp0s25; man netstat; netsat -r
man nmap; nmap localhost; man tcpdump; man iptraf

man lynx; man elinks; man w3m
man wget; wget <url>
man curl; curl <url>; curl -o saved.html <url>
man ftp; man sftp; ftp ip; mget filename; mput filename; lcd dirpath; bye
man dhclient; dhclient enp0s25

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
rsync --progress -avrxH  --delete sourcedir destdir
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

pandoc filename.md -o filename.pdf; man pandoc

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
man at; at --help
at 00:42 AM 4/20/2022 -f ./myScript.sh

ma sort; man uniq; man paste; man join; man split
sort -k 3 <filename>
paste -d, <file1> <file2>
join <file1> <file2>

dd if=<file> of=/dev/stdout 2> /dev/null #Another way to cat a file
lsblk -o +UUID; cat /etc/fstab #check UIID
sudo chattr +a cmd.md
for ((i=0; i<100;i++ )); do echo $i; done
sudo mdadm --zero-superblock /dev/<sdaX> # RAID device removal
sudo mdadm --detail /dev/mdX # RAID device removal
sudo mdadm --stop /dev/mdX # RAID device removal
