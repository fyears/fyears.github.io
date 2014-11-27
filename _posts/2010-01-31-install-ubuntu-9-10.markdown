---
date: '2010-01-31 13:04:29'
redirect_from:
  /2010/01/install-ubuntu-9-10/
layout: post
slug: install-ubuntu-9-10
status: publish
title: install ubuntu 9.10
wordpress_id: '98'
tags:
- install
- linux
- programming
- ubuntu
---

Though ubuntu 10.04 is approaching, unluckily, I have to reinstall the ubuntu 9.10 these days.

Here is the notes after freshly install ubuntu-9.10-desktop-i386.iso. Almost command lines.

Lines with two "#" are comments. And lines with one "#" are actions with GUI instead of command lines.

<pre><code>

#set the network connection
sudo /etc/init.d/network-manager restart
#Menus, /System/Administration/SoftwareSources, and set the sources.
#Menus, /System/Administration/LanguageSupport, and set the language input menthod.
cd /etc/fonts/conf.d
sudo ln -sf ../conf.avail/66-wqy-zenhei-sharp-no13px.conf 66-wqy-zenhei-sharp.conf
cd ~

##add ppa
sudo add-apt-repository ppa:mozillateam/firefox-stable
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
sudo add-apt-repository ppa:gnome-colors-packagers/ppa
sudo add-apt-repository ppa:network-manager/ppa
sudo add-apt-repository ppa:tualatrix/ppa
sudo add-apt-repository ppa:sevenmachines/tor
sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo add-apt-repository ppa:ubuntuone/beta
sudo add-apt-repository ppa:geany-dev/ppa
sudo add-apt-repository ppa:ibus-dev/ibus-1.2-karmic
sudo add-apt-repository ppa:ailurus

#add google source
sudo gedit /etc/apt/sources.list.d/google-chrome.list
#add this line
deb http://dl.google.com/linux/deb/ stable main
#save and quit
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

#add medubuntu source
sudo wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list
sudo apt-get --quiet update
sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring
sudo apt-get --quiet update
sudo apt-get --yes install app-install-data-medibuntu apport-hooks-medibuntu

sudo apt-get update

##remove
sudo apt-get remove evolution-common gnome-games-common totem-common f-spot tomboy ibus-m17n computer-janitor gnome-orca gnome-pilot vino vinagre gnome-bluetooth bluez bluez-gstreamer transmission-common xsane-common gnome-accessibility-themes gnome-doc-utils gcalctool gucharmap

##installation about entertainment
sudo apt-get install mplayer w32codecs libdvdcss2 gnome-colors shiki-colors arc-colors compiz compizconfig-settings-manager simple-ccsm
#go to http://get.adobe.com/flashplayer/ to download install_flash_player_10_linux.deb, and install the file.

##installation about system
sudo apt-get install ubuntu-tweak ailurus tree virtualbox-ose rar unrar p7zip p7zip-rar p7zip-full nautilus-open-terminal nautilus-gksu gufw ttf-wqy-microhei ubiquity-frontend-gtk wine1.2 wine1.2-gecko wine1.2-dev
wget http://www.kegel.com/wine/winetricks
chmod 755 winetricks
sudo mv winetricks /usr/local/bin
#Go to http://www.geekconnection.org/remastersys/repository/karmic/ to download remastersys_all.deb and install it.

##installation about internet and office
sudo apt-get install poppler-data google-chrome-unstable tor tor-geoipdb vidalia prism ibus-pinyin googleearth rtorrent
sudo update-rc.d -f tor remove
sudo /etc/init.d/tor stop

##installation about development
sudo apt-get install build-essential python-setuptools python-dev mercurial bison gcc libc6-dev ed gawk make auto-apt checkinstall vim idle-python2.6 libssl-dev geany indent glade manpages-dev manpages-posix-dev manpages-posix exuberant-ctags libgmp3-dev libncurses5-dev libqt3-mt-dev subversion git-core

sudo apt-get upgrade

sudo apt-get autoclean
sudo apt-get clean
sudo apt-get autoremove

##tweak
#Use ubuntu-tweak,ailurus,and configure the keyboard shortcut, and configure the ibus, geany, vidalia.
sudo gconf-editor
#Go to /apps/nautilus/desktop and /apps/metacity/general, right-click the keys, and set it to default.
#Go to /apps/gedit2/preferences/encodings, in auto_detected add GBK, and right-click the keys, and set it to default.
#Go to /apps/metacity/global_keybindings/, set the key run_command_terminal, and right-click the keys, and set it to default.

</code></pre>

That's all. Looking forward to ubuntu 10.04 and hoping that  it will be successful.
