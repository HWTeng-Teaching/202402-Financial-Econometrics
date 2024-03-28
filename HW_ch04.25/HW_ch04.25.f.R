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
