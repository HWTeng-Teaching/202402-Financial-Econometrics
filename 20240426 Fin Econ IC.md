# 20240426 Fin Econ IC


## Q1. 

In the simple linear regression with random regressors: 
- (a) Derive $\beta_2 =\frac{cov(x_i,y_i)}{var(x_i)}-\frac{cov(x_i,e_i)}{var(x_i)}$
Assume $E(e_i)=0$, then $E(y_i)=\beta_1+\beta_2E(x_i)$:
$$y_i-E(y_i)=\beta_2[x_i-E(x_i)]+e_i$$
Multiply the above equation with $(x_i-E(x_i))$ and take an expectation: 
$$[x_i-E(x_i)][y_i-E(y_i)] = \beta_2[x_i-E(x_i)]^2+ [x_i-E(x_i)]e_i$$
$$E\{[x_i-E(x_i)][y_i-E(y_i)]\}=\beta_2E\{[x_i-E(x_i)]^2\}+E\{[x_i-E(x_i)]e_i\}$$
$$cov(x_i,y_i) = \beta_2 var(x_i) + cov(x_i,e_i)$$

## Q2. 
- (a) Show that OLS $b_2$ is biased, but consistent for  exogenous regressors.
  LSE is biased:
  $$\mathsf{E}(b_2) = \mathsf{E}\left[{\frac{\sum(x_i-\bar{x})(y_i-\bar{y})}{\sum(x_i-\bar{x})^2}}\right] \neq \frac{\mathsf{E}\left[\sum(x_i-\bar{x})(y_i-\bar{y})\right]}{\mathsf{E}\left[\sum(x_i-\bar{x})^2\right]}=\beta_2$$
  The LSE is consistent:
  $$b_2 = \frac{\sum(x_i-\bar{x})(y_i-\bar{y})}{\sum(x_i-\bar{x})^2}=\frac{\hat{cov}(x,y)}{\hat{var}(x)}\rightarrow \frac{cov(x,y)}{var(x)}=\beta_2$$
- (b)  Show that OLS $b_2$ is biased, and inconsistent for  endogenous regressors.



(Skipped: Q3. Write down the properties that an IV needs to satisfy. )

