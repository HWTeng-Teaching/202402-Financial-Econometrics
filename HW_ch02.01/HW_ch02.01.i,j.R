#i
sigma_hat_square = sum(random_error_square)/(N-2)

#j
conditional_variance_b2 = sigma_hat_square/sum((x-mean_x)^2)
standard_errors_b2 = sqrt(conditional_variance_b2)
