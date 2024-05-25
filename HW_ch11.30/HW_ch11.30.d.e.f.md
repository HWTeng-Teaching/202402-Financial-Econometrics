## This homework is written by 張滕淇 (312707041)

### d.
Obtain the 2SLS estimated of the investment equation using all eight exogenous and predetermined variables as IVs and software designed for 2SLS. Compare the estimates to the OLS estimates in part(a). Do you find any different?

**Ans:**

OLS:
| Term        | Estimate    | Std. Error  | Statistic  | p-value     | significant |
|-------------|-------------|-------------|------------|-------------|-------------|
| (Intercept) | 10.1257885  | 5.4655465   | 1.852658   | 0.0813742   |             |
| p           | 0.4796356   | 0.0971146   | 4.938864   | 0.0001246   |    ***      |
| plag        | 0.3330387   | 0.1008592   | 3.302015   | 0.0042117   |    **       |
| klag        | -0.1117947  | 0.0267276   | -4.182749  | 0.0006244   |    ***      |



2SLS:
| Term        | Estimate    | Std. Error  | Statistic  | p-value     | significant | 
|-------------|-------------|-------------|------------|-------------|-------------|
| (Intercept) |20.2782089   | 8.3832489   | 2.41890    | 0.0270705   |     *       |
| p           | 0.1502218   | 0.1925336   | 0.78024    | 0.4459798   |             |
| plag        | 0.6159436   | 0.1809258   | 3.40440    | 0.0033755   |     **      |
| klag        | -0.1577876  | 0.0401521   | -3.92975   | 0.0010797   |     **      |

P became insignificant and intercept became significant.

### e.
Estimated the second-stage model 
$$I_t = b_1+b_2 \hat{P_{t}}+b_3P_{t-1}+b_4K_{t-1}+e_{2t}$$
by OLS.Compare the estimates and standard errors from this estimation to those in part (d). What differences are there?  

**Ans:**

| Term        | Estimate    | Std. Error  | Statistic  | p-value     | significant | 
|-------------|-------------|-------------|------------|-------------|-------------|
| (Intercept) |20.27821     | 9.97663     | 2.033      | 0.05802     |             |
| p           | 0.15022     | 0.22913     | 0.656      | 0.52084     |             |
| plag        | 0.61594     | 0.21531     | 2.861      | 0.01083     |     *       |
| klag        | -0.15779    | 0.04778     | -3.302     | 0.00421     |     **      |

These two different methods have almost same estimates on coefficients, but the method we used in part (e) has smaller standard errors,lead to higher t-value and lower p-value.

### f.
Let the 2SLS residuals from part (e) be $\hat{e_{2t}}$. Regress these residuals on all the exogenous and predetermined variables. If these instruments are valid, then the $R^2$ from this regression should be low, and none of the variables are statistically significant. The Sargan test for instrument validity is discussed in Section 10.4.3. The test statistic $TR^2$ has a chi-square distribution with degrees of freedom equal to the number of “surplus” IVs if the surplus instruments are valid. The consumption equation includes three exogenous and/or predetermined variables of the total of eight possible. There are $L$ = 5 external instruments and $B$ = 1 right-hand side endogenous variables. Compare the value of the test statistic to the 95th percentile value from the $\chi^2_{(4)}$ distribution. What do we conclude about the validity of the surplus instruments in this case?

**Ans:**

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/71300551/a4909d5b-1334-4293-b3fa-ed0cd6db8800)


Use the information we get in the regression,we obtain:

|             |   $TR^2$    | $\chi^2_{(4,0.95)}$  |
|-------------|-------------|----------------------|
| (Intercept) |  9.674965   |      9.487729        |

Since $TR^2 > \chi^2_{(4,0.95)}$ we reject the null hypothsis that all the surplus moment conditions are valid.
We conclude that at least one of the surplus moment condition is not valid.



