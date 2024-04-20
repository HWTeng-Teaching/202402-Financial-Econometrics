### This homework is written by 孫知岱 (311707054)
## 08.06
Consider the wage equation 
$WAGE_i = \beta_1 + \beta_2 EDUC_i + \beta_3 EXPER_i + \beta_4 METRO_i + e_i$
 where wage is measured in dollars per hour, education and experience are in years, and METRO = 1
 if the person lives in a metropolitan area. We have N = 1000 observations from 2013.

### a小题
We are curious whether holding education, experience, and METRO constant, there is the same amount of random variation in wages for males and females. Suppose $\text{Var}(e_i| x_i, \text{FEMALE} = 0) = \sigma_M^2$ and $\text{Var}(e_i| x_i, \text{FEMALE} = 0) = \sigma_F^2$. We specifically wish to test the null hypothesis $\sigma_M^2=\sigma_F^2$ against $\sigma_M^2 ≠\sigma_F^2$. Using 577 observations on males, we obtain the sum of squared OLS residuals, $SSE_M = 97161.9174$. The regression using data on females yields $\hat{\sigma_F} = 12.024$. Test the nullhypothesis at the 5% level of significance. Clearly state the value of the test statistic and the rejection region, along with your conclusion.
