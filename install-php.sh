#!/bin/bash

#echo "cleanup system..."
# Comment this in if your installation was a mess
#for f in `brew list`; do 
#    brew uninstall --ignore-dependencies --force $f
#done

echo "be sure you'r running zsh, if not CANCEL this and install it."

sleep 5

echo "install php 5.6 - 7.4 patched for catalina and php switcher no apache fix"

brew tap exolnet/homebrew-deprecated

brew update

brew install --build-from-source https://raw.githubusercontent.com/JParkinson1991/homebrew-deprecated/79d817a7ef794234d5276df0487a9d037b7b7bba/Formula/php@5.6.rb --with-openssl-1.1-patch


brew install --build-from-source php@7.0

brew install --build-from-source php@7.1

brew install --build-from-source php@7.2

brew install --build-from-source php@7.3

brew install --build-from-source php@7.4



sudo curl -L https://raw.githubusercontent.com/KartoffelToby/php-brew-switcher-no-apache/master/sphp.sh > /usr/local/bin/sphp

sudo chmod +x /usr/local/bin/sphp

echo 'export PATH="/usr/local/bin:/usr/local/sbin:$PATH"' >> ~/.zshrc

echo "Disable the default apache daemon"

sudo apachectl stop
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

echo "done... use sphp %PHPVERSION% to switch php versions"
