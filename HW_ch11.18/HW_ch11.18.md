## 11.18 
### (a) Check the identification of the consumption and investment functions

**Identification Check:** For each equation, we need to ensure that there are enough excluded exogenous variables from the other equations to serve as instruments.

The model consists of two equations:

$$
CN_t = \alpha_1 + \alpha_2 I_t + \alpha_3 \text{TIME}_t + e_{1t}
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
CN_t = \alpha_1 + \alpha_2 I_t + \alpha_3 \text{TIME}_t + e_{1t}
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
CN_t = \alpha_1 + \alpha_2 (\beta_1 + \beta_2 CN_t + \beta_3 K_{t-1} + e_{2t}) + \alpha_3 \text{TIME}_t + e_{1t}
$$

Solve for $CN_t$:

$$
CN_t = \alpha_1 + \alpha_2 \beta_1 + \alpha_2 \beta_2 CN_t + \alpha_2 \beta_3 K_{t-1} + \alpha_2 e_{2t} + \alpha_3 \text{TIME}_t + e_{1t}
$$

$$
CN_t - \alpha_2 \beta_2 CN_t = \alpha_1 + \alpha_2 \beta_1 + \alpha_2 \beta_3 K_{t-1} + \alpha_2 e_{2t} + \alpha_3 \text{TIME}_t + e_{1t}
$$

$$
CN_t (1 - \alpha_2 \beta_2) = \alpha_1 + \alpha_2 \beta_1 + \alpha_2 \beta_3 K_{t-1} + \alpha_2 e_{2t} + \alpha_3 \text{TIME}_t + e_{1t}
$$

$$
CN_t = \frac{\alpha_1 + \alpha_2 \beta_1}{1 - \alpha_2 \beta_2} + \frac{\alpha_2 \beta_3}{1 - \alpha_2 \beta_2} K_{t-1} + \frac{\alpha_3}{1 - \alpha_2 \beta_2} \text{TIME}_t + \frac{\alpha_2 e_{2t} + e_{1t}}{1 - \alpha_2 \beta_2}
$$

Thus, we have:

$$
CN_t = \pi_1 + \pi_2 K_{t-1} + \pi_3 \text{TIME}_t + \text{error term}
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
