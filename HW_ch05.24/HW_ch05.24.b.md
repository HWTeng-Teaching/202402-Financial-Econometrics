## This homework is written by 游政諺 (311707012)
## ch05.24 (b)
Q: Write down expressions for the marginal effects ∂E(PRICE|X)/∂SQFT and
∂E(PRICE|X)/∂AGE. Interpret each of the coefficients. Given the categorical nature of the
variable AGE, what assumptions are being made?

$PRICE = \beta_1 + \beta_2 SQFT + \beta_3 (SQFT * AGE)+e$

expressions for the marginal effects:

$\frac{\delta E(PRICE|X)}{\delta SQFT} = b_2 + b_3 *AGE$ 

$\frac{\delta E(PRICE|X)}{\delta AGE} = b_3 *SQFT$ 

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

Since AGE is a categorical variable, if the increase in house age does not increase the AGE variable ( for example: when the house age increases from 12 to 14, AGE is still 5 ), the marginal effect remains unchanged.

