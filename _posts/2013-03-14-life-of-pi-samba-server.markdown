---
layout: post
title: "Life of Pi -- Samba Server"
date: 2013-03-14 00:46
comments: true
categories: Linux
tags: [ArchLinux, Samba, exFat]
keywords: samba, linux, exfat, pi
---

### Update: 
Fix the issue of not having writing permission on the mounted exFAT disk:
In **/etc/fstab** add:
``` sh
/dev/sda1	/media/Media	exfat	rw,async,umask=0	0	0
```
And then mount the disk:
``` sh
sudo mount -a
```

---

---

I have a 2T external hard disk that is partioned into:  
*  1.5T of exFAT format to store media files  
*  0.5T of HFS+ as TimeMachine  
``` sh
   Device Boot      Start         End      Blocks   Id  System
/dev/sda1               2  2930667377  1465333688    7  HPFS/NTFS/exFAT
/dev/sda2   *  2930667379  3906967727   488150174+  af  HFS / HFS+
```

What I want to do is to mount the hard disk to my Raspberry Pi running Arch Linux ARM, then it can be used wirelessly as media hub and TimeMachine.

### Mount the disk
In order to mount exFAT formatted disks, we have to install *fuse-exfat* and *exfat-utils*
``` sh 
sudo pacman -S fuse-exfat exfat-utils
```
<!-- more -->
After install the packages, we need to reboot the system:
```
sudo reboot
```
<del>
After rebooting, we should be able to mount the exFAT formatted disk  
sudo mount -t exfat-fuse /dev/sda1 /media/Media
</del>
### Setup samba
Install samba:
``` sh
sudo pacman -S samba
```

Copy the default conf file:
``` sh
sudo cp /etc/samba/smb.conf.default /etc/samba/smb.conf
```

Open the configuration file:
``` sh
sudo vim /etc/samba/smb.conf
```

Insert this after **Share Definitions**:
``` sh
[Media]
        path=/media/Media
        valid users     =       USERNAME
        public          =       no
        writable        =       yes
        printable       =       no
        create mask     =       0644
```
Add a user: 
This is to add a user to Samba, and this user must exists in linux.
``` sh
pdbedit -a -u USERNAME
```

Start Samba:
``` sh
sudo systemctl start smbd
```

I mounted and shared the TimeChine partition too. However, Mac OS X does not support TimeChine over Samba:
``` sh
sudo tmutil setdestination /Volumes/TM
/Volumes/TM: Incompatible file system type: smbfs (error 45)
The backup destination could not be set.
```

My next step is to setup TimeMachine over AFP