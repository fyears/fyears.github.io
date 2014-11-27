---
layout: post
redirect_from:
  /2012/10/playing-nodejs-1-basic-concepts/
title: "playing Node.js: 1. basic concepts"
description: ""
category: technology
tags: [interesting, js, node.js, coffeescript, express.js, technology]
---

These days, I wanna have a look at the hot and smart technology: Node.js. So I'd like to make some notes and share some useful resources.

## [Node.js](http://nodejs.org/)

### What's Node.js?

Javascript on the server side.

### What's npm?

The package manager for Node.js. npm for Node.js is as apt-get for Ubuntu.

### How to install it?

I'm not talking about how to do it in Windows, because it's bringing ourselves into troubles. Use one of the techniques from [gist: 579814](https://gist.github.com/579814) is just good and ok. After following that, `npm` and `node` shoule be avaiable as the command in the shell.

### What's a `package.json` file? And what's a `node_modules` folder?

Every Node.js project should provide one of these. It describes the dependencies and some other information of the project. See one [example](https://github.com/fyears/exprcoffee/blob/master/package.json). `node_modules` is the floder of the local dependency files.

### What's the `module`, `require` and `exports`?

There are two excelent posts explaining them. [Node.js, Require and Exports](http://openmymind.net/2012/2/3/Node-Require-and-Exports/), [Node.js, Module.Exports and Organizing Express.js Routes](http://openmymind.net/NodeJS-Module-Exports-And-Organizing-Express-Routes/). The follwing should be read before reading the second post here.

## [CoffeeScript](http://coffeescript.org/)

### What's CoffeeScript?

CoffeeScript is a little language that compiles into JavaScript. It provides a simplified way to write __javascript__ without the annoying from awkward braces and semicolons and othe stuff from the original javascript.

### Why should I use it?

It's the good part of javascript.

### How to use it?

`npm install coffee -g` so `coffee` is the command line. See [Installing](http://coffeescript.org/#installation) for more information. It can be used on [client side](http://coffeescript.org/#scripts) too.

### How to transer between CoffeeScript and javascript?

Command line can be used. However, official website provide an [in-time translator](http://coffeescript.org/#try:alert%20%22Hello%20CoffeeScript!%22) from CoffeeScript to javascript, which is good for development. And there's an unofficial project, called js2coffee, whose website provide an [in-time translator](js2coffee.org/) from javascript to CoffeeScript! (However, the latter one may occur some mistakes, and the result should be checked on the first site...)

## [Express](http://expressjs.com/)

### What's it?

A framework for devloping Node.js websites.

### Install?

`npm install express@3.x -g` for global usage. Create a folde and run `express --css stylus` to get a hello world example. Then `npm install` to install the dependencies locally. Run `node app` to view the website!

### What's a "middleware"?

"Middleware" is an important concept for Express framework, and [Connect](http://www.senchalabs.org/connect/), the framework that Express is based on. In short, a request sent to Express apps (or/and the response) is handled, modified, 'filtered' by the middlewares, in order.

In fact, I think Node.js is still young, and its concepts are unfamiliar to most of us. It's good toy, however it should be carefully considered if we want to use it in production.