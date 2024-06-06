# This homework is written by 梁宏宇 (312707050)

## ch15.17(c)
### Question: Test for the presence of random effects using the LM statistic in equation(15.35). Use the 5% level of significance.

## Answer: 
```{r setup, include=FALSE}
install.packages("devtools")
library(devtools)
install_github("ccolonescu/POE5Rdata")
library(POE5Rdata)
install.packages("plm")
install.packages("lmtest")

library(plm)
library(lmtest)

data("liquor5", package = "POE5Rdata")

liquor_panel <- pdata.frame(liquor5, index = c("hh", "year"))   # hh are households 

# 構建固定效應模型
fixed_model <- plm(liquor ~ income, data = liquor_panel, model = "within")

# 構建隨機效應模型
random_model <- plm(liquor ~ income, data = liquor_panel, model = "random")

# 使用Breusch-Pagan LM檢驗來測試隨機效應， bp is Breusch-Pagan 檢驗
lm_test <- plmtest(fixed_model, effect = "individual", type = "bp")  

print(lm_test)
```

### chisq = 20.68, df = 1, p-value = 5.429e-06 < 5% 
### At the 5% significance level, reject null hypothesis, and there is a significant random effect.
