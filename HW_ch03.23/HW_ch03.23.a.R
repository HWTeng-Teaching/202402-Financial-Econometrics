# load data
library(POE5Rdata)
data("collegetown")

# quadratic model
model = lm(price ~ I(sqft^2), data = collegetown)
summary(model)

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