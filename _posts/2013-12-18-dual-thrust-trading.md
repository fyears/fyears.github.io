---
published: true
layout: post
title: Dual Thrust Trading
tags:
  - interesting
  - r
categories: interesting
---

Dual Thrust is a very simple but seemly effective strategy in quantitative investment.

**Attention: I am NOT responsible for ANY of your loss!**

## strategy

1. After the close of first day, let `m = max(FirstDayHighestPrice-FirstDayClosePrice, FirstDayClosePrice-FirstDayLowestPrice)`, then let `SecondDayTrigger1 = m * k1`, `SecondDayTrigger2 = m * k2`. `SencondDayTrigger1` and `SecondDayTrigger2` are called trigger values.

2. In the second day, note down the `SecondDayOpenPrice`. Once the price is higher than `SecondDayOpenPrice + SecondDayTrigger1`, buy. And once the price is lower than `SecondDayOpenPrice - SecondDayTrigger2`, sell short.

3. This system is a reversal system. Say, Once the price is higher than `SecondDayOpenPrice + SecondDayTrigger1`, and buy two shares if having a short shares. And once the price is lower than `SecondDayOpenPrice - SecondDayTrigger2`, short sell two shares if having a long share. (TODO: precise translation in English. 如果在价格超过（开盘＋触发值1）时手头有一手空单，则买入两手。如果在价格低于（开盘－触发值2）时手上有一手多单，则卖出两手。)

## keypoints

This strategy is a super-easy one. It's possible to build an automated trading system to do all the jobs. But of course there are some risks. For example, how to choose `k1` and `k2` and how they influence the result are not clear for me. Moreover, sometimes the stock runs vibrately, then the strategy will cause loss in the unexpected way. Last but not least, no stop-loss order is included in this strategy. It's guessed (by me) that reducing `k2` may stop loss to some extend.

## simulation

