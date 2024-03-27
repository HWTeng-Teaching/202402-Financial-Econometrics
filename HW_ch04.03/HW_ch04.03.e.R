# 4.3 e.
x_i <- c(3,2,1,-1,0)
x_bar <- mean(x_i)
y_hat <- 1.2+0.8*x_bar
t_c <- qt(1-0.05/2, 5-2)
var_hat <- 1.2
var_f_hat <- var_hat*(1+1/5+0)
se_f <- var_f_hat^0.5
cat('95% P.I. for y given x=mean(x) is [', round(y_hat-t_c*se_f,4),',', round(y_hat+t_c*se_f,4), ']', '\n')
