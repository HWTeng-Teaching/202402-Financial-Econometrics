This homework is written by  李宇量 (312707004)
# e.  
**Question:**  
Estimate the quadratic regression $WAGE = α_1 + α_2EDUC^2 + e$ and discuss the results.  
Estimatethe marginal effect of another year of education on wage for a person with 12 years of education
and for a person with 16 years of education.   
Compare these values to the estimated marginal effect of education from the linear regression in part (b).
```{r}
# Fit quadratic regression model
quad_model <- lm(wage ~ I(educ^2), data = cps_data)

# Summary of the quadratic regression results
summary(quad_model)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/102803318/7eb845f9-bc7e-4d4e-8107-57b5c13b5945)  
For each unit increase in education, wage increases by 0.089134 units.Compared with (b),the quad_model have positive intercept. 


```{r}
# Calculate marginal effects
edu_12 <- predict(quad_model, newdata = data.frame(educ = 12))
edu_16 <- predict(quad_model, newdata = data.frame(educ = 16))
marginal_effect_12 <- diff(edu_12)#WRONG??
marginal_effect_16 <- diff(edu_16)
marginal_effect_12
marginal_effect_16
a1 <- coef(quad_model)[1]#4.92
a2 <- coef(quad_model)[2]#0.0891
emargin12=2*a2*12#2.14
emargin16=2*a2*16#2.85
```
marginal effect when educ=12 is 2.14  
marginal effect when educ=16 is 2.85

The marginal effect in (b) for educ=12 and educ=16 are both 2.4  

# f.  
**Question:**  
Plot the fitted linear model from part (b) and the fitted values from the quadratic model from
part (e) in the same graph with the data on WAGE and EDUC.  
Which model appears to fit the data better?
```{r}
# Scatterplot with linear regression line
ggplot(cps_data, aes(x = educ, y = wage)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, color = "red")+
  labs(title = "Quadratic Regression Model and Linear Regression Model")
```
![Rplot](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/102803318/28fd7fb3-104d-454b-a4f4-f070bd8d4bf1)

Quadratic Regression Model fit the data better.  
Because we can see this figure the linear model get negative wage, but it doesn't make sense.

**[Reviewed by Yenting 20240316.]** 

下次估計結果不要只貼報表
