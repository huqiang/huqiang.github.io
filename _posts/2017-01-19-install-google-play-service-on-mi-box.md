---
layout: post
title: "Install Google Play Service and YouTube on Mi Box"
date: 2017-01-18 20:29:09 +0800
---
Recently I found out [YouTube for Kids](https://kids.youtube.com) app. Then I really wanted to install it on my Xiaomi Mi Box, so I could play for my little daughter. Initially, I thought it would be as easy as to install YouTube TV, which I just downloaded from ApkMirror, and installed on Mi Box. It turned out not that easy, since YouTube for Kids requires Google Play Service. After several trial and errors, I finally managed to make it work.  
## Prerequisites:
* Able to side load `.apk` to Mi Box;
* Have a working mouse connected to Mi Box;

## Steps:
1. Root the Mi Box: I used [KingRoot](https://kingroot.net) to root my Mi Box. Since this app is not optimized for TV boxes, it requires a mouse to interact.
1. Install `Google Installer`. I do not have the official address to this download, so I cannot provide with an authenticated link to it.
1. Install `Link2SD`, which is available at [ApkMirror](http://www.apkmirror.com/apk/bulent-akpinar/link2sd/). 
1. Open `Link2SD` and grant it `root` rights. Make the 6 Google services `System App`, by clicking and holding mouse left to toggle the menu, then select the option.  
1. Restart Mi Box.
1. Open `Play Store` and input account information.
1. Re-install YouTube for TV and YouTube for Kids. 

That's it, have fun!