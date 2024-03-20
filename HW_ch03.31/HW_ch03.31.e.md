#### This homework is written by 廖軒霈 (312707038)

## **Question 3.31 (e)** 

Construct a 95% interval estimate of the elasticity of sales of brand no. 1 with respect to the price of brand no. 1 “at the means.” Treat the sample means as constants and not random variables. Do you find the sales are fairly elastic, or fairly inelastic, with respect to price? Does this make economic sense? Why?

## **Ans**
1. - $SAL1=\beta1+\beta2PRICE1$\
mean($PRICE1$)=78.25\
mean($SAL1$)=6718.712\
$\epsilon =\cfrac{\frac{\Delta y}{y}}{\frac{\Delta x}{x}}$
=$m \frac{x}{y}$
= $\beta2 \frac{PRICE1}{SAL1}$
=-5.0598
   - For 95% C.I.\
We need to calculate the standard deviation of $\epsilon$ and t-statistic\
$se(\epsilon)= se(\beta2)\times \frac{PRICE1}{SAL1}=$ 0.9152\
t-statistic $=t_\frac{\alpha}{2}(n-2)$\
The interval is $\epsilon\pm t_\frac{\alpha}{2}(n-2)\times se(\epsilon)$\
   - From R.studio ,we get\
point estimator =-5.0598\
t-statistic =2.0086\
$se(\epsilon)=$ 0.9152\
so 95% C.I. $=[$-6.8981$,$-3.2215$]$
1.  $\epsilon=$-5.0598, sales are highly sensitive to price changes, indicating a high degree of elasticity.
2.  Yes, canned tuna has many substitutes in the market. Consummers have plenty of alternatives to choose from if the price of canned tuna increases. So the degree of elasticity is high.
## **Code**
```{r}
load('/Users/xuanpei/Downloads/poe5rdata/tuna.rdata')
mean_pricemean(price1)
mean_sal=mean(tuna$sal1)
ela=b2_331*mean(price1)/mean(tuna$sal1)
se_b2=summary(lm_331)$coefficients['price1', "Std. Error"]
se_ela=se_b2 * mean(price1)/mean(tuna$sal1)
alpha=0.05
df=lm_331$df.residual
t_value=qt(1-alpha/2, df)
ci_lower=ela-t_value*se_ela
ci_upper=ela+t_value*se_ela
cat("Elasticity:",ela,"\n")
cat("95% CI: [",ci_lower,",",ci_upper,"]\n")
```
