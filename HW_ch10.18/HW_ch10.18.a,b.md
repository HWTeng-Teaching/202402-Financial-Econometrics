
## This homework is written by 鄭今惠(312707012)

Question:\
Consider the data file $mroz$ on working wives. Use the 428 observations on married women who participate in the labor force. In this exercise, we examine the effectiveness of a parent’s college education as an instrumental variable.

## 10.18 (a)

Question:\
a. Create two new variables. $MOTHERCOLL$ is a dummy variable equaling one if $MOTHEREDUC$ \> 12, zero otherwise. Similarly, $FATHERCOLL$ equals one if $FATHEREDUC$ \> 12 and zero otherwise. What percentage of parents have some college education in this sample?

ans:\
The percentage of mothers with some college education is 12.1495327102804 %\
The percentage of fathers with some college education is 11.6822429906542 %

**code**

```{R }
data("mroz")

lfp <- mroz$lfp
mother_educ <- mroz$mothereduc
father_educ <- mroz$fathereduc


mothercoll <- ifelse(mother_educ > 12 & lfp == 1, 1, 0)
fathercoll <- ifelse(father_educ > 12 & lfp == 1, 1, 0)

numbers_mothercoll <- sum(mothercoll)
numbers_fathercoll <- sum(fathercoll)

percentage_mothercoll <- (numbers_mothercoll / 428) * 100
percentage_fathercoll <- (numbers_fathercoll / 428) * 100

print(paste("Percentage of mothers with some college education:", percentage_mothercoll, "%"))
print(paste("Percentage of fathers with some college education:", percentage_fathercoll, "%"))

```

## 10.18 (b)

Question:\
b. Find the correlations between $EDUC$, $MOTHERCOLL$, and $FATHERCOLL$. Are the magnitudes of these correlations important? Can you make a logical argument why $MOTHERCOLL$ and $FATHERCOLL$ might be better instruments than $MOTHEREDUC$ and $FATHEREDUC$?

ans:\
The correlation coefficient between $EDUC$ and $MOTHERCOLL$ is 0.3594705, while the correlation coefficient between $EDUC$ and $FATHERCOLL$ is 0.3984962. These correlation coefficients indicate a positive relationship between $EDUC$ and parents' college education, but it is not very strong, fall between Weak and Moderate.

| Correlation Range | Interpretation          |
|-------------------|-------------------------|
| 0.00 - 0.19       | Very Weak Correlation   |
| 0.20 - 0.39       | Weak Correlation        |
| 0.40 - 0.59       | Moderate Correlation    |
| 0.60 - 0.79       | Strong Correlation      |
| 0.80 - 1.00       | Very Strong Correlation |

According to the conditions for instrumental variables:\
1.The instrumental variable should not have a direct effect on the outcome variable (yi) and therefore should not be included as an explanatory variable in the model.\
2.It should not be correlated with the error term of the regression (i.e., it should be exogenous).\
3.It should be strongly correlated (or at least not weakly correlated) with the endogenous variable (xi).\
Given the context provided, $MOTHERCOLL$ and $FATHERCOLL$ are more likely to satisfy condition two. This is because they are binary variables indicating whether a parent has some college education, which are less susceptible to endogeneity concerns compared to continuous variables like $MOTHEREDUC$ and $FATHEREDUC$. These binary variables are less likely to be influenced by contemporaneous factors affecting the outcome variable.

**code**

```{R }
mothercoll <- mothercoll[1 : 428]
fathercoll <- fathercoll[1 : 428]
educ <- mroz$educ
educ <- educ[1 : 428]
correlation_matrix <- cor(cbind(educ,mothercoll, fathercoll))
print(correlation_matrix)
```
