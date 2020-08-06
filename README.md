# php-brew-switcher-no-apache / install php on macOS Catalina

> One thing you get for **free** from apple if you buy a macbook: DEV-Env problems.

**This repo has two main functions:**

1. PHP switcher without restarting or reanable apache on macOS (sphp.sh)
2. Install PHP's on macOS Catalina without hassle, install a php switcher that works with zsh and disable the annoying system default apache service (patch version to be compiled with the latest and savest openssl version that comes with macOS Catalina (install-php.sh)

***if you want to remove all brew packages fist because you have messed up, comment in the for loop in install-php.sh (Warning will remove all brew installations first)***

# Installation

## All including php 5.6 - 7.4 macOS Catalina patch + PHP switcher + Disable default apache service
```
$ curl -L https://raw.githubusercontent.com/KartoffelToby/php-brew-switcher-no-apache/master/install-php.sh > install-php.sh
$ chmod +x install-php.sh
$ ./install-php.sh
```

## Only switcher
```
$ curl -L https://raw.githubusercontent.com/KartoffelToby/php-brew-switcher-no-apache/master/sphp.sh > /usr/local/bin/sphp
$ chmod +x /usr/local/bin/sphp
```


![alt text](https://pbs.twimg.com/media/Ebtj0UFXkAAJ2eQ.jpg "meme1")
