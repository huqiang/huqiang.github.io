---
title: Provisioning for a Million Eyeballs
author: nickhuq
layout: post
permalink: /2011/10/provisioning-for-a-million-eyeballs.html
geo_latitude:
  - 1.294311
geo_longitude:
  - 103.769708
geo_public:
  - 1
categories:
  - CS3216
---
# 

This is my first time being so late for a post. Last week was not easy for me. I had too much work(coding) to do. I stayed up until 4am every night. Then I was sick, and still have not fully recovered yet. Now I am at the rehearsal of Eusoff Hall Talent Time, on duty for AudioWorks. I am using the iPad writing this post, for the first time I find it is useful.

As usual, last lecture was also very useful, especially for me, a webmaster. Some of the topics are still beyond my scope now, like multiple servers, load balancing. But I do have thought about some others, and even done some work on them. Here I would like to share some points.

**Loading time for website**  
As social networking is playing a important role in our daily life, many websites have the social plugins, including Tweet, Facebook Like, to make the sites more wide-spread. For some well-known reasons, people in China, my who contribute the second most of the traffic for my site, cannot access either Facebook or Twetter. When they are visiting my site, the page keeps loading, to get the plugins, for more than one time, but ends with error messages. I thought it was really bad user experience. So I tried to look for way to remove/hide those plugins for them.  
What I did was writing some php code, to get IPs of the visitors, and to locate their country based on the IPs. If you navigate to [here][1], you should see your country. If not, please drop me a message, so I can debug. It sounds easy, but I did have some trouble doing it, and I will write another post later to share that.

 [1]: http://www.huqiangty.com/lab/getVisitorCountry.php

**Caching of reloading**  
How good if this lecture had been before our first assignment!  
In our first assignment, The Claw, I really did some naive things. To check if a user is logged in, we connect to Facebook on every page! Based o. Other conditions: it is a flash game and the server is at Virginia, the loading time for our app is really long! If we were doing it now, we would consider these and could do better.

**Application and database logging**  
Only after our app in assignment one was hacked and I failed to trace the log of database, did I realize how crucial it is to log. Also, days ago, I fixed a serious bug on my Mac, by reading the log.  
However, for most of the time, I find logs are really hard to find and harder to read! Some of them contain binary codes, low level language as well as English… Anyway, we need not only read but also write log in the future.

I just hope I can fully recovery soon, so that I can be dedicated to all my works. Everyone, do take care of yourself!