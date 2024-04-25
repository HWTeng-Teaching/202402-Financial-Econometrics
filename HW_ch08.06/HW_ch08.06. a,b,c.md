### This homework is written by 孫知岱 (311707054)
## 08.06
## QUESTION

Consider the wage equation 
$WAGE_i = \beta_1 + \beta_2 EDUC_i + \beta_3 EXPER_i + \beta_4 METRO_i + e_i$
 where wage is measured in dollars per hour, education and experience are in years, and METRO = 1
 if the person lives in a metropolitan area. We have N = 1000 observations from 2013.

### a小题
We are curious whether holding education, experience, and METRO constant, there is the same amount of random variation in wages for males and females. Suppose $\text{Var}(e_i| x_i, \text{FEMALE} = 0) = \sigma_M^2$ and $\text{Var}(e_i| x_i, \text{FEMALE} = 0) = \sigma_F^2$. We specifically wish to test the null hypothesis $\sigma_M^2=\sigma_F^2$ against $\sigma_M^2 ≠\sigma_F^2$. Using 577 observations on males, we obtain the sum of squared OLS residuals, $SSE_M = 97161.9174$. The regression using data on females yields $\hat{\sigma_F} = 12.024$. Test the nullhypothesis at the 5% level of significance. Clearly state the value of the test statistic and the rejection region, along with your conclusion.

### ANSWER:

$df_M = 577-3-1 =573$

$\hat{\sigma_M^2} = SSE_M/df_M = 97161.9174/573 = 169.567$

$F = \hat{\sigma_M^2}/\hat{\sigma_F^2} = 169.567/12.024^2 = 1.173$

$df_F = 1000-577-3-1 =419$

At the 5% level of significance, since the calculated F-statistic (1.173) is less than the critical value of 1.313, we fail to reject the null hypothesis. Therefore, we do not have enough evidence to support the hypothesis that the variability in wages is different between males and females.

### b小题
We hypothesize that married individuals, relying on spousal support, can seek wider employment types and hence holding all else equal should have more variable wages. Suppose
$\text{Var}(e_i| x_i, \text{MARRIED} = 0) = \sigma_{SINGLE}^2$ and $\text{Var}(e_i| x_i, \text{MARRIED} = 1) = \sigma_{MARRIED}^2$. Specify the null hypothesis $\sigma_{SINGLE}^2=\sigma_{MARRIED}^2$ versus the alternative hypothesis $\sigma_{MARRIED}^2>\sigma_{SINGLE} ^2$. We add FEMALE to the wage equation as an explanatory variable, so that 

$WAGE_i = \beta_1 + \beta_2 EDUC_i + \beta_3 EXPER_i + \beta_4 METRO_i +\beta_5 FEMALE+ e_i$

Using $N = 400$ observations on single individuals, OLS estimation of the above equation yields a sum of squared residuals is 56231.0382. For the 600 married individuals, the sum of squared errors is 100,703.0471. Test the null hypothesis at the 5% level of significance. Clearly state the value of the test statistic and the rejection region, along with your conclusion.

### ANSWER:

$MSE_{SINGLE} = SSE_{SINGLE} / df_{SINGLE} = 56231.0382 / (400-4-1) = 142.357$

$MSE_{MARRIED} = SSE_{MARRIED} / df_{MARRIED} = 100,703.0471 / (1000-400-4-1) = 169.249$

$F = MSE_{SINGLE}/MSE_{MARRIED} = 142.357/169.249 = 0.8411$

Based on our calculated F-statistic of 0.84, at the 5% significance level, as the calculated F-statistic is less than the critical value of 1.315, we fail to reject the null hypothesis.
Therefore, our conclusion is that at the 5% significance level, we do not have enough evidence to support the hypothesis that the variability in wages is higher for married individuals compared to single individuals.

### c小题
Following the regression in part (b), we carry out the $NR^2$ test using the right-hand-side variables in (XR8.6b) as candidates related to the heteroskedasticity. The value of this statistic is 59.03.
What do we conclude about heteroskedasticity, at the 5% level? Does this provide evidence about the issue discussed in part (b), whether the error variation is different for married and unmarried individuals? Explain.

### ANSWER:

The $NR^2$ test evaluates whether the variance of errors between observations in the regression model is constant, but it does not specifically examine whether the error variation differs between married and unmarried individuals. Therefore, although the result of the $NR^2$ test suggests potential heteroskedasticity, it does not directly provide evidence regarding the specific issue discussed in the question.
