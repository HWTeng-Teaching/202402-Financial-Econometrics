#(a)
library(POE5Rdata)
library(lmtest)
library(car)
data(vacation)
mod1=lm(miles~income+age+kids,data=vacation)
mod1
summary1=summary(mod1)
#(bi-tc(bi), bi+tc(bi))
confint(mod1, level = 0.95) #(bi-tc*se(bi), bi+tc*se(bi))

#(b)
plot(vacation$income, mod1[["residuals"]], xlab = 'income', ylab = 'residuals')
plot(vacation$age, mod1[["residuals"]], xlab = 'age', ylab = 'residuals')

#(c)
vacation_sort = vacation[order(vacation$income), ] #將數據由小到大排序
vacation_sort1 = head(vacation_sort, 90)
vacation_sort2 = tail(vacation_sort, 90)
model_vacation_sort1 = lm(miles ~ income + age + kids, data = vacation_sort1)
model_vacation_sort2 = lm(miles ~ income + age + kids, data = vacation_sort2)
degree1 = model_vacation_sort1[["df.residual"]]
degree2 = model_vacation_sort2[["df.residual"]]
alpha=0.05
summary_model_vacation_sort1=summary(model_vacation_sort1)
summary_model_vacation_sort2=summary(model_vacation_sort2)
sigma1=summary_model_vacation_sort1[["sigma"]]
sigma2=summary_model_vacation_sort2[["sigma"]]
f_stat = (sigma2^2 / degree2) / (sigma1^2 / degree1)
critical_value = qf(1-alpha,degree1,degree2)
