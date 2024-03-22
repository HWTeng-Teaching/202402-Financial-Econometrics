library(readr)
library(dplyr)
library(ggplot2)
library(plotly)
library(tidyr)
library(zoo)

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

calculate_bollinger_band <- function(data, column, window) {
  data <- data %>%
    mutate(
      !!paste0(column, "_sma_", window) := rollmean(get(column), k = window, fill = NA),
      !!paste0(column, "_upper_band_", window) := rollmean(get(column), k = window, fill = NA) + (rollapply(get(column), width = window, FUN = sd, align = "right", fill = NA, na.rm = TRUE) * 2),
      !!paste0(column, "_lower_band_", window) := rollmean(get(column), k = window, fill = NA) - (rollapply(get(column), width = window, FUN = sd, align = "right", fill = NA, na.rm = TRUE) * 2)
    ) %>%
    drop_na(!!paste0(column, "_upper_band_", window))  # Remove rows with NA in sma column
  data <- data %>%
    select(column, !!paste0(column, "_sma_", window), !!paste0(column, "_upper_band_", window), !!paste0(column, "_lower_band_", window))
  return(data)
}

sal1 <- calculate_bollinger_band(tuna, 'sal1', 5)
fig <- plot_ly()
fig <- fig %>% add_lines(x = ~seq_len(nrow(sal1)), y = ~sal1[['sal1']], name = 'sal1', type = 'scatter', mode = 'lines')
fig <- fig %>% add_lines(x = ~seq_len(nrow(sal1)), y = ~sal1[['sal1_upper_band_5']], name = 'sal1_upper_band_5', type = 'scatter', mode = 'lines')
fig <- fig %>% add_lines(x = ~seq_len(nrow(sal1)), y = ~sal1[['sal1_lower_band_5']], name = 'sal1_lower_band_5', type = 'scatter', mode = 'lines')
fig <- fig %>% layout(title = "Bollinger Bands", xaxis = list(title = "Week"), yaxis = list(title = "sal1"))
fig

apr1 <- calculate_bollinger_band(tuna, 'apr1', 5)
fig <- plot_ly()
fig <- fig %>% add_lines(x = ~seq_len(nrow(apr1)), y = ~apr1[['apr1']], name = 'apr1', type = 'scatter', mode = 'lines')
fig <- fig %>% add_lines(x = ~seq_len(nrow(apr1)), y = ~apr1[['apr1_upper_band_5']], name = 'apr1_upper_band_5', type = 'scatter', mode = 'lines')
fig <- fig %>% add_lines(x = ~seq_len(nrow(apr1)), y = ~apr1[['apr1_lower_band_5']], name = 'apr1_lower_band_5', type = 'scatter', mode = 'lines')
fig <- fig %>% layout(title = "Bollinger Bands", xaxis = list(title = "Week"), yaxis = list(title = "apr1"))
fig
