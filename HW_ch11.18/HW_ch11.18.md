## 11.18 
### (a) Check the identification of the consumption and investment functions

**Identification Check:** For each equation, we need to ensure that there are enough excluded exogenous variables from the other equations to serve as instruments.

The model consists of two equations:

$$
CN_t = \alpha_1 + \alpha_2 I_t + \alpha_3 TIME_t + e_{1t}
$$

$$
I_t = \beta_1 + \beta_2 CN_t + \beta_3 K_{t-1} + e_{2t}
$$

To check for identification, we use the order condition (necessary condition): An equation is identified if the number of excluded exogenous variables (from the other equations) is at least as many as the number of endogenous variables in the equation minus one.

For the consumption equation:

-   Endogenous variable: $CN_t$
-   Exogenous variables included in the equation: $\text{TIME}_t$
-   Exogenous variables excluded from the equation: $K_{t-1}$

Since there is 1 excluded exogenous variable and 1 endogenous variable ($I_t$), the consumption equation is just identified.

For the investment equation:

-   Endogenous variable: $I_t$
-   Exogenous variables included in the equation: $K_{t-1}$
-   Exogenous variables excluded from the equation: $\text{TIME}_t$

Since there is 1 excluded exogenous variable and 1 endogenous variable ($CN_t$), the investment equation is just identified.

## 11.18 
### (b) Solve for the reduced-form equation for $CN_t$. Call the parameters $\pi_1, \pi_2, \pi_3$ and express them in terms of the structural parameters

**Reduced-Form Equations:**

To find the reduced form, we express the endogenous variables $CN_t$ and $I_t$ as functions of only the exogenous variables.

Given the structural equations:

$$
CN_t = \alpha_1 + \alpha_2 I_t + \alpha_3 TIME_t + e_{1t}
$$

$$
I_t = \beta_1 + \beta_2 CN_t + \beta_3 K_{t-1} + e_{2t}
$$

First, solve the second equation for $I_t$:

$$
I_t = \beta_1 + \beta_2 CN_t + \beta_3 K_{t-1} + e_{2t}
$$

Substitute this into the first equation:

$$
CN_t = \alpha_1 + \alpha_2 (\beta_1 + \beta_2 CN_t + \beta_3 K_{t-1} + e_{2t}) + \alpha_3 TIME_t + e_{1t}
$$

Solve for $CN_t$:

$$
CN_t = \alpha_1 + \alpha_2 \beta_1 + \alpha_2 \beta_2 CN_t + \alpha_2 \beta_3 K_{t-1} + \alpha_2 e_{2t} + \alpha_3 TIME_t + e_{1t}
$$

$$
CN_t - \alpha_2 \beta_2 CN_t = \alpha_1 + \alpha_2 \beta_1 + \alpha_2 \beta_3 K_{t-1} + \alpha_2 e_{2t} + \alpha_3 TIME_t + e_{1t}
$$

$$
CN_t (1 - \alpha_2 \beta_2) = \alpha_1 + \alpha_2 \beta_1 + \alpha_2 \beta_3 K_{t-1} + \alpha_2 e_{2t} + \alpha_3 TIME_t + e_{1t}
$$

$$
CN_t = \frac{\alpha_1 + \alpha_2 \beta_1}{1 - \alpha_2 \beta_2} + \frac{\alpha_2 \beta_3}{1 - \alpha_2 \beta_2} K_{t-1} + \frac{\alpha_3}{1 - \alpha_2 \beta_2} TIME_t + \frac{\alpha_2 e_{2t} + e_{1t}}{1 - \alpha_2 \beta_2}
$$

Thus, we have:

$$
CN_t = \pi_1 + \pi_2 K_{t-1} + \pi_3 TIME_t + \text{error term}
$$

where:

$$
\pi_1 = \frac{\alpha_1 + \alpha_2 \beta_1}{1 - \alpha_2 \beta_2}
$$

$$
\pi_2 = \frac{\alpha_2 \beta_3}{1 - \alpha_2 \beta_2}
$$

$$
\pi_3 = \frac{\alpha_3}{1 - \alpha_2 \beta_2}
$$

## 11.18 (c)
### Using the data file klein, estimate each of the structural equations by OLS. Comment on the signs and significance of the coefficients.


### Equation of CN

$$
CN_t = 52.0479 + 1.35521 \cdot I_t + 1.00537 \cdot TIME_t
$$

-   **Intercept**: 52.0479, **p** \< 0.001 (顯著)

-   **Investment (I)**: 1.35521, **p** \< 0.001 (顯著)

-   **Time**: 1.00537, **p** \< 0.001 (顯著)

-   $R^2$: 0.9114 (adjusted $R^2$: 0.902)

### Equation of I

$$
I_t = 27.5973 + 0.3337 \cdot CN_t - 0.2208 \cdot K_{t-1}
$$

-   **Intercept**: 27.5973, **p** ≈ 0.0138 (顯著)

-   **Consumption (CN)**: 0.3337, **p** ≈ 0.0006 (顯著)

-   **Capital of last period (Klag)**: -0.2208, **p** ≈ 0.0009 (顯著)

-   $R^2$: 0.543 (adjusted $R^2$: 0.4949)


<img width="474" alt="截圖 2024-05-15 下午2 41 04" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/67742647/47cafaa3-46a5-43d1-8316-146462c3c780">

```{r}
library(POE5Rdata) 
summary(klein)
# Estimate the consumption equation by OLS 
consumption_model <- lm(cn ~ i + time, data = klein)
summary(consumption_model) 
# Estimate the investment equation by OLS 
investment_model <- lm(i ~ cn + klag, data = klein)
summary(investment_model)
```
