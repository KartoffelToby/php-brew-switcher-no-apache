#!/bin/bash
# Creator: Phil Cook
# Modified: Tobias Haber
osx_major_version=$(sw_vers -productVersion | cut -d. -f1)
osx_minor_version=$(sw_vers -productVersion | cut -d. -f2)
osx_patch_version=$(sw_vers -productVersion | cut -d. -f3)
osx_patch_version=${osx_patch_version:-0}
osx_version=$((${osx_major_version} * 10000 + ${osx_minor_version} * 100 + ${osx_patch_version}))

brew_prefix=$(brew --prefix | sed 's#/#\\\/#g')

brew_array=("5.6","7.0","7.1","7.2","7.3","7.4")
php_array=("php@5.6" "php@7.0" "php@7.1" "php@7.2" "php@7.3" "php@7.4")
valet_support_php_version_array=("php@5.6" "php@7.0" "php@7.1" "php@7.2" "php@7.3" "php@7.4")
php_installed_array=()
php_version="php@$1"
php_opt_path="$brew_prefix\/opt\/"

php5_module="php5_module"
apache_php5_lib_path="\/lib\/httpd\/modules\/libphp5.so"
php7_module="php7_module"
apache_php7_lib_path="\/lib\/httpd\/modules\/libphp7.so"

native_osx_php_apache_module="LoadModule ${php5_module} libexec\/apache2\/libphp5.so"
if [ "${osx_version}" -ge "101300" ]; then
    native_osx_php_apache_module="LoadModule ${php7_module} libexec\/apache2\/libphp7.so"
fi

php_module="$php5_module"
apache_php_lib_path="$apache_php5_lib_path"

# Has the user submitted a version required
if [[ -z "$1" ]]; then
    echo "usage: sphp version"
    exit
fi

if [[ $(echo "$php_version" | sed 's/^php@//' | sed 's/\.//') -ge 70 ]]; then
    php_module="$php7_module"
    apache_php_lib_path="$apache_php7_lib_path"
fi

apache_change=0
apache_conf_path="/usr/local/etc/httpd/httpd.conf"
apache_php_mod_path="$php_opt_path$php_version$apache_php_lib_path"

valet_restart=0
# Check if valet is already install
hash valet 2>/dev/null && valet_installed=1 || valet_installed=0

POSITIONAL=()

# What versions of php are installed via brew
for i in ${php_array[*]}; do
    if [[ -n "$(brew ls --versions "$i")" ]]; then
        php_installed_array+=("$i")
    fi
done

# Check if php version support via valet
if [[ (" ${valet_support_php_version_array[*]} " != *"$php_version"*) && ($valet_restart -eq 1) ]]; then
    echo "Sorry, but $php_version is not support via valet"
    exit
fi

# Check that the requested version is supported
if [[ " ${php_array[*]} " == *"$php_version"* ]]; then
    # Check that the requested version is installed
    if [[ " ${php_installed_array[*]} " == *"$php_version"* ]]; then

        # Switch Shell
        echo "Switching to $php_version"
        echo "Switching your shell"
        for i in ${php_installed_array[@]}; do
            brew unlink $i
        done
        brew link --force "$php_version"

	echo ""
        php -v
        echo ""

        echo "All done!"
    else
        echo "Sorry, but $php_version is not installed via brew. Install by running: brew install $php_version"
    fi
else
    echo "Unknown version of PHP. PHP Switcher can only handle arguments of:" ${brew_array[@]}
fi
