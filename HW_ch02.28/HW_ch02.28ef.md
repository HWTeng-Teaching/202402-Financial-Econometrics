This homework is written by  李宇量 (312707004)
# e.  
**Question:**  
Estimate the quadratic regression WAGE = α1 + α2EDUC^2 + e and discuss the results.  
Estimatethe marginal effect of another year of education on wage for a person with 12 years of education
and for a person with 16 years of education.   
Compare these values to the estimated marginal effect of education from the linear regression in part (b).
```{r}
# Fit quadratic regression model
quad_model <- lm(wage ~ I(educ^2), data = cps_data)

# Summary of the quadratic regression results
summary(quad_model)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/102803318/c172c33b-6c19-4f19-a18f-4301e2a6f8e9)


```{r}
# Calculate marginal effects
edu_12 <- predict(quad_model, newdata = data.frame(educ = 12))
edu_16 <- predict(quad_model, newdata = data.frame(educ = 16))
marginal_effect_12 <- diff(edu_12)#WRONG??
marginal_effect_16 <- diff(edu_16)
marginal_effect_12
marginal_effect_16
a1 <- coef(quad_model)[1]#-10.4
a2 <- coef(quad_model)[2]#2.4
emargin12=2*a2*12#57.6
emargin16=2*a2*16#76.8
```
marginal effect when educ=12 is 57.6  
marginal effect when educ=16 is 76.8

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

Quadratic Regression Model fit the data better
