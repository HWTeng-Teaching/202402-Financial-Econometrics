## This homework is written by 張滕淇 (312707041)

### d.
Obtain the 2SLS estimated of the investment equation using all eight exogenous and predetermined variables as IVs and software designed for 2SLS. Compare the estimates to the OLS estimates in part(a). Do you find any different?

**Ans:**

OLS:
| Term        | Estimate    | Std. Error  | Statistic  | p-value     |
|-------------|-------------|-------------|------------|-------------|
| (Intercept) | 10.1257885  | 5.4655465   | 1.852658   | 0.0813742   |
| p           | 0.4796356   | 0.0971146   | 4.938864   | 0.0001246   |***
| plag        | 0.3330387   | 0.1008592   | 3.302015   | 0.0042117   |**
| klag        | -0.1117947  | 0.0267276   | -4.182749  | 0.0006244   |***



2SLS:
| Term        | Estimate    | Std. Error  | Statistic  | p-value     |
|-------------|-------------|-------------|------------|-------------|
| (Intercept) | 9.8231795   | 5.4888546   | 1.78966    | 0.0913376   |
| p           | 0.4894543   | 0.0984216   | 4.97304    | 0.0001159   |***
| plag        | 0.3246063   | 0.1017989   | 3.18870    | 0.0053766   |**
| klag        | -0.1104238  | 0.0268265   | -4.11621   | 0.0007209   |***


