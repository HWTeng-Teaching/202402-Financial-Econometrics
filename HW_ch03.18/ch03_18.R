install.packages("devtools")
library(devtools)
#install_github("ccolonescu/POE5Rdata")
#library(POE5Rdata)

#a
b1=6.855 #estimated intercept
b2=3.880 #estimated slope
plot(NULL, main = "Fitted Regression Line", xlab = "INCOME", ylab = "INSURANCE",xlim=c(0,400),ylim=c(0,400))
abline(b1, b2, col = "blue", lwd = 3)
sample_mean_insur = 6.855+3.880*59.3
points(59.3,sample_mean_insur,col="red",pch=16, cex=1.5)

#b
add_income = 1000 
new_insur = 6.855+3.880*1000# point estimate
alpha <- 0.05 # chosen 95% significance level
df <- 20-2 # degrees of freedom
seb2 <- 0.112 # se(add_income)
tc <- qt(1-alpha/2, df)	# critical value
lowb <- new_insur-tc*seb2  # lower bound
upb <- new_insur+tc*seb2   # upper bound
lowb; upb
# ci <- confint(mod1)


