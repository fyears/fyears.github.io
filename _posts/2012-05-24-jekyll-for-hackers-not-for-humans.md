---
date: '2012-05-24 19:00:00'
layout: post
slug: jekyll-for-hackers-not-for-humans
status: publish
title: Jekyll, for hackers, not for humans
categories:
- thoughts
tags:
- thoughts
- technology
- wordpress
- jekyll
- markdown
- mathjax
---

Nowadays, [Jekyll](https://github.com/mojombo/jekyll) (suddenly) becomes populars among hackers.

In short, "Jekyll is a blog-aware, static site generator in Ruby". It can be used to build a "static" blog, instead of using WordPress.

Born in "static", Jekyll does not have the problems such as security issues, C10K problems, php and database engines backend needed, software updates...... Considering that the comments, analytics can be done by Disqus and Google Analytics by adding some javascript snippets. More excitingly, writting posts in markdown,text-based instead of databases needed, they are cool! It should be the best alternate of WordPress!

__Not exactly.__ The above paragraph or similar texts can be seen in _almost any_ posts in the Internet introducing Jekyll. But since it and anthor project based on it, Octopress, are designed for hackers, it's not for humans.

When a simple user want to write a blog, he may start in [Blogger](https://blogger.com) or [WordPress.com](http://wordpress.com). They provide good features and large community. They automatically deal with the technical details. Inserting pictures, videos, etc. are simple and easy. When a curious user want to customize their blog, he of she starts to study HTML, CSS and javascript. He want to buy a virtual host account, such as BlueHost. WordPress' famous "five steps installation" gives strong convenience. After "clicking", binding domains is easy as well. Installing plugins gives user the satisfaction. after learning some php syntax, a user can even try to modify of develop the themes and plugins!

In short, "playing" with WordPress (WordPress should be the most famous and widely used blogging platform or software) (or Blogger, [Tumblr](https://www.tumblr.com)), users or players can "grow up" from easy to hard. In the very end, he or she can stop in any steps, or he or she can fully control WordPress just as a "person knowing more common sense about programming".

But Jekyll doesn't. "Playing" Jekyll needs that you are a hacker already!

Want to play Jekyll? Hummm...... It's written (majorly) in Ruby. But how to install Ruby? It seems that I'd better have a GUN/Linux distribution or a Mac? Moreover, it's cool to host it by [github](https://github.com), whose cofounder is the author of Jekyll, but hey, what's git? Version controller? I am not interested in it's differences compared with Subversion! And what's markdown? How to configure the text editor to suit it? ...... Lots of question flooded into my mind when I want to play Jekyll!

Moreover, I am disappointed with some limits of the "official support" from github. In deed, github does a good job and it provies lots of convience to programmers, and I love it. But, considering Jekyll, it's designed for hackers, but which hacker on earth doesn't write LATEX or insert gists?! Maruku markdown pharser seems to provide the opinion buliding fomulars pictures, but it requires the local LATEX engin! Rdiscount is fast, but does not support LATEX. Kramdown seems to support MathJax very well, but it can't be viewed in RSS because LATEX snippets are tranformed into `<script>` tags! In similar, gists can be inserted by adding the "embed" codes, but still they can't be viewed in RSS because they are `<script>` actually. Yes, Octopress seems to deal with some problems, but it's not "officially supported" by github pages, and it's even more complicated. Plugins can solve some problems (not elgently), but again, it's not supported by the official github pages. Of course I can generated the pages by the awesome [Pandoc](http://johnmacfarlane.net/pandoc/) and upload the static files to the server or github pages, but again, it's more complicated (though maybe I can't help doing this later.....).

So, if you are a hacker, you may want to try Jekyll. It should improve your writing environment and speed later, if you haven't commited a suicide while installing, configuring Jekyll, bearing the limitations and non-perfect aspects, and considering whether generating static files locally or by github pages, hosting it on github pages, or virtual host, of Heroku, or VPS etc. ...... If not, WordPress should be the best choice of writing yet.
