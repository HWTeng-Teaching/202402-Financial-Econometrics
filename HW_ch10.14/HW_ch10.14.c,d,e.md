#
## This homework is written by  李宇量 (312707004)
## ch10.14 (c)
**Question:**\
The estimated first-stage regression of ( $r_{IBM}$ − $r_𝑓$) on ${RANK}$ yields an overall $F$-test of model
significance of 93.77. What can we conclude about the strength of the IV $RANK$?  
  
**Answer:**  
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/102803318/52885d89-45c4-4687-b677-ac1dc776151f)  


By the rule of thumb , we assume the critical_value = 10 
  
The first stage simple linear regression F-value is 93.77, compared to the critival value 10  
Since $H_0:β_{1IV}=0$ is rejected we can say that RANK might be a good IV.   
## ch10.14 (d)  
**Question:**\
If we compute the first-stage residuals and add them to the CAPM model, the resulting coefficient
has a $t$-value of 60.60. What does this result suggest to us about the OLS estimator in the CAPM
model?  
  
**Answer:**\
By Hausman test, our regression model will be $y_i=\beta_1+\beta_2∗x_i+\delta_1∗\hat{v_i}+e_i$,i=1,2,...,n
, then the null hypothesis is $H_0:\delta_1=0$
. Given the coefficient of $\delta_1$ has $t$-value = 60.60 , which is significantly different from zero
, we reject $H0$
, which means endogeneity issue does exist.
## ch10.14 (e)
**Question:**\
Using $RANK$ as an IV and estimating the CAPM model by IV/2SLS yield an estimate of IBM’s
beta of 1.0025 with a standard error of 0.1019. Compare this IV estimate to the OLS estimate in
part (a). Does the IV estimate agree with your expectations?  

**Answer:**\
When measurement error occurs, under the assumption of classical error-in-variables, the OLSE $\beta_1$ would be smaller. In comparison with the $\beta_{1IV}$, which is 1.0025 with a standard error of 0.1019, the OLS estimate of 0.9769 does indeed fall below 1.0025. This difference is in line with our expectation, as measurement errors typically lead to underestimation in the OLS estimate, reinforcing the value of using $RANK$ as an instrumental variable (IV) to improve the estimation of $\beta$ in the CAPM model.
