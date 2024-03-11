# **********************************************************************
# Homework  : 2
# Author    : Chin Hui Cheng
# Date      : 2024/03/11
# Version   : v1
# **********************************************************************


###################################################
#                   setting env                   #
###################################################

install.packages("devtools")
library(devtools)

install_git("https://github.com/ccolonescu/POE5Rdata")
library(POE5Rdata)


########################################
#               2.28 - (a)             #
########################################
# data("cps5_small")
# ? cps5_small
WAGE <- cps5_small$wage
quartz()
hist(WAGE, breaks = 100, col = "#e6adc2")
summary((WAGE))

EDUC <- cps5_small$educ
quartz()
hist(EDUC, breaks = 10, col = "#e19211")
summary((EDUC))


########################################
#               2.28 - (b)             #
########################################

quartz()
plot(EDUC, WAGE, type = "n", main = "Regression Line", xlab = "EDUC", ylab = "WAGE")
abline(lm(WAGE ~ EDUC), col = "blue", lwd = 3)

print(coef(lm(WAGE ~ EDUC))[1])
print(coef(lm(WAGE ~ EDUC))[2])

########################################
#               2.28 - (c)             #
########################################

residuals <- resid(lm(WAGE ~ EDUC))
quartz()
plot(EDUC, residuals, col = "brown", main = "Scatterplot", xlab = "EDUC", ylab = "Residual")

########################################
#               2.28 - (d)             #
########################################

# FEMALE
FEMALE_WAGE <- cps5_small$wage[cps5_small$female > 0]
FEMALE_EDUC <- cps5_small$educ[cps5_small$female > 0]

quartz()
plot(FEMALE_EDUC, FEMALE_WAGE, type = "n", main = "Regression Line", xlab = "FEMALE_EDUC", ylab = "FEMALE_WAGE")
abline(lm(FEMALE_WAGE ~ FEMALE_EDUC), col = "#ff00a2", lwd = 3)

# MALE
MALE_WAGE <- cps5_small$wage[cps5_small$female == 0]
MALE_EDUC <- cps5_small$educ[cps5_small$female == 0]

quartz()
plot(MALE_EDUC, MALE_WAGE, type = "n", main = "Regression Line", xlab = "MALE_EDUC", ylab = "MALE_WAGE")
abline(lm(MALE_WAGE ~ MALE_EDUC), col = "blue", lwd = 3)

# BLACKS
BLACK_WAGE <- cps5_small$wage[cps5_small$black > 0]
BLACK_EDUC <- cps5_small$educ[cps5_small$black > 0]

quartz()
plot(BLACK_EDUC, BLACK_WAGE, type = "n", main = "Regression Line", xlab = "BLACK_EDUC", ylab = "BLACK_WAGE")
abline(lm(BLACK_WAGE ~ BLACK_EDUC), col = "#0f0f0f", lwd = 3)

# WHITES
WHITE_WAGE <- cps5_small$wage[cps5_small$black == 0]
WHITE_EDUC <- cps5_small$educ[cps5_small$black == 0]

quartz()
plot(WHITE_EDUC, WHITE_WAGE, type = "n", main = "Regression Line", xlab = "WHITE_EDUC", ylab = "WHITE_WAGE")
abline(lm(WHITE_WAGE ~ WHITE_EDUC), col = "#00ff48", lwd = 3)

########################################
#               2.28 - (e)             #
########################################

quartz()
plot(EDUC, WAGE, type = "n", main = "Quadratic Regression Line", xlab = "EDUC", ylab = "WAGE")
# points(EDUC, WAGE)
curve(predict(lm(WAGE ~ EDUC + I(EDUC^2)), newdata = data.frame(EDUC = x)), add = TRUE, col = "blue", lwd = 3)

########################################
#               2.28 - (f)             #
########################################

quartz()
plot(EDUC, WAGE, col = "#ff0000", pch = 16, xlab = "Education", ylab = "Wage", main = "Comparison of Wage Models")
abline(lm(WAGE ~ EDUC), col = "#fb00ff", lwd = 3)
curve(predict(lm(WAGE ~ EDUC + I(EDUC^2)), newdata = data.frame(EDUC = x)), add = TRUE, col = "blue", lwd = 3)
legend("topright", legend = c("Original Data", "Linear Regression", "Quadratic Regression"), col = c("#ff0000", "#fb00ff", "blue"), lwd = 3, pch = c(16, NA, NA))


########################################
#               2.29 - (a)             #
########################################

install.packages("moments")
library(moments)
LN_WAGE <- log(cps5_small$wage)

quartz()
hist(LN_WAGE, breaks = 100, col = "#87a034")
summary((LN_WAGE))

print(paste("Skewness:", skewness(LN_WAGE)))
print(paste("Kurtosis:", kurtosis(LN_WAGE)))

########################################
#               2.29 - (b)             #
########################################

EDUC <- cps5_small$educ
LN_WAGE <- log(cps5_small$wage)

quartz()
plot(EDUC, LN_WAGE, type = "n", main = "Regression Line", xlab = "EDUC", ylab = "LN_WAGE")
abline(lm(LN_WAGE ~ EDUC), col = "blue", lwd = 3)

print(coef(lm(LN_WAGE ~ EDUC))[1]) # Intercept
print(coef(lm(LN_WAGE ~ EDUC))[2]) # Slope

########################################
#               2.29 - (c)             #
########################################

LN_WAGE_12 <- exp((12) * coef(lm(LN_WAGE ~ EDUC))[2] + coef(lm(LN_WAGE ~ EDUC))[1])
LN_WAGE_12
LN_WAGE_16 <- exp((16) * coef(lm(LN_WAGE ~ EDUC))[2] + coef(lm(LN_WAGE ~ EDUC))[1])
LN_WAGE_16

########################################
#               2.29 - (d)             #
########################################

WAGE_12 <- exp((coef(lm(LN_WAGE ~ EDUC))[1])) * (coef(lm(LN_WAGE ~ EDUC))[2]) * exp((coef(lm(LN_WAGE ~ EDUC))[2]) * 12)
WAGE_12
WAGE_16 <- exp((coef(lm(LN_WAGE ~ EDUC))[1])) * (coef(lm(LN_WAGE ~ EDUC))[2]) * exp((coef(lm(LN_WAGE ~ EDUC))[2]) * 16)
WAGE_16


########################################
#               2.29 - (e)             #
########################################

quartz()
# Plot original data
plot(EDUC, WAGE, col = "red", pch = 16, xlab = "Education", ylab = "Wage", main = "Comparison of Original and New Wage Models")

# Add regression line for original data
abline(lm(WAGE ~ EDUC), col = "blue", lwd = 3)

# Calculate and plot new wage based on the model
NEW_WAGE <- exp(coef(lm(LN_WAGE ~ EDUC))[1] + coef(lm(LN_WAGE ~ EDUC))[2] * EDUC)
abline(lm(NEW_WAGE ~ EDUC), col = "green", lwd = 3)

# Add a legend
legend("topleft", legend = c("Original Wage", "New Wage"), col = c("blue", "green"), lwd = 3)

########################################
#               2.29 - (f)             #
########################################

WAGE_DIFF <- sum((WAGE - NEW_WAGE)^2)
TOAL_RESIDUALS <- sum(residuals^2)
WAGE_DIFF
TOAL_RESIDUALS
