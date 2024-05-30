# This homework is written by 張禕紘 (312707043)

![螢幕擷取畫面 2024-05-30 161057](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161785685/56f8d3e5-8bf0-46ec-a41c-897870aa4167)
![螢幕擷取畫面 2024-05-30 161115](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161785685/28f78a12-a354-4151-ac9b-df8d9a7cad2d)

## ch15.6(c)

### Question:

column (3) contains the estimated fixed effects model specified in part (b). Compare these estimates with the OLS estimates. Which coefficients, apart from the intercepts, show the most
difference?

## Answer:

Using 95% interval estimates for the fixed effects (FE)

|  | upper bound | lower bound | OLS_estimator_1987 | OLS_estimator_1988 |
| --- | --- | --- | --- | --- |
| $EXPER$ | -0.00718 | 0.12218 | 0.127 | 0.1265 |
| $EXPER^2$ | -0.00336 | 0.000956 | -0.0033 | -0.0031 |
| $SOUTH$ | -0.57267 | -0.07953 | -0.2128 | -0.2384 |
| $UNION$ | 0.021048 | 0.143352 | 0.1445 | 0.1102 |

The  $EXPER$ coefficient estimated using OLS exceeded the 95% confidence interval. Therefore, the $EXPER$ coefficient shows a most significant difference between the OLS estimator and the FE estimator.

## ch15.6(d)

### Question:

The F-statistic for the null hypothesis that there are no individual differences, equation (15.20),
is 11.68. What are the degrees of freedom of the F-distribution if the null hypothesis (15.19) is
true? What is the 1% level of significance critical value for the test? What do you conclude about
the null hypothesis.

## Answer:

$N=716 ,T=2, K_s=4$

Suppose the F-statistic value is $11.68$ and null hypothesis is consider as true, at 1% level of the significance, the degree of freedom is $N-1=716-1=715$

Denominator degree of freedom is $NT-N-K_s=1432-716-4=712$

 $F_{0.99,715,712}=1.190496$. The critical value at the 1% significance level is $1.190496$.

Reject region is $F>F_{0.99,715,712}=1.190496$, $F=11.68$, reject null hypothesis.
