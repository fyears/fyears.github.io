---
layout: post
title: Yandex FREE domain email service
tags:
  - technology
categories: technology
---

As of now (~~April 2016~~ Aug 2019), there are two free domain email services available: [Yandex.Mail for Domain](https://connect.yandex.ru/pdd/) (originally in Russian and you need to switch language if you read English) and [Zoho Mail Suite](https://www.zoho.com/mail/help/email-hosting-with-zoho.html), while Microsoft and Google have cancelled their free domain email plans. Yandex is a Russian website and it provides generous quota for free. So I decide to give Yandex a try and note down some steps here.

1. [Sign up](https://mail.yandex.com/) a Yandex account. Be aware, you are creating an account like `example@yandex.com` which is a **personal** thing like gmail, and not necessarily connected to any domain.
2. Go to [Yandex Mail for Domain](https://connect.yandex.ru/pdd/), log in using the Yandex personal account to add the domain. Basically we need to add and verify the domain, then set up the DNS. Attention: your **personal** email will be the administor account for that domain.
3. Generate some email addresses like `hello@example.com`.
4. Next time, go to [Portal @ Yandex.Connect](https://connect.yandex.ru/portal/admin) to manage

Some important notes about DNS settings:

- [`MX` record](https://yandex.com/support/domain/set-mail/mx.html): `MX`, `@`, `mx.yandex.net.`, `10`
- [`SPF` record](https://yandex.com/support/domain/set-mail/records.html): `TXT`, `@`, `v=spf1 redirect=_spf.yandex.net`
- [`CNAME` record](https://yandex.com/support/domain/set-mail/cname.html): `CNAME`, `mail`, `domain.mail.yandex.net.`
- [`DKIM` record](https://yandex.com/support/domain/set-mail/dkim.html): To find this record, go to the domain page and click in the right column of the "DKIM digital signature" section on the Display record content link.

Users should be able to log in the domain email via `https://mail.yandex.com/for/example.com` or `http://mail.example.com/` now.

I highly recommend this service as it's free and kind of reliable.
