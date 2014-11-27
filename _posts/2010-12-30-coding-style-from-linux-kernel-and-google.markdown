---
date: '2010-12-30 12:37:26'
redirect_from:
  /2010/12/coding-style-from-linux-kernel-and-google/
layout: post
slug: coding-style-from-linux-kernel-and-google
status: publish
title: coding style from Linux Kernel and Google
wordpress_id: '643'
categories:
- science
- technology
- thoughts
tags:
- google
- linux
- poem
- programming
- science
- technology
- thoughts
---

> Every major open-source project has its own** style guide**: a set of conventions (sometimes arbitrary) about how to write code for that project. It is much easier to understand a large code base when all the code in it is in a consistent style.

“**Style**” covers a lot of ground, from “use camelCase for variable names” to “never use global variables” to “never use exceptions.”

> 
> ——Google Style Guide
> 
> 



Coding style is discussed everywhere. Are there any experienced and useful rules to follow?
Luckily, maybe the answer is "yes".

Absolutely we can learn a lot from Linux Kernel project and some open-source projects from Google.
And they provide us with two sets of style guide of how to write codes as poetry.

A document from [**Linux Kernel project**](http://www.kernel.org/) provide the suggestion of [how to code C](http://www.kernel.org/doc/Documentation/CodingStyle).
Suggestions of writing programs in [C++](http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml), [JavaScript](http://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml), [Python](http://google-styleguide.googlecode.com/svn/trunk/pyguide.html), and [Objective-C](http://google-styleguide.googlecode.com/svn/trunk/objcguide.xml), as well as the way to write [XML](http://google-styleguide.googlecode.com/svn/trunk/xmlstyle.html), from [**Google Style Guide**](http://code.google.com/p/google-styleguide/), are available.
Formatting issues of [Go language](http://golang.org/doc/effective_go.html#formatting) from Google are mainly cared by machines.

Not only they tell us **how to do it**, but also they tell us **why to do it in this way**. We should learn the ideas and thoughts while referring to these useful documents.
