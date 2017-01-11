---
title: Make Tired Lion Run Fast
layout: post
permalink: /2011/08/make-tired-lion-run-fast.html
categories:
  - Apple
  - Mac OS X
tags:
  - apple
  - cleanmymac
  - fast
  - Lion
  - mac
  - osx
  - slow
  - snow leopard
  - system
---
# 

After updating my early 2011 MacBook Pro 13” to Apple’s new operating system, Mac OSX Lion, I am deeply attracted by the new features. However, as nothing is perfect, I am much annoyed by the long startup and shutdown time, which is almost twice of that in Snow Leopard! That makes me back to the age of vista!

I searched via Goole and I found many people have this problem as I do, even the startup time for some SSD installed Mac is 3-4 minutes! I know it shouldn’t have this problem if I format my disk and install Lion in a clean disk. But, I was bothered to do that, because I have no extra disk to backup my datas; and I really like the new easy way to updating an operation system.

I found and tried many solutions proposed by other Mac users. Some people said they worked, however they are not useful to me. I suspected that the problem is caused by some software installed during the time of Snow Leopard (especially some hard-to-see plugins) conflicting with Lion King. Then I tried clean everything I think is not necessary using [CleanMyMac][1]. What I cleaned and uninstalled are Caches and Plugins (under Extensions, in CleanMyMac). Fortunately, it worked and my startup time backed to normal!

 [1]: http://macpaw.com/

In case this solution doesn’t work for you, I summarize all the solutions I found for your reference:

*   1, repairing disk permissions:

Go to Applications -> Utilities -> Disk Utility, select your disk and click Restore Disk Permissions.

*   2, delete caches:

In Finder, click Go -> Go to Folder, type /Library/ and delete everything under Caches folder.

*   3, reset Spotlight index:

Open Terminal and type: sudo mdutil -i off /

Enable it later by type: sudo mdutil -i on / && sudo mdutil -E /

*   4, delete Network Account Server (applicable for those used that before):

Go to System Preference -> Users & Groups, unlock and then delete anything red in Network Account Server. (It is empty for mine under Network Account Server).

Ok, that’s all I have. Hopefully it can help you.:-)