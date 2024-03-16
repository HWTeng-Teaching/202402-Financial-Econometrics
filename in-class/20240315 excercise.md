
1. To estimate the linear combination of $c_1\beta_1 + c_2\beta_2 $, write down its point estimator.
  $$c_1 b_1+c_2b_2$$

2. Write down the pivot statistic and its sampling distribution.
   $$\frac{c_1b_1+c_2b_2-(c_1\beta_1 + c_2\beta_2)}{se(c_1b_1+c_2b_2)}\sim t_{(N-2)}$$


3. "Derive" the $100(1-\alpha)\%$ confidence interval for $c_1\beta_1 + c_2\beta_2 $
- $$1-\alpha =  P\left(-t_c\leq \frac{c_1b_1+c_2b_2 - (c_1\beta_1+c_2\beta_2)}{se(c_1b_1+c_2b_2)}\leq t_c\right)$$
- $$=P\left(-t_c se(c_1b_1+c_2b_2)\leq {(c_1b_1+c_2b_2) - (c_1\beta_1+c_2\beta_2)}\leq t_cse(c_1b_1+c_2b_2)\right)$$
- $$=P\left(-(c_1b_1+c_2b_2)-t_c se(c_1b_1+c_2b_2)\leq { - (c_1\beta_1+c_2\beta_2)}\leq -(c_1b_1+c_2b_2)+t_cse(c_1b_1+c_2b_2)\right)$$
- $$=P\left((c_1b_1+c_2b_2)-t_c se(c_1b_1+c_2b_2)\leq {  (c_1\beta_1+c_2\beta_2)}\leq (c_1b_1+c_2b_2)-t_cse(c_1b_1+c_2b_2)\right)$$

Therefore, the $100(1-\alpha)\%$ confidence interval for $c_1\beta_1 + c_2\beta_2$ is: 
     $$(c_1 b_1+c_2b_2)\pm t_{1-\frac{\alpha}{2}}se(c_1b_1+c_2b_2)$$
     Note: “Derive” means you have to show why this formula is obtained. It is not okay to just provide the final CI formula.  


4. Write down the test statistic and its sampling distribution for $H_0: c_1\beta_1 + c_2\beta_2 =c_0$ vs $H_0: c_1\beta_1 + c_2\beta_2 \neq c_0$ 
  $$\lambda = \frac{c_1b_1+c_2b_2-c_0}{se(c_1b_1+c_2b_2)}\sim t_{(N-2)}$$
