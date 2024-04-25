#
## This homework is written by  施昱全 (312707008)
## ch08.06 (d)
**Question:**\
Following the regression in part (b) we carry out the White test for heteroskedasticity. The value of the test statistic is 78.82. What are the degrees of freedom of the test statistic? What is the  5% critical value for the test? What do you conclude?

$$ WAGE_i = \beta_1 + \beta_2 EDUC_i + \beta_3 EXPER_i + \beta_4 METRO_i + \beta_5 FEMALE_i + e_i $$

**Answer:**

df = number of variables + number of variables square + number of interactions - indicator variables =  4 + 4 + 6 - 2 = 12

$\ Rejection\ region : \lbrace \chi : \chi^* > \chi_{(12,0.95)} = 21.02607 \rbrace \$

$\ test\ statistic\quad \chi^* = 78.82 \$

$\ \because \chi^* = 78.82 > \chi_{(12,0.95)} = 21.02607 \therefore Reject \ H_0 \$

We have significant evidence to reject homoskedasticity. It means $\ \sigma^2_{SINGLE} \neq \sigma^2_{MARRIED} \$

```
qchisq(0.95, df = 12)
```
```
21.02607
```
