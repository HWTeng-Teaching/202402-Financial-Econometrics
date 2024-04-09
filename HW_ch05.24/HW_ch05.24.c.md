## This homework is written by 游政諺 (311707012)
## ch05.24 (c)
Q: Find point and 95% interval estimates for the marginal effect ∂E(PRICE|X)/∂SQFT for houses that
are (i) 5 years old, (ii) 20 years old, and (iii) 40 years old. How do these estimates change as
AGE increases? (Refer to the file collegetown.def for the definition of AGE.)

$\frac{\delta E(PRICE|X)}{\delta SQFT} = b_2 + 2*b_3 *AGE$ = 0.08471+0.02758 * AGE$

$\frac{\delta m}{\delta SQFT} = m$

$\frac{\delta m}{\delta b_2} = 1$

$\frac{\delta m}{\delta b_3} = 2AGE$

$se(f) = \sqrt{\sum c_i^2var(b_i) + \sum_{i \ne j} 2c_ic_jcov(b_i, b_j)}$\
```
price <- collegetown$price
sqft <- collegetown$sqft
age <- price*sqft

linear_model <- lm(price~sqft+age)
sum_linear <- summary(linear_model)
sum_linear

```
(i) 5 years old

```
d_age_1 = 5
d_MarginalEffect(d_age_1)

```

(ii) 20 years old

```
d_age_2 = 20
d_MarginalEffect(d_age_2)

```

(iii) 40 years old

```
d_age_3 = 40
d_MarginalEffect(d_age_3)

```
