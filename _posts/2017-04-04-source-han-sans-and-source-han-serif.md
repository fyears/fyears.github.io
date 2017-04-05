---
published: true
layout: post
title: 思源黑体和思源宋体
tags:
  - technology
  - Chinese
categories: technology
---

## 字体发布

继 2014 年 Adobe 发布[思源黑体](https://blog.typekit.com/alternate/source-han-sans-chs/)之后，现在 2017 年 Adobe 发布了[思源宋体](https://source.typekit.com/source-han-serif/cn/)！两者都开源！不要钱！走过路过不要错过！这是一种什么精神？！一种国际主义精神！

## Noto Sans CJK 和 Noto Serif CJK 又是什么鬼？

Noto 是 Google 贴牌的字体族，其中的中日韩字体部分，由 Google 和 Adobe 等共同开发。所以，两种字体的中日韩部分是一样的，一字两表。

## 那么问题来了，使用哪个？

我也受到这个问题困扰很久。没有特殊情况下，应该是**安装其中一种就够了**。

**推荐** 如果没有意外，以后的 Android 的 CJK 字体必然自带 Noto CJK 的！而且，现在的 Ubuntu 已经全面拥抱 Noto Sans CJK 了。所以出于实用主义缘故，使用 Noto Sans CJK 和 Noto Serif CJK 会有更大几率碰到用户安装了字体的情况。

如果是 Adobe 迷，或者是相关软件用户，或者使用 [Typekit](https://typekit.com/) 业务，当然可以使用 Source Han Sans 和 Source Han Serif。

## 下载

**推荐** Noto CJK 系列在 Google 网站下载：[Noto CJK](https://www.google.com/get/noto/help/cjk/) 或者 GitHub 上的 [`googlei18n/noto-cjk`](https://github.com/googlei18n/noto-cjk)。可以参阅 [Guidelines for Using Noto](https://www.google.com/get/noto/help/guidelines/)。

Source Han 系列在 GitHub 下载：[Source Han Sans](https://github.com/adobe-fonts/source-han-sans/tree/release)，[Source Han Serif](https://github.com/adobe-fonts/source-han-serif/tree/release/)（都是 `release` branch 之下）。

如果是 macOS 10.8 等，无脑安装 Super OTC（实测 Windows 不能）；如果是 Windows 10 Anniversary Update 或其它，尝试安装 OTCs；实在不行，选择 Language-specific OTFs。Ubuntu 下应该默认有了 Noto Sans CJK，可以预计以后能 `apt-get` Noto Serif CJK。

## CSS 中使用

[Google Fonts Early Access](https://fonts.google.com/earlyaccess) 提供了 [Noto Sans CJK](https://fonts.google.com/earlyaccess#Noto+Sans+SC) 的免费使用，可预见的未来应该会加上 Noto Serif CJK。**但是这并不是很有用**，因为需要下载整个字形的字体。如果真有这种 web font 的需要，Typekit 应该是更好的选择。

对于设置 CSS，如果是安装到电脑上的字体，并且需要显示的是简体中文：

```css
/*
@import url(https://fonts.googleapis.com/earlyaccess/notosanssc.css);
*/

body {
  font-family: Noto Sans CJK SC, Source Han Sans SC, Source Han Sans CN, sans-serif;
}
```
```css
body {
  font-family: Noto Serif CJK SC, Source Han Serif SC, Source Han Serif CN, serif;
}
```

实际上，更完整的，考虑到各个系统的中文 CSS 设置可以参照[`fonts.css` 中文字体解决方案](https://zenozeng.github.io/fonts.css/)。

## $\LaTeX$ 中使用

$\LaTeX$ 的中文设置强烈[推荐](https://www.fyears.org/2015/06/latex-config-chinese.html) `xelatex` + `ctex` 的组合。尽管如此，这也是一个天坑。🙄

首先更新字体缓存：

```bash
# fc-cache # in the font directory
fc-list :lang=zh
```

然后设置各种字体：

```latex
%!TEX program = xelatex
\documentclass[UTF8]{ctexart}
\setCJKmainfont{Noto Serif CJK SC}
\setCJKsansfont{Noto Sans CJK SC}
\begin{document}
\section{这是一个章节标题}
这个文档有中文版式和自动的字体配置。
\end{document}
```

记得用 `xelatex` 编译：

```bash
xelatex doc.tex
```

