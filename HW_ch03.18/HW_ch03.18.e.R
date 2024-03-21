##3.18.(e)

##INSURANCE = B1+B2*INCOME+elposn

###null hypothesis:B2=1
###alternative hypothesis:B2>1
alpha <- 0.01
b2 <- 3.88
se_b2 <- 0.112
df <- 18
test_stastistic <- (b2-1)/0.112
test_stastistic
critical_value <- qt(1-alpha,df)
critical_value
cat("The rejection region is { t : t >", critical_value, "}\n")
if (test_stastistic > critical_value) {
  print("Reject null hypothesis: the slope is significantly greater than 1")
} else {
  print("Fail to reject null hypothesis")
}