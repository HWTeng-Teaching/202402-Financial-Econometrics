#a
# 计算 df_M
df_M <- 577 - 3 - 1
df_M

# 计算 hat(sigma_M^2)
hat_sigma_M_squared <- 97161.9174 / df_M
hat_sigma_M_squared

# 计算 F
F <- hat_sigma_M_squared / (12.024^2)
F

# 计算 df_F
df_F <- 1000 - 577 - 3 - 1
df_F

# 设定置信水平
alpha <- 0.05

# 计算 F 分布的临界值
critical_value <- qf(1 - alpha, df_M, df_F, lower.tail = FALSE)

critical_value

#b
# 设置置信水平
alpha <- 0.05

# 计算 MSE_SINGLE 和 MSE_MARRIED
MSE_SINGLE <- 56231.0382
df_SINGLE <- 400 - 4 - 1
MSE_MARRIED <- 100703.0471
df_MARRIED <- 1000 - 400 - 4 - 1

# 计算 F 统计量
F_statistic <- MSE_SINGLE / MSE_MARRIED

# 计算 F 分布的临界值
critical_value <- qf(1 - alpha, df_SINGLE, df_MARRIED, lower.tail = FALSE)

F_statistic
critical_value
