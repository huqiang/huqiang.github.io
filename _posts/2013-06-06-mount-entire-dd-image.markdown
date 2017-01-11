---
layout: post
title: "Mount entire DD image"
date: 2013-06-06 10:56
comments: true
categories: linux
description: "This is a simple guide to mount linux system backup made using dd."
keywords: linux, arch linux, raspberry pi, dd, mount, ext4
cover: "http://lh3.googleusercontent.com/-djwgkFfBKn8/UcJhWb4HAWI/AAAAAAAABXk/ymN8GQccjlk/s800/Linux-OS-images.jpg"
---
![Linux Logo](http://lh3.googleusercontent.com/-djwgkFfBKn8/UcJhWb4HAWI/AAAAAAAABXk/ymN8GQccjlk/s800/Linux-OS-images.jpg) Yesterday, my Raspberry Pi running Arch Linux was not able to boot with error: `Kernel Panic, not syncing: no init found`. I spent a night on it, but could not find a working solution. The last option is easy: reinstall the system. That is really the last resort, for I do not want to re-setup everything I have done: [samba server](/2013/03/life-of-pi-samba-server.html), Time Machine server, Xunlei Offline Downloader...  
## Unable to mount the SD card

The system does not boot, so I need to find a way to get into the file system to identify what is wrong, or at least backup all the configuration files.
<!--more-->
I cannot directly mount it on my Mac, due to the unsupported Ext4 format, although the boot partition can be mounted, as it is in FAT format. I did tried with ext4fuse and fuse-ext2 without luck.
I could neither connect the inter SD card reader to Parallel Desktop VM running Ubuntu, what a pity!
## Use DD to make the SD card to an image
This is really a workaround, but it indeed is the best solution I am having.  
*	Locate the SD card by running `diskutil list`. It is __disk2__  
*	Make image file using dd:
```sh
sudo dd if=/dev/disk2 of=~/Desktop/pi.img bs=1m
```

## Mount the image in Ubuntu
_I did this in my Parallel Desktop running Ubuntu._  
Use `fdisk` to list partition information of the image.	
```sh
fdisk -u -l pi.img
```
the result I got was:    
```sh 
Disk pi.img: 15.9 GB, 15931539456 bytes
255 heads, 63 sectors/track, 1936 cylinders, total 31116288 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x0004f23a

 Device Boot      Start         End      Blocks   Id  System
pi.img1   *        2048      186367       92160    c  W95 FAT32 (LBA)
pi.img2          186368    31116287    15464960   83  Linux
```
We will be using this command to mount the image:
```
mount -o loop, offset=[offset value] [path to image file] [path to mount point]
```
Take note of the unit size, __512__ byte here and the Start sector for each partition, which are used to calculate the offset.
Here I want to mount the second partition, pi.img2. With a simple calculation: 512 * 186368 = 95420416
```
sudo mount -o loop,offset=95420416 pi.img /media/pi
```
Ok, that's it. Now I am able to explore the files.