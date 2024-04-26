#
## This homework is written by 歐陽君欣(312707009)
## ch08.06 (e)
**Question:**\
The OLS fitted model from part (b), with usual and robust standard errors, is

$\widehat{WAGE} = -17.77 + 2.50\ EDUC + 0.23\ EXPER + 3.23\ METRO - 4.20\ FEMALE$

 | Variable |  intercept  |      EDUC     |     EXPER     |     METRO     |   FEMALE   |
 |:--------:|:-----------:|:-------------:|:-------------:|:-------------:|:----------:|
 |    se    |    2.36  *   |     0.14   *   |      0.031 *   |      1.05     |    0.81  *  |
 |  robust  |    2.50     |     0.16      |      0.029    |      0.84     |    0.80    |


For which coefficients have interval estimates gotten narrower? For which coefficients have interval estimates gotten wider? Is there an inconsistency in the results?

**Answer:**

Since robust standard error is bigger than usual standard errors for intercept and $EDUC$, the interval estimates for the intercept and the coefficient of $EDUC$ have gotten wider.

Because robust standard error is smaller than usual standard errors for the rest variables, so the interval estimates for the others have gotten narrower.

There is no inconsistency because the robust standard errors might be larger or smaller than the incorrect OLS standard errors.

[ Teng: You should add significant indicator ., *, **, ***, and compare if these two rows give you the same indicators.]


## ch08.06 (f)
**Question:**\
If we add $MARRIED$ to the model in part (b), we find that its $t-value$ using a White heteroskedasticity robust standard error is about 1.0. Does this conflict with, or is it compatible with, the result in (b) concerning heteroskedasticity? Explain.

**Answer:**

The addition of the intercept indicator variable $MARRIED$ allows the expected wage, conditional on the explanatory variables $EDUC$, $EXPER$, $METRO$, and $FEMALE$ to differ between those who are married and those who are not. 

In part (b), we were asking about the amount of error variation between the two groups (married & single), which we found to be significant.

So the above two issues are quite different.
