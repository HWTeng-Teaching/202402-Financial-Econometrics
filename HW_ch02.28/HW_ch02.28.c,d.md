This homework is written by  黃鈺婷 (312707003)
# c.  
**Question:**  
Calculate the least squares residuals and plot them against $EDUC$.  
Are any patterns evident?  
If assumptions SR1–SR5 hold, should any patterns be evident in the least squares residuals?
```{r}
yhat <- predict(mod1)
residual=cps5_small$wage-yhat 
plot(cps5_small$educ, residual, 
     xlab="educ", 
     ylab="OLS residual", 
     type = "p",)
```
  
  **Answer:**  
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/150406955/f65f4c9c-c8f8-4c91-88d4-f4b80d413c28)  
There is a pattern evident; as EDUC increases, the magnitude of the residuals also increases, suggesting that the error variance is larger for larger values of EDUC - a violation of assumption SR3(Conditional Homoskedasticity $Var(e_i|X)=\sigma^2$).  
If the assumptions SR1-SR5 hold, there should not be any patterns evident in the residuals.

:red: [teng: Modify these]

1. Mean
2. Variations
3. Outlier
   




# d.  
**Question:**  
Estimate separate regressions for males, females, blacks, and whites.  
Compare the results.
```{r}
#for males
mod2 <- lm(wage[which(cps5_small$female==0)] ~ educ[which(cps5_small$female==0)], data = cps5_small)
b1 <- coef(mod2)[[1]]
b2 <- coef(mod2)[[2]]
b1
b2
```
**Answer:**   
The estimated model is $$\hat{WAGE}=-8.2849+2.3785EDUC$$  
The coefficient 2.3785 represents the estimated increase in the expected hourly wage rate for an extra year of education.  
The coefficient -8.2849 represents the estimated wage rate of a worker with no years of education.  
It should not be considered meaningful as it is not possible to have a negative hourly wage rate.

```{r}
#for females
mod3 <- lm(wage[which(cps5_small$female==1)] ~ educ[which(cps5_small$female==1)], data = cps5_small)
b1 <- coef(mod3)[[1]]
b2 <- coef(mod3)[[2]]
b1
b2
```
**Answer:**  
The estimated model is $$\hat{WAGE}=-16.6028+2.6595EDUC$$  
The coefficient 2.6595 represents the estimated increase in the expected hourly wage rate for an extra year of education.  
The coefficient -16.6028 represents the estimated wage rate of a worker with no years of education.  
It should not be considered meaningful as it is not possible to have a negative hourly wage rate.

```{r}
#for blacks
mod4 <- lm(wage[which(cps5_small$black==1)] ~ educ[which(cps5_small$black==1)], data = cps5_small)
b1 <- coef(mod4)[[1]]
b2 <- coef(mod4)[[2]]
b1
b2
```
**Answer:**   
The estimated model is $$\hat{WAGE}=-6.2541+1.9233EDUC$$  
The coefficient 1.9233 represents the estimated increase in the expected hourly wage rate for an extra year of education.  
The coefficient -6.2541 represents the estimated wage rate of a worker with no years of education.  
It should not be considered meaningful as it is not possible to have a negative hourly wage rate.

```{r}
#for white
mod5 <- lm(wage[which(cps5_small$black==0)] ~ educ[which(cps5_small$black==0)], data = cps5_small)
b1 <- coef(mod5)[[1]]
b2 <- coef(mod5)[[2]]
b1
b2
```
**Answer:**   
The estimated model is $$\hat{WAGE}=-10.4747+2.4178EDUC$$  
The coefficient 2.4178 represents the estimated increase in the expected hourly wage rate for an extra year of education.  
The coefficient -10.4747 represents the estimated wage rate of a worker with no years of education.  
It should not be considered meaningful as it is not possible to have a negative hourly wage rate.  
  
  From the results, we can see that an extra year of education increases, the expected wage rate of a white worker more than it  does for a black  worker.  
And an extra year of education increases, the expected wage rate of a female worker more than it does for a male worker.
