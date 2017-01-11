---
title: A Bug in Google News Search
author: nickhuq
layout: post
permalink: /2011/09/a-bug-in-google-news-search.html
categories:
  - Computing
tags:
  - Google
  - Google bug.
  - Google News
---
# 

In Google News search, the left navigation bar overlays the search result, see the image below:

![][1]

 [1]: http://huqiangty.com/wp-content/post-img/2011-09-25-google-bug-overview.png "Google News bug overview"

This was in Safari

After implementing elements in both Safari and Chrome, I found this bug only exists in Safari where the width of the left navigation bar, 175px, is greater than that in Chrome.

![][2]

 [2]: http://huqiangty.com/wp-content/post-img/2011-09-25-google-bug-in-safari.png "Google News bug in Safari"

Viewed in Safari, the width is 175px

![][3]

 [3]: http://huqiangty.com/wp-content/post-img/2011-09-25-google-bug-in-chrome.png "Google News bug in Chrome"

In Chrome, the width is 132px, which is good enough.

I suspect this is just a typo. Hopefully Google can fix it very soon.

 