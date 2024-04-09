## This homework is written by 游政諺 (311707012)
## ch05.24 (c)
Q: Find point and 95% interval estimates for the marginal effect ∂E(PRICE|X)/∂SQFT for houses that
are (i) 5 years old, (ii) 20 years old, and (iii) 40 years old. How do these estimates change as
AGE increases? (Refer to the file collegetown.def for the definition of AGE.)

$\frac{\delta E(PRICE|X)}{\delta SQFT} = b_2 + 2*b_3 *AGE$ = 0.08471+0.02758 * AGE

```
price <- collegetown$price
sqft <- collegetown$sqft
age <- price*sqft

linear_model <- lm(price~sqft+age)
sum_linear <- summary(linear_model)
sum_linear

```
H0: estimated coefficients equal zero

H1: estimated coefficients different from zero

以 90% 以及 95% 信心水準來說，檢定量 $\beta_3$ 以及 $\beta_1$ 的 p value 皆遠小於 0.1 以及 0.05，拒絕虛無假設，顯著異於0

而 $\beta_2$ 的 p value 因大於於 0.1 以及 0.05，故不拒絕虛無假設，不顯著異於0
