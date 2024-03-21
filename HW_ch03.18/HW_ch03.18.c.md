### This homework is written by 王柏皓 (312707019)

### 03.18 (c)
**Question:**\
Construct a 99% interval estimate of the expected amount of insurance held by a household with
$100,000 income. The estimated covariance between the intercept and slope coefficient is −0.746

**Ans:**\
$$\widehat{INSURANCE} = 6.855+3.880\times{INCOME} = 6.855+3.880\times100 = 394.855$$

```
intercept <- 6.855
slope <- 3.880
b_1 <- 7.383
b_2 <- 0.112
covariance <- -0.746

insurance_hat = intercept + slope*100
print(insurance_hat)

```

```
394.855
```

$$
\begin{aligned}
\sqrt{var(b_1+100b_2)} &=\sqrt{var(b_1)+100^2var(b_2)+2\times{100}\times{cov(b_1,b_2)}}\\
&=\sqrt{7.383^2+10000\times0.112^2+200\times(-0.746)}\\ 
&=\sqrt{30.748689}\\ 
&= 5.5452\\
\end{aligned}
$$

```
variance <- b_1^2 + 100^2 * b_2^2 + 2 * 100 * covariance
standard_error <- sqrt(variance)
print(standard_error)
```
```
5.54515
```
two-tailed t value when alpha = 0.01, df = 18\
$t_c:2.878$

```
p <- 0.99
df <- 18
tail_prob <- (1 - p) / 2
left_t_value <- qt(tail_prob, df, lower.tail = TRUE)
right_t_value <- qt(tail_prob, df, lower.tail = FALSE)
print(left_t_value)
print(right_t_value)

```
```
-2.87844 2.87844
```

99% interval estimate of the expected amount of insurance held by a household with a
$100,000 income:

$394.855 ± 2.878 × 5.5452 = [378.8959, 410.8141]$

```
upper_bound <-insurance_hat+2.878*standard_error
lower_bound <-insurance_hat-2.878*standard_error
print(upper_bound)
print(lower_bound)

```
```
410.8139 378.8961
```
We wll say that we have 99% confident that the average amount of insurance held by a household will at an amount between 378,896 and 410,814 with a
$100,000 income.
