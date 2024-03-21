# (f)
# 計算t統計量
t_statistic <- (elasticity - (-3)) / se_elasticity

# 計算p值
p_value <- 2 * pt((t_statistic), df = nrow(data) - 2)

# 計算10%水準下的臨界值
t_critical <- qt(0.95, df = nrow(data) - 2)

# 打印結果
print(paste("t-value =", t_statistic))
print(paste("t_critical=", t_critical))
print(paste("p-value =", p_value))