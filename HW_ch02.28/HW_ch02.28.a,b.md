This homework is written by  陳家祺 (312707002)
# a.
**Question:**

Obtain the summary statistics and histograms for the variables WAGE and EDUC. Discuss the data characteristics.

**Answer:**
```{r}
wage <- cps5_small$wage
edu <- cps5_small$educ
mod1 <- summary(wage)
mod2 <- summary(edu)

hist(wage)
hist(edu)
```
```{r}
mod1
```
<img width="374" alt="截圖 2024-03-10 下午9 17 21" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/107116674/d0543c98-b3ff-48b8-ada3-c2e244a856fa">

```{r}
mod2
```
<img width="372" alt="截圖 2024-03-10 下午9 18 01" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/107116674/c3007185-91db-4d6d-ab0f-e856e4dd7cc5">



```{r}
hist(wage)
```

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/107116674/768e71be-0020-460f-9845-f2fc7c9480da)

From the graph of the wage chart above, it can be observed that the distribution is positively skewed, and the shape resembles a lognormal distribution.

```{r}
hist(edu)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/107116674/97671839-95ac-450f-a5f1-500fabcd401b)

From the graph of the education chart above, it can be observed that the distribution also exhibits positive skewness, and there is a lower frequency of observations in the lower education range.

# b.
**Question:**

Estimate the linear regression WAGE = $\beta1 + \beta2 EDUC + e$ and discuss the results.

**Answer:**
```{r}
mod <- lm(cps5_small$wage ~ cps5_small$educ, data = cps5_small)
mod
summary(mod)
```
<img width="527" alt="截圖 2024-03-10 下午9 23 17" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/107116674/2b78cf70-6fa5-4f46-805d-13d19b0aa1ce">

Calculate the coefficients $\beta1$ and $\beta2$ of the linear model for wage and education data using the lm function in R

WAGE = $\beta1 + \beta2 EDUC + e$

$\beta1$ = -10.4, $\beta2$ = 2.3968

$\hat{WAGE} = -10.4 + 2.3968EDUC + e$

On average, for each unit increase in education, wage increases by 2.3986($\beta2$) units. However, it can be observed that for education levels less than 4.336, the calculated wage is negative, which is clearly illogical. This discrepancy may be attributed to the limited representation of lower education levels in the dataset. Furthermore, as we utilize the least squares method, it's possible that the negative wage estimates arise due to attempts to fit a linear model to the dataset, despite its inadequate representation of lower education levels.

