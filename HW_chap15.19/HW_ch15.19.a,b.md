### This homework is written by  曾昱樵 (312707057)

## ch15.19 (a)

This exercise uses the data and model in Exercise 15.18

**Question:**\
Extimate the model assuming random effects and with the characteristics of the sex workers included in the model. Carry out a test of the joint significance of the sex worker characteristics at the 5% level. Are these coefficients jointly significant? Are they individually significant?


**Solution:**\
|    term   | Coeff.  | SD.  |  p-value    | 
|:------------:|:-------------:|:------------:|:------------:|
| intercept      |  5.9104 ***| 0.1303 | 0.0000 |
| AGE    |  -0.0258 ***| 0.0028 | 0.0000 |
| ATTRACTIVE       |  0.2768 ***| 0.0602 | 0.0000 |
| SCHOOL      |  0.2161 ***| 0.0453 | 0.0000 |
| REGULAR    |   0.0236 | 0.0162 |0.1443|
| RICH        |  0.1160 *** | 0.0200 |0.0000|
| ALCOHOL         |  0.0149 | 0.0250 | 0.5507 |
| NOCONDOM       |  0.1390 ***| 0.0250 | 4.9098 |
| BAR | 0.4642 ***|0.0999 |0.0000 |
| STREET   |  0.1033 | 0.1011 | 0.3068 |

Joint Significance: The chi-squared statistic is 123.23 with a p-value < 2.2e-16, indicating that the characteristics AGE, ATTRACTIVE, and SCHOOL are jointly significant at the 5% level.

Individual Significance: The coefficients for AGE, ATTRACTIVE, and SCHOOL are individually significant based on their p-values

## ch15.19 (b)

**Question:**\
What is your 95% interval estimate of the risk premium, the coefficient on NOCONDOM, based on these random effects estimates?

**Solution:**\
95% Confidence Interval: [0.0899, 0.1880]

In repeated sampling, about 95% intervals constructed this way will contain the true value of the risk premium.

