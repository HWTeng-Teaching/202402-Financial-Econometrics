library(POE5Rdata)
data("collegetown")

sqft_f=2700/100

model1=lm(price~log(sqft),data=collegetown)
#summary(model1)
b1_a=coef(model1)[[1]]
b2_a=coef(model1)[[2]]
y1=b1_a+b2_a*log(sqft_f)
print(y1*1000)

model2=lm(log(price)~log(sqft),data=collegetown)
#summary(model2)
b1_b=coef(model2)[[1]]
b2_b=coef(model2)[[2]]
y2=exp(b1_b+b2_b*log(sqft_f))
print(y2*1000)

model3=lm(price~sqft,data=collegetown)
#summary(model3)
b1_c=coef(model3)[[1]]
b2_c=coef(model3)[[2]]
y3=b1_c+b2_c*sqft_f
print(y3*1000)
