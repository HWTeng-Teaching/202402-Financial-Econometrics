install.packages("devtools")
library(devtools)

#a
b1=6.855 #estimated intercept
b2=3.880 #estimated slope
plot(NULL, main = "Fitted Regression Line", xlab = "INCOME", ylab = "INSURANCE",xlim=c(0,400),ylim=c(0,400))
abline(b1, b2, col = "blue", lwd = 3)
sample_mean_insur = 6.855+3.880*59.3
points(59.3,sample_mean_insur,col="red",pch=16, cex=1.5)
