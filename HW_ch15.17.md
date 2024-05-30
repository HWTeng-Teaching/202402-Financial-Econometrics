# HW_15.17.a

## This homework is written by 吳日為 (312707044)

## ch015.17(a)

### **Question:**

The data file liquor contains observations on annual expenditure on liquor (LIQUOR) and annual
income (INCOME) (both in thousands of dollars) for 40 randomly selected households for three consecutive years

a. Create the first-differenced observations on LIQUOR and INCOME. Call these new variables
LIQUORD and INCOMED. Using OLS regress LIQUORD on INCOMED without a constant
term. Construct a 95% interval estimate of the coefficient.

### **answer:**

The estimated regression with differenced data is <br>
$LIQUOR$ = 0.2975 $INCOMED$
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162611288/7ff70ff7-a3b8-4a1e-b669-87a4a388e813)


The 95% interval estimate of the coefficient of INCOMED is [-0.0284146, 0.0879082]. The
interval covers zero; we have no evidence against the hypothesis that income does not affect
liquor expenditures. 
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162611288/29ef8c54-b9bd-427f-bc02-12ac8cef6eab)





```{r setup, include=FALSE}
library(dplyr)
library(POE5Rdata)

liquor_data <- data(liquor5)


liquor_diff <- liquor5 %>%
  arrange(hh, year) %>%
  group_by(hh) %>%
  mutate(
    LIQUORD = liquor - lag(liquor),
    INCOMED = income - lag(income)
  ) %>%
  filter(!is.na(LIQUORD) & !is.na(INCOMED)) 


model <- lm(LIQUORD ~ INCOMED - 1, data = liquor_diff)

summary(model)

coef_est <- coef(summary(model))["INCOMED", "Estimate"]
std_err <- coef(summary(model))["INCOMED", "Std. Error"]

alpha <- 0.05
t_critical <- qt(1 - alpha/2, df = nrow(liquor_diff) - 1)
lower_bound <- coef_est - t_critical * std_err
upper_bound <- coef_est + t_critical * std_err

cat("95%信賴區間：(", lower_bound, ",", upper_bound, ")\n")
knitr::opts_chunk$set(echo = TRUE)
```
