---
layout: post
title: "Fix Invalid URL to Google Calendar in Mountain Lion"
date: 2013-05-28 23:51
comments: true
categories: Mac
keywords: google calendar, apple, mountain lion, error, invalid url
description: 'To fix "CalendarAgent: AOSKit ERROR: (-) RAF: Invalid url --" in Mountain Lion'
---

If you are much annoyed, I believe you are if you landed this page by Googling, by tenths or even hundreds error messages in Console of 
```28/5/13 10:25:41.004 PM CalendarAgent[169]: AOSKit ERROR: (-) RAF: Invalid url -- https://USERNAME%40gmail.com@calendar.google.com/calendar/dav/USERNAME%40gmail.com/```
you might take a minute to read this post.

###The Cause: _Apple is the one to blame_
When we use __System Preferences__ -> __Mail, Contacts & Calendars__ to add our google accounts, and enable __Calendar & Reminders__ Apple sets the CalDAV url to `https://USERNAME%40gmail.com@calendar.google.com/calendar/dav/USERNAME%40gmail.com/`, but what Google API accepts is `https://USERNAME@calendar.google.com/calendar/dav/USERNAME%40gmail.com/`. That is the reason the Invalid URL error happens.
<!-- more -->
###The Solution
1.	Disable __Calendar & Reminders__ under __System Preferences__ -> __Mail, Contacts & Calendars__;
1.	Open __Calendar__ and add a account in __Preferences__ -> __Accounts__: select Account Type to be __CalDAV__, input your Google __USERNAME__(without @google.com), and password; and __Server Address__ as: `https://www.google.com/calendar/dav/`__USERNAME__`@gmail.com/user`

That's it and the error should be gone! Please feel free to post any comments.
:-)