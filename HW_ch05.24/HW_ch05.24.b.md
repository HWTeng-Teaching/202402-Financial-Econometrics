## This homework is written by 游政諺 (311707012)
## ch05.24 (b)
Q: Write down expressions for the marginal effects ∂E(PRICE|X)/∂SQFT and
∂E(PRICE|X)/∂AGE. Interpret each of the coefficients. Given the categorical nature of the
variable AGE, what assumptions are being made?

$PRICE = \beta_1 + \beta_2 SQFT + \beta_3 (SQFT * AGE)+e$

expressions for the marginal effects:

$\frac{\delta E(PRICE|X)}{\delta SQFT} = b_2 + 2*b_3 *AGE$ = 0.08471+0.02758 * AGE

$\frac{\delta E(PRICE|X)}{\delta AGE} = b_3 *AGE$ = 0.01379

AGE variable categories:

New		1

1-3 Years 	2

4-5 Years	3

6-10 Years	4

11-15 Years	5

16-20 Years	6

21-30 Years	7

31-40 Years	8

41-50 Years	9

51-75 Years	10

76+ Years	11

SQFT 的 marginal effect 為一斜直線，代表 SQFT 的 marginal effect 會受到 AGE 值的影響。當房屋年齡為 100 單位，SQFT 的 marginal effect 為 2.84271；若房屋年齡為 110 單位， SQFT 的 marginal effect 則為 3.11851，

AGE 的 marginal effect 為一水平線，代表 AGE 的 marginal effect 為一常數。例如當面積 SQFT 為 100 單位，AGE 的 marginal effect 為 0.01379；若當面積 SQFT 為 100 單位 ， AGE 的 marginal effect 仍然為 0.01379，

