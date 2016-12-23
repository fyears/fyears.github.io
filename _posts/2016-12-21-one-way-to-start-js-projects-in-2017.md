---
published: true
layout: post
title: One of the correct ways to start JS projects in 2017
tags:
  - javascript
  - front end
  - technology
categories: technology
---

## tl;dr

I choose to use [`create-react-app`](https://github.com/facebookincubator/create-react-app), then use ES2016 standard to write `react` to build the UI and use `redux` to manage the data, and write `flexbox` to manage layouts in CSS, if I am going to start a completely new general-purposes front end project in early 2017.

## disclaimer

This post only expresses my current opinion and suggestions and I am not responsible for any potential lost or profit for any readers. And moreover, I respect any developers or companies trying to make the community and the world better.

## personal complaints

Front end development is evolving really fast, I mean, **really** f***ing fast, especially in JavaScript-related fields.

It's in late 2016 and year 2017 is coming when I am writing this post. Many new learners in front end development are confused of a bunch of different concepts: `react`, `jQuery`, `webpack`, `browserify`, `gulp`, `npm`, `ES2015`... ["How it feels to learn JavaScript in 2016"](https://hackernoon.com/how-it-feels-to-learn-javascript-in-2016-d3a717dd577f) describes the confusion in a way making me laugh. As far as I am concerned, the front-end development is rapidly walking through all the ways the desktop GUI development once had. And because of the crazy optimization the browsers have, everyone is tending to making the front-end codebase larger and larger.

Besides that, I think JavaScript community likes to solve problems in unusual ways, (re-)invent the concepts, (re-)invent the toolkits, and likes to write small packages then compose them into larger packages, due to historical reasons. It was like, suddenly, many people realized that JS was a bad language and try to add features into the standard so people decided to propose ES2015 (a.k.a ES6) as a [significant update](https://babeljs.io/learn-es2015/) to the language, with arrow function, classes, etc. And interestingly JS community likes to "use new features beforehand", i.e., use `babel.js` to transform new-style JS code into old style. No other community frequently do that (For example, new compilers for latest C++ / Java standard, separated codebase for Python (or sometimes `six` package).). Or invent a better JavaScript like [CoffeeScript](http://coffeescript.org) or [TypeScript](https://www.typescriptlang.org/) then translate them into vanilla JS. Moreover, MVC, MVVM, pure function usage, task management, it seems that suddenly front end developers realize that those old desktop / backend / system development concepts can be applied to front end, too. Moreover, packages like to depend on small packages, and **NOT** hide the dependency. A small package `left-pad` caused tons of package broken in early 2016. Latest `babeljs` [splits](http://babeljs.io/blog/2015/10/31/setting-up-babel-6) itself into small plugins compared with old versions to "reduce unnecessarily large downloads". Oh, ES2015 eventually invent a new official module system, "combining the benefits of `require()` and AMD", and later `System.js` was invented to "load any module format". I could only think of the famous [xkcd #927](https://xkcd.com/927/) for this situation.

I sincerely wish front end development could become easier in one or two years.

## what are those concepts

HTML5 is the newer standard for HTML. Basically, it provides more markups and APIs.

CSS3 is the newer standard for CSS, providing new features like round corners and flexbox.

ECMAScript 2015 == ES2015 == ES6. "JavaScript" and "ECMAScript" are [differnt](https://stackoverflow.com/questions/912479/what-is-the-difference-between-javascript-and-ecmascript) but that's not important to normal developer. ES2015 introduces new / better syntax / features to the standard. CoffeeScript is a language that can be compiled to JS, but it's not important any more. TypeScript is another JS-like language with type annotation that can be compiled to JS, and it's usefully and maybe the next generation of ES standard. For late 2016 and early 2017, developer should learn ES2015 / ES2016 firstly, then learn TypeScript.

["Node.js is a server-side JavaScript runtime"](https://nodejs.org/). And it originally came with server-side package manger `npm`. On client side, people used `Bower` to manage packages in old days, but now `npm` manages packages on both server side and client side.

For task management, people used `Makefile`, `grunt`, `gulp`, `npm`. Nowadays people like to use `npm` directly, or use `npm` as the entry to many task scripts.

`browserify` and `webpack` are "package loader". Now many people choose `webpack`. "Package loader" can do many preprocess things, like loading packages, transforming language, "bundling" scripts, compressing outputs. As a result, many developers actually invoke some webpack scripts inside `npm`.

`babel` is an amazing library transforming new-style JS to old style for capability reasons. People usually invoke babel as one step in webpack commands.

`jQuery` and `d3.js` and `react` and `AngularJS 1` and `AngularJS 2` and `VueJS` are front end libraries or frameworks. People tend to not use `jQuery` in large applications any more. `d3.js` is super awesome for data visualization. `react` is Viewing library developed by Facebook. `AngularJS 1` and `AngularJS 2` are the front-end frameworks developed by Google, while they share different versions and same name, they are kind of very different in design. `VueJS` is another framework. `react` and `Angular` aim to solve different things: the former is just a view library (View in MV*) and the latter tries to provide whole-stack solution (MVC or MVVM) but people like to compare them. `react` is super easy but it should be combined with other things like `redux` to provide full front end solution, while `AngularJS` is already full solution but has a steep learning curve.

`fetch` is a new API and better replacement for `XMLHttpRequest`.

`JSX` in `react` is a syntax sugar. But we need `babel` or other things to transform it into normal JS.

## what to choose

Hopefully I have explained many concepts above clearly. Thus, to build the front end of a website, besides HTML and CSS, we usually need JavaScript to manage the data and the corresponding viewing effects, and make things "dynamic".

One old-style popular way was using `jQuery` to send AJAX calls and receive data, then manipulate the DOM. It might still be a good choice nowadays, but, on the one hand people use the ["standarized" APIs](http://youmightnotneedjquery.com/) abandoning the old browsers, so `jQuery` as the combability layer might be less necessary, and on the other hand people gradually think "manipulating DOM directly is bad", so people invent other libraries / frameworks to think differently.

`react` is a view library, designed behind the totally different idea compared with that's behind `jQuery`. I recommend everyone give it a try, because it has a smooth learning curve, helps building efficient UI efficiently, and plays an important role in front end development currently.

Surely `react` is not the only choice, but it's more natural to developers who don't come from Java world (yes, I am looking at you, `Angular`).

And, after choosing `react`, we only have the tool for displaying data, then (unfortunately) we need other things to "manage data" in the front end. Here comes `redux`, which is one of the best companions with `react`.

By developing front end projects nowadays, developers usually need a whole "building toolchain". Like what I explained above, they are so confusing. Here is one choice: use `webpack` to "bundle" (pack) all the code, meanwhile using `babel` to transform ES2016 codes and codes using new APIs into the old-style code that could be run on most browsers; also open a local webserver for debugging, which may support "hot reloading". Setting up these from scratch, in my opinion, is surprisingly annoying and time consuming.

Then here comes [`create-react-app`](https://github.com/facebookincubator/create-react-app). Once again, it's not the only choice. But it's officially supported by Facebook and has some sort of minimal configuration design. Once `npm install`, we could directly write modern JS (and HTML and CSS) code and the scripts would take care of the build process later.

## where to start?

Basic understanding of HTML, CSS, JS (easy). Some sort of new HTML tags, some new CSS styles, and how the modern JS codes are written (easy to know, not easy to write). Then know what AJAX / `fecth` is, those are very important for dynamically loading data in web (easy in concept), and how JS deals with async codes (hard to understand). Then `react` and `redux` and other new worlds (once you know the fundamentals, `react` is easy, `redux` is not easy, `Angular` is hard).
