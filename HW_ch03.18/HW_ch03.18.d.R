# Define the parameters
beta_hat_2 <- 3.880  # The estimated slope from regression
beta_0 <- 5          # The value under the null hypothesis
std_error_beta2 <- 0.112  # REPLACE THIS with the actual standard error of beta_hat_2

# Calculate the t-statistic
t_statistic <- (beta_hat_2 - beta_0) / std_error_beta2

# Calculate the degrees of freedom
n <- 20       # Number of observations
df <- n - 2   # Degrees of freedom for regression

# Calculate the critical value for two-tailed test at 5% level of significance
alpha <- 0.05
critical_value <- qt(1 - alpha/2, df)

# Determine whether to reject the null hypothesis
reject_null <- (abs(t_statistic) > critical_value)

# Print results
cat("T-statistic: ", t_statistic, "\n")
cat("Critical value at 5% significance level: ", critical_value, "\n")
cat("Reject the null hypothesis? ", reject_null, "\n")