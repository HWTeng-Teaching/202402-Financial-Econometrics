This homework is written by  李宇量 (312707004)
# e.  
**Question:**  
Estimate the quadratic regression WAGE = α1 + α2EDUC^2 + e and discuss the results.  
Estimatethe marginal effect of another year of education on wage for a person with 12 years of education
and for a person with 16 years of education.   
Compare these values to the estimated marginal effectof education from the linear regression in part (b).
```{r}
# Fit quadratic regression model
quad_model <- lm(wage ~ (educ^2), data = cps_data)

# Summary of the quadratic regression results
summary(quad_model)

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
