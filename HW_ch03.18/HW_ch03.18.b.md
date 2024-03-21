### This homework is written by 邱澤宇 (312707017)
## 03.18
## A life insurance company examines the relationship between the amount of life insurance held by a household and household income. Let $INCOME$ be household income (thousands of dollars) and $INSURANCE$ the amount of life insurance held (thousands of dollars). Using a random sample of $N$ = 20 households, the least squares estimated relationship is
## $\widehat{INSURANCE}=\left( 6.855 + 3.880I N C O M E\right)$
### &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(se)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(7.383) &nbsp; &nbsp; (0.112)

### 03.18 (b)
**Question:**\
How much do we estimate that the average amount of insurance held changes with each additional
$1000 of household income? Provide both a point estimate and a 95% interval estimate. Explain
the interval estimate to a group of stockholders in the insurance company.

**Ans:**\
 As the slope of the regression line is 3.880, theaverage amount of insurance held will increase  $3.880 * 1,000 = 3,880$  with each additional 1,000 of household income.


$\hat{b}_1 = 3.880$

two-tailed t value when alpha = 0.05, df = 18

$tc = 2.101$

The interval estimate is $[ b1 - t_cse(b_2) , b1 + t_cse(b_2) ] = [ 3.88 - 2.101 * 0.112 , 3.88 + 2.101 * 0.112 ] = [ 3.645 , 4.115 ]$

It means that we have 95% confident that the average amount of insurance held will increase at an amount between 3,645 and 4,115 with each additional 1,000 of household income.


**Sample code**
```
#b
df = 18
b0_318 = 6.855
b1_318 = 3.880
se_b0318 = 7.383
se_b1318 = 0.112

t_318b = qt(0.975, df)
lwb_318b = b1_318 - t_318b * se_b1318
upb_318b = b1_318 + t_318b * se_b1318
```
