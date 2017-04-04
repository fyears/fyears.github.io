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

## 下载

两者都可以在 GitHub 上下载。思源黑体：<https://github.com/adobe-fonts/source-han-sans/tree/release>，思源宋体：<https://github.com/adobe-fonts/source-han-serif/tree/release/>（都是 `release` branch 之下）。如果是最新版的 Windows 10 Anniversary Update 或者 macOS 10.8 等，无脑安装 OTCs，或者 Language-specific OTFs。

## 设置 CSS

对于设置 CSS，如果是安装到电脑上的字体，并且需要显示的是简体中文：

```css
body {
  font-family: Source Han Sans SC, Source Han Sans CN, sans-serif;
}
```
```css
body {
  font-family: Source Han Serif SC, Source Han Serif CN, serif;
}
```

实际上，更优雅的中文 CSS 设置可以参照[`fonts.css` 中文字体解决方案](https://zenozeng.github.io/fonts.css/)。
