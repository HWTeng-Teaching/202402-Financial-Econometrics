## This homework is written by 汪文豪 (311707006)
## ch05.21 (d)
The estimated model is:\
$Y_t = \beta_1 + \beta_2 TREND_t + \beta_3 RAIN_t + \beta_4 RAIN_t^2 + \beta_5(RAIN_t \times TREND_t)+e_t$\
**The sample code of HW_ch05.21.d.e.R for model setting**
```
#d
library(POE5Rdata)
data("toody5")
#model setting
y = toody5$y
trend = toody5$trend
rain = toody5$rain
rain_squared = rain^2
rain_trend = trend * rain
model = lm(y~trend+rain+rain_squared+rain_trend)
```
**Question** \
Find point and 95% interval estimates of the marginal effect of extra rainfall in \
(i) 1959 when the rainfall was 2.98 dm and \
(ii) 1995 when the rainfall was 4.797 dm. Discuss the results.\
**Answer**\
The marginal effect of extra rainfall is:\
$\frac{\delta Y_i}{\delta RAIN} = b_3 + 2b_4 RAIN_t + b_5TREND$\
$\frac{\delta Y_i}{\delta RAIN} = g$\
Using the delta method to calculate the variance\
$\frac{\delta g}{\delta b_3} = 1 = c_3$\
$\frac{\delta g}{\delta b_4} = 2RAIN_t = c_4$\
$\frac{\delta g}{\delta b_5} = TREND = c_5$\
$se(f) = \sqrt{\sum c_i^2var(b_i) + \sum_{i \ne j} 2c_ic_jcov(b_i, b_j)}$\
**The sample code of HW_ch05.21.d.e.R for parameters setting**
```
#parameters setting
b3 <- model$coefficients[[3]]
b4 <- model$coefficients[[4]]
b5 <- model$coefficients[[5]]
var_b3 <- vcov(model)[3, 3]
var_b4 <- vcov(model)[4, 4]
var_b5 <- vcov(model)[5, 5]
cov_b3_b4 <- vcov(model)[3, 4]
cov_b3_b5 <- vcov(model)[3, 5]
cov_b4_b5 <- vcov(model)[4, 5]
alpha <- 0.05
N = length(rain)
t_stat <- qt(1-alpha/2, df = N-5)
```
**The sample code of HW_ch05.21.d.e.R for constructing the marginal effect calculation function**
```
d_MarginalEffect <- function(d_rain, d_trend){
  ME = b3 + 2*b4*d_rain+b5*d_trend
  cat("Marginal Effect: ", ME, "\n")
  c3 <- 1
  c4 <- 2 * d_rain
  c5 <- 1 * d_trend
  se = sqrt(c3^2 * var_b3 + c4^2 * var_b4  +c5^2 * var_b5 + 2*c3*c4*cov_b3_b4 + 2*c3*c5*cov_b3_b5 + 2*c4*c5*cov_b4_b5)
  upper = ME + t_stat * se
  lower = ME - t_stat * se
  cat("The 95% Confidence Interval: [", lower, ", ", upper, "]\n")
}
```
**(i)**\
Parameters setting:\
$\alpha = 0.05$\
$TREND = 0.9$\
$RAIN = 2.98$\
**The sample code of HW_ch05.21.d.e.R for generating the marginal effect and the 95% confidence interval calculation result**
```
#d_1
rain_d_1 = 2.98
trend_d_1 = 0.9
d_MarginalEffect(rain_d_1, trend_d_1)
```
After executing the sample code (HW_ch05.21.d.e.R) you will get the marginal effect: **0.4884308** and the 95% confidence interval: **[0.1948469 , 0.7820147]**\
**(ii)**\
Parameters setting:\
$\alpha = 0.05$\
$TREND = 4.5$\
$RAIN = 4.797$\
**The sample code of HW_ch05.21.d.e.R for generating the marginal effect and the 95% confidence interval calculation result**
```
#d_2
rain_d_2 = 4.797
trend_d_2 = 4.5
d_MarginalEffect(rain_d_2, trend_d_2)
```
After executing the sample code (HW_ch05.21.d.e.R) you will get the marginal effect: **-0.4166124** and the 95% confidence interval: **[-0.7284281, -0.1047966]**\
**Discuss the results:**
1. In 1959, the 95% confidence interval for the marginal effect of rainfall is [0.1948469, 0.7820147], which tells us in repeated sampling, about 95% intervals constructed this way will contain the true marginal effect of rainfall on wheat yield.
As the technique of drought-resistant varieties of wheat is not developed yet, the appropriate rainfall will help the wheat yield.\
2. In 1995, the 95% confidence interval for the marginal effect of rainfall is [-0.7284281, -0.1047966], which tells us in repeated sampling, about 95% intervals constructed this way will contain the true marginal effect of rainfall on wheat yield.
As the technique of drought-resistant varieties of wheat may develop, the rainfall is not very helpful; in addition,  the over amount of rainfall will damage the wheat yield.
## ch05.21 (e)
**Question**\
Find point and 95% interval estimates for the amount of rainfall that would maximize expected yield in \
(i) 1959 and \
(ii) 1995. Discuss the results.\
**Answer**\
The amount of rainfall equation that would maximize expected yield is\
$\frac{\delta Y_i}{\delta RAIN} = b_3 + 2b_4 RAIN_t + b_5TREND = 0$\
Using the delta method to calculate the variance\
$\frac{\delta RAIN_{max}}{\delta b_3} =(b_3+b_5TREND)(-2b_4)^{-1}
=(-2b_4)^{-1}$

