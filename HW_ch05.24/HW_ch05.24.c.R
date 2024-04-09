price <- collegetown$price
sqft <- collegetown$sqft
age <- price*sqft

linear_model <- lm(price~sqft+age)
sum_linear <- summary(linear_model)
sum_linear

b2 <- linear_model$coefficients[[2]]
b3 <- linear_model$coefficients[[3]]

var_b2 <- vcov(linear_model)[2, 2]
var_b3 <- vcov(linear_model)[3, 3]

cov_b2_b3 <- vcov(linear_model)[2, 3]


alpha <- 0.05
N = length(sqft)
t_stat <- qt(1-alpha/2, df = N-3)

d_MarginalEffect <- function(d_age){
  ME = b2 + 2*b3*d_age
  cat("Marginal Effect: ", ME, "\n")
  c2 <- 1
  c3 <- 2 
  se = sqrt(c2^2 * var_b2 + c3^2 * var_b3  + 2*c2*c3*cov_b2_b3 )
  upper = ME + t_stat * se
  lower = ME - t_stat * se
  cat("The 95% Confidence Interval: [", lower, ", ", upper, "]\n")
}

#d_1
d_age_1 = 3
d_MarginalEffect(d_age_1)

#d_2
d_age_2 = 6
d_MarginalEffect(d_age_2)

#d_3
d_age_3 = 8
d_MarginalEffect(d_age_3)
