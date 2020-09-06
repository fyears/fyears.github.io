---
published: true
layout: post
title: 'simple packaging and encryption using tar and gpg'
tags:
  - technology
categories: technology
---

How to package and encrypt files or folders easily using **symmetry** password in unix way? `tar` -> `gzip` -> `gpg` to rescue. Here is my quick note. 

- **Every reader should use the command at the own risk.**
- **No guarantee is given that the generated files are uncrackable or crackable using the command below.**
- **Suggestion: always choose a strong password.**
- **The code is released under GPL.**

See these for references:

- https://askubuntu.com/questions/95920
- https://willhaley.com/blog/encrypt-single-file-linux-aes-gpg/
- https://github.com/SixArm/gpg-encrypt/blob/master/gpg-encrypt
- https://xkcd.com/936/

```bash
# packaging and encrytion
# you will be required to enter the password
tar -cz your_dir | gpg \
    --no-symkey-cache \
    --cipher-algo AES256 \
    --digest-algo sha256 \
    --cert-digest-algo sha256 \
    --compress-algo none -z 0 \
    --s2k-mode 3 \
    --s2k-digest-algo sha512 \
    --s2k-count 65011712 \
    --force-mdc \
    --quiet --no-greeting \
    --pinentry-mode=loopback \
    -o your_archive.tar.gz.gpg \
    -c

# decryption and de-packaging
# you will be required to provide the password
gpg -d your_archive.tar.gz.gpg | tar xz
```