$\frac{\delta RAIN_{max}}{\delta b_4} =(b_3+b_5TREND)(-2b_4)^{-1}
=\frac{(b_3+b_5TREND)}{2b_4^{2}}$ 

$\frac{\delta RAIN_{max}}{\delta b_5} =(b_3+b_5TREND)(-2b_4)^{-1}
=(TREND)(-2b_4)^{-1}$\
**The parameters setting same as part (e)**\
**The sample code of HW_ch05.21.d.e.R for constructing the amount of rainfall calculation function that would maximize the expected yield**
```
e_RainfallMaximizeExpectedYield <- function(e_trend){
    e_rain = (b3 + b5 * e_trend) / (-2*b4)
    cat("The amount of rainfall that would maximize expected yield: ", e_rain, "\n")
    c3 <- (-2*b4)^(-1)
    c4 <- (b3+b5*e_trend)/(2*b4^2)
    c5 <- e_trend * (-2*b4)^(-1)
    se = sqrt(c3^2 * var_b3 + c4^2 * var_b4  + c5^2 * var_b5 + 2*c3*c4*cov_b3_b4 + 2*c3*c5*cov_b3_b5 + 2*c4*c5*cov_b4_b5)
    upper = e_rain + t_stat * se
    lower = e_rain - t_stat * se
    cat("The 95% Confidence Interval: [", lower, ", ", upper, "]\n")
} 
```
**(i)**\
Parameters setting:\
$\alpha = 0.05$\
TREND = 0.9$\
**The sample code of HW_ch05.21.d.e.R for generating the amount of rainfall that would maximize the expected yield and the 95% confidence interval calculation result**
```
#e_1
trend_e_1 = 0.9
e_RainfallMaximizeExpectedYield(trend_e_1)
```
After executing the sample code (HW_ch05.21.d.e.R) you will get the amount of rainfall that would maximize the expected yield: **4.534727** and the 95% confidence interval: **[4.059036, 5.010418]**\
**(ii)**\
Parameters setting:\
$\alpha = 0.05$\
$TREND = 4.5$\
**The sample code of HW_ch05.21.d.e.R for generating the amount of rainfall that would maximize the expected yield and the 95% confidence interval calculation result**
```
#e_2
trend_e_2 = 4.5
e_RainfallMaximizeExpectedYield(trend_e_2)
```
After executing the sample code (HW_ch05.21.d.e.R) you will get the amount of rainfall that would maximize the expected yield: **3.470879** and the 95% confidence interval: **[2.679208, 4.262549]**\
**Discuss the results**
1. In 1959, the amount of rainfall that would maximize the expected yield of the 95% confidence interval is [4.059036, 5.010418], which tells us in repeated sampling, about 95% intervals constructed this way will contain the true optimal rainfall amount needed to maximize wheat yield. As the technique of drought-resistant varieties of wheat is not developed yet, it needs more amount of rainfall to maximize the wheat yield.
2. In 1995, the amount of rainfall that would maximize the expected yield of the 95% confidence interval is [2.679208, 4.262549], which tells us in repeated sampling, about 95% intervals constructed this way will contain the true optimal rainfall amount needed to maximize wheat yield. As the technique of drought-resistant varieties of wheat may develop, the needed amount of rainfall is less than 1959 to maximize the wheat yield.
3. These results are consistent with the findings from part (d):
    - In 1959, the part(d) amount of rainfall was 2.98, which is not the best amount of rainfall in part(e) result. As more amount of rainfall can maximize the wheat yield, the marginal effect is positive.
    - In 1995, the part(d) amount of rainfall was 4.797, which is not the best amount of rainfall in part(e) result. As less amount of rainfall can maximize the wheat yield, the marginal effect is negative.
