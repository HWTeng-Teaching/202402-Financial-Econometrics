## This homework is written by 黃子騏(312707036)
# 29
$$
\begin{aligned}
& \text{According to equation 11.17,} \\
& CN_t = \alpha_1 + \alpha_2 (W_{1t} + W_{2t}) + \alpha_3 P_t + \alpha_4 P_{t-1} + e_{1t}.
\end{aligned}
$$
## a
$$
\begin{aligned}
& \text{Question: } \\
& \text{Estimate the consumption function in equation (11.17) by OLS. Comment on the signs and significance of the coefficients.} \\
& \text{Answer: } \\
& \text{Given} \alpha \text{is set to be 0.05, the t-values of both total wages and the profit of current year are significantly positive since they are larger} \\
& \text{than the critical value t_{(0.025, 17)} = 2.109816.} \\
\end{aligned}
$$
```{r}
data_29 <- read.csv("C:/Users/Lab_615/Desktop/klein.csv")
# a
reg_29_a <- lm(cn~total_wage+p+plag, data = data_29)
library(broom);library(knitr)
sum_reg_29_a <- tidy(reg_29_a)
kable(sum_reg_29_a)
df.residual(reg_29_a) #17 因為plag少了一個數
qt(1-0.05/2,17) #2.109816
```

