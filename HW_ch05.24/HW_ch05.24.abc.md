## This homework is written by 游政諺 (311707012)
## ch05.24 (a)、(b)、(c)
## ch05.24 (a)
Q: Report the results. Are the estimated coefficients significantly different from zero?

The estimated model is

$PRICE = \beta_1 + \beta_2 SQFT + \beta_3 (SQFT * AGE)+e$

```
price <- collegetown$price
sqft <- collegetown$sqft
age <- price*sqft

linear_model <- lm(price~sqft+age)
sum_linear <- summary(linear_model)
sum_linear

```
![image](https://github.com/adni7413/ch05.24.a.1/raw/main/%E4%BD%9C%E6%A5%AD51.png)


H0: estimated coefficients equal zero

H1: estimated coefficients different from zero

At 90% and 95% confidence levels, the p-values ​​for hypothesis test of  $\beta_3$ and $\beta_1$ are both less than 0.1 and 0.05, rejecting the null hypothesis H0. 

However, the p-value of $\beta_2$ is greater than 0.1 and 0.05, so the null hypothesis H0 is not rejected. Assume that it is not significantly different from 0




## ch05.24 (b)
Q: Write down expressions for the marginal effects ∂E(PRICE|X)/∂SQFT and
∂E(PRICE|X)/∂AGE. Interpret each of the coefficients. Given the categorical nature of the
variable AGE, what assumptions are being made?

$PRICE = \beta_1 + \beta_2 SQFT + \beta_3 (SQFT * AGE)+e$

expressions for the marginal effects:

$\frac{\delta E(PRICE|X)}{\delta SQFT} = b_2 + b_3 *AGE$ 

$\frac{\delta E(PRICE|X)}{\delta AGE} = b_3 *SQFT$ 

AGE variable categories:

New		1

1-3 Years 	2

4-5 Years	3

6-10 Years	4

11-15 Years	5

16-20 Years	6

21-30 Years	7

31-40 Years	8

41-50 Years	9

51-75 Years	10

76+ Years	11

Since AGE is a categorical variable, if the increase in house age does not increase the AGE variable ( for example: when the house age increases from 12 to 14, AGE is still 5 ), the marginal effect remains unchanged.

## ch05.24 (c)
Q: Find point and 95% interval estimates for the marginal effect ∂E(PRICE|X)/∂SQFT for houses that
are (i) 5 years old, (ii) 20 years old, and (iii) 40 years old. How do these estimates change as
AGE increases? (Refer to the file collegetown.def for the definition of AGE.)

$\frac{\delta E(PRICE|X)}{\delta SQFT} = b_2 + b_3 *AGE$ 

$\frac{\delta m}{\delta SQFT} = m$

$\frac{\delta m}{\delta b_2} = 1$

$\frac{\delta m}{\delta b_3} = AGE$

$se(f) = \sqrt{\sum c_i^2var(b_i) + \sum_{i \ne j} 2c_ic_jcov(b_i, b_j)}$\
```
b2 <- linear_model$coefficients[[2]]
b3 <- linear_model$coefficients[[3]]

var_b2 <- vcov(linear_model)[2, 2]
var_b3 <- vcov(linear_model)[3, 3]

cov_b2_b3 <- vcov(linear_model)[2, 3]


alpha <- 0.05
N = length(sqft)
t_stat <- qt(1-alpha/2, df = N-3)

marginalEffect <- function(age){
  ME = b2 + b3*age
  cat("Marginal Effect: ", ME, "\n")
  c2 <- 1
  c3 <- age 
  se = sqrt(c2^2 * var_b2 + c3^2 * var_b3  + 2*c2*c3*cov_b2_b3 )
  upper = ME + t_stat * se
  lower = ME - t_stat * se
  cat("The 95% Confidence Interval: [", lower, ", ", upper, "]\n")
}


```

AGE variable categories:

New		1

1-3 Years 	2

4-5 Years	3

6-10 Years	4

11-15 Years	5

16-20 Years	6

21-30 Years	7

31-40 Years	8

41-50 Years	9

51-75 Years	10

76+ Years	11

(i) 5 years old

```
age_1 = 3
marginalEffect(age_1)


```
Marginal Effect:  0.1260778 

The 95% Confidence Interval: [ -0.74701 ,  0.9991656 ]


(ii) 20 years old

```
age_2 = 6
marginalEffect(age_2)

```
Marginal Effect:  0.1674482 

The 95% Confidence Interval: [ -0.7037089 ,  1.038605 ]

(iii) 40 years old

```
age_3 = 8
marginalEffect(age_3)
```
Marginal Effect:  0.1950286 

The 95% Confidence Interval: [ -0.6748425 ,  1.0649 ]

The ages of the houses are 5 years, 20 years, and 40 years respectively, and the corresponding category variable AGE values ​​are 3, 6, and 8 respectively. Because the age gap of houses over the classification range, the increase in AGE value also strengthen the marginal effect.
