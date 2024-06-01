## ch15.19 

This exercise uses the data and model in Exercise 15.18.

### ch15.19 (e)

#### Question: 

Using the t-test statistic in equation (15.36) and a 5% significance level, test whether there are any significant differences between the fixed effects and random effects estimates of the coefficients on `NOCONDOM`, `RICH`, `REGULAR`, `ALCOHOL`, `BAR`, and `STREET`. If there are significant differences between any of the coefficients, should we rely on the fixed effects estimates or the random effects estimates? Explain your choice.

#### Answer:

$$
\ln(\text{PRICE}_{it}) = \beta_1 + \beta_2 \text{BAR}_{it} + \beta_3 \text{STREET}_{it} + \beta_4 \text{OTHERSITE}_{it} + \beta_5 \text{NOCONDOM}_{it} + \beta_6 \text{ATTRACTIVE}_{it} + \beta_7 \text{SCHOOL}_{it} + \beta_8 \text{AGE}_{it} + \beta_9 \text{RICH}_{it} + \beta_{10} \text{REGULAR}_{it} + \beta_{11} \text{ALCOHOL}_{it} + e_{it}
$$

##### equation (15.36)
$$ 
t = \frac{b_{FE,k} - b_{RE,k}}{\sqrt{\widehat{\text{var}}(b_{FE,k}) - \widehat{\text{var}}(b_{RE,k})}} = \frac{b_{FE,k} - b_{RE,k}}{\sqrt{\text{se}(b_{FE,k})^2 - \text{se}(b_{RE,k})^2}} 
$$


##### Results of fixed effects and random effects estimates and t-test statistic in equation (15.36)

|  |  Coeff. (FE)   | SD. (FE)  |  Coeff. (RE)   | SD. (RE)  |  t-value    | 
|:-------------:|:------------:|:-------------:|:------------:|:-------------:|:------------:|
| `NOCONDOM`       |   0.1703 ***   | 0.0258  | 0.1390 ***| 0.0250 | 4.9098 |
| `RICH`        |   0.0826  ***  | 0.0205| 0.1160 *** | 0.0200 |-7.4222|
| `REGULAR`    |   0.0372 *   |0.0168| 0.0236 | 0.0162 |3.0563|
| `ALCOHOL`         |  -0.0569 *   | 0.0261 | 0.0149 | 0.0250 | -9.5767 |
| `BAR` |   0.2985 *   | 0.1345| 0.4642 ***|0.0999 | -1.8399 |
| `STREET`   | 0.4552 ***   | 0.1305| 0.1033 | 0.1011 | 4.2646 |

Hausman test = 155.43\
Chi-square = 12.592

We see that the difference between the fixed effects and random effects coefficients are all significant at the 5% level or better, except for BAR which is significant at the 10% level. The usual Hausman contrast test statistic value is 155.43, which is greater than $\chi^2_{(0.95,6)}$ =12.592. We reject the null hypothesis that the difference in the estimators is zero, and conclude that there is endogeneity in the random effects model. In this case the random effects estimator is inconsistent, and the fixed effects estimator is consistent, so the fixed effects estimator should be used.

![image](https://github.com/nxthuan97/Financial-Economectric-/blob/Rplots/Rplot15.19e1.png?raw=true)

![image](https://github.com/nxthuan97/Financial-Economectric-/blob/Rplots/Rplot15.19e2.png?raw=true)

![image](https://github.com/nxthuan97/Financial-Economectric-/blob/Rplots/Rplot15.19e3.png?raw=true)
