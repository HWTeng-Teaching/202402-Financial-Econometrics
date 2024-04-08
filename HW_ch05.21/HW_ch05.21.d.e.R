#d
#parameters setting
b3 <- model$coefficients[[3]]
b4 <- model$coefficients[[4]]
b5 <- model$coefficients[[5]]
var_b3 <- vcov(model)[3, 3]
var_b4 <- vcov(model)[4, 4]
var_b5 <- vcov(model)[5, 5]
cov_b3_b4 <- vcov(model)[3, 4]
cov_b3_b5 <- vcov(model)[3, 5]
cov_b4_b5 <- vcov(model)[4, 5]
alpha <- 0.05
N = length(rain)
t_stat <- qt(1-alpha/2, df = N-5)
#d_1
rain_d = 2.98
trend_d = 0.9
d_ans_1 = b3 + 2*b4*rain_d+b5*trend_d
cat("Marginal Effect: ", d_ans_1, "\n")
c3 <- 1
c4 <- 2 * rain_d
c5 <- 1 * trend_d
se = sqrt(c3^2 * var_b3 + c4^2 * var_b4  +c5^2 * var_b5 + 2*c3*c4*cov_b3_b4 + 2*c3*c5*cov_b3_b5 + 2*c4*c5*cov_b4_b5)

upper = d_ans + t_stat * se
lower = d_ans - t_stat * se
cat("95% Confidence Interval: [", lower, ", ", upper, "]\n")
#d_2
rain_d_2 = 4.797
trend_d_2 = 4.5
d_ans_2 = b3 + 2*b4*rain_d_2+b5*trend_d_2
cat("Marginal Effect: ", d_ans_2, "\n")
c3 <- 1
c4 <- 2 * rain_d_2
c5 <- 1 * trend_d_2
se = sqrt(c3^2 * var_b3 + c4^2 * var_b4  +c5^2 * var_b5 + 2*c3*c4*cov_b3_b4 + 2*c3*c5*cov_b3_b5 + 2*c4*c5*cov_b4_b5)
upper = d_ans_2 + t_stat * se
lower = d_ans_2 - t_stat * se
cat("95% Confidence Interval: [", lower, ", ", upper, "]\n")

#e
#parameters setting
N <- length(toody5$trend)
alpha <- 0.05
b3 <- model$coefficients[[3]]
b4 <- model$coefficients[[4]]
b5 <- model$coefficients[[5]]
var_b3 <- vcov(model)[3, 3]
var_b4 <- vcov(model)[4, 4]
var_b5 <- vcov(model)[5, 5]
cov_b3_b4 <- vcov(model)[3, 4]
cov_b3_b5 <- vcov(model)[3, 5]
cov_b4_b5 <- vcov(model)[4, 5]
t_stat <- qt(1-alpha/2, df = N-5)
#e_1
trend_e_1 = 0.9
#The amount of rainfall that would maximize expected yield 
rain_e_1 = (b3 + b5 * trend_e_1) / (-2*b4)
cat("The amount of rainfall that would maximize expected yield: ", rain_e_1, "\n")
#Using the delta method to calculate the variance
c3 <- (-2*b4)^(-1)
c4 <- (b3+b5*trend_e_1)/(2*b4^2)
c5 <- trend_e_1 * (-2*b4)^(-1)
se = sqrt(c3^2 * var_b3 + c4^2 * var_b4  + c5^2 * var_b5 + 2*c3*c4*cov_b3_b4 + 2*c3*c5*cov_b3_b5 + 2*c4*c5*cov_b4_b5)
upper = rain_e_1 + t_stat * se
lower = rain_e_1 - t_stat * se
cat("95% Confidence Interval: [", lower, ", ", upper, "]\n")
#e_2
trend_e_1 = 4.5
#The amount of rainfall that would maximize expected yield 
rain_e_1 = (b3 + b5 * trend_e_1) / (-2*b4)
cat("The amount of rainfall that would maximize expected yield: ", rain_e_1, "\n")
#Using the delta method to calculate the variance
c3 <- (-2*b4)^(-1)
c4 <- (b3+b5*trend_e_1)/(2*b4^2)
c5 <- trend_e_1 * (-2*b4)^(-1)
se = sqrt(c3^2 * var_b3 + c4^2 * var_b4  + c5^2 * var_b5 + 2*c3*c4*cov_b3_b4 + 2*c3*c5*cov_b3_b5 + 2*c4*c5*cov_b4_b5)
upper = rain_e_1 + t_stat * se
lower = rain_e_1 - t_stat * se
cat("95% Confidence Interval: [", lower, ", ", upper, "]\n")