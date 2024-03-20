library(readr)
library(dplyr)
library(ggplot2)

tuna <- read.csv("/Users/chenpinyu/Downloads/tuna.csv")

# Calculate summary statistics for SAL1
summary_sal1 <- summary(tuna$sal1)
mean_sal1 <- mean(tuna$sal1)
min_sal1 <- min(tuna$sal1)
max_sal1 <- max(tuna$sal1)
std_dev_sal1 <- sd(tuna$sal1)

# Calculate summary statistics for APR1
summary_apr1 <- summary(tuna$apr1)
mean_apr1 <- mean(tuna$apr1)
min_apr1 <- min(tuna$apr1)
max_apr1 <- max(tuna$apr1)
std_dev_apr1 <- sd(tuna$apr1)

summary_df <- data.frame(
  Variable = c("SAL1", "APR1"),
  Sample_Mean = c(mean_sal1, mean_apr1),
  Minimum_Value = c(min_sal1, min_apr1),
  Maximum_Value = c(max_sal1, max_apr1),
  Standard_Deviation = c(std_dev_sal1, std_dev_apr1)
)

print(summary_df)


tuna$index <- 1:nrow(tuna)

# Plot Sales vs. Week
ggplot(tuna, aes(x = index, y = sal1)) +
  geom_line() +
  labs(title = "Sales vs. Week", x = "Week", y = "Sales")

# Plot Price vs. Week
ggplot(tuna, aes(x = index, y = apr1)) +
  geom_line() +
  labs(title = "Price vs. Week", x = "Week", y = "Price")

# Calculate variance for SAL1 and APR1
var_sales <- var(tuna$sal1)
var_price <- var(tuna$apr1)

var_df <- data.frame(
  Variable = c("SAL1", "APR1"),
  Variance = c(var_sales, var_price)
)

print(var_df)
