#c
intercept <- 6.855
slope <- 3.880
b_1 <- 7.383
b_2 <- 0.112
covariance <- -0.746

#calculate point estimator
insurance_hat  = intercept + slope*100
print(insurance_hat)

#calculate SE
variance <- b_1^2 + 100^2 * b_2^2 + 2 * 100 * covariance
standard_error <- sqrt(variance)
print(standard_error)

#calculate t value
p <- 0.99
df <- 18
tail_prob <- (1 - p) / 2
left_t_value <- qt(tail_prob, df, lower.tail = TRUE)
right_t_value <- qt(tail_prob, df, lower.tail = FALSE)
print(left_t_value)
print(right_t_value)

#calculate C.I.
upper_bound <-insurance_hat+2.878*standard_error
lower_bound <-insurance_hat-2.878*standard_error
print(upper_bound)
print(lower_bound)
