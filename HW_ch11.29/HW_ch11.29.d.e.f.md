### This homework is written by 廖軒霈(312707038)

## **Question 11.29 (d)**
The Hausman test for the presence of endogenous explanatory variables is discussed in Section 10.4.1. It is implemented by adding the reduced-form residuals to the structural equation and testing their significance, that is, using OLS, estimate the model
$CN_{t} \=\alpha_{1}\+\alpha_{2}(W_{1t} +W_{2t})\+\alpha_{3}P_{t} \+\alpha_{4}P_{t−1} \+\delta_{1}\hat{\nu_{1t}}\+\delta_{2}\hat{\nu_{2t}}+e_{1t}$\
Use an $F$-test for the null hypothesis $H_{0}\:\delta_{1}\=0,\delta_{2}\=0$ at the 5% level of significance. By rejecting the null hypothesis, we conclude that either $W_{1t}$ or $P_{t}$ is endogenous, or both are endogenous. What do we conclude from the test? In the context of this simultaneous equations model what result should we find?

## **Ans.**
We see that $\hat{\nu_{2}}$ is significant at the 1% level. The joint $F$-test gives $F \= 5.60$. The 95th percentile of $F_{(2,15)}$ is $3.6823$.Therefore, at the 5% level we do find these variables jointly significant. We conclude that either $W_{1t}$ or $P_{t}$ is endogenous, or both are. This is what we should find in a system of simultaneous equations. The endogenous variables are jointly determined. 

![截圖 2024-05-21 下午8 24 20](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/142668635/dcde635e-2372-42c8-819d-6b4692cd08ed)


## **Question 11.29 (e)**
Obtain the 2SLS estimates of the consumption equation using all eight exogenous and predetermined variables as IVs. Compare the estimates to the OLS estimates in part (a). Do you find any important differences?

## **Ans.**
The primary difference is that profits, $P$, has a much smaller coefficient estimate and is no longer significant. On the other hand, lagged profits, $PLAG$, has a larger coefficient estimate and is significant at the 10% level, using the critical value $t_{(0.95,17)}\=1.74$. 

![截圖 2024-05-21 下午8 24 37](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/142668635/b2817b55-76c7-45ce-81e0-b9cf9dfe9cb9)

## **Question 11.29 (f)**
Let the 2SLS residuals from part (e) be $\hat{e_{1t}}$. Regress these residuals on all the exogenous and predetermined variables. If these instruments are valid, then the $R^2$ from this regression should be low, and none of the variables are statistically significant. The Sargan test for instrument validity is discussed in Section 10.4.3. The test statistic $TR^2$ has a chi-square distribution with degrees of freedom equal to the number of “surplus” IVs if the surplus instruments are valid. The consumption equation includes three exogenous and/or predetermined variables of the total of eight possible. There are $L$ = 5 external instruments and $B$ = 2 right-hand side endogenous variables. Compare the value of the test statistic to the 95th percentile value from the $\chi^2_{(3)}$ distribution. What do we conclude about the validity of the surplus instruments in this case?

## **Ans.**
The test statistic is $NR^2\=21\times0.4177\=8.7715$. The critical value is $\chi^2_{(3)}\=7.8147$. Thus, we reject the validity of the surplus IV. The test does not indicate which IV is the problem, but government spending, $G$, is statistically significant in the regression. Valid exogenous variables, and IV, should not be related to the 2SLS residuals. 

![截圖 2024-05-21 下午8 24 54](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/142668635/f917fe2c-2527-4beb-8d6d-b45fceb7b614)


