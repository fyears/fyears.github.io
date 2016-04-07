---
date: '2010-03-06 09:49:01'
layout: post
slug: not-to-trust-in-cnnic
status: publish
title: not to trust in CNNIC
wordpress_id: '166'
tags:
- cn
- programming
---

Do not trust in the certificates from CNNIC!

Here is the solution in Ubuntu/Debian, which should work for Firefox 3.6 & Chrome & Wget & cURL:

~~~~
sudo rm /usr/share/ca-certificates/mozilla/Entrust.net_Secure_Server_CA.crt
sudo dpkg-reconfigure ca-certificates
#unselect mozilla/Entrust.net_Secure_Server_CA.crt
#  OR sudo vi /etc/ca-certificates.conf
#  and add "!" to line "mozilla/Entrust.net_Secure_Server_CA.crt";
##  like:
##  ...
##  mozilla/Entrust.net_Secure_Personal_CA.crt
##  !mozilla/Entrust.net_Secure_Server_CA.crt
##  mozilla/Entrust_Root_Certification_Authority.crt
##  ...
sudo update-ca-certificates
#view the result:
grep "MIIE2DCCBEGgAwIBAgIEN0rSQzANBgkqhkiG9w0BAQUFADCBwzELMAkGA1UEBhMC" /etc/ssl/certs/ca-certificates.crt

sudo apt-get install libnss3-tools
cd ~
wget https://dl.dropbox.com/u/1356279/proxys/CNNIC.7z
p7zip -d CNNIC.7z

cd ~/.mozilla/firefox/*.default
certutil -d . -M -t "" -n "CNNIC SSL" || certutil -d . -A -i ~/CNNIC/CNNICSSL.crt -n "CNNIC SSL" -t ""
certutil -d . -M -t "" -n "CNNIC ROOT" || certutil -d . -A -i ~/CNNIC/CNNICROOT.crt -n "CNNIC ROOT" -t ""
certutil -d . -M -t "" -n "Entrust.net Secure Server CA" || certutil -d . -A -i ~/CNNIC/Entrust.netSecureServerCertificationAuthority.crt -n "Entrust.net Secure Server CA" -t ""
##view the result:
certutil -d . -L

cd ~
certutil -d sql:$HOME/.pki/nssdb -M -t "" -n "CNNIC SSL" || certutil -d sql:$HOME/.pki/nssdb -A -i ~/CNNIC/CNNICSSL.crt -n "CNNIC SSL" -t ""
certutil -d sql:$HOME/.pki/nssdb -M -t "" -n "CNNIC ROOT" || certutil -d sql:$HOME/.pki/nssdb -A -i ~/CNNIC/CNNICROOT.crt -n "CNNIC ROOT" -t ""
certutil -d sql:$HOME/.pki/nssdb -M -t "" -n "Entrust.net Secure Server CA" || certutil -d sql:$HOME/.pki/nssdb -A -i ~/CNNIC/Entrust.netSecureServerCertificationAuthority.crt -n "Entrust.net Secure Server CA" -t ""
##view the result:
certutil -d sql:$HOME/.pki/nssdb -L

#go to the web pages to test:
##https://tns-fsverify.cnnic.cn/
##https://www.enum.cn/

rm ~/CNNIC.7z
rm -r ~/CNNIC
~~~~

Thanks to [Linuxtoy](http://linuxtoy.org/archives/ca-certificate-problem.html), [Felix](http://felixcat.net/2010/01/throw-out-cnnic/), [Rex](http://people.debian.org.tw/~chihchun/2010/02/02/remove-cnnic-cert-on-linux/), and other network people.