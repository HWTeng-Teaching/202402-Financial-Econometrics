# 4.3 c.
y_hat <- 4.4
t_c <- qt(1-0.05/2, 5-2)
se_f <- sqrt(2.52)
cat('95% P.I. for y given x=4 is [', round(y_hat-t_c*se_f,4),',', round(y_hat+t_c*se_f,4), ']', '\n')
