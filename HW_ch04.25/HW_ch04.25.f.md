This homework is written by 趙悅豪（312707051）
## ch04.25(f)
**Question:**
For each model in (a)-\(c), predict the value of a house with 2700 square feet.

**Ans:**
1. Construct the regression models and get the coefficients. The remaining two are similar.
```r
model1=lm(log(price)~sqft,data=collegetown)
#summary(model1)
b1=coef(model1)[[1]]
b2=coef(model1)[[2]]
```
2. For each model we use following formula to estimate the value of y.
- log-linear:
$\hat{y}=e^{\beta_1+\beta_2x}$
- log-log:
$\hat{y}=e^{\alpha_1+\alpha_2ln(x)}$
- linear:
$\hat{y}=\delta_1+\delta_2x$


3. Notice that per **SQFT** stands for 100 sequre feet of house in the data, so we need substitute sqft=2700/100=27. Also per **PRICE** stands for $1000 in the data, so the final answer should x1000.
```r
sqft_f=2700/100
y1=exp(b1_a+b2_a*sqft_f)
print(y1*1000)
```

4. At last we can get:

| model | log-linear | log-log | linear |
| --- | --- | --- | --- |
| predict-value | 214,233.6 | 227,538.6 | 246,455.7 |

**Code:**
```r
library(POE5Rdata)
data("collegetown")

sqft_f=2700/100

model1=lm(log(price)~sqft,data=collegetown)
#summary(model1)
b1=coef(model1)[[1]]
b2=coef(model1)[[2]]
y1=exp(b1+b2*sqft_f)
print(y1*1000)

model2=lm(log(price)~log(sqft),data=collegetown)
#summary(model2)
a1=coef(model2)[[1]]
a2=coef(model2)[[2]]
y2=exp(a1+a2*log(sqft_f))
print(y2*1000)

model3=lm(price~sqft,data=collegetown)
#summary(model3)
d1=coef(model3)[[1]]
d2=coef(model3)[[2]]
y3=d1+d2*sqft_f
print(y3*1000)
```