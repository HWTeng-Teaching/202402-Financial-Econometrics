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

