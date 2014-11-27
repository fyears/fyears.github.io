---
date: '2010-06-14 10:45:52'
redirect_from:
  /2010/06/install-lnmp-wordpress-ubuntu-servers/
layout: post
slug: install-lnmp-wordpress-ubuntu-servers
status: publish
title: install LNMP and wordpress on Ubuntu servers
wordpress_id: '246'
categories:
- technology
tags:
- install
- linux
- lnmp
- niginx
- programming
- server
- technology
- ubuntu
- wordpress
---

LNMP, which is known as "Linux, Nginx, Mysql and PHP" is a better choice when compared with the traditional LAMP on a server.

However, Nginx is not as famous as Apache, and it seems that people prefer CentOS to Ubuntu while they are choosing the system for a server. So, I came with some problems while installing LNMP and wordpress on a Ubuntu server. Luckily at last, I seemed to run my programs properly. Here are the steps.



The system of my vps is Ubuntu 10.04, 32bits.

Thanks to the auto tools from [lnmp.org](http://lnmp.org) (the website is written in Simplified Chinese) .

``` bash
#ssh as root
ssh root@[ip] -p 22
apt-get autoremove apache2 mysql-server mysql-server-5.0 php5

vim /etc/apt/sources.list
#input these:
deb http://us.archive.ubuntu.com/ubuntu lucid main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu lucid-security main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu lucid-updates main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu lucid-proposed main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu lucid-backports main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu lucid main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu lucid-security main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu lucid-updates main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu lucid-proposed main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu lucid-backports main restricted universe multiverse
#input :wq! to save&quit
apt-get update
apt-get upgrade
apt-get dist-upgrade

apt-get install -y ubuntu-minimal
apt-get install -y language-pack-en language-pack-zh python-software-properties
apt-get install -y bash-completion nano vim ctags vim-doc vim-scripts screen byobu sysv-rc-conf pptpd
apt-get install -y wget curl iptables sendmail mutt logwatch
apt-get install -y bzip2 unzip unrar p7zip
apt-get install -y perl python python-dev sqlite sqlite3 openssl lynx python-pip
apt-get install -y gcc g++ make autoconf automake patch gdb libtool cpp build-essential libc6-dev libncurses-dev expat build-essential psmisc libxml2 libxml2-dev python-setuptools libpcre3-dev libssl-dev

#add-apt-repository ppa:cherokee-webserver/ppa
#add-apt-repository ppa:nginx/stable
#add-apt-repository ppa:uwsgi/release
#apt-get update
#apt-get install uwsgi-python nginx cherokee cherokee-admin

apt-get autoremove
apt-get clean
apt-get autoclean

byobu -S lnmp
wget -c http://soft.vpser.net/lnmp/lnmp0.7-full.tar.gz
tar zxvf lnmp0.7-full.tar.gz
cd lnmp0.7-full/
./ubuntu.sh | tee lnmp.log
sh upgrade_nginx.sh
#input the latest version which can be found at http://nginx.org/en/download.html
1.0.8 #etc
#press Enter to update the Nginx
sh upgrade_php.sh
#input the latest version which can be found at http://php.net/
5.3.8 #etc
#press Enter to update the php
./apache.sh #install Apache as backend server
vi /usr/local/apache/conf/extra/httpd-info.conf
##change like these:
<Location /server-status>
    SetHandler server-status
    Order deny,allow
    Deny from all
    Allow from 127.0.0.1
</Location>
#save&quit
service httpd restart
nano eaccelerator.sh
##change line 48 to this:
wget -c http://soft.vpser.net/web/eaccelerator/eaccelerator-0.9.6.1.tar.bz2
##change line 95 to this:
zend_extension="/usr/local/php/lib/php/extensions/no-debug-non-zts-20090626/eaccelerator.so"
#save&quit
./eaccelerator.sh #install e-Accelerator to speed up php
exit ##exit byobu
cd ~
##the address of the programs:
##mysql : /usr/local/mysql
##php : /usr/local/php
##nginx : /usr/local/nginx
##to manage LNMP:
sh /root/lnmp {start|stop|reload|restart|kill|status}
##or to manage LNMPA
sh /root/lnmpa {start|stop|reload|restart|kill|status}
##phpMyAdmin address: http://[IP]/phpmyadmin/

#install pptpd
#apt-get install -y pptpd
nano /etc/pptpd.conf
#uncomment these:
localip 192.168.0.1
remoteip 192.168.0.234-238,192.168.0.245
#save&quit
nano /etc/ppp/chap-secrets
##add users ("happyuser" with passwd "wahaha123" etc) like this:
happyuser pptpd wahaha123 *
#save&quit
nano /etc/ppp/options
#add
ms-dns 8.8.8.8
ms-dns 8.8.4.4
#save&quit
nano /etc/sysctl.conf
#uncomment this:
net.ipv4.ip_forward=1
#save&quit
sysctl -p
/etc/init.d/pptpd restart

#change sshd port
nano /etc/ssh/sshd_config
#change some lines like these:
Port 22222
PermitRootLogin no
#save&quit
/etc/init.d/ssh restart

#user control
adduser nick
gpasswd -a nick sudo
visudo
#modify the file /etc/sudoers like this:
root    ALL=(ALL) ALL
nick    ALL=(ALL) ALL
#save&quit
passwd -l root

##configure iptables. 22222(ssh)，1723(pptpd)，80(http)，443(https)
nano iptables_init.sh
#save these:
#!/bin/sh
#clean
iptables -F
iptables -X
iptables -Z
#pptp
iptables -P FORWARD ACCEPT
iptables -A INPUT -p gre -j ACCEPT 
iptables -A OUTPUT -p gre -j ACCEPT 
iptables -A INPUT -p tcp --dport 1723 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 1723 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE
#and...
iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -j ACCEPT
#some open ports
iptables -A INPUT -p tcp --dport 22222 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 110 -j ACCEPT
iptables -A INPUT -p tcp --dport 995 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 465 -j ACCEPT
iptables -A INPUT -p tcp --dport 587 -j ACCEPT
#allow ping
iptables -A INPUT -p icmp -j ACCEPT
#reject others
iptables -A INPUT -j REJECT
#save
iptables-save > /etc/iptables.rules
iptables -L -n --line-numbers
#save&quit
sh iptables_init.sh
nano /etc/network/if-post-down.d/iptables
#add this line:
#!/bin/bash
iptables-save > /etc/iptables.rules
#save&quit
nano /etc/network/if-pre-up.d/iptables
#add this line:
#!/bin/bash
iptables-restore < /etc/iptables.rules
#save&quit
chmod +x /etc/network/if-post-down.d/iptables
chmod +x /etc/network/if-pre-up.d/iptables

nano /etc/group
#comment these:
#lp
#news
#games
#save&quit
nano /etc/passwd
#comment these:
#lp
#news
#games
#save&quit

##avoid DDoS
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
wget http://www.inetbase.com/scripts/ddos/install.sh
sh install.sh
#input :q to quit the license
nano /usr/local/ddos/ddos.conf
#change this line to ues iptables:
APF_BAN=0 ##(0: Uses iptables for banning ips instead of APF)
#modify this line
EMAIL_TO="root" 
#save&quit

#backup sql everyday at 5am
cd ~
mkdir /home/website
mkdir /home/website/backups
nano /home/website/sqlbackup.sh
#add:
mysqldump -u[mysqlusername] -p[mysqlpasswd] --lock-all-tables --databases [database1name] [database2name] > /home/website/backups/databackup.sql
tar zcf /home/website/backups/databackup.sql.tar.gz /home/website/backups/
cd /home/website/backups/
split -b 20m -a 3 -d databackup.sql.tar.gz databackup.sql.tar.gz.part
rm -f databackup.sql
rm -f databackup.sql.tar.gz
for file in *
do
	echo "Subject: backup of database" | mutt -a $file -s "Content: Wahaha the backup of database" -- [emailaddress]@gmail.com
	sleep 30s
done
rm -r /home/website/backups/*
END
#save&quit
chmod +x /home/website/sqlbackup.sh
crontab -e 
0 5  * * *   /home/website/sqlbackup.sh

#logwatch and email
mkdir /var/cache/logwatch
cp /usr/share/logwatch/default.conf/logwatch.conf /etc/logwatch/conf/
nano /etc/logwatch/conf/logwatch.conf
#change these lines:
Output = mail
Format = html
MailTo = [emailaddress]@gmail.com
MailFrom = logwatch@mydomain.com
#save&quit
logwatch ##test
crontab -e
0 1  * * *   /usr/sbin/logwatch
#save&quit

exit ##exit ssh
#login again as "nick"
ssh nick@[ip] -p 22222
#then
sudo -s
##to add the virtual hosting site:
cd /root/
./vhost.sh
#Go under the guide. In my example, I added my website www.fyears.org, in which I'd like to install wordpress, so I chose the Rewrite rule of "wordpress".
##and I'd like to redirect or address of "fyears.org" to "www.fyears.org", so I had to configure the Nginx file:
nano /usr/local/nginx/conf/vhost/www.fyears.org.conf
#I added these lines to the beginning of the file (before"server ......"):
server
{
	listen       80;
	server_name fyears.org;
	rewrite ^(.*) http://www.fyears.org$1 permanent;
}
#I saved the file, then:
kill -HUP `cat /usr/local/nginx/logs/nginx.pid`
#However, if you installed apache too, you should not edit this. but just add a .htaccesss file in the root of your website:
<Files ~ "^.(htaccess|htpasswd)$">
deny from all
</Files>

RewriteEngine On
RewriteCond %{HTTP_HOST} !^www.fyears.org$ [NC]
RewriteRule ^(.*)$ http://www.fyears.org/$1 [L,R=301]

FileETag none
#save&quit
##Then install wordpress, here is the example of my website (using the address www.fyears.org):
/usr/local/mysql/bin/mysql -u root -p
CREATE DATABASE [the-name-of-the-database];
Quit
cd /home/wwwroot/www.fyears.org/
wget -c http://wordpress.org/latest.tar.gz
tar zxvf latest.tar.gz
mv wordpress/* .
#I went to http://www.fyears.org/ and install wordprss in famous five steps.
##It is likely that I have to do this:
chown -R www:www /home/wwwroot
cd ~
#configure the wodpress
exit ##exit sudo -s
exit ##exit ssh
```

Enjoy!

If anyone have questions, you can leave a comment here or in http://blog.licess.cn/lnmp/ , which is a better way.