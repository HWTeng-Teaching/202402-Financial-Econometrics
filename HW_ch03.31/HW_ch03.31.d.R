data_tuna <- read.csv('C:/Users/zxc00/Desktop/tuna.csv')
library(ggplot2)
library(dplyr)
data_tuna_a <- data_tuna%>%mutate(week = 1:52)
data_tuna_b <- data_tuna_a%>%mutate(price1 = 100*apr1)
reg_c <- lm(sal1 ~ price1, data = data_tuna_b)
summary(reg_c)
sreg_c <- summary(reg_c)
yi_hat <- coef(reg_c)[[1]]+coef(reg_c)[[2]]*70
yi_hat
alpha_d <- 0.1
tc_d <- qt(1 - alpha_d/2, 50)
sse_d <- sum(resid(reg_c)^2)
#mean of price1 = 78.25
#summary(data_tuna_b$price1)
mse_d <- sse_d/50
sxx_d <- sum((data_tuna_b$price1-78.25)^2)
se_yi_hat_d <- sqrt(mse_d*(1/52+(70-78.25)^2/sxx_d))
upper_bound <- yi_hat + tc_d*se_yi_hat_d 
lower_bound <- yi_hat - tc_d*se_yi_hat_d 
upper_bound
lower_bound

