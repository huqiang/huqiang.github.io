---
title: Mobile Safari Rotation Bug
author: nickhuq
layout: post
permalink: /2011/10/mobile-safari-rotation-bug.html
categories:
  - Apple
  - CS3216
  - iOS
tags:
  - iPad
  - iPhone
  - javascript
  - rotation
  - safari
---
# 

It may not be appropriate to call it a bug, but it is a problem I am faced with.

The scenario is that I am building a web application, the link is , which should resize based on the size of browser. I use javascript to detect the window size:

> `winW = window.innerWidth;
winH = window.innerHeight;`

Also I add resize() event to the window object:

> `$(window).resize( function(){`
> 
> //Here I will re-detect the size of the window, and then change the size of the container.
> 
> })

It works as expected in desktop browser. While I am testing on iPhone and iPad, the problem comes. It is fine when I open the page with iPhone/iPad vertically, and when I rotate the devices to horizontal view. If I rotate it back vertically again, the code “window.innerWidth” gives “wrong” result.

I suspect this is because of zooming in safari, because when zooming in twice, then window.innerWidth becomes half. It is likely safari use zooming to adjust contents when rotation happens.

I have come up with two solutions: 1, disable the zooming function of safari, because zooming is not very useful for the app I am building. I found some tips on this, but they did not work. 2, storing the size of browser window, and changing the size of container using the stored value. That means, I need to hand it in both mobile and desktop browser, since users can resize the window in desktop browsers which can have infinitely different window sizes.

I am still working on this. Any suggestion will be much appreciated and I will post the solution after I solve it.