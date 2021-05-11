List of available LINUX distributions can be find [here](https://lwn.net/Distributions/).
# FHS Linux Standard Directory Tree
The Filesystem Hierarchy Standard ([FHS](https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.pdf)) is administered originally by the Free Standards Group.<br>
| DIRECTORY | IN FHS | PURPOSE |
| --------- | ------ | ------- |
|/|Yes|Primary directory of the entire filesystem hierarchy.|
|/bin|Yes|Essential executable programs that must be available in single user mode.|
|/boot|Yes|Files needed to boot the system, such as the kernel (vmlinuz), initrd or initramfs images, and boot configuration files and bootloader programs.|
|/dev|Yes|Device Nodes, used to interact with hardware and software devices.|
|/etc|Yes|System-wide configuration files.|
|/home|Yes|User home directories, including personal settings, files, etc.|
|/lib|Yes|Libraries required by executable binaries in /bin and /sbin.|
|/lib64|No|64-bit libraries required by executable binaries in /bin and /sbin, for systems which can run both 32-bit and 64-bit programs.|
|/media|Yes|Mount points for removable media such as CDs, DVDs, USB sticks, etc.|
|/mnt|Yes|Temporarily mounted filesystems.|
|/run|No|store transient files that contain runtime information.|
|/opt|Yes|Optional application software packages.|
|/proc|Yes|Virtual pseudo-filesystem giving information about the system and processes running on it. Can be used to alter system parameters.|
|/sys|No|Virtual pseudo-filesystem giving information about the system and processes running on it. Can be used to alter system parameters. Similar to a device tree and is part of the Unified Device Model.|
|/root|Yes|Home directory for the root user.|
|/sbin|Yes|Essential system binaries.|
|/srv|Yes|Site-specific data served up by the system. Seldom used.|
|/tmp|Yes|Temporary files; on many distributions lost across a reboot and may be a ramdisk in memory.|
|/usr|Yes|Multi-user applications, utilities and data; theoretically read-only.|
|/var|Yes|Variable data that changes during system operation.|

<br>Different types of filesystems supported by Linux:
* Conventional disk filesystems: ext2, ext3, ext4, XFS, Btrfs, JFS, NTFS, etc.
* Flash storage filesystems: ubifs, JFFS2, YAFFS, etc.
* Database filesystems
* Special purpose filesystems: procfs, sysfs, tmpfs, squashfs, debugfs, etc.<br><br>

# Programs, Processes, and Threads
A **program** is a set of instructions, along with any internal data used while carrying the instructions out. Programs may also use external data.<br>
A **process** is an executing program and associated resources, including environment, open files, signal handlers, etc.<br>
A **Thread** is the segment of a process, meaning that a process can have multiple threads and these multiple threads are contained within a process. A thread have 3 states: running, ready, and blocked.
# Git
The source code for git can be obtained [here](https://mirrors.edge.kernel.org/pub/software/scm/git/) and full documentation [here](https://mirrors.edge.kernel.org/pub/software/scm/git/docs/).
# Package management system
The lower-level package utilities such as rpm and dpkg deal with the details of installing specific software package files and managing already installed software. The higher-level package management systems (such as yum, dnf, apt and zypper) work with databases of available software and incorporate the tools needed to find, install, update, and uninstall software in a highly intelligent fashion.
## The Red Hat Package Manager [RPM](https://rpm.org/)<br>
It is used by a number of major distributions (and their close relatives) to control the installation, verification, upgrade, and removal of software on Linux systems. The low-level rpm program can perform all these operations, either on just one package, or on a list of packages
```bash
man rpm
```
The standard naming format for a binary RPM package is:<br>
**name-version-release.distro.architecture.rpm**<br>
## YUM, the interactive, RPM based, package manager
It Is used by the majority (but not all) of distributions that use rpm, including RHEL, CentOS, and Fedora. It performs dependency resolution when installing, updating, and removing software packages. YUM can manage packages from installed repositories in the system or from .rpm packages.
## DNF, the next-generation replacement for YUM
DNF is a software package manager that installs, updates, and removes packages on Fedora and is the successor to YUM (Yellow-Dog Updater Modified). DNF makes it easy to maintain packages by automatically checking for dependencies and determines the actions required to install packages. It underlies YUM in RHEL 8.
## ZYPPER package manager
For use on SUSE-based systems, the zypper program provides a higher level of intelligent services for using the underlying rpm program, and plays the same role as yum on Red Hat-based systems. It can automatically resolve dependencies when installing, updating and removing packages. It accesses external software repositories, synchronizing with them and retrieving and installing software as needed.
## The Debian Package Manager [dpkg](https://man7.org/linux/man-pages/man1/dpkg.1.html)<br>
It's the lower-level package utilities for debian based distributions. The standard naming format for a binary package is:<br>
**name_version-revisionNumber_architecture.deb**
 ## APT - Advanced Packaging Tool
  APT set of programs provides a higher level of intelligent services for using the underlying dpkg program, and plays the same role as yum on Red Hat-based systems. Usefull link [package](https://www.debian.org/distrib/packages) and [Ubuntu Packages Search](https://packages.ubuntu.com/).
# Process and Load Monitoring Utilities
  | UTILITY | PURPOSE | PACKAGE |
  |-------- | ------- | ------- |
|top|Process activity, dynamically updated|procps|
|uptime|How long the system is running and the average load|procps|
|ps|Detailed information about processes|procps|
|pstree|A tree of processes and their connections|psmisc (or pstree)|
|mpstat|Multiple processor usage|sysstat|
|iostat|CPU utilization and I/O statistics|sysstat|
|sar|Display and collect information about system activity|sysstat|
|numastat|Information about NUMA (Non-Uniform Memory Architecture)|numactl|
|strace|Information about all system calls a process makes|strace|
<br>

## Memory Monitoring Utilities
  | UTILITY | PURPOSE | PACKAGE |
  |-------- | ------- | ------- |
|free|Brief summary of memory usage|procps|
|vmstat|Detailed virtual memory statistics and block I/O, dynamically updated|procps|
|pmap|Process memory map|procps|
<br>

## I/O Monitoring Utilities
  | UTILITY | PURPOSE | PACKAGE |
  |-------- | ------- | ------- |
|iostat|CPU utilization and I/O statistics|sysstat|
|sar|Display and collect information about system activity|sysstat|
|vmstat|Detailed virtual memory statistics and block I/O, dynamically updated|procps|
<br>

## Network Monitoring Utilities
  | UTILITY | PURPOSE | PACKAGE |
  |-------- | ------- | ------- |
|netstat|Detailed networking statistics|netstat|
|iptraf|Gather information on network interfaces|iptraf|
|tcpdump|Detailed analysis of network packets and traffic|tcpdump|
|wireshark|Detailed network traffic analysis|wireshark|
<br>

## top
  | Command | Output |
  |---------|--------|
  | 1 | Display or hide cpu(s) information|
  | 2 | Display or hide memory information|
  | t | Display or hide summary information (rows 2 and 3)|
  | m	| Display or hide memory information (rows 4 and 5)|
  | A	| Sort the process list by top resource consumers|
  | r	| Renice (change the priority of) a specific processes|
  | k	| Kill a specific process|
  | f	| Enter the top configuration screen|
  | o	| Interactively select a new sort order in the process list|
  | man top | for more....<br>
