##
This homework is written by 陳品妤 (312707032)

# ch03.31(a)
Data on weekly sales of a major brand of canned tuna by a supermarket chain in a large midwest- ern U.S. city during a mid-1990s calendar year are contained in the data file tuna. There are 52 observations for each of the variables. The variable SAL1 = unit sales of brand no. 1 canned tuna, and APR1 = price per can of brand no. 1 tuna (in dollars).

**Question** \
Calculate the summary statistics for SAL1 and APR1. What are the sample means, minimum and maximum values, and their standard deviations. Plot each of these variables versus WEEK. How much variation in sales and price is there from week to week?

**Answer**
1. - The summary statistics for SAL1 and APR1
      | Variable | Sample_Mean | Minimum_Value | Maximum_Value | Standard_Deviation |
      |:--------:|:-----------:|:-------------:|:-------------:|:-----------------:|
      |   SAL1   |   6718.71   |    1762.00    |    32820.00   |      6915.08      |
      |   APR1   |     0.78    |      0.61     |      0.92     |        0.10       |

   - Sample code
      ```r
      # Calculate summary statistics for SAL1
      summary_sal1 <- summary(tuna$sal1)
      mean_sal1 <- round(mean(tuna$sal1), 2)
      min_sal1 <- round(min(tuna$sal1), 2)
      max_sal1 <- round(max(tuna$sal1), 2)
      std_dev_sal1 <- round(sd(tuna$sal1), 2)
      
      # Calculate summary statistics for APR1
      summary_apr1 <- summary(tuna$apr1)
      mean_apr1 <- round(mean(tuna$apr1), 2)
      min_apr1 <- round(min(tuna$apr1), 2)
      max_apr1 <- round(max(tuna$apr1), 2)
      std_dev_apr1 <- round(sd(tuna$apr1), 2)
      
      summary_df <- data.frame(
        Variable = c("SAL1", "APR1"),
        Sample_Mean = c(mean_sal1, mean_apr1),
        Minimum_Value = c(min_sal1, min_apr1),
        Maximum_Value = c(max_sal1, max_apr1),
        Standard_Deviation = c(std_dev_sal1, std_dev_apr1)
      )
  
     print(summary_df)
2. - Data Visualization: SAL1 and APR1
<p align="center">
  <img src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162009543/8c2da84f-4a42-454b-8f8f-30ec1e2f718f" alt="image" width="600">
</p>

<p align="center">
  <img src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162009543/611e8a63-b4ea-4bd4-9794-dd77a6c74d9c" alt="image" width="600">
</p>


   - Sample code
        ```r
        tuna$index <- 1:nrow(tuna)
        
        # Plot Sales vs. Week
        ggplot(tuna, aes(x = index, y = sal1)) + geom_line() +
          labs(title = "Sales vs. Week", x = "Week", y = "Sales")
        
        # Plot Price vs. Week
        ggplot(tuna, aes(x = index, y = apr1)) + geom_line() +
          labs(title = "Price vs. Week", x = "Week", y = "Price")
3.  - Variation in Sales and Prices
      ![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162009543/95b27e46-1a87-4cff-971b-936f174714ac)
      ![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162009543/c3337e70-cb1e-4803-a38f-ba0044b16b29)
      By incorporating the changes based on bandwidth, setting the time window to 5 and calculating the Bollinger Bands reveals that the variation in sales and prices changes over time from week to week. Additionally, sales exhibit relatively higher volatility.


[Teng: Please correct the conclusion about variation. ]
