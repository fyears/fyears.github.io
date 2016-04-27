---
layout: post
title: Yandex FREE domain email service
tags:
  - technology
categories: technology
---

As of now (April 2016), there are two free domain email services available: [Yandex.Mail for Domain](https://domain.yandex.com/domains_add/) and [Zoho Mail Suite](https://www.zoho.com/mail/help/email-hosting-with-zoho.html), while Microsoft and Google have cancelled their free domain email plans. Yandex is a Russian website and it provides generous quota for free. So I decide to give Yandex a try and note down some steps here.

1. [Sign up](https://passport.yandex.com/passport?mode=auth&msg=pdd&retpath=https%3A%2F%2Fdomain.yandex.com%2Fdomains_add%2F) a Yandex account.
2. Log in and go to [Yandex Mail for Domain](https://domain.yandex.com/domains_add/) to add the domain. Basically we need to verify the domain and set up the DNS.
3. Generate some email addresses like `hello@example.com`.

Some important notes about DNS settings:

- [`MX` record](https://yandex.com/support/domain/records.xml): `MX`, `@`, `mx.yandex.net.`, `10`
- [`SPF` record](https://yandex.com/support/domain/records.xml): `TXT`, `@`, `v=spf1 redirect=_spf.yandex.net`
- [`CNAME` record](https://yandex.com/support/domain/access/web.xml): `CNAME`, `mail`, `domain.mail.yandex.net.`
- [`DKIM` record](https://yandex.com/support/domain/additional/dkim.xml): To find this record, go to the domain page and click in the right column of the "DKIM digital signature" section on the Display record content link.

Users should be able to log in the email via `https://mail.yandex.com/for/example.com` or `http://mail.example.com/` now.

I highly recommend this service as it's free and kind of reliable.
