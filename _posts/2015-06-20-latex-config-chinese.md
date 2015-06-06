---
published: true
layout: post
title: some LaTeX notes
tags:
  - science
  - technology
categories: technology
---

Here are some notes for LaTeX. All from a guy's blog: [始终](http://liam0205.me/).

### LaTeX 的中文

曾经 LaTeX 的中文处理非常繁琐，现在日新月异，LaTeX 的中文处理在一般情况下已经很便捷，再也不需要折腾。

要求：安装最新的 TeX Live 2015 / MacTeX 2015 （重点是需要其中的 CTeX 2.0 宏包）。使用 XeLaTeX。

如果需要中文版式：

```latex
%!TEX program = xelatex
\documentclass[UTF8]{ctexart}
\begin{document}
这个文档有中文版式和自动的字体配置。
\end{document}
```

如果只是插入一部分中文，不需要中文版式：

```latex
%!TEX program = xelatex
\documentclass{article}
\usepackage[UTF8, heading = false, scheme = plain]{ctex}
\begin{document}
This article contains some 中文文字.
\end{document}
```

全部都使用 `xelatex` 来进行编译。

### LaTeX and Sublime Text

Install Sublime Text, TeX Live 2015 / MacTeX 2015.

Install SumatraPDF on Windows, Skim on OSX, or Evince on Linux.

In Sublime, install [Package Control](https://packagecontrol.io/) then install [LaTeXTools](https://github.com/SublimeText/LaTeXTools). After Installation, we have to run command "Reconfigure LaTeXTools and migrate settings" before the first time use.

Then use `Command + B` or `Ctrl + B` inside Sublime to compile the LaTeX files. If we need Chinese characters, we could add `%!TEX program = xelatex` as the first line of the source codes.

### References

All notes are copied and/or built upon these links, which are distributed under CC BY-SA 3.0:

- [始终](http://liam0205.me/)
- [一份其实很短的 LaTeX 入门文档](http://liam0205.me/2014/09/08/latex-introduction/)
- [为 MacTeX 配置中文支持](http://liam0205.me/2014/11/02/latex-mactex-chinese-support/)
- [订制 Sublime Text 下 LaTeXTools 插件的编译脚本](http://liam0205.me/2014/12/14/advanced-builder-latextools/)
