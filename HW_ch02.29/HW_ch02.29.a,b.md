## This homework is written by 鄭今惠 (312707012)

Question:\
How much does education affect wage rates? The data file cps5_small contains 1200 observations on hourly wage rates, education, and other variables from the 2013 Current Population Survey (CPS). [Note: cps5 is a larger version with more observations and variables.]

## 2.29 (a)

Question:\
Create the variable LWAGE = ln(WAGE). Construct a histogram and calculate detailed summary statistics. Does the histogram appear bell shaped and normally distributed? A normal distribution is symmetrical with no skewness, skewness = 0. The tails of the normal distribution have a certain “thickness.” A measure of the tail thickness is kurtosis, discussed in Appendix C.4.2. For a normal distribution, the kurtosis = 3, discussed in Appendix C.7.4. How close are the measures of skewness and kurtosis for LWAGE to 0 and 3, respectively?

<p align="center">
  <img src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786795/d53287ce-09c8-465e-add9-cc1ebfc0aa8b" alt="HW_ch02  style="width: 100%;">
</p>


ans:
| $variable$ |  $N$   |  $mean$  | $median$ |  $min$   |  $max$   | $skewness$ | $kurtosis$ |
|:----------:|:------:|:--------:|:--------:|:--------:|:--------:|:----------:|:----------:|
| $ln(WAGE)$ | $1200$ | $2.9994$ | $2.9601$ | $1.3712$ | $5.3986$ |  $0.2306$  |  $2.6846$  |






The histogram of ln(WAGE) indicates that its distribution is nearly symmetrical. This is unlike skewed distributions where the mean and median differ significantly. The skewness coefficient is slightly different from zero, and the kurtosis is slightly different from three. Therefore, the feature seems to be a normal distribution.

**code**

```         
install.packages("moments")
library(moments)
LN_WAGE <- log(cps5_small$wage)

quartz()
hist(LN_WAGE, breaks = 100, col = "#87a034")
summary((LN_WAGE))

print(paste("Skewness:", skewness(LN_WAGE)))
print(paste("Kurtosis:", kurtosis(LN_WAGE)))
```

## 2.29 (b)

Question:\
(b)Obtain the OLS estimates from the log-linear regression model ln(WAGE) = β1 + β2EDUC + e and interpret the estimated value of β .

<p align="center">
  <img src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786795/bacae199-918e-4f6e-837c-750cde769fe7")>
</p>

ans:
$\hat{ln(WAGE)} = 1.5968 + 0.0987EDUC$

We can estimate that for each additional year of education, the wage will be 9.87% higher, assuming all other factors remain constant.

**code**

```         
EDUC <- cps5_small$educ
LN_WAGE <- log(cps5_small$wage)

quartz()
plot(EDUC, LN_WAGE, type = "n", main = "Regression Line", xlab = "EDUC", ylab = "LN_WAGE")
abline(lm(LN_WAGE ~ EDUC), col = "blue", lwd = 3)

print(coef(lm(LN_WAGE ~ EDUC))[1]) # Intercept
print(coef(lm(LN_WAGE ~ EDUC))[2]) # Slope
```
