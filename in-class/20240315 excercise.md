1. To estimate the linear combination of $c_1\beta_1 + c_2\beta_2 $, write down its point estimator.
  $$c_1 b_1+c_2b_2$$
2. Write down the pivot statistic and its sampling distribution.
   $$\frac{c_1b_1+c_2b_2-(c_1\beta_1 + c_2\beta_2)}{se(c_1b_1+c_2b_2)}\sim t_{(N-2)}$$
3. Derive the $100(1-\alpha)\%$ confidence interval for $c_1\beta_1 + c_2\beta_2 $
     $$(c_1 b_1+c_2b_2)\pm t_{1-\frac{\alpha}{2}}se(c_1b_1+c_2b_2)$$
4. Write down the test statistic and its sampling distribution for $H_0: c_1\beta_1 + c_2\beta_2 =c_0$
  $$\lambda = \frac{c_1b_1+c_2b_2-c_0}{se(c_1b_1+c_2b_2)}\sim t_{(N-2)}$$
