### This homework is written by 鄧筠潔 (312707031)
Question:
#### d. Locate houses in the sample with 2000 square feet of living area. Calculate the sample mean(average) of their selling prices.Is the sample average of the selling price for houses with $SQFT = 20$ compatible with the result in part (c)? Explain.
Answer:

```
price<- collegetown$price
str(subset(collegetown,sqft == 20)$price)
summary(subset(collegetown,sqft == 20)$price)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786558/e2373edd-0595-4738-bec7-e4caeca58a80)

In the sample there are 3 houses with 2000 square feet ($SQFT = 20$). They sold for $138,000, $169,000 and $183,000 respectively, \
and the sample average is 163.3, which is inside the interval estimate [158.0481, 176.6988].
