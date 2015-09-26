---
title       : Introducing Historical Stock Price Comparison App
subtitle    : Course Project for Developing Data Products
author      : Carolyn
job         : MOOCer
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Why?

Why create/use this app?

1. Stock investment for investment managers
2. Quantitative research for quantitative analysts
3. Company/industry comparison for people interested in finance in general

--- .class #id 

## What?

What does this app do?

1. This is a tool to get and compare histocial stock prices for publicly traded companies on NASDAQ or NYSE.

2. Compares two stocks for a specific time period between 2007 and present by calculating the mean, standard deviation and correlation for the close prices.

3. Generates time series charts for easy visualizaion.

--- .class #id 

## hoW?

How was this app created?

1. Using R package quantmod: a quantitative financial modelling and trading framework for R.

2. Getting historial stock prices from Yahoo! Finance.

3. Using close prices, but can be tweaked to include the option to get other prices and volume. E.g., to get amazon stock prices for Jan 3rd, 2007.


```r
library(quantmod)
amzn<-getSymbols('AMZN',auto.assign=FALSE)
amzn[1,]
```

```
##            AMZN.Open AMZN.High AMZN.Low AMZN.Close AMZN.Volume
## 2007-01-03     38.68     39.06    38.05       38.7    12405100
##            AMZN.Adjusted
## 2007-01-03          38.7
```

--- .class #id 

## Where?

Where is the app/documentation/code?

1. The app along with a short documentation is deployed on Rstudio's shiny server:
<https://carolynchen.shinyapps.io/HSPC>.

2. The ui.R and server.R source code is on github:
<>.



