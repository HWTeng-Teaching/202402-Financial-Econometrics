# This homework is written by 林震洋 (312707020)
# 3.18(d)

Question:\
One member of the management board claims that for every \$1000 increase in income the average amount of life insurance
held will increase by \$5000. Let the algebraic model be $INSURANCE = \beta_1 + \beta_2*INCOME + e$. Test the hypothesis
that the statement is true against the alternative that it is not true. State the conjecture in terms of a null and
alternative hypothesis about the model parameters. Use the 5% level of significance. Do the data support the claim or
not? Clearly, indicate the test statistic used and the rejection region.

Answer:\
### Hypothesis Test on Income and Insurance

The conjecture can be stated in terms of the model parameters as follows:

-   Null Hypothesis ($H_0$): ${b_{2}}$ = 5 (For every \$1000 increase in income, the average amount of life insurance
    held increases by \$5000).
-   Alternative Hypothesis ($H_1$): ${b_{2}}$ ≠ 5 (The statement is not true).
$$\widehat{INSURANCE} = 6.855 + 3.880 \times INCOME$$
### Hypothesis Test

We will test the hypothesis using a t-test. The test statistic is calculated as:

$$
 t = \frac{{b_{2} - 5}}{\text{se}(b_{2})} = \frac{{3.88 - 5}}{0.112} = -10
$$

where ${b_{2}}$ is the estimated coefficient for INCOME and $\text{se}({b_2})$ is its standard error.

Assuming a significance level of 5%, the critical value for a two-tailed test with 18 degrees of freedom (N - 2) is
approximately 2.101 (from the t-distribution table).
If the t-statistic falls outside of the range defined by the
negative and positive critical values(+-2.101), the null hypothesis is rejected.\

### Conclusion

-10 is less than -2.101, we reject the null hypothesis and conclude that the data do not support the claim.



**[Reviewed by Yenting 20240327.]** 
