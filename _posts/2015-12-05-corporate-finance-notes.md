---
published: true
layout: post
title: corporate finance notes
tags:
  - finance
  - science
categories: science
---

## what

In the lecture [Corporate Finance](http://econweb.ucsd.edu/~gramey/173B.htm), Teaching Assistant [Jessie Wang](http://economics.ucsd.edu/about/Profile.aspx?pid=509) provides an excellent note.

## notes

### Cash Flow

Present Value: $V_A = \sum_{t=1}^{\infty}\frac{C_t}{(1+r)^t}$

Net Present Value: $NPV = PV - Investment$

Annuity: $\frac{B}{r-g} ( 1- (\frac{1+g}{1+r})^t)$

Perpetuity: $\frac{B}{r-g}$

rate of sub-period CF: $r_{sub} = (1+r)^\frac{1}{N} - 1$

delayed CF: $\frac{V_{future}}{(1+r)^T}$

 portfolio assets: $V = V_A + V_B$ and $r_p = \frac{V_A}{V}r_A + \frac{V_B}{V}r_B$

### Cash Flow Table

headers:

```
- yr, year
- I, Investment
- Scrap
- Dep, Depreciation
- uBV, undepreciatedBookValue, endingBookValue
- Rev, Revenue
- SG&A
- COGS, CostOfGoodSold
- Shrinkage
- BadDebt
- PNI, PreTaxIncome
- Tax
- Inv, Inventory
- ΔInv, ΔInventory
- NewGoods
- Rec, Receivable
- ΔRec, ΔReceivable
- WC, WorkingCapital
- ΔWC, ΔWorkingCapital
- CF, CashFlow
```

formulas:

```
PNI = Scrap - Dep - uBV + Rev - SG&A - COGS - Shrinkage - BadDebt

Tax = PNI * TaxRate

NewGoods = COGS + Shrinkage + ΔInv

CF = -I - Scrap + Rev - SG&A - BadDebt - NewGoods - ΔRec - ΔWC
```

inflation adjustment:

```
- I
- Scrap
- Rev
- SG&A
- COGS (sometimes)
```

### Debt

Debt, Bond.

Value of Debt: $D = \frac{F r_C}{r_D} (1 - (\frac{1}{1+r_D})^T) + (\frac{F}{1+r_D})^T$ where $F$ is Face Value, $D$ is current value of Debt, $r_C$ is coupon rate and $r_D$ is yield. And $\frac{F r_C}{r_D} (1 - (\frac{1}{1+r_D})^T)$ is annuity of market payment, and $(\frac{F}{1+r_D})^T$ is market value of principle payment.

$r_C = r_D \iff F = D$

Value of Interest Tax Shield: $V_{ITS} = \frac{F  r_C  \tau}{r_D - g} (1 - (\frac{1}{1+r_D})^T)$ where $g$ is growth rate on face value, and $\tau$ is tax rate, and assuming annuity here.

$r_C = r_D, T \to \infty \implies    V_{ITS} = D \tau$

### Equity

Equity, stock.

$r_E = \frac{Div + \Delta p}{p} = \frac{Div}{p} + g = \frac{Div}{p} + r_{CapitalGain}$ where $p$ is Price.

Dividend Yields: $\frac{Div}{p}$

$E = p k$ where $p$ is Price per share and $k$ is shares.

CAPM: $r_A = r_f + \beta_A (r_m - r_f) $ where $r_A$ is asset return rate, $r_f$ is risk-free rate,  $r_m$ is market return rate, and $r_m - r_f$ is risk premium.

### Firm Theory

MM Formula: $V_{EnterpriseMarketValue} \equiv V_A + V_{ITS} \equiv D + E$ at any time point.

Company Cost of Capital: ${CCC} = \frac{D r_D + E r_E}{D + E} = \frac{V_A r_A + V_{ITS} r_D}{D + E}$

Thus we also have, e.g, $r_A = \frac{D r_D + E r_E - V_{ITS} r_D}{V_A}$

Debt Ratio in the firm: $\delta = \frac{D}{D+E}$

$\lambda = \frac{\delta}{1 - \delta \tau}$

$D \equiv \lambda V_A = \frac{\delta}{1 - \delta \tau} V_A$

shorthand of $CCC$: $CCC = \delta r_D + (1-\delta)r_E$

$E = (D+E) - D$

### Projects

financing opinion. use $\hat{hat}$ to represent the values at post-adoption.

after adoption:

$I + B (1-\tau) = N_D + N_E + N_I + N_S$ where $N_I$ is new internal cash, $B$ is Brokerage Cost.

equity finance: $N_E = \hat{p} (\hat{k} - k)$

asset sale: $N_S = V_S - (V_S - uBV) \tau$ 

$B = I r_{BrokerageCommissionRate}$

$\hat{V_A} = V_A + V_B - V_S$ where $V_A$ is value of real asset, $V_B$ is current market value of all the future cash flow.

$\hat{D} = D + N_D$

$\hat{E} = \hat{p} \hat{k}  = (\hat{D} + \hat{E}) - \hat{D}$

$V_B = \frac{C}{r_A}$ if cash flow $C$ is perpetuity. 

$NPV = V_B - I$

$APV = NPV + N_D \tau - (V_S - uBV)\tau - B(1-\tau)$ where $V_S$ is the current market value of the sold, $B$ is Brokerage Cost.

$\hat{p} - p = \frac{APV + N_I}{k}$

net gain per share from project adoption: $\frac{APV}{k}$

$\hat{k} - k = \frac{N_E}{\hat{p}}$

Weighted Average Capital Cost: $WACC = r^* = \frac{V_A}{D+E} r_A = \delta (1-\tau) r_D + (1-\delta) r_E$,  used when the firm follows fixed debt ratio, new asset occurs as perpetuity, without asset sales, new asset has the same risk as the firm's existing real assets, and standard ITS formula are valid.

WACC method: $APV = \frac{C}{r^*} - I$ where $C$ is the perpetuity cash flow every period, $I$ is investment.
