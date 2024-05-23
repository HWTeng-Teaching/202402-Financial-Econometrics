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
| (Intercept) | 9.8231795   | 5.4888546   | 1.78966    | 0.0913376   |             |
| p           | 0.4894543   | 0.0984216   | 4.97304    | 0.0001159   |     ***     |
| plag        | 0.3246063   | 0.1017989   | 3.18870    | 0.0053766   |     **      |
| klag        | -0.1104238  | 0.0268265   | -4.11621   | 0.0007209   |     ***     |

There is no significant different between the estimates of two method.

### e.
Estimated the second-stage model 
$$I_t = b_1+b_2 \hat{P_{t}}+b_3P_{t-1}+b_4K_{t-1}+e_{2t}$$
by OLS.Compare the estimates and standard errors from this estimation to those in part (d). What differences are there?  

| Term        | Estimate    | Std. Error  | Statistic  | p-value     | significant | 
|-------------|-------------|-------------|------------|-------------|-------------|
| (Intercept) | 9.82318     | 5.42984     | 1.809      | 0.088153    |             |
| p           | 0.48945     | 0.09736     | 5.027      | 0.000104    |     ***     |
| plag        | 0.32461     | 0.10070     | 3.223      | 0.004990    |     **      |
| klag        | -0.11042    | 0.02654     | -4.161     | 0.000655    |     ***     |

These two different methods have almost same estimates on coefficients, but the method we used in part (e) has smaller standard errors,lead to higher t-value and lower p-value.

### f.




