---
published: true
layout: post
title: Try Let’s Encrypt with custom NGINX installation
tags:
  - ssl
  - technology
categories: technology
---

## what

[Let's Encrypt](https://letsencrypt.org/) is an awesome project providing **free** SSL certs to the world. In Dec 3, 2015, it entered public beta.

It [says](https://letsencrypt.org/about/):

> Anyone who owns a domain name can use Let’s Encrypt to obtain a trusted certificate at zero cost.

## why

For the glory of Santa of course!

Well... Because security is important, so we should take enabling https into consideration.

## why this post

However, the [client](https://github.com/letsencrypt) doesn't have full support for NGINX yet. Moreover, if admin is using custom installation of Apache or NGINX, the automatic plugins of the client may not work properly. So we want to manually generate and install the certs.

## how

Assuming a proper NGINX is working smoothly without HTTPS. **The following commands run inside the server runing the website(s) of the domain(s).** Take `hellossl.example.com` for example.

### install the client

Firstly, [install the client](http://letsencrypt.readthedocs.org/en/latest/contributing.html#running-a-local-copy-of-the-client):

```sh
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
sudo ./bootstrap/install-deps.sh
./bootstrap/dev/venv.sh
source ./venv/bin/activate
letsencrypt --help all
```

### generate the certs

Then, use [`webroot` mode](https://letsencrypt.readthedocs.org/en/latest/using.html#webroot) to generate the certs (it generates private key as well):

```sh
# assuming web root of hellossl.example.com is /var/www/hellossl.example.com/
letsencrypt certonly --email admin@example.com --agree-tos --webroot -w /var/www/hellossl.example.com/ -d hellossl.example.com --rsa-key-size 4096 --text 
## ...
## - Congratulations! Your certificate and chain have been saved at
##    /etc/letsencrypt/live/hellossl.example.com/fullchain.pem. Your cert
##    will expire on 2016-03-03. To obtain a new version of the
##    certificate in the future, simply run Let's Encrypt again.
## - Your account credentials have been saved in your Let's Encrypt
##   configuration directory at /etc/letsencrypt. You should make a
##   secure backup of this folder now. This configuration directory will
##   also contain certificates and private keys obtained by Let's
##   Encrypt so making regular backups of this folder is ideal.
## - If you like Let's Encrypt, please consider supporting our work by:
## 
##    Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
##    Donating to EFF:                    https://eff.org/donate-le
```

In fact, the client creates a directory in the web root, and generates some important files in its directory:

```sh
tree -a /var/www/hellossl.example.com/
## .
## ├── index.html
## ├── ... # something
## └── .well-known
##     └── acme-challenge

ls -al /etc/letsencrypt/live/hellossl.example.com/
## cert.pem  chain.pem  fullchain.pem  privkey.pem
```

Note: I am confused how the email is used. We could check [issue #1310](https://github.com/letsencrypt/letsencrypt/issues/1310) and [post #2603](https://community.letsencrypt.org/t/2603) for details:

```sh
tree -a /etc/letsencrypt/accounts
## /etc/letsencrypt/accounts
## └── acme-v01.api.letsencrypt.org
##     └── directory
##         └── <hash>
##             ├── meta.json
##             ├── private_key.json
##             └── regr.json
```

### configure the NGINX

Mozilla provides an excellent [tool](https://mozilla.github.io/server-side-tls/ssl-config-generator/) about configurating SSL.

[Cipherli.st](https://cipherli.st/) provides suggestions on strong ciphers.

We may also want to rewrite the http site to https using [`rewrite`](https://www.linode.com/docs/websites/ssl/how-to-provide-encrypted-access-to-resources-using-ssl-certificated-on-nginx#redirect-http-virtual-hosts-to-https).

So, edit the NGINX virtual host configuration file as follow:

```nginx
server {
    listen 80;
    #listen [::]:80;
    server_name hellossl.example.com;
    root /var/www/hellossl.example.com;
    location / {
        rewrite ^ https://$server_name$request_uri permanent;
    }
    location /.well-known {
        try_files $uri $uri/ =404;
    }
}

server {
    listen 443 ssl http2; # http2 enabled here
    #listen [::]:443 ssl http2;
    server_name hellossl.example.com;

    # certs sent to the client in SERVER HELLO are concatenated in ssl_certificate
    ssl_certificate /etc/letsencrypt/live/hellossl.example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/hellossl.example.com/privkey.pem;
    ssl_session_timeout 1d;
    ssl_session_cache shared:SSL:50m;
    ssl_session_tickets off;

    # Diffie-Hellman parameter for DHE ciphersuites, recommended 2048 bits
    # Let's Encrypt doesn't care about it here, so comment it here.
    #ssl_dhparam /etc/ssl/certs/dhparam.pem;

    # configuration. tweak to your needs.
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH";
    ssl_prefer_server_ciphers on;

    # HSTS
    add_header Strict-Transport-Security "max-age=63072000; includeSubdomains; preload";

    add_header X-Frame-Options DENY;
    add_header X-Content-Type-Options nosniff;

    # OCSP Stapling ---
    # fetch OCSP records from URL in ssl_certificate and cache them
    ssl_stapling on;
    ssl_stapling_verify on;

    # verify chain of trust of OCSP response using Root CA and Intermediate certs
    ssl_trusted_certificate /etc/letsencrypt/live/hellossl.example.com/chain.pem;

    #resolver <IP DNS resolver>;

    root /var/www/hellossl.example.com;
    location /.well-known {
        try_files $uri $uri/ =404;
    }
 
    # ...
}
```

Then reload nginx:

```sh
nginx reload
```

### check the result

Go to http://hellossl.example.com, if everything goes right, you should be redirected to https://hellossl.example.com without any errors! WOW!

### bonus: `ssl_dhparam`

`ssl_dhparam` is [a way](https://weakdh.org/sysadmin.html) to enhance security.

Generate `dhparam.pem` firstly:

```sh
# long time to run!!!
openssl dhparam -out dhparam.pem 4096
# place the cert somewhere
sudo mv dhparam.pem /etc/ssl/certs/dhparam.pem
```

Then uncomment the relatived line in NGINX configuration:

```nginx
server {
    # ...
    ssl_dhparam /etc/ssl/certs/dhparam.pem;
    # ...
}
```

Then reload the NGINX.

```sh
nginx reload
```

## conclusion and other things

It works! And it's very cool!

And we should notice that the certificate will expire in 90 days. So if we use it in production, we should set up something like `crontab` running automatically, say, every month, to renew the certificate.

For simplified steps, we could also try less complicated unofficial clients [diafygi/acme-tiny](https://github.com/diafygi/acme-tiny), [diafygi/letsencrypt-nosudo](https://github.com/diafygi/letsencrypt-nosudo), or [kuba/simp_le](https://github.com/kuba/simp_le).
