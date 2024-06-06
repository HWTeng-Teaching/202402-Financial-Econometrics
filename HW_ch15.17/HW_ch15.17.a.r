rm(list = ls())
install.packages("dplyr")

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
