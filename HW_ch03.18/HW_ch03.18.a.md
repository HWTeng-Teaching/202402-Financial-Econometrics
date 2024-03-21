### This homework is written by 許淨喻 (312707016)
## 03.18
## A life insurance company examines the relationship between the amount of life insurance held by a household and household income. Let $INCOME$ be household income (thousands of dollars) and $INSURANCE$ the amount of life insurance held (thousands of dollars). Using a random sample of $N$ = 20 households, the least squares estimated relationship is
## $\widehat{INSURANCE}=\left( 6.855 + 3.880I N C O M E\right)$
### &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(se)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(7.383) &nbsp; &nbsp; (0.112)

### 03.18 (a)
**Question:**\
Draw a sketch of the fitted relationship identifying the estimated slope and intercept. The sample mean of $INCOME$ = 59.3. What is the sample mean of the amount of insurance held? Locate the point of the means in your sketch.

**Ans:**\
When the least squares estimated relationship is $\widehat{INSURANCE}=\left( 6.855 + 3.880I N C O M E\right)$ , 

the estimated slope = 3.880

the estimated intercept = 6.855

When household income = 59.3, the sample mean of the amount of insurance held = 6.855 + 3.880 * 59.3 = 236.939



**Sample code**
```
install.packages("devtools")
library(devtools)

#a
b1=6.855 #estimated intercept
b2=3.880 #estimated slope
plot(NULL, main = "Fitted Regression Line", xlab = "INCOME", ylab = "INSURANCE",xlim=c(0,２00),ylim=c(0,400))
abline(b1, b2, col = "blue", lwd = 3)
sample_mean_insur = 6.855+3.880*59.3
points(59.3,sample_mean_insur,col="red",pch=16, cex=1.5)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/71587037/0f3ddac2-e682-44d4-bed7-84e371391643)


