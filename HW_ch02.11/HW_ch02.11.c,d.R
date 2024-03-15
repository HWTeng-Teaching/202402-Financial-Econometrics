#2.11 (c)
b1 <- 13.77
b2 <- 0.52
x1 <- 2000/100 
yhat <- b1 + b2 * x1
elas <- b2 * x1 / yhat
print(elas)

#2.11 (d)
b11 <- 3.14
b22 <- 0.007
x2 <- 2000/100
ln_yhat <- b11 + b22 * x2
yhat <- exp(b11 + b22 * x2)
slope <- b22 * exp(b11 + b22 * x2)
elas1 <- slope * x2 / yhat
print(elas1)
