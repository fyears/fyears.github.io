---
layout: post
redirect_from:
  /2012/09/playing-r-useful-packages/
title: "playing R: useful packages"
description: ""
category: science
tags: [interesting, mathematics, R, note, statistic]
---

R is an useful software for statistical computing. And it has a package system, which enables users to install many interesting and useful packages. Here I note and recommend some.

```r
install.packages("ggplot2")  # powerful printing system
install.packages("devtools")  # make dev life easier
install.packages("knitr")  # elegant report generator
install.packages("reshape2")  # use melt() and *cast() to reshape the data
install.packages("plyr")  # The split-apply-combine strategy for R
install.packages("stringr")  # work with strings

install.packages("Rglpk")  # powerful solver for mixed integer linear programming
install.packages("lpSolve")  # including solver for transportation problem and assignment problem
install.packages("goalprog")  # goal programming
install.packages("Rdonlp2", repos="http://R-Forge.R-project.org")  # powerful solver for smooth nonlinear minimization problem
install.packages("gafit")  # simple package for Genetic Programming
install.packages("igraph")  # complex network research
install.packages("TSP")  # travelling salesman problem

install.packages('foreign')  # read SPSS, SAS, S-PLUS, Stata files
install.packages("ggpmap")  # access Google Maps
install.packages("googleVis")  # access Google Visualisation API
install.packages("rdatamarket")  # access http://datamarket.com/
install.packages("twitteR")  # access Twitter
```