## b
$$
\begin{aligned}
& \text{Question:} \\
& \text{Estimate the reduced-form equation for wages of workers in the private sector, } W_{1t} \text{, using all eight exogenous and predetermined } \\
& \text{variables as explanatory variables. Test the joint significance of all the variables except wages of workers in the public sector, } W_{2t} \text{,}\\
& \text{and lagged profits, } P_{t-1} \text{. Save the residuals, } \hat{\nu}_{1t} \text{.} \\
& \text{Answer:} \\
& \text{The reduced form equation would be:} \\
& \ W_{1t} = \beta_1 + \beta_2 P_{t-1} + \beta_3 K_{t-1} + \beta_4 W_2 + \beta_5 G + \beta_6 TX + \beta_7 TIME + \beta_8 E_{t-1} + \nu_{it}.
\end{aligned}
$$
```{r}
reg_29_b <- lm(w1~plag+klag+w2+g+tx+time+elag, data = data_29)
resid_full_model <- resid(reg_29_b)
sse_29_b <- sum(resid_full_model^2)
sum_reg_29_b <- tidy(reg_29_b)
kable(sum_reg_29_b)
```
$$
\begin{aligned}
& \text{In order to test the joint significance of all the variables except wages of workers in the public } \\
& \text{sector, }W_{2t} \text{, and lagged profits, }P_{t-1}\text{, we implement partial F-test.} \\
& H_0: \text{The full model and the reduced model possess equivalent explanatory power.} \\
& H_a: \text{The full model has superior explanatory power compared to the reduced model.} \\
& \text{Full Model :} W_{1t} = \beta_1 + \beta_2 P_{t-1} + \beta_3 K_{t-1} + \beta_4 W_2 + \beta_5 G + \beta_6 TX + \beta_7 TIME + \beta_8 E_{t-1} + \nu_{it} \\
& \text{Reduced Model :} W_{1t} = \alpha_1 + \alpha_2 W_{2t} + \alpha_3 P_{t-1} + v_{it} \\
& \text{F} = \frac{\frac{\text{SSE}_R - \text{SSE}_F}{m}}{\frac{\text{SSE}_F}{n - k}} \overset{H_0}{\sim} F(m, n - k) \\
& \text{The F value would be :}\frac{\frac{78.98 - 40.0072}{5}}{\frac{40.0072}{13}} \approx 2.533 .\\
& \text{Given } \alpha \text{ is set to be 0.05, the critical value is } F(5, 13) \approx 3.025 \text{.} \\
& \text{The F value is lower than the critical value, hence we don't have sufficient evidence to say that } \\
& \text{those five variables have explanatory power for wages of wokers in the private sector, } W_{1t} \text{.} \\
\end{aligned}
$$
```{r}
df_full <- df.residual(reg_29_b) #13

reg_29_b_reduced <- lm(w1~w2+plag, data = data_29)
sum_reg_29_b_reduced <- tidy(reg_29_b_reduced )
kable(sum_reg_29_b_reduced)
resid_reduced_model <- resid(reg_29_b_reduced)
sse_29_b_reduced <- sum(resid_reduced_model^2)

f_statistic <- ((sse_29_b_reduced-sse_29_b)/5)/(sse_29_b/13)
f_statistic
Critical_value_F <- qf(0.95, 5, 13)
Critical_value_F
v_1 <- resid(reg_29_b) #save residuals
```
## c
$$
\begin{aligned}
& \text{Question:} \\
& \text{Estimate the reduced-form equation for profits, } P_t \text{, using all eight exogenous and predetermined } \\
& \text{variables as explanatory variables. Test the joint significance of all the variables except wages of } \\
& \text{workers in the public sector, } W_{2t} \text{ , and lagged profits, } P_{t-1} \text{. Save the residuals, } \hat{\nu}_{2t} \text{.} \\
& \text{Answer:} \\
& \text{The reduced form equation would be:}\\
& \ P_{t} = \beta_1 + \beta_2 P_{t-1} + \beta_3 K_{t-1} + \beta_4 W_2 + \beta_5 G + \beta_6 TX + \beta_7 TIME + \beta_8 E_{t-1} + \nu_{it}.
\end{aligned}
$$
```{r}
reg_29_c <- lm(p~plag+klag+w2+g+tx+time+elag, data = data_29)
sum_reg_29_c <- tidy(reg_29_c)
kable(sum_reg_29_c)

```
$$
\begin{aligned}
& \text{In order to test the joint significance of all the variables except wages of workers in the public }\\
& \text{sector, }W_{2t} \text{, and lagged profits, }P_{t-1}\text{, we implement partial F-test.} \\
& H_0: \text{The full model and the reduced model possess equivalent explanatory power.} \\
& H_a: \text{The full model has superior explanatory power compared to the reduced model.} \\
& \text{Full Model :} W_{1t} = \beta_1 + \beta_2 P_{t-1} + \beta_3 K_{t-1} + \beta_4 W_2 + \beta_5 G + \beta_6 TX + \beta_7 TIME + \beta_8 E_{t-1} + \nu_{it} \\
& \text{Reduced Model :} W_{1t} = \alpha_1 + \alpha_2 W_{2t} + \alpha_3 P_{t-1} + v_{it} \\
& F = \frac{\frac{\text{SSE}_R - \text{SSE}_F}{m}}{\frac{\text{SSE}_F}{n - k}} \overset{H_0}{\sim} F(m, n - k) \\
& \text{The F value would be :}\frac{\frac{141.75 - 61.95}{5}}{\frac{61.95}{13}} \approx 3.35 .\\
& \text{Given } \alpha \text{ is set to be 0.05, the critical value is } F(5, 13) \approx 3.025 \text{.} \\
& \text{The F value is higher than the critical value, hence we have sufficient evidence to say that } \\
& \text{those five variables have explanatory power for profits, } P_{t} \text{.} \\
\end{aligned}
$$
```{r}
resid_full_model <- resid(reg_29_c)
sse_29_c <- sum(resid_full_model^2) #61.9501
df_full <- df.residual(reg_29_c) #13

reg_29_c_reduced <- lm(p~w2+plag, data = data_29)
sum_reg_29_c_reduced <- tidy(reg_29_c_reduced )
kable(sum_reg_29_c_reduced)
resid_reduced_model <- resid(reg_29_c_reduced)
sse_29_c_reduced <- sum(resid_reduced_model^2) #141.7514

f_statistic <- ((sse_29_c_reduced-sse_29_c)/5)/(sse_29_c/13)
f_statistic #3.3492 approx 3.35
Critical_value_F <- qf(0.95, 5, 13)
v_2 <- resid(reg_29_c) #save residuals
```
