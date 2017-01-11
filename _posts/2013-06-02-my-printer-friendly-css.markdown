---
layout: post
title: "My printer friendly CSS(updated)"
date: 2013-06-02 13:15
comments: true
categories: webhosting
keywords: CSS, printer-friendly
description: "This is my print.css which is used when visitors what to print pages."
cover: "http://lh6.googleusercontent.com/-lCoo_0HpStY/UcJg9O7HVJI/AAAAAAAABXA/HicEQ0DGzuI/s800/css-logo.jpg"
---
![CSS Logo](http://lh6.googleusercontent.com/-lCoo_0HpStY/UcJg9O7HVJI/AAAAAAAABXA/HicEQ0DGzuI/s800/css-logo.jpg)  
I do want my webpages printed out nicely, especially my [Resume](/resume), which should not contain the unnecessary elements, e.g. site title, side bar, comments... According to w3schools.com, [CSS Media Type](http://www.w3schools.com/css/css_mediatypes.asp) can help me achieve the goal by providing different sets of CSS for various outputs.
Below is the CSS I have written, you can copy and save it if you want. 
<!--more-->
You need to add this to your `/source/_includes/head.html`, or just header of your htmls if you are not using **Octopress**.  

```html
  <link href="{{ root_url }}/stylesheets/print.css" media="print" rel="stylesheet" type="text/css">
```
PS: `#comments` and `#post_links` are IDs I put for comment section and posts navigation section, which are not originally included in Octopress, you may either ignore them or you can go to `/source/_includes/post.html` to add them.

```css
@media only print{

/*
Body
*/
body {
	width: 100% !important;
	margin: 0 ;
	padding: 0 ;
	font-family: Garamond, Perpetua, "Nimbus Roman No9 L", "Times New Roman", serif;
	color: #000 !important;
	background: none !important;
	font-size: 11pt !important;
}

h1 {
	font-size: 18pt;
	float: center;
}
h2 {
	font-size: 16pt;
}
h3 {
	font-size: 14pt;
}
h4,h5,h6{
	font-size: 12pt;
}
h1 a,h2 a,h3 a,h4 a,h5 a,h6 a {
	text-decoration: none !important;
}

img.right {
	float: right;
	margin-right: 20px;
}

img.left {
	float: left;
	margin-left: 20px;
}

img.center {
	margin: 0 auto;
}

article>header {
	padding-top: 0;
}

article>header>.meta{
	display: none;
}

article>header>.entry-title{
	text-align: center;
}

/*
remove border
*/
body>div>div {
border: none !important;
}

code {
word-wrap: break-word;
}

/*
Removes unnecessary parts for print view: navigation and sidebar
*/
body>header, body>nav, aside, article>footer>.sharing, article>section,
#comments, #post_links{
  display: none !important;
}

}
```

### UPDATE:  
Instead of having to CSS files, which will slow down site loading time, I have made use of Compass, to compile into one css file. and changes are reflected on the contents below:
1.	Change in `head.html`:  
    ```html
      <link href="{{ root_url }}/stylesheets/screen.css" media="screen, projection, print" rel="stylesheet" type="text/css">
    ```
1.	Copy the `print.css` mentioned above to `sass/custom/print.scss`  
1.	Modify `sass/screen.scss` as:  
    ```scss
    @import "compass";
    @include global-reset;
    @include reset-html5;

    @import "custom/colors";
    @import "custom/fonts";
    @import "custom/layout";
    @import "base";
    @import "partials";
    @import "custom/_styles.scss";
    @import "custom/print.scss";
    ```  
One more thing I did was adding a print button in post, for not all people use shortcut to print.