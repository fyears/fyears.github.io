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

1. 如果是 macOS 10.8 等，无脑安装 Super OTC（实测 Windows 不能）；如果是 Windows 10 Anniversary Update 或更加新的，尝试安装 OTCs；实在不行，选择 Language-specific OTFs。

    **推荐** Noto CJK 系列在 Google 网站下载：[Noto CJK](https://www.google.com/get/noto/help/cjk/) 或者 GitHub 上的 [`googlei18n/noto-cjk`](https://github.com/googlei18n/noto-cjk)。可以参阅 [Guidelines for Using Noto](https://www.google.com/get/noto/help/guidelines/)。

    Source Han 系列在 GitHub 下载：[Source Han Sans](https://github.com/adobe-fonts/source-han-sans/tree/release)，[Source Han Serif](https://github.com/adobe-fonts/source-han-serif/tree/release/)（都是 `release` branch 之下）。

2. Debian / Ubuntu 下直接 `sudo apt-get install fonts-noto-cjk` 即可。如果 Linux 下要手动安装的话，安装 Super OTC 即可。

## CSS 中使用思源黑体和思源宋体

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

## $\LaTeX$ 中使用思源黑体和思源宋体

$\LaTeX$ 的中文设置强烈[推荐](https://www.fyears.org/2015/06/latex-config-chinese.html) `xelatex` + `ctex` 的组合。 ~~尽管如此，这也是一个天坑。~~ 🙄

首先更新字体缓存：

```bash
# fc-cache # in the font directory
fc-list :lang=zh
```

然后设置各种字体。我不是很懂 `\setCJKfamilyfont` 到底是否需要设置。例子 `doc.tex` 如下：

```latex
%!TEX program = xelatex

\documentclass[UTF8]{ctexart}

\setCJKmainfont[BoldFont = Noto Sans CJK SC]{Noto Serif CJK SC}
\setCJKsansfont{Noto Sans CJK SC}
\setCJKfamilyfont{zhsong}{Noto Serif CJK SC}
\setCJKfamilyfont{zhhei}{Noto Sans CJK SC}

\begin{document}
\section{这是一个章节标题}
这个文档有中文版式和自动的字体配置。
\end{document}
```

记得用 `xelatex` 编译：

```bash
xelatex doc.tex
```

## 效果

来一段林肯的《Gettysburg Address 葛底斯堡演说》中文版吧，用思源宋体展示，摘自[维基百科](https://zh.wikipedia.org/wiki/%E8%93%8B%E8%8C%B2%E5%A0%A1%E6%BC%94%E8%AA%AA)：

<blockquote style="font-family: Noto Serif CJK SC, Source Han Serif SC;">
<p>先人立国已逾八十有七载。立国以自由，众生平等乃国本也。</p>
<p>今逢内争，欲明以此为本之国能永存否。今聚战场，欲以方寸之地奉我勇士。勇士者，为国捐躯舍生取义，奉以此地安之，义举也。</p>
<p>然复往广推，此地难奉，遑论祭或圣之。众勇士，或存或亡，皆战于此，已奉祭于斯，我等绵力不能增其圣以毫厘，或减以寸分。吾等今日所言，世人将漠之，记忆必短；然勇士事迹，量不致或忘丝毫。吾尚存者，当担所余大任；承烈士遗志，倍吾力于未竟之业；神佑吾国，当获自由之新生；民有、民治、民享之政必永续于世。</p>
</blockquote>
