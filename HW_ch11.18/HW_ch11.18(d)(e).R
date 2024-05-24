load("/Users/chenpinyu/Downloads/klein.rdata")
library(AER)

##d
# 2SLS estimation for consumption function
consumption_2sls <- ivreg(cn ~ i + time | time + klag, data = klein)
summary(consumption_2sls)

# 2SLS estimation for investment function
investment_2sls <- ivreg(i ~ cn + klag | time + klag, data = klein)
summary(investment_2sls)

##e
# First-stage reduced-form equation for cn
reduced_form_cn <- lm(cn ~ time + klag, data = klein)
summary(reduced_form_cn)

# First-stage reduced-form equation for I
reduced_form_i <- lm(i ~ time + klag, data = klein)
summary(reduced_form_i)

# Check significance of klag in cn equation
summary(reduced_form_cn)$coefficients["klag", "Pr(>|t|)"]

# Check significance of time in I equation
summary(reduced_form_i)$coefficients["time", "Pr(>|t|)"]

