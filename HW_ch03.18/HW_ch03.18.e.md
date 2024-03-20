### This homework is written by 陳泰清 (312707021)

## 03.18.e
**Quesion:**\
Test the null hypothesis that as income increases the amount of life insurance held by the same amount. That is, test the null hypothesis that the slope is one. Use as the alternative that the slope is larger than one. State the null and alternative hypothesis in terms of the model parameters. Carry out the test at the 1% level of significance. Clearly indicate the test statistic used, and the rejection region. What is your conclusion?

**ANS:**




**Sample code**
```
alpha <- 0.01
b2 <- 3.88
se_b2 <- 0.112
df <- 18
test_stastistic <- (b2-1)/0.112
test_stastistic
critical_value <- qt(1-alpha,df)
critical_value
upper_bound <- b2 + critical_value * se_b2
print("the reject region is")
print(upper_bound)
if (test_stastistic > upper_bound) {
  print("Reject null hypothesis: the slope is significantly greater than 1")
} else {
  print("Fail to reject null hypothesis")
}
```
