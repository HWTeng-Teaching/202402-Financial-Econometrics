This homework is written by 孫知岱（311707054）

i.Compute sigma_hat_square

from previous steps we know:
y_hat = b1+b2*x
random_error = y - y_hat
Using formula 2.19:
sigma_hat_square = sum(random_error_square)/(N-2) = 1.2

g.Compute conditional variance and standard errors of b2

Using formula 2.21 & 2.24
conditional_variance_b2 = sigma_hat_square/sum((x-mean_x)^2) = 0.12
standard_errors_b2 = sqrt(conditional_variance_b2) = 0.346