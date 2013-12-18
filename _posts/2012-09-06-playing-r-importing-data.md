---
layout: post
title: "playing R: importing data"
description: ""
category: science
tags: [R, note, mathematics, statistics]
---

It's quite important to acquire, deal with and import data for statisticso work. Here is some notes about acquiring and importing data in R. This post may be updated frequently.

```r
# first of all, we should know where we are:
normalizePath("~")
# change the working directory if necessary:
setwd("~/tmp")
# show the file in the directory:
dir()
# edit some file if necessary:
file.edit("a.txt")
```

Assuming there are two files in the working directory:

a.txt:

```
name price
apple 10
orange 12
watermelon 9

```

b.csv:

```
name,price
apple,10
orange,12
watermelon,9

```

c.csv:

```
name,price
1,apple,10
2,orange,12
3,watermelon,9

```

Here shows the result. `read.table("a.txt",F)` is the same as `read.table("a.txt",header=F)` and `read.table("a.txt",header=FALSE)`. `read.table()` and `read.csv()` should load the data into RAM as data frame. Pay attention to the differences of the examples.

```r
> read.table("a.txt")
          V1    V2
1       name price
2      apple    10
3     orange    12
4 watermelon     9
> read.table("a.txt",F)
          V1    V2
1       name price
2      apple    10
3     orange    12
4 watermelon     9
> read.table("a.txt",T)
        name price
1      apple    10
2     orange    12
3 watermelon     9
> 
> read.csv("b.csv")
        name price
1      apple    10
2     orange    12
3 watermelon     9
> read.csv("b.csv",F)
          V1    V2
1       name price
2      apple    10
3     orange    12
4 watermelon     9
> read.csv("b.csv",T)
        name price
1      apple    10
2     orange    12
3 watermelon     9
> 
> read.csv("c.csv")
        name price
1      apple    10
2     orange    12
3 watermelon     9
> read.csv("c.csv",F)
    V1         V2 V3
1 name      price NA
2    1      apple 10
3    2     orange 12
4    3 watermelon  9
> read.csv("c.csv",T)
        name price
1      apple    10
2     orange    12
3 watermelon     9
> 
```

And some columns will be factors, some will be simple victors.

```r
> b <- read.csv("b.csv",header=TRUE)
> b$name
[1] apple      orange     watermelon
Levels: apple orange watermelon
> b$price
[1] 10 12  9
> 
```

`scan()` is another fast function to import data.

Acquiring infomation from the web is quite flexible.

[DataMarket](http://datamarket.com/) is amazing, with lots of free data avaiable to download. There are some [guides](http://blog.datamarket.com/2011/10/31/using-datamarket-from-within-r/). Run the following code to try:

```r
install.packages('rdatamarket')
library(rdatamarket)

l <- dmlist("http://datamarket.com/data/set/17tm/#ds=17tm|kqc=17.v.i")
head(l)

plot(dmseries("http://data.is/nyFeP9"))

oil <- dminfo("http://datamarket.com/data/set/17tm/#ds=17tm|kqc=17.v.i")
print(oil)
```

It's important to find the informations. Here are some websites may help.

```
http://datamarket.com/  # an open database, good with "rdatamarket"
http://en.wikipedia.org/wiki/Wikipedia:Database_download  # Wikipedia database
http://openflights.org/data.html  # data about flights among the world, three csv files.
http://stat-computing.org/dataexpo/  # The Data Expo at the Joint Statistical Meetings
http://data.worldbank.org/  # data from World Bank
https://explore.data.gov/catalog/raw  # data from Data.Gov
http://data.un.org/Default.aspx  # data from UN
http://www-958.ibm.com/software/data/cognos/manyeyes/datasets  # data sets from IBM
http://aws.amazon.com/datasets  # public data sets on AWS, big, including data from 1000 Genomes Project
http://snap.stanford.edu/data/  # Stanford Large Network Dataset Collection
http://archive.ics.uci.edu/ml/  # UC Irvine Machine Learning Repository
```
