### This homework is written by 莊巧筠 (312707030)
### 11.19
(a)

Q: Calculate the summary statistics for the variables: wife’s age, the number of less than 6-year-old
children, and the income from other sources than from the wife’s employment, NWIFEINC,
for the women who worked (LFP = 1) and those who did not (LFP = 0). Define $NWIFEINC =
FAMINC – WAGE × HOURS$. Comment on any differences you observe.

A:

Summary statistics for women who worked (LFP = 1)

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161672454/76cb7009-7d0b-46fb-9ee1-046a8fac7623)

Summary statistics for women who did not work (LFP = 0)

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161672454/d02535ba-c692-446b-b504-7f4b8616bc66)


Women not in the labor force are on average slightly older, and a higher income from their partners.

```{r}
library(devtools)
install_github("ccolonescu/POE5Rdata")
library(POE5Rdata)
data("mroz")
data("mroz.def")
library(magrittr)
library(readr) 
library(dplyr)

lfp <- mroz$lfp
age <- mroz$age
Children_Less_than_6 <- mroz$kidsl6

worked <- mroz[lfp == 1, ]
not_worked <- mroz[lfp == 0, ]

worked$NWIFEINC <- worked$faminc - worked$wage * worked$hours
not_worked$NWIFEINC <- not_worked$faminc  

summary_worked <- summary(worked, wife_age = age,children_less_than_6 = kidsl6,nwifeinc = nwifeinc)

summary_not_worked <- summary(not_worked,wife_age=age,children_less_than_6 = kidsl6,nwifeinc = nwifeinc)

cat("Summary statistics for women who worked (LFP = 1):\n")
print(summary_worked)
cat("\nSummary statistics for women who did not work (LFP = 0):\n")
print(summary_not_worked)
```

(b)

Q:Consider the following supply equation specification:

$$
HOURS = \beta_1 +  \beta_2 ln(WAGE) + \beta_3EDUC +  \beta_4AGE +  \beta_5KIDSL6 + \beta_6KIDS618 + \beta_7NWIFEINC + e
$$

What signs do you expect each of the coefficients to have, and why? What does NWIFEINC
measure?

A:


$\beta_2$ > 0: A higher wage leads to an increased quantity of labor supplied. 

$\beta_3$ : The effect of an increase in education is unclear.

$\beta_4$ : This sample has been taken for working women between the ages of 30 to 60. It is not certain . 

$\beta_ 5$ <0, $\beta_6$ < 0: The presence of children in the household reduces the number of hours worked because they demand time from their mother. 

$\beta_7$ < 0: As income from other sources increases, it becomes less necessary for the woman to work. 


NWIFEINC measures the sum of all family income excluding the wife's income.

