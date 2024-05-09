This homework is written by  黃鈺婷 (312707003)

# 10.14  
The Capital Asset Pricing Model (CAPM) [see Exercise 2.16] says that the risk premium on security *j* is related to the risk premium on the market portfolio, that is $$r_j − r_𝑓 = \alpha_j + \beta_j(r_m − r_𝑓)$$ where $r_j$ and $r_f$ are the returns to security *j* and the risk-free rate, respectively, $r_m$ is the return on the
market portfolio, and $\beta_j$ is the *j*th security’s “*beta*” value. A stock’s *beta* is important to investors since it reveals the stock’s volatility. We measure the market portfolio using the Standard & Poors value weighted index, and the risk-free rate by the 30-day LIBOR monthly rate of return.  


## a.  
**Question:**  
Using 180 monthly observations from January 1988, the OLS estimate of IBM’s beta is 0.9769 with a standard error of 0.0978. If our constructed values of the market return and the risk-free rate are measured with error is the OLS estimator unbiased and consistent? If it is biased, what is the direction of the bias?  

**Answer:**  
Consider measurement error: $x^\*+u$, where $x^\*$ is the real explanatory variable and u is a random error.  
The regression model is $$\begin{aligned} y&=\beta_1+\beta_2x^*+e \\&=\beta_1+\beta_2(x-u)+e \\&=\beta_1+\beta_2x+(e-\beta_2u) \end{aligned}$$  
The $cov(x,e-\beta_2u)=cov(x^\*+u,e-\beta_2u)=cov(u,-\beta_2u)=-\beta_2var(u)\neq 0$.  
The explanatory variable $(r_m − r_f )$ is endogenous.  
Therefore, OLS estimator is inconsistent.  
$\beta_2=0.9769>0$, there is a negative correlation between $x$ and the randon error $e-\beta_2u$. The least square estimator will underestimate $\beta_2$.  
Therefore ,the OLS estimator is downward biased.  

## b.  
**Question:**  
It has been suggested that it is possible to construct an IV by ranking the values of the explanatory variable and using the rank as the IV. That is, we sort $(r_m − r_𝑓)$
from smallest to largest, and assign the values *RANK* = 1, 2,…, 180. Does this variable potentially satisfy the conditions IV1–IV3?  

**Answer:**  
The constructed variable *RANK* does not belong in the regression, so IV1($z_i$ doesn't have a direct effect on $y_i$) is satisfied.  
Because we have “sorted” the values of the explanatory variables and assigned according to the rank of ($r_m-r_f$), it is probable to believe that the regression error in time *t* is not correlated to the ranked values.(IV2($z_i$ is not correlated with the regression error) is satisfied.)    
We can speculate that there is a correlation because when ($r_m-r_f$) is large it
will have a high rank.(IV3($z_i$ is strongly correlated with $x_i$, the endogenous variable) is satisfied.)  
