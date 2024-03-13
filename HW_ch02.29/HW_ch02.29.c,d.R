# 2.29 c

# After conducting the regression in part (b), substitute values of educ = 12 and educ = 16 into the equation

library(moments)
library(POE5Rdata)
library(ggplot2)
library(dplyr)
data("cps5_small")

cps5_small$LWAGE <- log(cps5_small$wage)

model_2 <- lm(LWAGE ~ educ, data = cps5_small)

b1 <- coefficients(model_2)[[1]]
b2 <- coefficients(model_2)[[2]]

educ <- 12
wage_hat_12 <- paste("wage_hat_12 = exp{ln(wage)} =", round(exp(b1 + b2 * educ), 4))

educ <- 16
wage_hat_16 <- paste("wage_hat_16 = exp{ln(wage)} =", round(exp(b1 + b2 * educ), 4))

cat(wage_hat_12, "\n")
cat(wage_hat_16, "\n")

 
## Answer: 
## wage _hat =  exp (ln(wage)) = exp (1.5968 +0.0988EDUC)
## For a person with 12 years of education, wage_hat = exp (1.5968 + 0.0988 * 12) = 16.1493
## For a person with 16 years of education, wage_hat = exp (1.5968 + 0.0988 * 16) = 23.9721

# 2.29 d

# Marginal effect(slope) in the log-linear model ln(y) = b1 + b2x, which is dy/dx = b2 * exp(b1 + b2x) 

library(moments)
library(POE5Rdata)
library(ggplot2)
library(dplyr)
data("cps5_small")

cps5_small$LWAGE <- log(cps5_small$wage)

model_2 <- lm(LWAGE ~ educ, data = cps5_small)

b1 <- coefficients(model_2)[[1]]
b2 <- coefficients(model_2)[[2]]

educ <- 12
marginal_effect_12 <- round(b2 * exp(b1 + b2 * educ), 4)

educ <- 16
marginal_effect_16 <- round(b2 * exp(b1 + b2 * educ), 4)

cat("Marginal Effect of additional education for a person with 12 years of education:", marginal_effect_12, "\n")
cat("Marginal Effect of additional education for a person with 16 years of education:", marginal_effect_16, "\n")

## Answer: 
## The marginal effects of education on expected wage in the log-linear model:
## When a person with 12 years of education, the expected wage increases about $1.5948 with an additional education.
## When a person with 16 years of education, the expected wage increases about $2.3673 with an additional education.