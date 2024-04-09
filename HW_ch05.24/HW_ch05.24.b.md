## This homework is written by 游政諺 (311707012)
## ch05.24 (b)
Q: Write down expressions for the marginal effects ∂E(PRICE|X)/∂SQFT and
∂E(PRICE|X)/∂AGE. Interpret each of the coefficients. Given the categorical nature of the
variable AGE, what assumptions are being made?

$PRICE = \beta_1 + \beta_2 SQFT + \beta_3 (SQFT * AGE)+e$

expressions for the marginal effects:

$\frac{\delta E(PRICE|X)}{\delta SQFT} = b_2 + 2*b_3 *AGE$ = 0.08471+0.02758 * AGE

$\frac{\delta E(PRICE|X)}{\delta AGE} = b_3 *AGE$ = 0.01379

Interpret of the coefficients:

當乘以 100 後，此邊際效應給出了價格相對於
額外 100 平方英尺的佔地面積。隨著房屋面積 (SQFT) 的增加，
百分比變化接近常數 2 100 。因此，我們預期 2  = 0 。的標誌
係數 3  決定價格變動的百分比是增加或減少
當它接近 2 100 時。對於 3   0 ，價格變化百分比隨著
接近 2 100 ；對於 3  < 0，它正在增加。對於 3  ，任一符號都可能。然而，我們
對於 SQFT 的所有值，確實期望 2  和 3  的振幅為 0 SQFT ME  。
