#
## This homework is written by  李宇量 (312707004)
## ch08.14 (c)
**Question:**\
The estimated first-stage regression of ( $r_{IBM}$ − $r_𝑓$) on ${RANK}$ yields an overall $F$-test of model
significance of 93.77. What can we conclude about the strength of the IV $RANK$?  
```
critical_value <- qf(1 - 0.05, 1, 178)
critical_value
```
critical_value = 3.894232 
  
The first stage simple linear regression F-value is 93.77, compared to the critival value 3.894232 (given α=0.05)  
Since $H_0:β_{1IV}=0$ is rejected we can say that RANK might be a good IV.   
## ch08.14 (d)
**Question:**\
If we compute the first-stage residuals and add them to the CAPM model, the resulting coefficient
has a $t$-value of 60.60. What does this result suggest to us about the OLS estimator in the CAPM
model?
## ch08.14 (e)
**Question:**\
Using $RANK$ as an IV and estimating the CAPM model by IV/2SLS yield an estimate of IBM’s
beta of 1.0025 with a standard error of 0.1019. Compare this IV estimate to the OLS estimate in
part (a). Does the IV estimate agree with your expectations?
