### This homework is written by 陳泰清 (312707021)

## 03.18.e
**Quesion:**\
Test the null hypothesis that as income increases the amount of life insurance held by the same amount. That is, test the null hypothesis that the slope is one. Use as the alternative that the slope is larger than one. State the null and alternative hypothesis in terms of the model parameters. Carry out the test at the 1% level of significance. Clearly indicate the test statistic used, and the rejection region. What is your conclusion?

**ANS:**
### Hypothesis for income amd amount of life insurance.
Below is the null and alternative hypothesis in terms of model parameters.
- $H_0$ : $b_2$ = $1$ (The amount of life insurance held increases by the same amount as income increases)
- $H_1$ : $b_2$ > $1$ (The amount of life insurance held increases doesn't held by the same amount as income increases)

### Test statistic
Model parameters: $\alpha$ = $0.01$ , $b_2$ = $3.88$ , $\text{se}(b_{2})$= $0.112$ , $df=18(20-2)$\
The test statistic is calculated as : $t_c$ = $\frac{b_{2} - 1}{\text{se}(b_{2})} = \frac{3.88 - 1}{0.112} = 25.7143$\
**Sample code**
```
alpha <- 0.01
b2 <- 3.88
se_b2 <- 0.112
df <- 18
test_stastistic <- (b2-1)/0.112
test_stastistic
```
### Reject region
To find reject region, we should find criticle value first.\
Cretical value: $t_{18,0.099} = 2.55238$\
The rejection region is  { $t : t > 2.55238$ }

**Sample code**
```
critical_value <- qt(1-alpha,df)
critical_value
cat("The rejection region is { t : t >", critical_value, "}\n")
```

### Conclusion
Because $t$ falls in rejection region, we reject the null hypothesis : $b_2$ = $1$, and accept the alternative $b_2$ > $1$.\
it indicates that the slope is larger than $1$.

**Sample code**
```
if (test_stastistic > critical_value) {
  print("Reject null hypothesis: the slope is significantly greater than 1")
} else {
  print("Fail to reject null hypothesis")
}
```
