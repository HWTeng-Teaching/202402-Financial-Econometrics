## This homework is written by 游政諺 (311707012)
## ch05.24 (b)
Q: Write down expressions for the marginal effects ∂E(PRICE|X)/∂SQFT and
∂E(PRICE|X)/∂AGE. Interpret each of the coefficients. Given the categorical nature of the
variable AGE, what assumptions are being made?

$PRICE = \beta_1 + \beta_2 SQFT + \beta_3 (SQFT * AGE)+e$

expressions for the marginal effects:

$\frac{\delta E(PRICE|X)}{\delta SQFT} = b_2 + 2*b_3 *AGE$ = 0.08471+0.02758 * AGE

$\frac{\delta E(PRICE|X)}{\delta AGE} = b_3 *AGE$ = 0.01379

SQFT 的 marginal effect 為一斜直線，代表 SQFT 的 marginal effect 會受到 AGE 值的影響。當房屋年齡為 100 單位，SQFT 的 marginal effect 為 2.84271；若房屋年齡為 110 單位， SQFT 的 marginal effect 則為 3.11851，

AGE 的 marginal effect 為一水平線，代表 AGE 的 marginal effect 為一常數。例如當面積SQFT為 100 單位，AGE 的 marginal effect 為 0.01379；若當面積SQFT為 100 單位 ， AGE 的marginal effect 仍然為0.01379，

