### This homework is written by 許桂萍 (312707028)
Question:
#### 3.23 The file collegetown.dat contains data on 500 single-family houses sold in Baton Rouge, Louisiana, during 2009-2013. The data include sale price in $1000 units, PRICE, and total interior area in hundreds of square feet, SQFT.
#### a. Using the quadratic regression model, 2 1 2 PRICE SQFT e =α+α + , test the hypothesis that the marginal effect on expected house price of increasing the size of a 2000 square foot house by 100 square feet is less than or equal to $13000 against the alternative that that the marginal effect will be greater than $13000. Use the 5% level of significance. Clearly state the test statistic used, the rejection region, and the test p-value. What do you conclude?
sol:
```{r}
model = lm(price ~ I(sqft^2), data = collegetown)
summary(model)
```
The estimated model is  
$$\hat{PRICE}=93.5659+0.1845\ {SQFT}^2$$
code:
<img width="401" alt="image" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/89432894/82adcfab-b4be-477f-a63c-1b5a36c25551">

```{r}
# margin effect and std
aphla2 = coef(model)[[2]]
margine_effect = 2*aphla2*20
sd = 40*(0.005256)
# test
t = (margine_effect-13)/sd
df = dim(collegetown)[1]-2
p = 1 - pt(q = t, df = df, lower.tail = T)
print(paste("t-value =", t))
print(paste("df =", df))
print(paste("p-value =", p))
```
<img width="219" alt="image" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/89432894/282fa144-daa6-43db-984a-c3f63adce3f7">

Next, the marginal effect is $\frac{d\ PRICE}{d\ SQFT}=2\hat{\alpha_2}SQFT=2\hat{\alpha_2}(20)=7.2808$.\
Standard error is $\sqrt{\hat{var}(40\hat{\alpha_2})}=40(se(\alpha_2))=0.2102$.\
The hypothesis is $H_0=2\alpha_2(20)\leq13 \ v.s. \ H_1= 2\alpha_2(20) > 13$.This is a right-tail test.\
The test statistic is $t=(40\hat{\alpha_2}-13)/\sqrt{40\hat{\alpha_2}} \sim t_{(N-2=492)}$.\ 
The calculated t-value is −26.7288. This falls in the non-rejection region. The p-value is $P[t_{(498) \geq -26.7288}]=1$. We cannot conclude that the marginal effect is greater than $13,000.\


