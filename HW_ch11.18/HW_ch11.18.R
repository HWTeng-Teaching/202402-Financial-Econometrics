library(POE5Rdata)
summary(klein)
# Estimate the consumption equation by OLS
consumption_model <- lm(cn ~ i + time, data = klein)
summary(consumption_model)
# Estimate the investment equation by OLS
investment_model <- lm(i ~ cn + klag, data = klein)
summary(investment_model)
