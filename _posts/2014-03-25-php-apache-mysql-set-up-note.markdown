---
layout: post
title: "PHP Apache MySQL Set-up Note"
date: 2014-03-25 13:09:31 +0800
comments: true
categories: server 
description: "my notes to setup local development environment"
keywords: "PHP, Apache, setup"
cover: 
---

- Apache is pre-installed in Mac OS X, and it can be started by running `sudo apachectl start` in terminal. After this, **It works!** is shown when visiting `localhost` in browser. Create a `Sites` folder in your home folder, then this folder is accessible through `localhost/~yourusername`. 
- Enable PHP by uncommenting `LoadModule php5_module libexec/apache2/libphp5.so` in `/etc/apache2/httpd.conf`. Then restart Apache via `sudo apachectl restart`. To verify if php works, creating a `phpinfo.php` in the `Sites` folder:
{% highlight php %}
<?php
  phpinfo();
?>  
{% endhighlight %}
When visiting `localhost/~yourusername/phpinfo.php` you should see php mata information instead of plain text of the code.  
- Install MySQL and phpMyAdmin
- Set MySQL root password `mysqladmin -u root password PASSWORD`  
If you're getting `#2002 Cannot log in to the MySQL server` when logging in to phpmyadmin, try editing `phpmyadmin/config.inc.php` and change:  
`$cfg['Servers'][$i]['host'] = 'localhost';`  
to:
`$cfg['Servers'][$i]['host'] = '127.0.0.1';`  
- Create VirtualHost by adding to the end of `/etc/apache2/extra/httpd-vhosts.conf`  
{% highlight sh %}
<VirtualHost *:80>
  DocumentRoot "PATH TO SITE ROOT"
  ServerName "SERVER.local"
  ErrorLog "/private/var/log/apache2/jason.local-error_log"
  CustomLog "/private/var/log/apache2/jason.local-access_log" common
  <Directory "PATH TO SITE ROOT">
    AllowOverride All
    Order allow,deny
    Allow from all
  </Directory>
</VirtualHost>
<VirtualHost *:80>
  DocumentRoot "PATH TO SITE ROOT"
  ServerName "SERVER.local"
  ErrorLog "/private/var/log/apache2/"SERVER.local"-error_log"
  CustomLog "/private/var/log/apache2/"SERVER.local"-access_log" common
  <Directory "PATH TO SITE ROOT">
    Options +Indexes
    AllowOverride All
    Order allow,deny
    Allow from all
  </Directory>
</VirtualHost>
{% endhighlight %}
- Edit `/etc/hosts` to append ```127.0.0.1  SERVER.local```