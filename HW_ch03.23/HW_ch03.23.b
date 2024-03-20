price <- collegetown$price
sqft <- collegetown$sqft
qrmodel <- lm(price~I(sqft^2))
qrmodel_A1 <- coef(qrmodel)[1]
qrmodel_A2 <- coef(qrmodel)[2]
qrsummary <- summary(qrmodel)
qrmodel_A2_se <- qrsummary$coef[4]
df <- qrsummary$df[2]

sqft_2 <- 40
marginal_effect_2 <- 2*qrmodel_A2*sqft_2
se <- (qrmodel_A2_se*2*sqft_2)
t_statistic_2 <- (marginal_effect_2 - 13)/se
critical_2 <- qt(0.95, df)
pvalue_2 <- 1-pt(t_statistic_2,df)
marginal_effect_2
se
t_statistic_2
critical_2
pvalue_2


