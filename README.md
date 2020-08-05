# php-brew-switcher-no-apache / install php on macOS Catalina

This repo has two main functions,

1. PHP switcher without restarting or reanable apache on macOS (sphp.sh)
2. Install PHP on macOS Catalina without hassle (patch version to be compiled with the latest and savest openssl version that comes with macOS Catalina (install-php.sh)

***if you want to install the pachted php version but won't remove all brew packages fist, comment out the for loop in install-php.sh***

# Installation

## Only switcher
```
$ curl -L https://raw.githubusercontent.com/KartoffelToby/php-brew-switcher-no-apache/master/sphp.sh > /usr/local/bin/sphp
$ chmod +x /usr/local/bin/sphp
```

## All including php 5.6 - 7.4 macOS Catalina patch (Warning will remove all brew installations first)
```
$ curl -L https://raw.githubusercontent.com/KartoffelToby/php-brew-switcher-no-apache/master/install-php.sh > install-php.sh
$ chmod +x install-php.sh
$ ./install-php.sh
```
