# HW_4.25.a

## This homework is written by 張禕紘 (312707043)

## ch04.25(a)

### **Question**

Estimate the log-linear model $ln(PRICE)= \beta_1 + \beta_2SQFT + e$. Interpret the estimated model parameters. Calculate the slope and elasticity at the sample means, if necessary.

### answer:

In this model, two parameters are estimated.

The explanation of the two variables is as follows.

![螢幕擷取畫面 2024-03-28 141602](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161785685/d871a6a3-bf78-4368-a77c-de249eba6c78)


$\beta_1$=4.39 ,  $\beta_2$=0.036   $\bar{PRICE}=\bar{y}$ = 250.24   $\bar{SQFT}=\bar{x}$ = 27.28 

When $SQFT$ = 0, the value of $ln(PRICE)$ is 4.40. This means that if $SQFT$ = 0, $ln(PRICE)$ has a basic value of 4.40.

When $SQFT$ increase by 1 unit, on average, $PRICE$ will increase by 0.036 percent.

At the sample mean, the slope is  $\frac{dy}{dx}$  = $\beta_2 \cdot \hat{y}= 9.02$  and the elasticity is 
$\frac{dy}{dx} \cdot \frac{\bar{x}}{\hat{y}} = \text{slope} \cdot \frac{\bar{x}}{\hat{y}}$  = 0.98.
[🍎 Teng: correct gramaticall errors. ]

## code

``` r
model1 <- lm(ln_price~sqft,data = D)
R1 <- summary(model1)
R12 <- R1$r.squared
x_p <- data.frame(sqft=c(x_mean))
predict_lny <- predict(model1,newdata=x_p)  #newdata
predict_y <- exp(predict_lny)
#slope
slope <- coef(model1)[2] * predict_y
#elasticity
elas <- slope*x_mean/predict_y
print(paste("at the sample means, slope =", slope, "elasticity =", elas))
