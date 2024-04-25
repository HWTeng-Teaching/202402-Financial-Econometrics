### This homework is written by 吳亭儀 (312707011)
## 08.16
 A sample of 200 Chicago households was taken to investigate how far American households tend to travel when they take a vacation. Consider the model 
 
 $MILES = \beta_1 + \beta_2 INCOME + \beta_3 AGE + \beta_4 KIDS + e$
 
 $MILES$ is miles driven per year, $INCOME$ is measured in $1000 units, $AGE$ is the average age of the adult members of the households, and $KIDS$ is number of children.
### (a)
**Question:**\
Use the data file $vacation$ to estimate the model by OLS. Construct a 95% interval estimate for the effect of one more child on miles traveled, holidng the two other variables constant.

**Ans:**\
|               |      2.5%      |      97.5%      | 
|---------------|:--------------:|:---------------:|
| $(Intercept)$ |   -726.36871   |     -56.72731   |
| $income$      |    10.65097    |      17.75169   |
| $age$         |     8.33086    |      23.15099   |
| $kids$        |   -135.32981   |     -28.32302   |

The 95% confidence intervals for $\beta_4$ is $b4 ± tc*se(b4)$.

Using the t critical value of 1.97214, the 95% interval estimate of the effect of another child is [-135.3298, -28.32302]. 

Therefore, we estimate that another child will reduce average miles traveled by between 28 and 135 miles, with 95% confidence.

### (b)
**Question:**\ 
Plot the OLS residuals versus $INCOME$ and $AGE$. Do you observe any patterns suggesting that heteroskedasticity is present?

**Ans:**\
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/blob/main/HW_ch8.16/residuals%20vs%20income.png)

In the plot of the residuals against income, variation of the residuals increases as income increases.

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/blob/main/HW_ch8.16/residuals%20vs%20age.png)

While in the plot of the residuals against age, the same effect is not apparent.

### (c)
**Question:**\
Sort the data accordingg to increasing magnitude of income. Estimate the model using the first 90 observations and again using the last 90 observations. Carry out the Goldfelf-Quandt  test for heteroskedasticity errors at the 5% level. State the null and alternative hypothesis.

**Ans:**\
