---
date: '2010-12-20 12:20:20'
redirect_from:
  /2010/12/simplified-blackjack-in-c/
layout: post
slug: simplified-blackjack-in-c
status: publish
title: Simplified Blackjack in C
wordpress_id: '609'
tags:
- C
- difficult
- experience
- programming
---

Now I'd like to share one of my experience of programming C.

Our teacher gave us a task: to finish a small but not so useless program by our own in C. He gave three options and unluckily, I was so confident that I chose the most difficult one: to write a program of [Blackjack](http://en.wikipedia.org/wiki/Blackjack) (simplified though, without money involved), also known as Twenty-one, played in command line.

It is a disaster. Though I scanned lots of programming books, however, I haven't really finished a useful project before. In this task, I strongly realize how stupid I am.

First of all, I don't know the way to shuffle the 52 cards. Their order requires random, no repeat, and easy to access. "Array", you must say. However, I didn't exactly understand how it works in C, and I had to find out the algorithm, which our teacher didn't tell us. And after I found the answer to the algorithm, I was trapped in the pointers and arrays, and my poor understanding to function in C forced me to face strange warnings and errors. I wasted long long time to debug the shuffle_cards() function, though in the end I realized how simple it is.

Secondly, too many branches in the game exactly annoyed me a lot. There are too many possible results of the game, due to its rules. So I had to use lots of if(){}else{} statement, which results in ugly look and slow performance.

Finally, problems occur when I want to compile the code. I develop it in Ubuntu Linux, and gcc works fine. But it seems that Visual C++ 6.0 doesn't like the code! Luckily I found alternative compiler in Windows: [Dev C++](http://sourceforge.net/projects/dev-cpp/files/Binaries/Dev-C%2B%2B%204.9.9.2/) and [Tiny C Compiler](http://bellard.org/tcc/). And I finished it now. They are ugly and unclean codes. :-(

It is an unforgettable experience. Well, anyway, after all, I dare to say I have developed in C now!

I have uploaded it to [https://github.com/fyears/simple-Black-Jack](https://github.com/fyears/simple-Black-Jack) now.
