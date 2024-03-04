#Initialize the necessary variables
x = c(3,2,1,-1,0)
y = c(4,2,3,1,0)

mean_x = mean(x)
mean_y = mean(y)

sum_of_square = sum((x-mean_x)^2)
covariance_xy = sum((x-mean_x)*(y-mean_y))

N = length(x)

b2 = covariance_xy / sum_of_square
b1 = mean_y - b2*mean_x

#2.1 c
x_square = x^2
sum_of_x_square = sum(x_square)
x_mul_y = x*y
sum_x_mul_y = sum(x_mul_y)
sum_of_square == (sum_of_x_square - (N*mean_x^2))
covariance_xy == (sum_x_mul_y - (N*mean_x*mean_y))

#2.1 d
y_hat = b1+b2*x
sum_y_hat = sum(y_hat)
random_error = y - y_hat
sum_random_error = sum(random_error)
random_error_square = random_error^2
sum_random_error_square = sum(random_error_square)
x_mul_random_error = x*random_error
sum_x_mul_random_error = sum(x_mul_random_error)

sample_variance_y = sum((y-mean_y)^2)/(N-1)
sample_variance_x = sum((x-mean_x)^2)/(N-1)

covariance_x_y = sum((y-mean_y) * (x-mean_x))/(N-1)

correlation_x_y = covariance_x_y/(sqrt(sample_variance_x) * sqrt(sample_variance_y))
#The result is same as covariance_x_y/sample_variance_x
coefficient_variation_x = 100*(sqrt(sample_variance_x)/mean_x)
quantile(x, probs = c(.25, .5, .75))
#you also can use median() to find
median(x)
