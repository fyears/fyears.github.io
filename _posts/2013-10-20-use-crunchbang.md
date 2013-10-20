---
published: true
layout: post
title: use CrunchBang
tags: 
  - technology
  - linux
categories: technology
---

## experience

My Hackintosh crashed a few days before. What's worse, I couldn't install OS X 10.9 Maverick any more because some wired stuff! :-( So in case I want to do something relative with *nix, I wanna install a desktop Linux now. And for safe, I am installing it in a virtual machine firstly.

Long days before, I was accoustomed to use Ubuntu. In fact I started to use it from 08.10. And coincidentally a new version 13.10 was released days before. However, I don't admire the new design (Unity and many other things), and the beautiful Linux Mint hasn't released a new version based on Ubuntu 13.10 yet, so I searched in Google, and discovered the very simple [CrunchBang](http://crunchbang.org/), a distribution based on Debian.

> CrunchBang is a Debian GNU/Linux based distribution offering a great blend of speed, style and substance. Using the nimble Openbox window manager, it is highly customisable and provides a modern, full-featured GNU/Linux system without sacrificing performance.

So I installed it in vmware. It's of course similar to Ubuntu, and it's very lightweight and, well, ugly or simple, without any entertainment. :-) At first time, I wanted to try to use the "testing" or "unstable" branch to update my application, but I always met toubles. So in the end, I have to use the "stable" branch, feeling the stable (and old) packages of Debian.

I saved some process in [one](https://gist.github.com/fyears/7036310) of my gists. If anyone one is interested in it or want some helps, he or she can leave comments.

## additional tips

### tip #1 get rid of the gnome3 after dist-upgrade

look at line 1 to line 8 :

<script src="https://gist.github.com/fyears/7036310.js?file=install.sh"></script>

### tip #2 how to install vmware tools in Debian 7 wheezy / CrunchBang 11 waldorf

I haven't tried to install CrunchBang in VirtualBox. So this tip is only suitable for VMware case.

Attention: in my case, installing the default and official VMware tools will bring much trouble. So I strongly recommend [open-vm-tools](http://open-vm-tools.sourceforge.net/), an open source tool as the alternate to official VMware tools.

<script src="https://gist.github.com/fyears/7036310.js?file=install-vm-tools.sh"></script>

And remember, always reboot the machine to avoid any troubles.


