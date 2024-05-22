data_29 <- read.csv("C:/Users/Lab_615/Desktop/klein.csv")
# a
reg_29_a <- lm(cn~total_wage+p+plag, data = data_29)
library(broom);library(knitr)
sum_reg_29_a <- tidy(reg_29_a)
kable(sum_reg_29_a)
df.residual(reg_29_a) #17 因為plag少了一個數
qt(1-0.05/2,17) #2.109816
# b
reg_29_b <- lm(w1~plag+klag+w2+g+tx+time+elag, data = data_29)
resid_full_model <- resid(reg_29_b)
sse_29_b <- sum(resid_full_model^2)
sum_reg_29_b <- tidy(reg_29_b)
kable(sum_reg_29_b)
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
#c
reg_29_c <- lm(p~plag+klag+w2+g+tx+time+elag, data = data_29)
sum_reg_29_c <- tidy(reg_29_c)
kable(sum_reg_29_c)

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






