## This homework is written by 許雯娟(312707014)

Question:\
How much does education affect wage rates? The data file cps5_small contains 1200 observations on hourly wage rates, education, and other variables from the 2013 Current Population Survey (CPS).
[Note: cps5 is a larger version with more observations and variables.]

## 2.29 (c)

Question:\
Obtain the predicted wage, $\widehat{W A G E}=\exp \left(b_{1}+b_{2} E D U C\right)$, for a person with 12 years of education and for a person with 16 years of education.

Answer:\
$\widehat{W A G E}=\exp (ln(wage)) =\exp (1.5968 +0.0988EDUC)$\
For a person with 12 years of education, $\widehat{W A G E}=\exp (1.5968 + 0.0988 * 12) = 16.1493$\
For a person with 16 years of education, $\widehat{W A G E}=\exp (1.5968 + 0.0988 * 16) = 23.9721$

**code**

```
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

``` 


## 2.29 (d)

Question:\
What is the marginal effect of additional education for a person with 12 years of education and for a person with 16 years of education? [Hint: This is the slope of the fitted model at those two points.]

Answer:\
The log-linear equation is $ln(y)=\beta_1+\beta_2 \ x $\
which is $y=exp(\beta_1+\beta_2 \ x) $\
The marginal effect (the slpoe) is $m= dy/dx=\beta_2\ exp(\beta_1+\beta_2 \ x)$\
The marginal effects of education on expected wage in the log-linear model\
When a person with 12 years of education, the expected wage increases about $1.5948 with an additional education.\
When a person with 16 years of education, the expected wage increases about $2.3673 with an additional education.

**code**

```
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

```
