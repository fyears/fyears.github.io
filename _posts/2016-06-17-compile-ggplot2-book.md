---
published: true
layout: post
title: compile Hadley's ggplot2 book (online version)
tags:
  - R
  - ggplot2
categories: programming
---

Hadley's [ggplot2 book](https://github.com/hadley/ggplot2-book) is a useful resource about learning his `ggplot2` package. He generously provides the online version for us to read. But how to compile and get the (personal) pdf version from the repo? I figure it out and note down here. I am working on Windows 10.

To sum up: we need these working in command line: `git` `R` `xelatex` `make` `optipng` `pandoc`. Then `make clean && make`.

## pre-installation

After installing above things (On Windows, like `Git`, `Gow`, `Rtools`, `MiKTeX`, and others), run these in terminal to verify:

```bash
git --version
gcc --version
R --version
xelatex --version # or pdflatex --version
make --version
pandoc --version
optipng --version
```

## generate pdf

Prepare:

```bash
git clone https://github.com/hadley/ggplot2-book.git
cd ggplot2-book/
make clean
R -e "devtools::install_deps()"
```

Then run!

```bash
make
```

The first time of `make`-ing is taking a while. But next time, if you make some changes to the `*.rmd` files and `make` it again, it will be faster.

Finally, read and enjoy `ggplot2-book/book/ggplot2-book.pdf`. Yay!

## bonus: preparation for internationalization

```diff
diff --git a/Makefile b/Makefile
index 7de869b..aeae0f5 100644
--- a/Makefile
+++ b/Makefile
@@ -9,7 +9,7 @@ book/ggplot2-book.pdf: $(TEXDIR) $(TEXDIR)/ggplot2-book.tex book/CHAPTERS
  cp -R book/springer/* $(TEXDIR)
  cp book/latexmk $(TEXDIR)/
  cp book/latexmkrc $(TEXDIR)/
- cd $(TEXDIR) && ./latexmk -pdf -interaction=batchmode ggplot2-book.tex
+ cd $(TEXDIR) && ./latexmk -xelatex -interaction=batchmode ggplot2-book.tex
  cp $(TEXDIR)/ggplot2-book.pdf book/ggplot2-book.pdf

 book/CHAPTERS: $(TEX_CHAPTERS)
diff --git a/book/ggplot2-book.tex b/book/ggplot2-book.tex
index 8a683c5..23fe524 100644
--- a/book/ggplot2-book.tex
+++ b/book/ggplot2-book.tex
@@ -2,6 +2,8 @@

 \usepackage[scaled=0.92,varqu]{inconsolata}

+\usepackage[UTF8, hyperref, heading = false, scheme = plain]{ctex}
+
 \usepackage{float}
 \usepackage{index}
 % index functions separately
diff --git a/book/render-tex.R b/book/render-tex.R
index 2dcf03c..1aeb052 100644
--- a/book/render-tex.R
+++ b/book/render-tex.R
@@ -9,6 +9,7 @@ if (length(path) == 0) {
   base <- oldbookdown::tex_chapter()
   base$knitr$opts_knit$width <- 67
   base$pandoc$from <- "markdown"
+  base$pandoc$latex_engine <- "xelatex"

-  rmarkdown::render(path, base, output_dir = "book/tex", envir = globalenv(), quiet = TRUE)
+  rmarkdown::render(path, base, output_dir = "book/tex", envir = globalenv(), quiet = TRUE, encoding = "UTF-8")
 }
diff --git a/ggplot2-book.Rproj b/ggplot2-book.Rproj
index a6cad59..b6c62ba 100644
--- a/ggplot2-book.Rproj
+++ b/ggplot2-book.Rproj
@@ -10,7 +10,7 @@ NumSpacesForTab: 2
 Encoding: UTF-8

 RnwWeave: knitr
-LaTeX: pdfLaTeX
+LaTeX: XeLaTeX

 StripTrailingWhitespace: Yes
```
