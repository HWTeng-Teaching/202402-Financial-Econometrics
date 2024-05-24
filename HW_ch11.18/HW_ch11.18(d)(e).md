##
This homework is written by 陳品妤 (312707032)

### d. Estimate Each of the Structural Equations by 2SLS
#### Answer
1. **2SLS estimation for consumption function**
   
<div style="text-align: center;">
  <img src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162009543/d77a25e8-a27a-46a7-b626-2c2f8f526d38" alt="Image description" width="500"/>
</div>

**Consumption Function (CN):**

- The coefficient for `i` is -0.2341 with a p-value of 0.8669, indicating it is not statistically significant.
- The coefficient for `time` is 0.7888 with a p-value of 0.0104, indicating it is statistically significant and positive.

2. **2SLS estimation for investment function**

<div style="text-align: center;">
  <img src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162009543/81e4aae7-925d-427c-99b0-50481f101a28" alt="Image description" width="500"/>
</div>

**Investment Function (I):**

- The coefficient for `cn` is -0.04652 with a p-value of 0.803, indicating it is not statistically significant.
- The coefficient for `klag` is -0.10791 with a p-value of 0.258, indicating it is not statistically significant.

#### Code
```r
library(AER)

# Load the data
load("/Users/chenpinyu/Downloads/klein.rdata")

# 2SLS estimation for consumption function
consumption_2sls <- ivreg(cn ~ i + time | time + klag, data = klein)
summary(consumption_2sls)

# 2SLS estimation for investment function
investment_2sls <- ivreg(i ~ cn + klag | time + klag, data = klein)
summary(investment_2sls)
```

### e. Estimate the First-Stage, Reduced Form Equations

#### Answer

1. **First-stage reduced-form equation for CN**

<div style="text-align: center;">
  <img src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162009543/39fbaa25-28e8-4836-8f35-2825de897a3f" alt="Image description" width="500"/>
</div>

2. **First-stage reduced-form equation for I**

<div style="text-align: center;">
  <img src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162009543/3605e696-14fa-4267-b619-f159437f1cdd" alt="Image description" width="500"/>
</div>

**Significance of \(K_{t-1}\) in the CN Equation:**

- The p-value for `klag` is 0.848, indicating it is not statistically significant in the reduced-form equation for consumption.

**Significance of TIME in the I Equation:**

- The p-value for `time` is 0.790, indicating it is not statistically significant in the reduced-form equation for investment.

**Explaining Differences Between OLS and 2SLS Estimates:**

- The non-significance of `klag` in the CN equation and `time` in the I equation suggests that the instruments may not be strong, potentially explaining the differences between OLS and 2SLS estimates. If the instruments are weak, they do not sufficiently address endogeneity issues, leading to less reliable 2SLS estimates.

#### Code
```r
# First-stage reduced-form equation for CN
reduced_form_CN <- lm(cn ~ time + klag, data = klein)
summary(reduced_form_CN)

# First-stage reduced-form equation for I
reduced_form_I <- lm(i ~ time + klag, data = klein)
summary(reduced_form_I)