If you want to reproduce the result or do some further research, you can download the `min1_sh000300.csv` and some other data from [this page](https://skydrive.live.com/redir?resid=8DBE987187DC7E74!1102&authkey=!AMNu1GwV54QRM4w) .

And possible-updated code for this project is on [Github](https://github.com/fyears/dual-thrust-simulation) . Of course forks and pull requests are welcome.

I choose the Shanghai Shenzhen CSI 300 Index (000300.SS) to run the simulation. I acquired `min1_sh000300.csv`, the high frequency (every-minute-level) index price of CSI300 from 2010-01-01 to 2013-11-30, with some days lost.

There are some assumptions and limitations in the simulation. I assume I have 1,000,000 (one million) yuan cash available (WOW), and I cannot borrow shares more than those valued as 50% of one million. And I started to apply the strategy from 2010-01-01 to 2013-11-11. No market impact, no transaction cost.

### library

**All** the below code requires these three libraries. Add these libraries accordingly firstly if you meet any troubles running code in this passage.

```r
library("lubridate")
library(ggplot2)
library("zoo")
## 
## Attaching package: 'zoo'
## 
## The following objects are masked from 'package:base':
## 
##     as.Date, as.Date.numeric
```

### load the data

```r
a = read.csv("min1_sh000300.csv")
head(a)
##   Stock Code                Time Open High  Low Close  Volume    Amount
## 1    sh  300 2010-01-04 09:31:00 3592 3597 3592  3596 1160765 1.555e+09
## 2    sh  300 2010-01-04 09:32:00 3595 3596 3592  3592  539317 7.652e+08
## 3    sh  300 2010-01-04 09:33:00 3593 3593 3589  3589  434880 6.097e+08
## 4    sh  300 2010-01-04 09:34:00 3588 3588 3586  3586  392227 5.727e+08
## 5    sh  300 2010-01-04 09:35:00 3587 3587 3586  3586  370230 5.236e+08
## 6    sh  300 2010-01-04 09:36:00 3587 3587 3586  3586  367130 5.186e+08

minutedata = read.zoo(a[, 3:9], FUN = ymd_hms)
head(minutedata)
##                     Open High  Low Close  Volume    Amount
## 2010-01-04 09:31:00 3592 3597 3592  3596 1160765 1.555e+09
## 2010-01-04 09:32:00 3595 3596 3592  3592  539317 7.652e+08
## 2010-01-04 09:33:00 3593 3593 3589  3589  434880 6.097e+08
## 2010-01-04 09:34:00 3588 3588 3586  3586  392227 5.727e+08
## 2010-01-04 09:35:00 3587 3587 3586  3586  370230 5.236e+08
## 2010-01-04 09:36:00 3587 3587 3586  3586  367130 5.186e+08
```

### generate the daily data

It's quite strange that Google and Yahoo! do not provide the precise daily data of CSI300. So I have to generate the daily (low-frequency) data from the minutes data!

```r
gendaydata <- function(minutedata){
    alldaysdata = data.frame(Date=NULL, Open=NULL, High=NULL, Low=NULL, Close=NULL)

    tmphigh = NULL
    tmplow = NULL
    tmpopen = NULL
    tmpclose = NULL

    for(i in 1:(nrow(minutedata)-1)){
        print(i)

        if(as.Date(index(minutedata)[i])==as.Date(index(minutedata)[i+1])){
            tmpopen = c(tmpopen, minutedata[i]$Open)
            tmphigh = c(tmphigh, minutedata[i]$High)
            tmplow = c(tmplow, minutedata[i]$Low)
        }

        if(as.Date(index(minutedata)[i])!=as.Date(index(minutedata)[i+1])){
            tmphigh = c(tmphigh, minutedata[i]$High)
            tmplow = c(tmplow, minutedata[i]$Low)
            tmpclose = minutedata[i]$Close

            dayhigh = max(tmphigh)
            daylow = min(tmplow)
            dayopen = tmpopen[1]
            dayclose = tmpclose[1]
            daydate = as.character(index(minutedata)[i])
            singledaydata = data.frame(Date=daydate, Open=dayopen, High=dayhigh, Low=daylow, Close=dayclose)
            alldaysdata = rbind(alldaysdata, singledaydata)

            tmphigh = NULL
            tmplow = NULL
            tmpopen = NULL
            tmpclose = NULL
        }

        if(as.Date(index(minutedata)[i])==as.Date(index(minutedata)[i+1]) && i+1==nrow(minutedata)){
            #tmpopen = c(tmpopen, minutedata[i]$Open)  # not needed
            #tmphigh = c(tmphigh, minutedata[i]$High)  # not needed
            #tmplow = c(tmplow, minutedata[i]$Low)  # not needed
            tmpclose = minutedata[i+1]$Close  #tmpclose = minutedata[i]$Close  # changed!!

            dayhigh = max(tmphigh)
            daylow = min(tmplow)
            dayopen = tmpopen[1]
            dayclose = tmpclose[1]
            daydate = as.character(index(minutedata)[i])
            singledaydata = data.frame(Date=daydate, Open=dayopen, High=dayhigh, Low=daylow, Close=dayclose)
            alldaysdata = rbind(alldaysdata, singledaydata)

            tmphigh = NULL
            tmplow = NULL
            tmpopen = NULL
            tmpclose = NULL
        }
    }

    return(alldaysdata)
}
```

Then I do this:

```r
daydata = gendaydata(minutedata)
# requires a long long time!!
daydata = as.zoo(daydata[,2:5], as.Date(daydata[,1]))
# turn it into a zoo object
head(daydata)
##            Open High  Low Close
## 2010-01-04 3592 3597 3535  3535
## 2010-01-05 3545 3577 3498  3564
## 2010-01-06 3559 3589 3541  3542
## 2010-01-07 3543 3559 3453  3471
## 2010-01-08 3457 3482 3427  3480
## 2010-01-11 3593 3594 3466  3482
```

### run!

Two situations are worth discussing: the first is that investors cannot sell short, and the second is that the investors can sell short.

For example, A-shares in China do not allow shorting. In other words, investors can "just sell all the shares they own", but they cannot "borrow extra shares and sell them, and then return the shares to the lenders next time they buy the shares". But when it comes to options stocks or funds stocks, they are allowed to sell short in China.

So at first I define this trading function, in which the investors cannot sell short:

```r
starttradesimp <- function(minutedata, daydata, minutesinday=240, k1=0.5, k2=0.2, startmoney=1000000){
    daydata$hmc = daydata$High - daydata$Close
    daydata$cml = daydata$Close - daydata$Low
    daydata$maxhmccml = (daydata$hmc + daydata$cml + abs(daydata$hmc - daydata$cml)) / 2
    daydata$trigger1 = daydata$maxhmccml * k1
    daydata$trigger2 = daydata$maxhmccml * k2
    print(daydata)

    timevetor = c()
    cashvetor = c()
    stockassetvetor = c()
    allvetor = cashvetor + stockassetvetor

    cash = startmoney
    hands = 0
    stockasset = 0

    for(i in 2:nrow(daydata)){
        trigger1 = as.numeric(daydata$trigger1[i-1])
        trigger2 = as.numeric(daydata$trigger2[i-1])

        for(k in ((i-1)*minutesinday+1):(i*minutesinday)){
            # access this day's minute data
            if(as.numeric(minutedata[k]$Open) > (as.numeric(daydata[i]$Open)+trigger1)){
                # buy
                print('buyyyyyyyyyyyyy!')
                thishands = cash %/% as.numeric(minutedata[k]$Open)
                cash = cash - thishands * as.numeric(minutedata[k]$Open)
                hands = thishands + hands
                stockasset = hands * as.numeric(minutedata[k]$Open)
            } else if(as.numeric(minutedata[k]$Open) < (as.numeric(daydata[i]$Open)-trigger2)){
                # sell
                print('sellllllllllllll!')
                cash = cash + hands * as.numeric(minutedata[k]$Open)
                hands = 0
                stockasset = 0
            } else{
                stockasset = hands * as.numeric(minutedata[k]$Open)
            }

            timevetor = c(timevetor, index(minutedata)[k])
            cashvetor = c(cashvetor, cash)
            stockassetvetor = c(stockassetvetor, stockasset)
            allvetor = c(allvetor, cash+stockasset)
            print(paste('i:', i, ', k:', k, ', cash:', cash, ', stockasset:', stockasset, ', ',index(minutedata)[k] ))
        }
    }

    return(data.frame(time=as.POSIXct(timevetor, origin='1970-01-01', tz='UTC'), cash=cashvetor, stockasset=stockassetvetor, all=allvetor))
}
```

And the second function in which investors can sell short:

```r
starttrade <- function(minutedata, daydata, minutesinday=240, k1=0.5, k2=0.2, startmoney=1000000, borrowed_rate = 0.5){
    daydata$hmc = daydata$High - daydata$Close
    daydata$cml = daydata$Close - daydata$Low
    daydata$maxhmccml = (daydata$hmc + daydata$cml + abs(daydata$hmc - daydata$cml)) / 2
    daydata$trigger1 = daydata$maxhmccml * k1
    daydata$trigger2 = daydata$maxhmccml * k2
    print(daydata)

    timevetor = c()
    cashvetor = c()
    stockassetvetor = c()
    allvetor = cashvetor + stockassetvetor

    cash = startmoney
    hands = 0
    stockasset = 0
    borrowed_money = startmoney * borrowed_rate
    borrowed_hands = 0
    has_borrowed = FALSE

    for(i in 2:nrow(daydata)){
        trigger1 = as.numeric(daydata$trigger1[i-1])
        trigger2 = as.numeric(daydata$trigger2[i-1])

        for(k in ((i-1)*minutesinday+1):(i*minutesinday)){
            # access this day's minute data
            if(as.numeric(minutedata[k]$Open) > (as.numeric(daydata[i]$Open)+trigger1)){
                # buy
                print('buyyyyyyyyyyyyy!')
                thishands = cash %/% as.numeric(minutedata[k]$Open)
                cash = cash - thishands * as.numeric(minutedata[k]$Open)
                hands = thishands + hands - borrowed_hands
                stockasset = hands * as.numeric(minutedata[k]$Open)
                borrowed_hands = 0
                has_borrowed = FALSE
            } else if(as.numeric(minutedata[k]$Open) < (as.numeric(daydata[i]$Open)-trigger2)){
                # sell
                print('sellllllllllllll!')
                if(!has_borrowed){
                    borrowed_hands_this_time = borrowed_money %/% as.numeric(minutedata[k]$Open)
                    has_borrowed = TRUE
                } else{
                    borrowed_hands_this_time = 0
                }
                borrowed_hands = borrowed_hands + borrowed_hands_this_time
                cash = cash + (borrowed_hands_this_time + hands) * as.numeric(minutedata[k]$Open)
                hands = 0
                stockasset = 0
            } else{
                stockasset = hands * as.numeric(minutedata[k]$Open)
            }

            #print(borrowed_hands*as.numeric(minutedata[k]$Open))
            #print(borrowed_hands)
            #print(cash)
            #print(cash-borrowed_hands*as.numeric(minutedata[k]$Open))
            #print(as.numeric(minutedata[k]$Open))
            realcash = cash-borrowed_hands*as.numeric(minutedata[k]$Open)
            timevetor = c(timevetor, index(minutedata)[k])
            cashvetor = c(cashvetor, realcash)
            stockassetvetor = c(stockassetvetor, stockasset)
            allvetor = c(allvetor, realcash+stockasset)
            print(paste('i: ', i, '  k: ', k, '  realcash: ', realcash, '  stockasset: ', stockasset, '  ',index(minutedata)[k] ))
        }
    }

    return(data.frame(time=as.POSIXct(timevetor, origin='1970-01-01', tz='UTC'), realcash=cashvetor, stockasset=stockassetvetor, all=allvetor))
}
```

(Eww, complex enough...)

Both functions above accept the `minutedata` and `daydata` (generated before, `zoo` objects), then pretend there is a smart investor who can observe the stock every minute. Once the prices reach the trigger values, the investor knows it's time to sell or buy, then manipulates his/her assets accordingly. However, sometimes it's time to sell, but the investor don't have any shares in market, so he/she does nothing. Similarly, he/she does nothing if he/she doesn't have enough cash even the "buy!" signal is sent. At last, the functions return the `data.frame` objects reflecting the assets of the investor in every minute.

Next step. You may have to wait a night for these lines of code:

```r
gen_trade_simp_result = starttradesimp(minutedata, daydata)
# verrrrrrrryyyyyyyyy slooooooooooooooowwwwwwwww!
gen_trade_result = starttrade(minutedata, daydata)
# verrrrrrrryyyyyyyyy slooooooooooooooowwwwwwwww!
```

### result

```r
head(gen_trade_simp_result)
##                  time  cash stockasset   all
## 1 2010-01-05 09:31:00 1e+06          0 1e+06
## 2 2010-01-05 09:32:00 1e+06          0 1e+06
## 3 2010-01-05 09:33:00 1e+06          0 1e+06
## 4 2010-01-05 09:34:00 1e+06          0 1e+06
## 5 2010-01-05 09:35:00 1e+06          0 1e+06
## 6 2010-01-05 09:36:00 1e+06          0 1e+06
head(gen_trade_result)
##                  time realcash stockasset   all
## 1 2010-01-05 09:31:00    1e+06          0 1e+06
## 2 2010-01-05 09:32:00    1e+06          0 1e+06
## 3 2010-01-05 09:33:00    1e+06          0 1e+06
## 4 2010-01-05 09:34:00    1e+06          0 1e+06
## 5 2010-01-05 09:35:00    1e+06          0 1e+06
## 6 2010-01-05 09:36:00    1e+06          0 1e+06
```

Well, you probably know the structure of the result `data.frame`s now.

Why not have a plot?

```r
qplot(x = gen_trade_simp_result$time, y = gen_trade_simp_result$all)
```

![trade-simple-result](data:image/png;base64,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)

```r
qplot(x = gen_trade_result$time, y = gen_trade_result$all)
```

![trade-simple-result](data:image/png;base64,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)

= = /// The results are very promising!!!!!!!!!!! Please analyse the picture by yourselves, and check whether there is any errors in my functions.

## end

The results of simulations show that Dual Thrust is a very magic and efficient strategy in stock market. So... really? Of course not. First, I do not consider market impact and transaction cost. Second, I ignore the possibility of margin call. Third, you have to apply the strategy for a relatively **long** time. And so many factors influence the market, no strategy ensures profits.

One more thing: Huatai Securities releases two detailed and professonial reports ([first one](http://www.xcf.cn/zjfxs/yjzs/jrgc/201210/P020121004348795101761.pdf) & [second one](http://www.xcf.cn/zjfxs/yjzs/jrgc/201210/P020121004348175810786.pdf)) about Dual Thrust in Chinese.

**Attention again: I am NOT responsible for ANY of your loss!**
