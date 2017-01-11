---
title: 'Final Project &#8212; Be MAD'
author: nickhuq
layout: post
permalink: /2011/10/final-project-be-mad.html
categories:
  - CS3216
tags:
  - book reader
  - final project
  - make a deference
---
# 

Time flies so fast this semester! It is now the final phase before I wake up. As for the final project, we really what to make a different, making use of what we have learnt so far. We may not change the world, but as long as we can change a little for some people, it is good enough.

*   **What is the application we are going to build?**

Basically, it is going to be an online book reader, which is built with HTML5 so it can be used in various platforms, desktops/laptops, tablets, and mobile phones, in depending of what operating system the devices are using. This idea came when [Shaohuan and I were meeting a startup in NUS][1]. The company has 5000 books, and we wanted to make use of (sell) them, in a nice way. Later we realized we might not dependent on this company. Rather than making an app for the company, we would better make it for users. That is we will make users have access to more books than the company has.

 [1]: http://www.huqiangty.com/2011/09/a-day-of-projects/

*   **What are the problems we are going to solve?**

There are quite many book reading applications. They more or less have these two common problems:

1), Many people will read on deferent platforms in different conditions. For example, they will read on desktop/laptop at home, but read on phones when they are on bus/MRT. The problem is that the reading progress is not the same in different devices. Users have to spend time locating where they stopped reading.

2), There are two ways to getting books: downloading from the internet and reading offline, and reading online. The problem for the former one is that users have to store a copy in deferent devices. As for the later one, users cannot be able to read, or the loading time is rather long when the internet access is bad, like when they are on MRT.

A HTML5 clouding application can solve both of the problems mentioned. It can store the bookmarks and user settings in the cloud (server), and synchronize among all devices. SO the users will not feel any deference when switching devices. Also by making use of the application cache of HTML5 to store whole of part ion of the books the users are reading to their devices, users can even read without internet connection.

*   **What are the challenging?**

1, How to prevent people from stealing our books, especially the copyrighted ones? There are two proposed solutions: drawing the text in canvas and disable selecting and coping. Drawing the text in canvas can make the display more beautiful, but it definitely needs much processing power, so the application may crash in mobile devices! Disabling the selecting and coping functions are simpler, and IVLE uses this way for taking quizzes. Thus I think we are going to implement the second solution

2, How do we deal with different phone screen sizes? This is quite challenging, since there are huge number of deferent phone screen sizes, and most phones can switch in portrait and landscape views. My idea is to come out with two basic designs: for portrait and landscape views. Then use [responsive web design][2], to make the application adjust itself to suit deferent screen sizes.

 [2]: http://www.alistapart.com/articles/responsive-web-design/

3, What about non-smart phones without supporting HTML5? We don’t have enough time to consider that situation since most of the people and Prof Ben are having smart phones. We can support there phones by just displaying the text without having fancy UI. That a future work.

*   **Some more thoughts**

I think we’d better reduce use of javascript. Javascript runs on the browsers, and using it too much is not a good way to clouding applications. Clouding programming is to run on the server and return the results to clients. Also, running javascript requires good CPU that not many mobile devices have a good one. I have a basic layout [here][3], which uses javascript to remove the redundant elements when it is viewed on mobile devices. It is tested well on desktop browsers. However, I can really see the lag when I use iPad to view it. The best mobile device, iPad, has the lag. I really cannot image what will happen if I use a another device.

 [3]: http://www.huqiangty.com/lab/layout.html

I have imba teammates who have high skill of programming and responsibility. It is fun to work with them and I am sure we can be MAD–make a deference!