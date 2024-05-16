## Supppose you want to estimate a wage equation for married women of the form $ln(wage) = \beta_1+\beta_2HOURS+\beta_3EDUC+\beta_4EXPER+\beta_5EXPER^2+e_i$ where WAGE is the hourly wage, HOURS is number of hours worked per week, EDUC is years of education, and EXPER is years of experience. Your classmate observes that higher wages can bring forth increaseed work effort, and that married women with small children may reduce their hours of work to take care of them. It may also be true that a husband's wage rate has an effect on a wife's hours of work supplied, sot that there may be an anxuiliary relationship such as $HOURS = \alpha_1+\alpha_2ln(WAGE)+\alpha_3KIDS+\alpha_4ln(HWAGE)$ where KIDS is the number of children under the age of six in the woman's household and HWAGE is her husband's wage rate.
### this homework is written by 陳泰清
### 11.12(a)
### Can the wage equation be estimated satisfactorily using the OLS estimator? If not, why not?

***Answer:***  
No, we can't use the OLS estimator. Because HOURS is determined by WAGE, and WAGE is simultaneously determined by HOURS in this problem. There will be an potential endogenous situation. So, this equation violate the ordinary least squares (OLS) assumption of no correlation between the independent variables and the error term.  Directly using OLS to estimate the wage equation would likely lead to biased and inconsistent estimates. Therefore, the wage equation may not be satisfactorily estimated using OLS.

### 11.12(b.)
### Is the wage equation "identified"? What does the term $identifiction$ mean in this context?

***Answer:***  
The steps for checking identification of an equation : 
1. Find the values of $M$ endogenous variables which joints determind in simulataneous equation. 
2. Determine the endogenous and exogenous variables. 
3. check there are at least (M-1) exogenous variable is absent from an equation.  

Check the wage equation is "identified"  or not:  
1. $M$ = 2 ($ln(Wage)、HOURS$)   
2. endogenous variables : $ln(WAGE)、HOURS$  
       exogenous variables : $EDUC、EXPER、EXPER^2、KIDS、ln(HWAGE)$  
3. There are 2 exogenous variables ( $KIDS$ and $ln(HWAGE)$ ) absent in wage equation.  

So, the wage equation is identified.


