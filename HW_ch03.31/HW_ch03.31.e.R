#e
load('/Users/xuanpei/Downloads/poe5rdata/tuna.rdata')
mean_price=mean(price1)
mean_sal=mean(tuna$sal1)
ela=b2_331*mean(price1)/mean(tuna$sal1)
se_b2=summary(lm_331)$coefficients['price1', "Std. Error"]
se_ela=se_b2 * mean(price1)/mean(tuna$sal1)
alpha=0.05
df=lm_331$df.residual
t_value=qt(1-alpha/2, df)
ci_lower=ela-t_value*se_ela
ci_upper=ela+t_value*se_ela
cat("Elasticity:",ela,"\n")
cat("95% CI: [",ci_lower,",",ci_upper,"]\n")
